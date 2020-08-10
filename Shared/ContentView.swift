//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Lee on 7/9/20.
//

import SwiftUI

class GlobalEnvironment: ObservableObject {
    @Published var display = "0"
    
    func receiveInput(calculatorButton: String){
        if(self.display == "0") {
            self.display = ""
        }
        self.display += calculatorButton
    }
}

struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text(env.display)
                        .multilineTextAlignment(.trailing)
                }
                HStack{
                    Alt(alt: "AC")
                    Alt(alt: "+/-")
                    Alt(alt: "%")
                    Operator(op: "÷")
                }
                HStack{
                    Button(action: {self.env.receiveInput(calculatorButton: "7")}){
                        Digit(digit: "7")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {self.env.receiveInput(calculatorButton: "8")}){
                        Digit(digit: "8")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {self.env.receiveInput(calculatorButton: "9")}){
                        Digit(digit: "9")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Operator(op: "X")
                }
                
                HStack{
                    Button(action: {self.env.receiveInput(calculatorButton: "4")}){
                        Digit(digit: "4")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {self.env.receiveInput(calculatorButton: "5")}){
                        Digit(digit: "5")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {self.env.receiveInput(calculatorButton: "6")}){
                        Digit(digit: "6")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Operator(op: "-")
                }
                HStack{
                    Button(action: {self.env.receiveInput(calculatorButton: "1")}){
                        Digit(digit: "1")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {self.env.receiveInput(calculatorButton: "2")}){
                        Digit(digit: "2")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {self.env.receiveInput(calculatorButton: "3")}){
                        Digit(digit: "3")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Operator(op: "+")
                }
                HStack{
                    Button(action: {self.env.receiveInput(calculatorButton: "0")}){
                        Capsule()
                            .frame(width: 130, height: 60)
                            .foregroundColor(Color(.tertiarySystemBackground))
                            .overlay(Text("0"))
                    }
                    .buttonStyle(PlainButtonStyle())
                    Digit(digit: ".")
                    Operator(op: "=")
                }
            }
            .font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .environmentObject(GlobalEnvironment())
            
    }
}
