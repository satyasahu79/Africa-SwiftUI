//
//  InsertGalleryView.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 07/04/21.
//

import SwiftUI

struct InsertGalleryView: View {
    //MARK: - Properties
    
    let animal : Animal
    
    //MARL: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators : false){
            HStack {
                ForEach(animal.gallery,id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height : 200)
                        .cornerRadius(12)
                }//End of the Loop
            }// HStack Ends


        }//Scroll View Ends
        
    }
}

//MARK: - Properties
struct InsertGalleryView_Previews: PreviewProvider {
    
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    
    static var previews: some View {
        InsertGalleryView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
