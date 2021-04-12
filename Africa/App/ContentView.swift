//
//  ContentView.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 06/04/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    let animals : [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive : Bool = false
    
    @State private var gridLayout : [GridItem] = [GridItem(.flexible()) ]
    @State private var gridColumn : Int = 1
    @State private var toolbarIcon : String = "square.grid.2x2"
    
    //MARK: - Function
    func gridSwitch()   {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1 )
    
        gridColumn = gridLayout.count
        print("Grid Number \(gridColumn)")
        
        
        // Tool Bar Image
        switch gridColumn {
        case 1:
            toolbarIcon = "rectangle.grid.1x2"
        case 2:
            toolbarIcon = "square.grid.2x2"
        
        case 3:
            toolbarIcon = "square.grid.3x2"
            
        default:
            toolbarIcon = "square.grid.2x2"
        }
    
    
    }
    
    
   // MARK: - Body
    var body: some View {
        NavigationView{
            Group{
                
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                        ForEach(animals) { animal in
                            NavigationLink(destination : AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                            }//End of Link
                        }//End of Loop
                        HStack {
                            Spacer()
                            CreditsView()
                            Spacer()
                        }
                        
                    
                    
                    }// List Ends
                } else {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                            
                            ForEach(animals) { animal in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }
                            }// End of Loop
                            }) // End of Grid
                        .padding(10)
                        .animation(.easeIn)
                        
                        
                    })// End of Scroll View
                    
                    
                } // End of else
                
            }// End os Group
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .navigationBarTitle("Africa",displayMode: .large)
            .toolbar {
                ToolbarItem(placement : .navigationBarTrailing) {
                    HStack(spacing : 16)    {
                        //List
                        Button(action: {
                            print("List View is Activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        })
                        
                        // Grid Layout
                        Button(action: {
                            print("Grid View is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        })
                    }// HStack Ends
                } // ToolBar Item Ends
            } // ToolBar Ends
        }// Navigation View Ends
            
    }
}



//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
