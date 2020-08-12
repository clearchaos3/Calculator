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
                Link("@Supleezy", destination: URL(string: "https://www.twitter.com/supleezy")!)
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
