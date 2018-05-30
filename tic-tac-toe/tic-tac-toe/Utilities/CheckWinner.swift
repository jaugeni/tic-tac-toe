//
//  CheckWinner.swift
//  tic-tac-toe
//
//  Created by YAUHENI IVANIUK on 5/30/18.
//  Copyright © 2018 Yauheni Ivaniuk. All rights reserved.
//

import Foundation

struct CheckWinner {
    
    func checkWinCombination(board: BoardMatrix) -> (Bool, String?) {

        let checkRowVal = checkRow(board)
        if checkRowVal.0 {
            return (checkRowVal.0, checkRowVal.1)
        }
        
        let checkColumnVal = checkColumn(board)
        if checkColumnVal.0 {
            return (checkColumnVal.0, checkColumnVal.1)
        }
        
        let diagonalTopLeftToRightValue = diagonalTopLeftToRight(board)
        if diagonalTopLeftToRightValue.0 {
            return (diagonalTopLeftToRightValue.0, diagonalTopLeftToRightValue.1)
        }
        
        let diagonalButLeftToRightValue = diagonalButLeftToRight(board)
        if diagonalButLeftToRightValue.0 {
            return (diagonalButLeftToRightValue.0, diagonalButLeftToRightValue.1)
        }
        
        if checkTie(board) {
            return (true, "tie")
        }
        
        return (false, nil)
    }
    
    private func checkRow(_ board: BoardMatrix) -> (Bool, String?) {
        for rowsIndex in 0...board.rows-1 {
            let winner = board[rowsIndex, 0]
            var counter = 0
            for columsIndex in 0...board.columns-1{
                
                if winner != board[rowsIndex, columsIndex] || winner == "" {
                    break
                } else {
                    counter += 1
                }
                
                if counter == board.rows {
                    return (true, winner)
                }
            }
        }
        return (false, nil)
    }
    
    private func checkColumn(_ board: BoardMatrix) -> (Bool, String?) {
        for columsIndex in 0...board.columns-1 {
            let winner = board[0, columsIndex]
            var counter = 0
            for rowsIndex in 0...board.rows-1 {
                
                if winner != board[rowsIndex, columsIndex] || winner == "" {
                    break
                } else {
                    counter += 1
                }
                
                if counter == board.rows {
                    return (true, winner)
                }
            }
        }
        return (false, nil)
    }
    
    private func diagonalTopLeftToRight(_ board: BoardMatrix) -> (Bool, String?) {
        let winner = board[0, 0]
        var counter = 0
        for rowsIndex in 0...board.rows-1 {
            for columsIndex in 0...board.columns-1 {
                if rowsIndex == columsIndex {
                    if winner != board[rowsIndex, columsIndex] || winner == "" {
                        break
                    } else {
                        counter += 1
                    }
                    
                    if counter == board.rows {
                        return (true, winner)
                    }
                }
            }
        }
        return (false, nil)
    }
    
    private func diagonalButLeftToRight(_ board: BoardMatrix) -> (Bool, String?) {
        let winner = board[0, board.columns-1]
        var counter = 0
        
        for columsIndex in 0...board.columns-1 {
            
            if winner != board[columsIndex, (board.rows-1) - columsIndex] || winner == "" {
                break
            } else {
                counter += 1
            }
            
            if counter == board.rows {
                return (true, winner)
            }
            
        }
        return (false, nil)
    }
    
    private func checkTie(_ board: BoardMatrix) -> (Bool) {
        var counter = 0
        for rowsIndex in 0...board.rows-1 {
            for columsIndex in 0...board.columns-1{
                
                if board[rowsIndex, columsIndex] == "" {
                    return (false)
                } else {
                    counter += 1
                }
                if counter == (board.rows * board.columns) {
                    return (true)
                }
            }
        }
        return (false)
    }
    
}
