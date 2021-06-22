//
//  Game.swift
//  millionaire
//
//  Created by Regina Galishanova on 23.05.2021.
//

import UIKit



final class Game {
    
    static let shared = Game()
    
    private let recordsCaretaker = RecordsCaretaker()
        
    private let questionCaretaker = QuestionCaretaker()
    
    private let correctAnswersCaretaker = CorrectAnswersCaretaker()

    

    private(set) var records: [Record] {
        didSet {
        
            recordsCaretaker.save(records: self.records)
        }
    }
    
    private(set) var questions: [Question] {
        didSet {

            questionCaretaker.save(questions: self.questions)
        }
    }
    
    private(set) var correctAnswers: [Answer] {
        didSet {

            correctAnswersCaretaker.save(answers: self.correctAnswers)
        }
    }
    

    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
        self.questions = self.questionCaretaker.retrieveQuestions()
        self.correctAnswers = self.correctAnswersCaretaker.retrieveAnswers()

    }
    
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
    
    func addQuestion(_ question: Question) {
        self.questions.append(question)
    }

    func clearQuestions() {
        self.questions = []
    }
    
    func addAnswer(_ answer: Answer) {
        self.correctAnswers.append(answer)
    }

    func clearAnswer() {
        self.correctAnswers = []
    }
    
}
