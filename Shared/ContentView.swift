//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Lee on 7/9/20.
//

import SwiftUI

class GlobalEnvironment: ObservableObject {
    @Published var display = "0"
    @Published var display2 = "0"
    @Published var operation = "."
    
    func receiveInput(calculatorButton: String){
        if(calculatorButton == "<3"){
            self.display = "<3"
        }
        if(calculatorButton == "."){
            self.display += ""
        }
        
        if(self.display == "0" || self.display == "<3") {
            self.display = ""
        }
        self.display += calculatorButton
    }
    
    func doOperation(calculatorButton: String){
        if(calculatorButton != "="){
            self.display2 = self.display
            self.display = "0"
            self.operation = calculatorButton
        }
        if(calculatorButton == "="){
            switch self.operation {
            case "+": self.display = String((self.display2 as NSString).doubleValue + (self.display as NSString).doubleValue)
            case "-": self.display = String((self.display2 as NSString).doubleValue - (self.display as NSString).doubleValue)
            case "*": self.display = String((self.display2 as NSString).doubleValue * (self.display as NSString).doubleValue)
            case "/": self.display = String((self.display2 as NSString).doubleValue / (self.display as NSString).doubleValue)
            default: self.display += ""
            }
        }
    }
    
    func clearInput(){
        self.display = "0"
        self.display2 = "0"
    }
}

extension Color {
    static let offWhite = Color(.systemBackground)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                            .frame(width: 60, height: 60)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                            )
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                            )
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                    }
                }
            )
    }
}


struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    @State var showingDetail = false
    
    var body: some View {
        ZStack {
            Color.offWhite
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                Text(env.display2)
                    .foregroundColor(Color.secondary)
                    .opacity(0.5)
                    .multilineTextAlignment(.trailing)
                HStack {
                    Text(env.display)
                        .multilineTextAlignment(.trailing)
                }
                HStack{
                    Spacer()
                    Button(action: {self.env.clearInput()}){
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {}){
                        Image(systemName: "plus.slash.minus")
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {}){
                        Image(systemName: "percent")
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {self.env.doOperation(calculatorButton: "/")}){
                        Image(systemName: "divide")
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button(action: {self.env.receiveInput(calculatorButton: "7")}){
                        Text("7")
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {self.env.receiveInput(calculatorButton: "8")}){
                        Text("8")
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {self.env.receiveInput(calculatorButton: "9")}){
                        Text("9")
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {self.env.doOperation(calculatorButton: "*")}){
                        Image(systemName: "multiply")
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    Button(action: {self.env.receiveInput(calculatorButton: "4")}){
                        Text("4")
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {self.env.receiveInput(calculatorButton: "5")}){
                        Text("5")
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {self.env.receiveInput(calculatorButton: "6")}){
                        Text("6")
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {self.env.doOperation(calculatorButton: "-")}){
                        Image(systemName: "minus")
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button(action: {self.env.receiveInput(calculatorButton: "1")}){
                        Text("1")
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {self.env.receiveInput(calculatorButton: "2")}){
                        Text("2")
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {self.env.receiveInput(calculatorButton: "3")}){
                        Text("3")
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {self.env.doOperation(calculatorButton: "+")}){
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button(action: {self.env.receiveInput(calculatorButton: "0")}){
                        Text("0")
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {self.env.receiveInput(calculatorButton: ".")}){
                        Text(".")
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {self.env.doOperation(calculatorButton: "=")}){
                        Image(systemName: "equal")
                            .foregroundColor(.green)
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                    Button(action: {self.showingDetail.toggle()}){
                        Image(systemName: "heart")
                            .foregroundColor(.yellow)
                    }.sheet(isPresented: $showingDetail) {
                        HeartView()
                    }
                    .buttonStyle(SimpleButtonStyle())
                    Spacer()
                }
            }
            .font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GlobalEnvironment())
            
    }
}
