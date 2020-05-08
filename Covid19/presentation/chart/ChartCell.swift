//
//  ChartCell.swift
//  Covid19
//
//  Created by Kévin Esprit on 08/05/2020.
//  Copyright © 2020 Kesprit. All rights reserved.
//

import SwiftUI

struct ChartCell: View {
    let number: String
    let date: String
    
    var body: some View {
        VStack(spacing: 12) {
            Text(number)
                .font(.caption)
            GeometryReader { g in
                VStack {
                    Spacer(minLength: 0)
                    Color.death
                        .frame(width: 12)
                        .clipShape(Capsule())
                }
            }
            Text(date)
                .font(.system(size: 10))
        }
        .foregroundColor(.gray)
    }
}

struct ChartCell_Previews: PreviewProvider {
    static var previews: some View {
        ChartCell(number: "300K", date: "04/04/20")
    }
}
