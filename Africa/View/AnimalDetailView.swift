//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 07/04/21.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal : Animal

    var body: some View {
        
        ScrollView(.vertical, showsIndicators : false)  {
            
            
            VStack(alignment: .center, spacing: 20) {
               // Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // Title
                Text(animal.name.uppercased())
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                    .padding(.vertical,8)
                    .multilineTextAlignment(.center)
                    .background(Color.accentColor
                                    .frame(height:6)
                                    .offset(y:24)
                        )
                //Headline
                Text(animal.headline)
                    .font(.headline)
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                
                // Gallery
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsertGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // Facts
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsertFactsView(animal: animal)
                }
                .padding(.horizontal)
                // Description
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                // Map
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    
                    InsertMapView()
                    
                }
                .padding(.horizontal)
                
                
                // Link
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalWebLinkView(animal: animal)
                }
                .padding(.horizontal)
                
                
                
            }// VStack Ends
            .navigationBarTitle("Learn about \(animal.name)",displayMode: .inline)

        }//Scroll View ends
        
    
    
        
        
       
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[6])
        }
        
        
       
    }
}
