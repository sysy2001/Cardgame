//
//  emoji.swift
//  Cardgame
//
//  Created by Sangyu Chen on 1/20/21.
//

import Foundation

class emoji: ObservableObject{
    
    @Published private var game: Concentration<String> = emoji.setgame()
    
    private static func setgame() -> Concentration<String>{
        let emojitheme = Themeset.randomElement()!
        let emojis = emojitheme.emojiset
        return Concentration<String>(theme: emojitheme){ pair in
            return emojis[pair]
        }
        
    }
    
    var cards:Array<Concentration<String>.Card>{
        return game.cards
    }
    
    func choose(card: Concentration<String>.Card){
        game.choose(card: card)
    }
    
    func reset(){
        game = emoji.setgame()
    }
}
