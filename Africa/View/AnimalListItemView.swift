//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 07/04/21.
//

import SwiftUI

struct AnimalListItemView: View {
    let animal : Animal

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 8)
                {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing,8)
                    .lineLimit(3)
            }//VStack Ends
     
            
            
        }//HStack Ends
    
        
        
    }


}


struct AnimalListItemView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    
    static var previews: some View {
        AnimalListItemView(animal : animals[5])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
