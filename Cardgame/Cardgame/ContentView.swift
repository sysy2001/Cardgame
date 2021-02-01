//
//  ContentView.swift
//  Cardgame
//
//  Created by Sangyu Chen on 1/15/21.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var Egame: emoji
    var body: some View {
        
        Grid(Egame.cards){ card in
            Displaycards(card: card).onTapGesture{
                withAnimation(.linear(duration: 0.5)){
                Egame.choose(card: card)
            }
            }
            .padding(7)
        }
        
            .padding()
            .foregroundColor(.yellow)
        
        //button for reset
        Button(action:{ withAnimation(.linear(duration: 0.5)){
            self.Egame.reset()
        }}){
            Text("New Round")
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
            .stroke(Color.gray,lineWidth: 2)
            )
                            
        }
        .padding(5)

    }
    
}

struct Displaycards: View{
    var card : Concentration<String>.Card
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                if card.isFaceup{
                RoundedRectangle(cornerRadius: 15.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 15.0).stroke(lineWidth: 3)
                    Text(card.type)
                }
                else{
                    if !card.isMatched{
                        RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
                    }
                }
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height)*0.7))
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(Egame: emoji())
    }
}
