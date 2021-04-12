//
//  InsertFactsView.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 07/04/21.
//

import SwiftUI

struct InsertFactsView: View {
    
    let animal : Animal
    
    var body: some View {
        GroupBox {
            
            TabView{
            
                ForEach(animal.fact, id : \.self) { item in
                    Text(item)
                }
            
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight : 148, idealHeight: 168, maxHeight: 180)
        }// Group Box Ends
    }
}

struct InsertFactsView_Previews: PreviewProvider {
    
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    
    static var previews: some View {
        InsertFactsView(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
