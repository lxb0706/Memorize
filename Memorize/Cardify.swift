//
//  Cardify.swift
//  Memorize
//
//  Created by lxb on 2021/12/17.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    
    func body(content: Content) -> some View {
        let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRaduis)
        if isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
        }
        else {
            shape.fill()
        }
        content.opacity(isFaceUp ? 1 : 0)
    }
    
    private struct DrawingConstants {
        static let cornerRaduis: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}

extension View{
    func cardify(isFaceUp: Bool) -> some View{
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
