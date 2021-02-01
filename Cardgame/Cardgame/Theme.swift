//
//  Theme.swift
//  Cardgame
//
//  Created by Sangyu Chen on 1/25/21.
//

import Foundation


struct Theme: Codable{
    let name: String
    var emojiset: Array<String>
    var numpairs: Int
    
    init(name: String, emojiset: Array<String>, numpairs: Int){
        self.name=name
        self.emojiset=emojiset
        self.numpairs=numpairs
    }
    
}

let Themeset=[breakfirst,faces,objects,fruits,desserts]

let breakfirst = Theme(name: "Breakfast", emojiset:["🥨","🥞","🥐","🍳","🌮","🧇","🍤","🍞","🍣","🍜","🌭","🍔"], numpairs: Int.random(in: 5...12) )
let faces = Theme(name: "faces", emojiset:["🥺","🥳","🥰","🧐","😫","😢","😡","🤯","😴","😚","😇","😲"], numpairs: Int.random(in: 5...12) )

let objects = Theme(name: "objects", emojiset:["🎸","🎻","🎷","🥁","🪕","🎹","🎺","🎨","♟","🎮","🎭","🩰"], numpairs: Int.random(in: 5...12) )

let fruits = Theme(name: "fruits", emojiset:["🍏","🍎","🍊","🍐","🍋","🍌","🍉","🍇","🍓","🍑","🥥","🥝"], numpairs: Int.random(in: 5...12))

let desserts = Theme(name: "desserts", emojiset:["🍮","🍭","🍦","🍰","🍫","🧁","🍡","🍧","🍨","🍪","🍿","🍩"], numpairs: Int.random(in: 5...12) )

