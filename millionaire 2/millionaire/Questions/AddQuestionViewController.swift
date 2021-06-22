//
//  SettingsViewController.swift
//  millionaire
//
//  Created by Regina Galishanova on 06.06.2021.
//

import UIKit


class AddQuestionViewController: UIViewController {
    
    
    @IBOutlet weak var addQuestionLabel: UILabel!
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answer1TextField: UITextField!
    
    @IBOutlet weak var answer2TextField: UITextField!
    
    @IBOutlet weak var answer3TextField: UITextField!
    
    @IBOutlet weak var answer4TextField: UITextField!
        
    @IBOutlet weak var scrollView: UIScrollView!
    
    var difficulty: Difficulty = .consistent
    
    private var createQuestionStrategy: CreateQuestionsStrategy {
        switch self.difficulty {
        case .consistent:
            return ConsistentQuestionStrategy()
        case .random:
            return RandomQuestionStrategy()
            
        }
    }
    
    var usersQuestions: [Question] = [] {
        didSet {
            let userQuestion = Game.shared.questions
            usersQuestions.append(contentsOf: userQuestion)
        }
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnScroll))
        scrollView?.addGestureRecognizer(tapGesture)
        scrollView.isUserInteractionEnabled = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    func getUsersQuestion() {
        
        let addedQuestion = questionTextField.text!
        let addedAnswer1 = answer1TextField.text!
        let addedAnswer2 = answer2TextField.text!
        let addedAnswer3 = answer3TextField.text!
        let addedAnswer4 = answer4TextField.text!
        
                
        let usersQuestion = Question(question: addedQuestion, answer1: addedAnswer1, answer2: addedAnswer2, answer3: addedAnswer3, answer4: addedAnswer4)
        Game.shared.addQuestion(usersQuestion)
        Game.shared.addAnswer(Answer(answer: usersQuestion.answer4))
        
    }
    func showSuccessAlert() {
        
        let alert = UIAlertController(title: "Добавлено", message: "Вопрос '\(questionTextField.text!)' успешно добавлен", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlert() {
        
        let alert = UIAlertController(title: "Ошибка", message: "Для добавления вопроса необходимо заполнить все пустые поля", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
     
    }
    
    func clearTextFields() {
        questionTextField.text! = "";
        answer1TextField.text! = "";
        answer2TextField.text! = "";
        answer3TextField.text! = "";
        answer4TextField.text! = ""
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.size.height, right: 0)
        scrollView.contentInset = insets
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let insets = UIEdgeInsets.zero
        scrollView.contentInset = insets
    }
    @objc func didTapOnScroll() {
        view.resignFirstResponder() //опустить полностью клавиатуру
        self.scrollView?.endEditing(true)
        //опустить полностью клавиатуру
    }
    
    @IBAction func closeButtonTaped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func addQuestion(_ sender: UIButton) {
        
//        let questions = self.createQuestionStrategy.createQuestion()
    

        if questionTextField.text!.isEmpty ||  answer1TextField.text!.isEmpty ||  answer2TextField.text!.isEmpty ||  answer3TextField.text!.isEmpty ||  answer4TextField.text!.isEmpty {
            
            showErrorAlert()
        
        }else {
            
            getUsersQuestion()
            showSuccessAlert()
            clearTextFields()
            
        }
    }

}
