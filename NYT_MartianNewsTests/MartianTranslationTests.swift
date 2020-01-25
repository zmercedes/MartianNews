//
//  MartianTranslationTests.swift
//  NYT_MartianNewsTests
//
//  Created by Zoilo Mercedes on 1/24/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import XCTest

class MartianTranslationTests: XCTestCase {
    
    var word: String!
    
    override func setUp() {
        super.setUp()
        word = ""
    }

    func testTranslation_TwoLetterWord() {
        word = "is"
        let martianWord = word.toMartian()
        XCTAssertEqual(word, martianWord)
    }
    
    func testTranslation_ThreeLetterWord() {
        word = "and"
        let martianWord = word.toMartian()
        XCTAssertEqual(word, martianWord)
    }
    
    func testTranslation_capitalized() {
        word = "Nice"
        let martianWord = word.toMartian()
        XCTAssertEqual(martianWord, "Boinga")
    }
    
    func testTranslation_uncapitalized() {
        word = "four"
        let martianWord = word.toMartian()
        XCTAssertEqual(martianWord, "boinga")
    }
    
    func testTranslation_whiteSpace() {
        word = "      "
        let martianWord = word.toMartian()
        XCTAssertEqual(martianWord, word)
    }
    
    func testTranslation_wordWithNumber() {
        word = "fri3nd"
        let martianWord = word.toMartian()
        XCTAssertEqual(martianWord, "boinga")
    }
    
    func testTranslation_newline() {
        word = "\n\n"
        let martianWord = word.toMartian()
        XCTAssertEqual(martianWord, word)
    }
    
    func testTranslation_sentenceUpper() {
        word = "This is a sentence"
        let martianSentence = word.toMartian()
        XCTAssertEqual(martianSentence, "Boinga is a boinga")
    }
    
    func testTranslation_sentenceLower() {
        word = "this is a sentence"
        let martianSentence = word.toMartian()
        XCTAssertEqual(martianSentence, "boinga is a boinga")
    }
    
    func testTranslation_sentenceWithPunctuation() {
        word = "This is another sentence."
        let martianSentence = word.toMartian()
        XCTAssertEqual(martianSentence, "Boinga is boinga boinga.")
    }
    
    func testTranslation_sentenceWithNewLinePunctuation() {
        word = "This is a sentence with Various \n\n Tricky things."
        let martianSentence = word.toMartian()
        XCTAssertEqual(martianSentence, "Boinga is a boinga boinga Boinga \n\n Boinga boinga.")
    }
    
    func testTranslation_givenExample1() {
        word = "20,000 Leagues Under the Sea"
        let martianSentence = word.toMartian()
        XCTAssertEqual(martianSentence, "20,000 Boinga Boinga the Sea")
    }
    
    func testTranslation_givenExample2() {
        word = "Is there life on Mars?"
        let martianSentence = word.toMartian()
        XCTAssertEqual(martianSentence, "Is boinga boinga on Boinga?")
    }

}
