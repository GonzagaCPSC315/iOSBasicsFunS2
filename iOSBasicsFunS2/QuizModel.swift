//
//  QuizModel.swift
//  iOSBasicsFunS2
//
//  Created by Gina Sprint on 9/28/20.
//  Copyright © 2020 Gina Sprint. All rights reserved.
//

import Foundation

struct QuizModel {
    // parallel arrays
    private let questions: [String]
    private let answers: [String]
    private var currentQuestionIndex: Int
    
    init() {
        questions = ["What was the 50th State?", "What is 1 + 1?", "What percentage of nuts do squirrels lose?"]
        answers = ["Hawaii", "2", "80"]
        currentQuestionIndex = -1
    }
    
    // MARK: - Access Modifiers
    // use access modifiers to control access to state and behavior
    // internal: accessible anywhere within the app or framework (default)
    // private: accessible only within this object
    // private(set): internal plus private for write
    // fileprivate: accesibly only within the source file
    // open: used with frameworks
    // public: used with frameworks
    
    
    // API: application programming interface
    mutating func getNextQuestion() -> String {
        currentQuestionIndex += 1
        currentQuestionIndex %= questions.count
        return questions[currentQuestionIndex]
    }
    
    func getCurrentAnswer() -> String {
        return answers[currentQuestionIndex]
    }
}
