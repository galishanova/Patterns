//
//  Answer.swift
//  millionaire
//
//  Created by Regina Galishanova on 17.06.2021.
//

import Foundation

struct Answer: Codable {
    var answer: String
}

extension Answer: Equatable {
    static func == (lhs: Answer, rhs: Answer) -> Bool {
        return lhs.answer == rhs.answer
    }
}

extension Service {

    func getCorrectAnswers() -> [Answer] {
        return [
            Answer(answer: "Великий Устюг"),
            Answer(answer:"Апперкот"),
            Answer(answer:"К внучке"),
            Answer(answer:"Коня"),
            Answer(answer:"Солнце")
        ]
    }
}
