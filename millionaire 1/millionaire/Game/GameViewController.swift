//
//  GameViewController.swift
//  millionaire
//
//  Created by Regina Galishanova on 15.05.2021.
//

import UIKit

class GameViewController: UIViewController {
    

    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet  var buttons: [UIButton]!
    
    var questions: [Question]!
    
    var service: Service!
    
    var onGameEnd: ((Int) -> Void)?
        
    var correctAnswersQuantity = [Int]()
    
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service = Service()
        questions = service.getQuestions()
        loadQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func loadQuestion() {
    
    
        
        for i in 0..<buttons.count {
            
            buttons[i].createAnswerButton()
            buttons[i].isHidden = false
            buttons[i].isEnabled = true
            
        }
        
        if index <= questions.count - 1 {
            questionNumber.text = "Вопрос № \(index+1)"
            
            questionText.text = questions[index].question

            buttons[0].setTitle(questions[index].answer1, for: UIControl.State.normal)
            buttons[1].setTitle(questions[index].answer2, for: UIControl.State.normal)
            buttons[2].setTitle(questions[index].answer3, for: UIControl.State.normal)
            buttons[3].setTitle(questions[index].answer4, for: UIControl.State.normal)
            
        } else if index > questions.count - 1 {
            
            dismiss(animated: true, completion: nil)
            let score = correctAnswersQuantity.count
            let record = Record(date: Date(), score: score)
            Game.shared.addRecord(record)
            self.onGameEnd?(score)

        }
    
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        let correctAswers = ["Великий Устюг", "Апперкот", "К внучке", "Коня", "Солнце"]
        let buttonTitle = sender.titleLabel?.text ?? ""
        
        if correctAswers.contains(buttonTitle) {
            correctAnswersQuantity.append(1)
            index+=1
            loadQuestion()
            
            print("correct \(correctAnswersQuantity)")
            
        } else {
            dismiss(animated: true, completion: nil)
            let score = correctAnswersQuantity.count
            let record = Record(date: Date(), score: score)
            Game.shared.addRecord(record)
            self.onGameEnd?(score)
        }
        
    }


}


