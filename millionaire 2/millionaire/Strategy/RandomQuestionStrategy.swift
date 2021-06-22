//
//  RandomQuestionStrategy.swift
//  millionaire
//
//  Created by Regina Galishanova on 13.06.2021.
//

import Foundation
import GameplayKit

final class RandomQuestionStrategy: CreateQuestionsStrategy {
    
    var sourseQuestions: [Question]!
    var service: Service!
    var usersQuestions = AddQuestionViewController().usersQuestions
    
    
    func createQuestion() -> [Question] {
        
        let userQuestion = Game.shared.questions
        usersQuestions.append(contentsOf: userQuestion)
        service = Service()
        sourseQuestions = service.getQuestions() + usersQuestions
                
        let questions = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: sourseQuestions)
        
        print(questions)
        
        return sourseQuestions
    }
    
}
