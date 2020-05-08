//
//  SwitchView.swift
//  Covid19
//
//  Created by Kévin Esprit on 08/05/2020.
//  Copyright © 2020 Kesprit. All rights reserved.
//

import SwiftUI

struct SwitchView: View {
    
    struct SwitchButton: View {
        
        @Binding var selectedIndex: Int
        let index: Int
        let text: String
        
        var body: some View {
            Button(action: {
                self.selectedIndex = self.index
            }) {
                Text(self.text)
                    .frame(width: (UIScreen.main.bounds.width / 2 - 30))
                    .padding(.vertical, 12)
                    .foregroundColor((self.selectedIndex == self.index) ? .black : .white)
                
            }
            .background((self.selectedIndex == self.index) ? Color.white : Color.clear)
            .clipShape(Capsule())
        }
    }
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            SwitchButton(selectedIndex: $selectedIndex, index: 0, text: "My Country")
            Spacer()
            SwitchButton(selectedIndex: $selectedIndex, index: 1, text: "Global")
        }
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color.black.opacity(0.25))
        .clipShape(Capsule())
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView(selectedIndex: .constant(0))
    }
}
