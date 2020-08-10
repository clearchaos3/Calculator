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
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(Color(.tertiarySystemBackground))
                .overlay(Text(self.digit)
                            .fontWeight(.bold))
    }
}

struct Digit_Previews: PreviewProvider {
    static var previews: some View {
        Digit(digit: "1")
    }
}
