//
//  Digit.swift
//  Calculator
//
//  Created by Ryan Lee on 7/9/20.
//

import SwiftUI

struct Digit: View {
    var digit : String
    var body: some View {
            Rectangle()
                .frame(width: 60, height: 60)
                .cornerRadius(12.0)
                .foregroundColor(Color.offWhite)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                .overlay(Text(self.digit)
                            .fontWeight(.bold))
                
    }
}

struct Digit_Previews: PreviewProvider {
    static var previews: some View {
        Digit(digit: "1")
    }
}
