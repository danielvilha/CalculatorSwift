//
//  ContentView.swift
//  CalculatorSwift
//
//  Created by Daniel Ferreira de Lima Freitas Vilha on 10/01/20.
//  Copyright © 2020 Daniel Ferreira de Lima Freitas Vilha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let scale: CGFloat = UIScreen.main.bounds.width / 414
    
    @EnvironmentObject private var model: CalculatorModel
    
    @State private var editingHistory = false
    @State private var showingResult = false
    
    var body: some View {
        
        VStack(spacing: 12) {
            Color.black.edgesIgnoringSafeArea(.all)
            Spacer()
            
            Text(model.brain.output)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24 * scale)
                .lineLimit(1)
                .foregroundColor(Color.white)
                .background(Color.black)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .onTapGesture { self.showingResult = true }
            
            CalculatorButtonPad().padding(.bottom)
        }.scaleEffect(scale)
            .background(Color.black)
    }
}

struct CalculatorButtonPad: View {
    
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)],
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}

struct CalculatorButtonRow: View {
    
    @EnvironmentObject private var model: CalculatorModel
    
    let row: [CalculatorButtonItem]
    
    var body: some View {
        
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                    title: item.title,
                    size: item.size,
                    backgroundColorName: item.backgroundColorName) {
                        self.model.apply(item)
                }
            }
        }
    }
}

struct CalculatorButton: View {
    
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack() {
                Capsule()
                    .fill(Color(backgroundColorName))
                    .frame(width: size.width, height: size.height)
                Text(title)
                    .font(.system(size: fontSize))
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
