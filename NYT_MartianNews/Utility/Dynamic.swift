//
//  Dynamic.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/20/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

public typealias Listener<T> = (T, AnyDynamic<T>) -> Void

// MARK: - DynamicType

protocol DynamicType {
    associatedtype ValueType
    var value: ValueType { get set }
}

// MARK: - AnyDynamic

public class AnyDynamic<T>: DynamicType {
    public var value: T {
        didSet {
            bonds.forEach { $0.bond?.listener(value, self) }
        }
    }
    
    fileprivate var bonds: [BondWrapper<T>] = []
    
    public init(_ value: T) {
        self.value = value
    }
    
    deinit {
        mapBond = nil
    }
    
    public func map<U>(_ transform: @escaping (T) -> U) -> AnyDynamic<U> {
        let dynamic = AnyDynamic<U>(transform(value))
        let bond = Bond<T> { value, _ in dynamic.value = transform(value) }
        bond.bind(to: self)
        dynamic.mapBond = bond
        return dynamic
    }
    
    @discardableResult
    public func observe(onNext: @escaping (T) -> Void) -> Bond<T> {
        let bond = Bond<T> { value, _ in
            onNext(value)
        }
        bond.bind(to: self)
        return bond
    }
}

// MARK: - AnyDynamic: MapBond

private var handle: UInt8 = 0

extension AnyDynamic {
    fileprivate var mapBond: Any? {
        set {
            objc_setAssociatedObject(self, &handle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &handle)
        }
    }
}

// MARK: - AnyDynamic: Equatable

extension AnyDynamic where T: Equatable {
    static func == (lhs: AnyDynamic<T>, rhs: AnyDynamic<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

// MARK: - Dynamic

public class Dynamic<T>: AnyDynamic<T> {
    override public func map<U>(_ transform: @escaping (T) -> U) -> Dynamic<U> {
        let dynamic = Dynamic<U>(transform(value))
        let bond = Bond<T> { value, _ in dynamic.value = transform(value) }
        bond.bind(to: self)
        dynamic.mapBond = bond
        return dynamic
    }
}

// MARK: - Bond

protocol BondType { }

public class Bond<T>: BondType {
    var listener: Listener<T>
    
    public init(_ listener: @escaping Listener<T>) {
        self.listener = listener
    }
    
    public func bind(to dynamic: AnyDynamic<T>) {
        dynamic.bonds.append(BondWrapper(self))
        listener(dynamic.value, dynamic)
    }
    
    @discardableResult
    public func dispose(with disposeBag: DisposeBag) -> Bond<T> {
        disposeBag.manage(bond: self)
        return self
    }
}

class BondWrapper<T> {
    weak var bond: Bond<T>?
    
    init(_ bond: Bond<T>) {
        self.bond = bond
    }
}

// MARK: - Dispose Bag

public final class DisposeBag {
    private var bonds = [BondType]()
    public var count: Int { return bonds.count }
    
    fileprivate func manage(bond: BondType) {
        bonds.append(bond)
    }
}

