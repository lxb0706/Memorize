//
//  MemoryGame.swift
//  Memorize
//
//  Created by lxb on 2021/12/9.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    
    private(set) var cards: [Card] = []
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card){
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    
    init(numberOfPairsOfCards: Int, content: (Int)->CardContent){
        var cards:[Card] = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let cardContent = content(pairIndex)
            cards.append(Card(content: cardContent, id: pairIndex * 2))
            cards.append(Card(content: cardContent, id: pairIndex * 2+1))
        }
        self.cards = cards//.shuffled()
    }
    
    
    struct Card: Identifiable{
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
        var id: Int
    }
}
