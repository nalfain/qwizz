//
//  ContentView.swift
//  qwizz
//
//  Created by gost on 29.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView(isFaseUP: true)
            CardView()
            CardView(isFaseUP: true)
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}



struct CardView: View {
    var isFaseUP: Bool = false
    var arr=5
    var body: some View {
        ZStack(content: {
            if isFaseUP {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
