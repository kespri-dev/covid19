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
    
    var body: some View {
        VStack(spacing: 20) {
            MenuView()
                .padding(.horizontal)
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) + 15)
            SwitchView(selectedIndex: $selectedIndex)
                .foregroundColor(.white)
            HStack(spacing: 15) {
                CardView(width: (UIScreen.main.bounds.width / 2) - 30, title: "Affected", details: manager.covidData.cases.formatted, backgroundColor: .affected)
                CardView(width: (UIScreen.main.bounds.width / 2) - 30, title: "Deaths", details: manager.covidData.deaths.formatted, backgroundColor: .death)
            }
            .foregroundColor(.white)
            
            HStack(spacing: 15) {
                CardView(width: (UIScreen.main.bounds.width / 3) - 25, title: "Recoverred", details: manager.covidData.recovered.formatted, backgroundColor: .recovered)
                CardView(width: (UIScreen.main.bounds.width / 3) - 25, title: "Active", details: manager.covidData.active.formatted, backgroundColor: .active)
                CardView(width: (UIScreen.main.bounds.width / 3) - 25, title: "Serious", details: manager.covidData.critical.formatted, backgroundColor: .serious)
            }
            .foregroundColor(.white)
            ChartView(globalCases: self.manager.globalCases)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .padding(.bottom, -(UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0))
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
