//
//  CalculatorButtonItem.swift
//  CalculatorSwift
//
//  Created by Daniel Ferreira de Lima Freitas Vilha on 12/01/20.
//  Copyright © 2020 Daniel Ferreira de Lima Freitas Vilha. All rights reserved.
//

import UIKit

enum CalculatorButtonItem {
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
    
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
}

extension CalculatorButtonItem: Hashable {
    
    var title: String {
        switch self {
        case .digit(let value): return String(value)
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let command): return command.rawValue
        }
    }
    
    var size: CGSize {
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: 88 * 2 + 8, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit, .dot: return "digitBackground"
        case .op: return "operatorBackground"
        case .command: return "commandBackground"
        }
    }
}
