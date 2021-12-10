//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by lxb on 2021/12/9.
//

import Foundation
import SwiftUI

class EmojiMemeoryGame: ObservableObject{
    
    static let  emojis = ["🚗","✈️","🚚","🛵","🚀","⛱","🏰","🏟","⛵️","🚁","🚢","🚧","🛣","📺","🛳","🚍"]
    
    static func createMemoryGame(numberOfPairs: Int) -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: numberOfPairs) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private(set) var model:MemoryGame<String> = createMemoryGame(numberOfPairs: 4)
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
