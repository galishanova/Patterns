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
    var usersQuestions = AddQuestionViewController().usersQuestions


    func createQuestion() -> [Question] {
        
        let userQuestion = Game.shared.questions
        usersQuestions.append(contentsOf: userQuestion)
        service = Service()
        questions = service.getQuestions() + usersQuestions
                        
        return questions
    }


}
