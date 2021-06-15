//
//  Question.swift
//  millionaire
//
//  Created by Regina Galishanova on 15.05.2021.
//

import Foundation

struct Question: Codable {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
}

let question = Question(question: "", answer1: "", answer2: "", answer3: "", answer4: "")

class Service {


func getQuestions() -> [Question] {
    return [
        Question(question: "Какой город объявлен официальной родиной русского Деда Мороза?", answer1: "Малая Вишера", answer2: "Великий Устюг", answer3: "Нижний Новгород", answer4: "Вышний Волочек"),
        Question(question: "Что проводит боксер, наносящий удар противнику снизу?", answer1: "Свинг", answer2: "Хук", answer3: "Джэб", answer4: "Апперкот"),
        Question(question: "К кому первому обратились за помощью дед и бабка, не справившись с репкой?", answer1: "К Жучке", answer2: "К дочке", answer3: "К внучке", answer4: "К залу"),
        Question(question: "Кого нет среди смешариков?", answer1: "Коня", answer2: "Свиньи", answer3: "Лося", answer4: "Барана"),
        Question(question: "Как называется ближайшая к Земле звезда?", answer1: "Проксиома Центавра", answer2: "Полярная", answer3: "Сириус", answer4: "Солнце")
    ]
}
}
