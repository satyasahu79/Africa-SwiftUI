//
//  VideosListItems.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 08/04/21.
//

import SwiftUI

struct VideosListItemsView: View {
    //MARK:- Properties
    let video : Video
    
    
    
    //MARK: - Body
    
    var body: some View {
        HStack {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height:80)
                    .cornerRadius(9)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height : 32)
                    .shadow(radius: 4 )
            }// ZStack Ends
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text(video.name)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                    .font(.title2)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            })
            
            
        }// HStack Ends
        
        
        
        
        
        
    }
}




//MARK:- Preview


struct VideosListItems_Previews: PreviewProvider {
    static let videos : [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideosListItemsView(video: videos[4])
            .previewLayout(.sizeThatFits)
            .padding()
}
}
