//
//  StartViewController.swift
//  millionaire
//
//  Created by Regina Galishanova on 20.05.2021.
//

import UIKit


class MainViewController: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var showGameResultsButton: UIButton!
    @IBOutlet weak var lastResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lastResult.text = "Последний результат: \( Game.shared.records.last?.score ?? 0)"
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        
        case "startGameSegue":
            guard let destination = segue.destination as? GameViewController else { return }

            destination.onGameEnd = { [weak self] result in
                self?.lastResult.text = "Последний результат: \(result)"
            }
            
        default:
            break
        }
    }
    

}
