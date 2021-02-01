//
//  Grid.swift
//  Cardgame
//
//  Created by Sangyu Chen on 1/20/21.
//

import SwiftUI

struct Grid<Item,Iview>: View where Item: Identifiable, Iview: View{
    var items: [Item]
    var vi: (Item) -> Iview
    
    init(_ items: [Item], vi:@escaping (Item) -> Iview){
        self.items = items
        self.vi = vi
    }
    
    var body: some View {
        GeometryReader{ geometry in //space
            self.buildcontainer(for: GridLayout(itemCount:self.items.count, in: geometry.size))
        }
    }
    func buildcontainer(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.itemspace(for: item, in: layout)
            
        }
    }
    func itemspace(for item: Item, in layout: GridLayout) -> some View{
        let index = self.getindex(of: item)
        return vi(item)
            .frame(width: layout.itemSize.width, height:layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
    
    func getindex(of item:Item) -> Int{
        for k in 0..<items.count {
            if items[k].id==item.id{
                return k
            }
        }
        
        return 0
    }
}

