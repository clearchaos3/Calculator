//
//  Operator.swift
//  Calculator
//
//  Created by Ryan Lee on 7/9/20.
//

import SwiftUI

struct Operator: View {
    var op : String
    var body: some View {
        Button(action: {}){
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(Color(.orange))
                .overlay(Text(self.op).fontWeight(.bold))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct Operator_Previews: PreviewProvider {
    static var previews: some View {
        Operator(op: "+")
    }
}
