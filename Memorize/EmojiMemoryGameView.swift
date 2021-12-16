//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by lxb on 2021/12/7.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemeoryGame
    
    var body: some View {
        
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
           cardView(for: card)
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func cardView(for card:  EmojiMemeoryGame.Card) -> some View{
        if card.isMatched && !card.isFaceUp{
            Rectangle().opacity(0.1)
        }else{
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
        }
    }
}



struct CardView : View {
    var card: EmojiMemeoryGame.Card
    var body: some View {
        
        GeometryReader{ geomtry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRaduis)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110 - 90)).padding(5).opacity(0.5)
                    Text(card.content).font(font(in: geomtry.size))
                } else if card.isMatched {
                    shape.opacity(0.0)
                } else {
                    shape.fill()
                }
            }
        }
        
    }
    
    private func font(in size: CGSize) -> Font{
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRaduis: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.75
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemeoryGame()
        EmojiMemoryGameView(game: viewModel)
    }
}
