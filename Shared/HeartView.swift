//
//  HeartView.swift
//  Calculator
//
//  Created by Ryan Lee on 8/12/20.
//

import SwiftUI

struct HeartView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("✨Kwik Mafs💨")
                    .bold()
                    .font(.system(.largeTitle, design: .rounded))
                Spacer()
                VStack {
                    HStack(alignment: .bottom){
                        Spacer()
                        VStack {
                            Image(systemName: "iphone")
                            Text("iPhone")
                                .font(.system(.caption, design: .rounded))
                                
                        }
                        Spacer()
                        VStack {
                            Image(systemName: "ipad")
                            Text("iPad")
                                .font(.system(.caption, design: .rounded))
                        }
                        Spacer()
                        VStack {
                            Image(systemName: "desktopcomputer")
                            Text("Mac")
                                .font(.system(.caption, design: .rounded))
                        }
                        Spacer()
                    }
                }
                Spacer()
                HStack {
                    Image("Twitter_Logo_Blue")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Link("@Supleezy", destination: URL(string: "https://www.twitter.com/supleezy")!)
                        .foregroundColor(Color(red: 74/255, green: 161/255, blue: 236/255))
                        .font(Font.system(.callout, design: .rounded).weight(.heavy))
                }
                Spacer()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct HeartView_Previews: PreviewProvider {
    static var previews: some View {
        HeartView()
            
            
            
    }
}
