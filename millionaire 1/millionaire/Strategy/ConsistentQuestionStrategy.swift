//
//  ConsistentQuestionStrategy.swift
//  millionaire
//
//  Created by Regina Galishanova on 13.06.2021.
//

import Foundation

final class ConsistentQuestionStrategy: CreateQuestionsStrategy {

    var questions: [Question]!
    var service: Service!
    
    func createQuestion() -> [Question] {
        
        service = Service()
        questions = service.getQuestions()
                        
        return questions
    }


}
