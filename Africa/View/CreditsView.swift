//
//  CreditsView.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 10/04/21.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128, alignment: .center)
                        Text("""
                 Copyright © Satya Prakash Sahu
                 All right reserved
                 Better Apps ♡ less Code
                 """)
                .font(.footnote)
                .multilineTextAlignment(.center)
            
        }// End os VStack
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
