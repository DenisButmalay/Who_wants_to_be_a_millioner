//
//  Game.swift
//  Who_wants_to_be_a_millioner
//
//  Created by Денис Бутмалай on 28.10.2021.
//

import Foundation

final class Game {
    static let shared = Game()
    
    private var recordCaretaker = RecordCaretaker()
    
    private (set) var records: [Record] {
        didSet {
            recordCaretaker.saveRecords(records: records)
        }
    }
    
    var gameSession: GameSession?
    private init() {
        records = recordCaretaker.loadRecords()
    }
    
    func addRecord(record: Record) {
        records.append(record)
    }
    
    func clearRecords() {
        records = []
    }
    
}
