//
//  ChartView.swift
//  Covid19
//
//  Created by Kévin Esprit on 08/05/2020.
//  Copyright © 2020 Kesprit. All rights reserved.
//

import SwiftUI

struct ChartView: View {
    var globalCases: GlobalCases
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Last 7 Days")
                    .font(.title)
                    .foregroundColor(.black)
                Spacer()
            }
            
            HStack(spacing: 15) {
                
                ForEach(globalCases.cases, id:\.self) { element in
                    ChartCell(number: element.number, date: element.date)
                }
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(globalCases: .empty)
    }
}
