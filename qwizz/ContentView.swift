//
//  ContentView.swift
//  qwizz
//
//  Created by gost on 29.01.2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🎃","👻","🤡","💩","🎃"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            
            }
     }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaseUP = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaseUP {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaseUP.toggle() //Ошибку уберет перед переменной - @State
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
