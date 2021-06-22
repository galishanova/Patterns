//
//  GameViewController.swift
//  millionaire
//
//  Created by Regina Galishanova on 15.05.2021.
//

import UIKit
import GameplayKit

class GameViewController: UIViewController {
    

    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet  var buttons: [UIButton]!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    var service: Service!
    
    var correctAswers: [Answer]!

    var onGameEnd: ((Int) -> Void)?
        
    var correctAnswersQuantity = [Int]()
    
    var difficulty: Difficulty = .consistent
    
    var index = Observable<Int>(0)
    

    private var createQuestionStrategy: CreateQuestionsStrategy {
        switch self.difficulty {
        case .consistent:
            return ConsistentQuestionStrategy()
        case .random:
            return RandomQuestionStrategy()
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service = Service()
        correctAswers = service.getCorrectAnswers()
        
        loadQuestion()
        
        let questions = self.createQuestionStrategy.createQuestion()
        
        self.index.addObserver(self, closure: { [weak self] (index, _) in
            self?.progressLabel.text = "\(index)/\(questions.count)"
        })

    }
        
    func loadQuestion() {
        
        for i in 0..<buttons.count {
            
            buttons[i].createAnswerButton()
            buttons[i].isHidden = false
            buttons[i].isEnabled = true
            
        }
        
        let questions = self.createQuestionStrategy.createQuestion()
                
        if index.value <= questions.count - 1 {
            questionNumber.text = "Вопрос № \(index.value+1)"
            
            questionText.text = questions[index.value].question
            
            let sourseAnswers = [questions[index.value].answer1, questions[index.value].answer2, questions[index.value].answer3, questions[index.value].answer4]
            
            let answers = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: sourseAnswers)


            buttons[0].setTitle(answers[0] as? String, for: UIControl.State.normal)
            buttons[1].setTitle(answers[1] as? String, for: UIControl.State.normal)
            buttons[2].setTitle(answers[2] as? String, for: UIControl.State.normal)
            buttons[3].setTitle(answers[3] as? String, for: UIControl.State.normal)
            
        } else if index.value > questions.count - 1 {
            
            showSuccessAlert()
            let score = correctAnswersQuantity.count
            let questionsCount = questions.count
            let record = Record(date: Date(), score: score, questionsCount: questionsCount)
            Game.shared.addRecord(record)
            self.onGameEnd?(score)

        }

    }
    
    func showSuccessAlert() {
        let questions = self.createQuestionStrategy.createQuestion()

        let alert = UIAlertController(title: "Поздравляем!", message: "Вы ответили на \(correctAnswersQuantity.count) вопросов из \(questions.count)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Супер!", style: .cancel, handler: {
            action in
            self.dismiss(animated: true, completion: nil)
        })
        
        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }
    
    func showGameEndAlert() {
        let questions = self.createQuestionStrategy.createQuestion()

        let alert = UIAlertController(title: "Ответ неверный", message: "Игра окончена. Вы ответили на \(correctAnswersQuantity.count) вопросов из \(questions.count)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "ОК", style: .cancel, handler: {
            action in
            self.dismiss(animated: true, completion: nil)
        })

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        let customsCorrectAnswers = Game.shared.correctAnswers
        
        correctAswers.append(contentsOf: customsCorrectAnswers)
        
        let buttonTitle = sender.titleLabel?.text ?? ""
        
        if correctAswers.contains(Answer(answer: buttonTitle)) {
            correctAnswersQuantity.append(1)
            index.value+=1
            loadQuestion()

            print("correct \(correctAnswersQuantity.count)")

        } else {
            showGameEndAlert()
            let questions = self.createQuestionStrategy.createQuestion()
            
            
            let score = correctAnswersQuantity.count
            let questionsCount = questions.count
            let record = Record(date: Date(), score: score, questionsCount: questionsCount)
            Game.shared.addRecord(record)
            self.onGameEnd?(score)
        }
        
    }


}


