//
//  MainVC.swift
//  Who_wants_to_be_a_millioner
//
//  Created by Денис Бутмалай on 28.10.2021.
//

import UIKit
class MainViewContoller : UIViewController {
    
    @IBOutlet weak var lastResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destionation = segue.destination as? GameViewController else { return }
            destionation.gameVCDelegate = self
            
            Game.shared.gameSession = GameSession()
        default:
            break
        }
    }
}

extension MainViewContoller: GameVCDelegate {
    func didAnswer(currentQuestion: Int, winningSum: Int, endTheGame: Bool) {
        guard let gameSession = Game.shared.gameSession else { return }
        gameSession.correctAnswers = currentQuestion
        gameSession.winningSum = winningSum
        let record = Record(date: Date(), percent: gameSession.percentCorrectAnswer, sum: winningSum)
        Game.shared.addRecord(record: record)
        lastResultLabel.text = """
            Последний результат: \(gameSession.percentCorrectAnswer)
            Выигрыш: \(winningSum)
            """
        
        if endTheGame {
            Game.shared.gameSession = nil
        }
    }
}

