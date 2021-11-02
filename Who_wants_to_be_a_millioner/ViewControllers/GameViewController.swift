//
// GameViewController.swift
//  Who_wants_to_be_a_millioner
//
//  Created by Денис Бутмалай on 28.10.2021.
//

import UIKit


protocol GameVCDelegate: AnyObject {
    func didAnswer(currentQuestion: Int, winningSum: Int, endTheGame: Bool)
    
}
class GameViewController: UIViewController {


    @IBOutlet  weak var questionLabel : UILabel!
    @IBOutlet   var AnswearsButtons: [UIButton]!
    @IBOutlet weak var NumberOfQuestion: UILabel!
    @IBOutlet weak var currentWinningSum: UILabel!
    
    weak var gameVCDelegate: GameVCDelegate?
    
    var currentQuestion = 0
    var currentSum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    //    ChangeQuesions()
//        FirstAnswear.setTitle(answearsofthegame.first, for: .normal)
    }
    
    func nextQuestion() {
        guard let questions = Game.shared.gameSession?.questions,
              currentQuestion <= questions.count - 1
              else { return }
        let question = questions[currentQuestion]
        questionLabel.text = "\(currentQuestion + 1). \(question.question)"
        var currentAnswer = 0
        var word = ""
        for text in question.answers.keys {
            switch currentAnswer {
            case 0:
                word = "A."
            case 1:
                word = "B."
            case 2:
                word = "C."
            case 3:
                word = "D."
            default:
                word = ""
            }
            AnswearsButtons.first { (button) -> Bool in
                button.tag == currentAnswer
            }?.setTitle(word + text, for: .normal)
            currentAnswer += 1
        }
    }
    @IBAction func answerTapped(_ sender: UIButton) {
        guard let questions = Game.shared.gameSession?.questions,
              currentQuestion <= questions.count - 1
              else { return }
        let question = questions[currentQuestion]
        let currentAnswer = question.answers.first { (key, value) -> Bool in
            (sender.titleLabel?.text?.contains(key) ?? false)
        }!
        if currentAnswer.value {
            currentSum = currentQuestion == 0 ? 100 : currentSum * 2
            currentQuestion += 1
            currentWinningSum.text = "Текущий выигрыш: \(currentSum)"
            nextQuestion()
        } else {
            gameVCDelegate?.didAnswer(currentQuestion: currentQuestion, winningSum: currentSum, endTheGame: true)
            dismiss(animated: true, completion: nil)
        }
        
    }
    
}
    
//  var numbers = ["Вопрос №1","Вопрос №2","Вопрос №3","Вопрос №4", "Вопрос №5"]
//
//    var questionsofgame = ["В каком году основали Москву?",
//                           "В каком году было крещение Руси?",
//                           "Какой князь основал Москву?",
//                           "В каком году состоялось Ледовое побоище?",
//                          "При каком князе свершилось крещение Руси?"]
//
//    var answearsofthegame = ["1993","1567","1147", "1171", //Правильный ответ - 1147 [2]
//                             "998", "980", "688" , " 988", //Правильный ответ -988 [7]
//                             "Д.Донской", "А.Невский","Ю.Долгорукий","И. Грозный",//Правильный ответ - Ю.Долгорукий [10]
//                              "1147","1242","1380", "1480",//Правильный ответ - 1242 [13]
//                             "Владимир", "Олег", "Ярослав", "Святослав"]//Правильный отет - Владимир [16]
//
//
//    func ChangeQuesions () {
//
//        NumberOfQuestion.text = numbers[0]
//        QuestionsOfGame.text = questionsofgame[0]
//        FirstAnswear.setTitle(answearsofthegame[0], for: .normal)
//        SecondAnswear.setTitle(answearsofthegame[1],for: .normal)
//        TherdAnswear.setTitle(answearsofthegame[2], for: .normal)
//        FourthAnswear.setTitle(answearsofthegame[3], for: .normal)
//        SecondAnswear.addTarget(self, action: #selector(press) , for: UIControl.Event.touchUpInside)
//
//        }
//    @objc func press (sender: AnyObject) {
//        NumberOfQuestion.text = numbers[1]
//        QuestionsOfGame.text = questionsofgame[1]
//        FirstAnswear.setTitle(answearsofthegame[4], for: .normal)
//        SecondAnswear.setTitle(answearsofthegame[5],for: .normal)
//        TherdAnswear.setTitle(answearsofthegame[6], for: .normal)
//        FourthAnswear.setTitle(answearsofthegame[7], for: .normal)
//        FourthAnswear.addTarget(self, action: #selector(changes2), for: UIControl.Event.touchUpInside)
//    }
//
//    @objc func changes2 (sender: AnyObject) {
//        NumberOfQuestion.text = numbers[2]
//        QuestionsOfGame.text = questionsofgame[2]
//        FirstAnswear.setTitle(answearsofthegame[8], for: .normal)
//        SecondAnswear.setTitle(answearsofthegame[9],for: .normal)
//        TherdAnswear.setTitle(answearsofthegame[10], for: .normal)
//        FourthAnswear.setTitle(answearsofthegame[11], for: .normal)
//        TherdAnswear.addTarget(self, action: #selector(changes3), for: .touchUpInside)
//    }
//
//    @objc func changes3 (sender: AnyObject) {
//        NumberOfQuestion.text = numbers[3]
//        QuestionsOfGame.text = questionsofgame[3]
//        FirstAnswear.setTitle(answearsofthegame[12], for: .normal)
//        SecondAnswear.setTitle(answearsofthegame[13],for: .normal)
//        TherdAnswear.setTitle(answearsofthegame[14], for: .normal)
//        FourthAnswear.setTitle(answearsofthegame[15], for: .normal)
//        SecondAnswear.addTarget(self, action: #selector(changes4), for: .touchUpInside)
//    }
//
//    @objc func changes4 (sender: AnyObject) {
//        NumberOfQuestion.text = numbers[4]
//        QuestionsOfGame.text = questionsofgame[4]
//        FirstAnswear.setTitle(answearsofthegame[16], for: .normal)
//        SecondAnswear.setTitle(answearsofthegame[17],for: .normal)
//        TherdAnswear.setTitle(answearsofthegame[18], for: .normal)
//        FourthAnswear.setTitle(answearsofthegame[19], for: .normal)
//        FirstAnswear.addTarget(self, action: #selector(deeeeep), for: .touchUpInside)
//    }
//    @objc func deeeeep (sender : AnyObject ) {
//            let FinalViewController:FinalViewController = FinalViewController()
//            self.present(FinalViewController, animated: true, completion: nil)
//         }
    
    

