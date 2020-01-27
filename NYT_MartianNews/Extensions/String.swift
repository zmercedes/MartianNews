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
        var tokens: [String] = []

        while tokenType != [] {
            let currentTokenRange = CFStringTokenizerGetCurrentTokenRange(tokenizer)
            let substring = self.substringWithRange(aRange: currentTokenRange)
            tokens.append(substring)
            tokenType = CFStringTokenizerAdvanceToNextToken(tokenizer)
        }
        var martianText = ""

        let letters = CharacterSet.letters
        let acceptableStrings = CharacterSet.alphanumerics.union(CharacterSet.punctuationCharacters)

        for token in tokens {
            if token.count <= 3 {
                martianText += token
                continue
            }
            if acceptableStrings.isSuperset(of: CharacterSet(charactersIn: token)) {
                if letters.contains(token.unicodeScalars.first!) {
                    if token.isFirstCapital() {
                        martianText +=  "Boinga"
                        continue
                    } else {
                        martianText += "boinga"
                        continue
                    }
                }
            }
            martianText += token
        }

        return martianText
    }

    private func substringWithRange(aRange: CFRange) -> String {

        let nsrange = NSMakeRange(aRange.location, aRange.length)
        let substring = (self as NSString).substring(with: nsrange)
        return substring
    }

    func isFirstCapital() -> Bool {
        return self.first == self.uppercased().first
    }
}
