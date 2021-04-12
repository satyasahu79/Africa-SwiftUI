//
//  InsertMapView.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 07/04/21.
//

import SwiftUI
import MapKit


struct InsertMapView: View {
//MARK:- Properties
    
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599),span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0) )
    
    
//MARK:- Body
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination : MapView()){
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                        
                    }// HStack Ends
                    .padding(.horizontal,14)
                    .padding(.vertical,10)
                    
                    
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    
                    
                    )// Background Ends
                }// Navigation Link Ends
                .padding(12),alignment: .topTrailing
            ) // Overlay Ends
            .frame(height : 256)
            .cornerRadius(12)
    }
}




//MARK:- Preiew
struct InsertMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsertMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
