//
//  ChartCell.swift
//  Covid19
//
//  Created by Kévin Esprit on 08/05/2020.
//  Copyright © 2020 Kesprit. All rights reserved.
//

import SwiftUI

struct ChartCell: View {
    let number: Int
    let date: String
    let numberMax: Int
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(number / 1000)K")
                .font(.system(size: 10))
            GeometryReader { g in
                VStack {
                    Spacer(minLength: 0)
                    Color.death
                        .frame(width: 12, height: self.heightRatio(value: self.number, height: g.frame(in: .global).height))
                        .clipShape(Capsule())
                }
            }
            Text(date)
                .font(.system(size: 10))
        }
        .foregroundColor(.gray)
    }
    
    private func heightRatio(value: Int, height: CGFloat) -> CGFloat {
        let ratio = height / CGFloat(numberMax)
        return CGFloat(CGFloat(value) * ratio)
    }
}

struct ChartCell_Previews: PreviewProvider {
    static var previews: some View {
        ChartCell(number: 30_000, date: "04/04/20", numberMax: 1000000)
    }
}
