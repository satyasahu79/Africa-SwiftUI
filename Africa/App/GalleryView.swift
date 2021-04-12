//
//  GalleryView.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 06/04/21.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - Properties
    
    @State private var selectedAnimal : String = "lion"
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
//    //Simple Grid Definition
//    let grindLayout : [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//
//    ]
    
   // Efficient Grid Defination
   // let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
// Dynamic Grid Layout
    
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Double = 3.0
    
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    
    
    
    
    //MARK:- Body
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
           
            VStack(alignment: .center, spacing:30) {
                
                //MARK: - Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.accentColor,lineWidth: 4))
                //MARK: - Slider
                
                
                Slider(value: $gridColumn, in: 2...4, step : 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                           
                    })
                    
                
                
                
                
                //MARK: - Grid
                
                LazyVGrid(columns: gridLayout,alignment : .center,spacing : 10, content: {
                    
                    ForEach(animals) { item in
                        
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white,lineWidth: 1))
                            .onTapGesture {
                            selectedAnimal = item.image
                                hapticImpact.impactOccurred()
                        }
                    } // End of Loop
                    
                    
                    
                    
                })  // End of Lazy Vertical Grid
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            
            
            }   // End of VStack
            .padding(.horizontal,10)
            .padding(.vertical,50)
            
            
        }// Scroll View Ends
        .frame(maxWidth: .infinity, maxHeight: .infinity) .background(MotionAnimationView())
        
        
        
        
    }
}




// MARK: - Preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
