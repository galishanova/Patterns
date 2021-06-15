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
    
    @IBOutlet weak var addQuestionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch segue.identifier {
//        case "toAddQuestion":
//            guard let startVC = segue.destination as? MainViewController else { return }
//            startVC.difficulty = self.difficulty
//        default:
//            break
//        }
//    }

    
    @IBAction func closeButtonTaped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    


}
