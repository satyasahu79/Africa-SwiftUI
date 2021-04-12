//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 10/04/21.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - Properties
    
    let animal : Animal
    
    
    
    // MARK: - Body
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}




// MARK: - Preview
struct AnimalGridItemView_Previews: PreviewProvider {
    static var animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
