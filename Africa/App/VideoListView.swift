//
//  VideoListView.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 06/04/21.
//

import SwiftUI

struct VideoListView: View {
    //MARK:- Properties
    
   @State var videos : [Video] = Bundle.main.decode("videos.json")
    let hapticImpac = UIImpactFeedbackGenerator(style: .medium)
    
    
    //MARK: - Body
    var body: some View {
        
        
        
        NavigationView {
            List {
                ForEach(videos) {   item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideosListItemsView(video: item)
                            .padding(.vertical,8)
                    }
                }
            }// List Ends
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos",displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        videos.shuffle()
                        hapticImpac.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                    
                    
                    
                    
                } // ToolBar item ends
                
                
                
            } // Toolbar Ends
            
        }// Navigation View Ends
    }
}





//MARK:- Preview
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
