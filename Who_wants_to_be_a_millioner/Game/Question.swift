//
//  Question.swift
//  Who_wants_to_be_a_millioner
//
//  Created by Денис Бутмалай on 28.10.2021.
//

import Foundation

struct Question {
    let question: String
    let answers: [String: Bool]
    let winningSum: Int
    
    init(_ question: String, answers: [String: Bool], sum: Int) {
        self.question = question
        self.answers = answers
        self.winningSum = sum
    }
    
    static let example: [Question] = {
        var questions: [Question] = []
        //1.
        questions.append(
            Question("В каком году основали Москву?",
                     answers: [
                        "1993": false,
                        "1147": true,
                        "1567": false,
                        "1171": false],
                     sum: 100
          //  var answearsofthegame = ["1993","1567","1147", "1171", //Правильный ответ - 1147 [2]
            )
        )
        //2.
        questions.append(
            Question("В каком году было крещение Руси?",
                     answers: [
                        "988": true,
                        "998": false,
                        "980": false,
                        "688": false],
                     sum: 100
                   //  "998", "980", "688" , " 988", //Правильный ответ -988 [7]
            )
        )
        //3.
        questions.append(
            Question("Какой князь основал Москву?",
                     answers: [
                        "Д.Донской": false,
                        "А.Невский": false,
                        "Ю.Долгорукий": true,
                        "И. Грозный": false],
                     sum: 100
                    // "Д.Донской", "А.Невский","Ю.Долгорукий","И. Грозный",//Правильный ответ - Ю.Долгорукий [10]
            )
        )
        //4.
        questions.append(
            Question("При каком князе свершилось крещение Руси?",
                     answers: [
                        "Владимир": true,
                        "Олег": false,
                        "Ярослав": false,
                        "Святослав": false],
                     sum: 100
                     //"Владимир", "Олег", "Ярослав", "Святослав"]//Правильный отет - Владимир [16]
            )
        )
        //5.
        questions.append(
            Question("В каком году состоялось Ледовое побоище?",
                     answers: [
                        "1147": false,
                        "1242": true,
                        "1480": false,
                        "1380": false],
                     sum: 100
                     //"1147","1242","1380", "1480",//Правильный ответ - 1242 [13]
            )
        )
        
        return questions
    }()
}
//var numbers = ["Вопрос №1","Вопрос №2","Вопрос №3","Вопрос №4", "Вопрос №5"]
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
