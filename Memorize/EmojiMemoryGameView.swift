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
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110 - 90))
                    .padding(5)
                    .opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .font(.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geomtry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
        
    }
    
//    private func font(in size: CGSize) -> Font{
//        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
//    }
    
    private func scale(thatFits size: CGSize) -> CGFloat{
        min(size.width, size.height) / (DrawingConstants.fontSize/DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontSize: CGFloat = 32
        static let fontScale: CGFloat = 0.75
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemeoryGame()
        EmojiMemoryGameView(game: viewModel)
    }
}
