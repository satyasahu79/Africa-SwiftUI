//
//  VideoModel.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 08/04/21.
//

import Foundation
import SwiftUI

struct Video : Codable,Identifiable {
    let id : String
    let name : String
    let headline : String
    
    //Computed Property
    
    var thumbnail: String{
        "video-\(id)"
    }
}
