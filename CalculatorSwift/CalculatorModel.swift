//
//  CalculatorModel.swift
//  CalculatorSwift
//
//  Created by Daniel Ferreira de Lima Freitas Vilha on 12/01/20.
//  Copyright © 2020 Daniel Ferreira de Lima Freitas Vilha. All rights reserved.
//

import Combine

class CalculatorModel: ObservableObject {
    @Published var brain: CalculatorBrain = .left("0")
    
    func apply(_ item: CalculatorButtonItem) {
        brain = brain.apply(item: item)
    }
}
