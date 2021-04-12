//
//  MapView.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 06/04/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - Properties
    @State private var region : MKCoordinateRegion = {
        
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0 )
        
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    
    }()
    
    let locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    
    //MARK:- Body
    var body: some View {
        
        //MARK: - 1. Basic Map
        
        //Map(coordinateRegion: $region)
    
        //MARK: - 2. Advacned Map
    
        Map(coordinateRegion: $region, annotationItems : locations, annotationContent : {
            item in
            
         // (A) PIN : Old Style always Static
            
            //MapPin(coordinate: item.location,tint: .accentColor)
            
        // (B) MARKER : NEW STYLE ALWAYS STATIC
            
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            
        // (C) Custom Basic Map Annotation
            
//            MapAnnotation(coordinate: item.location){
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            } // Annotation Ends
            
            
            // (D) Complex Map Annotation : It could be insteractive
            
            MapAnnotation(coordinate: item.location)    {
                MapAnnotationView(location: item)
            }
        })
        .overlay(
            HStack(alignment: .center, spacing: 12, content: {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3, content: {
                    HStack{
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .foregroundColor(.white)
                    }
                    HStack{
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .foregroundColor(.white)
                    }
                    
                    
                })
                
                
                
            })// End of HStack
            .padding(.vertical,12)
            .padding(.horizontal,16)
            .background(
                Color.black
                .cornerRadius(8)
                .opacity(0.6)
            )
            .padding(),alignment: .top
        )
    
    }
}



//MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MapView()
            
        }
    }
}
