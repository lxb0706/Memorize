//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by lxb on 2021/12/9.
//

import Foundation
import SwiftUI

class EmojiMemeoryGame: ObservableObject{
    
    typealias Card = MemoryGame<String>.Card
    
    static let  emojis = ["🚗","✈️","🚚","🛵","🚀","⛱","🏰","🏟","⛵️","🚁","🚢","🚧","🛣","📺","🛳","🚍"]
    
    static func createMemoryGame(numberOfPairs: Int) -> MemoryGame<String>{
        MemoryGame(numberOfPairsOfCards: numberOfPairs) { emojis[$0] }
    }

    @Published private(set) var model = createMemoryGame(numberOfPairs: 10)
    
//    @Published private(set) var model: MemoryGame<String> = {
//        MemoryGame(numberOfPairsOfCards: 10) { emojis[$0] }
//    }()
    
    var cards: [Card] {
        model.cards
    }
    
    func choose(_ card: Card){
        model.choose(card)
    }
}
