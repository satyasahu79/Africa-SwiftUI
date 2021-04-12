//
//  CenterModifier.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 10/04/21.
//

import Foundation
import SwiftUI

struct CenterModifier : ViewModifier {
    func body(content : Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
        
    }
}
