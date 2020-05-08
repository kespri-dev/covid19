//
//  ContentView.swift
//  Covid19
//
//  Created by Kévin Esprit on 08/05/2020.
//  Copyright © 2020 Kesprit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = 0
    @ObservedObject var manager = ApiManager()
    
    private var covidData: CovidData {
        (selectedIndex == 0) ? manager.countryCovidData : manager.globalCovidData
    }
    
    private var covidHistoryCases: GlobalCases {
        (selectedIndex == 0) ? manager.countryHistoryCases : manager.globalHistoryCases
    }
    
    var body: some View {
        VStack(spacing: 20) {
            MenuView()
                .padding(.horizontal)
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) + 15)
            SwitchView(selectedIndex: $selectedIndex)
                .foregroundColor(.white)
            HStack(spacing: 15) {
                CardView(width: (UIScreen.main.bounds.width / 2) - 30, title: "Infectés", details: covidData.cases.formatted, backgroundColor: .affected)
                CardView(width: (UIScreen.main.bounds.width / 2) - 30, title: "Morts", details: covidData.deaths.formatted, backgroundColor: .death)
            }
            .foregroundColor(.white)
            
            HStack(spacing: 15) {
                CardView(width: (UIScreen.main.bounds.width / 3) - 25, title: "Soignés", details: covidData.recovered.formatted, backgroundColor: .recovered)
                CardView(width: (UIScreen.main.bounds.width / 3) - 25, title: "Cas Actifs", details: covidData.active.formatted, backgroundColor: .active)
                CardView(width: (UIScreen.main.bounds.width / 3) - 25, title: "Graves", details: covidData.critical.formatted, backgroundColor: .serious)
            }
            .foregroundColor(.white)
            ChartView(globalCases: covidHistoryCases)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .padding(.bottom, -(UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0))
            Spacer(minLength: 0)
        }
        .background(Color.background)
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            self.manager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
