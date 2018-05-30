//
//  BoardMatrix.swift
//  tic-tac-toe
//
//  Created by YAUHENI IVANIUK on 5/30/18.
//  Copyright © 2018 Yauheni Ivaniuk. All rights reserved.
//

import Foundation

struct BoardMatrix {
    var rows: Int, columns: Int
    var board: [String]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        board = Array(repeating: "", count: rows * columns)
    }
    
    subscript(row: Int, column: Int) -> String {
        get {
            return board[(row * columns) + column]
        }
        set {
            board[(row * columns) + column] = newValue
        }
    }
}
