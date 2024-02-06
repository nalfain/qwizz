//
//  ContentView.swift
//  qwizz
//
//  Created by X on 29.01.2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🎃","👻","🤡","💩","🎃","👻","🤡","💩","🎃","?","🎃","👻","🤡"]
    @State var cardCount = 9
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer ()
            cardCountAdjusters
            }
            .padding()
        }
    var cards: some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 90))]) { //тоже доразобраться.
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    var cardCountAdjusters: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjusters(by offset: Int, symbol: String) -> some View {
        Button(action: {
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count) // || означает или, count - количество элементов строки.
    }
    
    var cardRemover: some View {
        cardCountAdjusters(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjusters(by: +1, symbol: "plus.rectangle.on.rectangle.fill")
    }
}
    
struct CardView: View {
    let content: String
    @State var isFaseUP = true
    var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
//                if isFaseUP {
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
//                } else {
//                    base.fill()
                .opacity(isFaseUP ? 1 : 0) //непонятно как работает
                base.fill().opacity(isFaseUP ? 0 : 1) //непонятно как работает
            }
        .onTapGesture {
            isFaseUP.toggle() //Ошибку уберет перед переменной - @State
        }
    }
}

// Это превью выводит.
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
