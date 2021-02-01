//
//  Concentration.swift
//  Cardgame
//
//  Created by Sangyu Chen on 1/20/21.
//

import Foundation

struct Concentration<cardtype> where cardtype: Equatable{ //Equatable for comparison in line 18
    var cards: Array<Card>
    var theme: Theme
    
    var ongoing: Int? //the card that is faced
    mutating func choose(card: Card){
        if let chosenindex: Int = self.index(of: card), !cards[chosenindex].isFaceup, !cards[chosenindex].isMatched{
            if let next = ongoing{
                if cards[chosenindex].type == cards[next].type{
                    cards[chosenindex].isMatched=true
                    cards[next].isMatched=true
                }
                ongoing = nil
            }
            else{
                for i in cards.indices{
                    cards[i].isFaceup = false
                }
                ongoing = chosenindex
            }
            self.cards[chosenindex].isFaceup = true
        }
    }
    
    func index(of card:Card)->Int{
        for index in 0..<self.cards.count{
            if self.cards[index].id == card.id{
                return index
            }
        }
        return 0
    }

    
    init(theme: Theme, typegenerate:(Int)->cardtype){
        cards=Array<Card>()
        for pair in 0..<theme.numpairs {
            let type0 = typegenerate(pair)
            cards.append(Card(isFaceup: false, isMatched: false, type: type0, id:pair*2))
            cards.append(Card(isFaceup: false, isMatched: false, type: type0, id:pair*2+1))
        }
        self.theme = theme
        cards.shuffle()
        
    }
    
    struct Card: Identifiable{
        var isFaceup: Bool 
        var isMatched: Bool
        var type: cardtype
        var id: Int
    }
}
