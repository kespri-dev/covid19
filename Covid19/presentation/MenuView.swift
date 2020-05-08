//
//  MenuView.swift
//  Covid19
//
//  Created by Kévin Esprit on 08/05/2020.
//  Copyright © 2020 Kesprit. All rights reserved.
//

import SwiftUI

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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
