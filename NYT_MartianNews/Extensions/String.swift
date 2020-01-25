//
//  String.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/24/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

extension String {
    public func toMartian() -> String {
        if self.count <= 3 { return self }
        
        let inputRange = CFRangeMake(0, self.utf16.count)
        let flag = UInt(kCFStringTokenizerUnitWordBoundary)
        let locale = CFLocaleCopyCurrent()
        let tokenizer = CFStringTokenizerCreate( kCFAllocatorDefault, self as CFString, inputRange, flag, locale)
        var tokenType = CFStringTokenizerAdvanceToNextToken(tokenizer)
        var tokens : [String] = []
        
        while tokenType != [] {
            let currentTokenRange = CFStringTokenizerGetCurrentTokenRange(tokenizer)
            let substring = self.substringWithRange(aRange: currentTokenRange)
            tokens.append(substring)
            tokenType = CFStringTokenizerAdvanceToNextToken(tokenizer)
        }
        print(tokens)
        var martianText = ""
        
        for token in tokens { martianText += token.martian() }
        
        return martianText
    }
    
    private func substringWithRange(aRange : CFRange) -> String {
        
        let nsrange = NSMakeRange(aRange.location, aRange.length)
        let substring = (self as NSString).substring(with: nsrange)
        return substring
    }
    
    private func martian() -> String {
        if count <= 3 { return self }
        
        let letters = CharacterSet.letters
        var martianTranslation: String

        if (CharacterSet.alphanumerics.isSuperset(of: CharacterSet(charactersIn: self))) {
            if letters.contains(self.unicodeScalars.first!) {
                if isFirstCapital() { martianTranslation =  "Boinga" }
                else { martianTranslation =  "boinga" }
                
                return martianTranslation
            }
        }
        
        return self
    }
    
    func isFirstCapital() -> Bool {
        return self.first == self.uppercased().first
    }
}
