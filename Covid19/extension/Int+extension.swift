//
//  Int+extension.swift
//  Covid19
//
//  Created by Kévin Esprit on 08/05/2020.
//  Copyright © 2020 Kesprit. All rights reserved.
//

import Foundation

extension Int {
    var formatted: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale.current
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
   }
}
