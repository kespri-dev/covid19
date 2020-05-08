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
    
    var body: some View {
        VStack(spacing: 20) {
            MenuView()
                .padding(.horizontal)
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) + 15)
            SwitchView(selectedIndex: $selectedIndex)
            
            HStack(spacing: 15) {
                CardView(width: (UIScreen.main.bounds.width / 2) - 30, title: "Affected", details: "59,474", backgroundColor: .affected)
                CardView(width: (UIScreen.main.bounds.width / 2) - 30, title: "Deaths", details: "3,682", backgroundColor: .death)
            }
            .foregroundColor(.white)
            
            HStack(spacing: 15) {
                CardView(width: (UIScreen.main.bounds.width / 3) - 25, title: "Recoverred", details: "59,474", backgroundColor: .recovered)
                CardView(width: (UIScreen.main.bounds.width / 3) - 25, title: "Active", details: "3,682", backgroundColor: .active)
                CardView(width: (UIScreen.main.bounds.width / 3) - 25, title: "Serious", details: "3,682", backgroundColor: .serious)
            }
            .foregroundColor(.white)
            
            ChartView()
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .padding(.bottom, -(UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0))
        }
        .background(Color.background)
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MenuView: View {
    var body: some View {
        HStack {
            Text("Statistics")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            Button(action: {
                print("TODO")
            }) {
                Text("FRANCE")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
}
