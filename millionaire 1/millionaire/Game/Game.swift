//
//  Game.swift
//  millionaire
//
//  Created by Regina Galishanova on 23.05.2021.
//

import UIKit



final class Game {
    
    static let shared = Game()
    
    private let recordsCaretaker = RecordsCaretaker()


    private(set) var records: [Record] {
        didSet {
        
            recordsCaretaker.save(records: self.records)
        }
    }


    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()

    }
    
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }

    
}
