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
    
    var maxCase: Int {
        globalCases.cases.sorted { $0.number > $1.number }
            .first?.number ?? 1
    }
    
    private var cases: [GlobalCase] {
        self.globalCases.cases.sorted {
            $0.date < $1.date
        }
    }
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("7 derniers jours")
                    .font(.title)
                    .foregroundColor(.black)
                Spacer()
            }
            
            HStack(spacing: 15) {
                
                ForEach(cases, id:\.self) { element in
                    ChartCell(number: element.number, date: element.date, numberMax: self.maxCase)
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
