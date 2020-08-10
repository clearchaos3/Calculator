//
//  Alt.swift
//  Calculator
//
//  Created by Ryan Lee on 7/9/20.
//

import SwiftUI

struct Alt: View {
    var alt : String
    var body: some View {
        Button(action: {}){
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(Color(.tertiarySystemFill))
                .overlay(Text(self.alt)
                            .fontWeight(.bold))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct Alt_Previews: PreviewProvider {
    static var previews: some View {
        Alt(alt: "AC")
    }
}
