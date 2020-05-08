//
//  CardView.swift
//  Covid19
//
//  Created by Kévin Esprit on 08/05/2020.
//  Copyright © 2020 Kesprit. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    let width: CGFloat
    let title: String
    let details: String
    let backgroundColor: Color
    
    var body: some View {
        
        VStack(spacing: 12) {
            Text(title)
                .bold()
            Text(details)
                .bold()
        }
        .padding(.vertical)
        .frame(width: width)
        .background(backgroundColor)
        .cornerRadius(12)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(width: 200, title: "Title", details: "300K", backgroundColor: .active)
    }
}
