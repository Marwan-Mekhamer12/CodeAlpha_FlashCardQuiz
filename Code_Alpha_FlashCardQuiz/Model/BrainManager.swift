//
//  BrainManager.swift
//  Code_Alpha_FlashCardQuiz
//
//  Created by Marwan Mekhamer on 28/04/2025.
//

import Foundation

struct BrainManager: Codable {
    let results: [Result]
}

struct Result: Codable {
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}
