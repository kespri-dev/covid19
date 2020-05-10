//
//  CovidData.swift
//  Covid19
//
//  Created by Kévin Esprit on 08/05/2020.
//  Copyright © 2020 Kesprit. All rights reserved.
//

import Foundation

struct CovidData: Decodable {
    
    let updated: Double
    let cases: Int
    let todayCases: Int
    let deaths: Int
    let todayDeaths: Int
    let recovered: Int
    let active: Int
    let critical: Int
    let casesPerOneMillion: Int
    let deathsPerOneMillion: Int
    let tests: Int
    let testsPerOneMillion: Double
    let country: String?
    
    static var empty: CovidData {
        .init(updated: 0, cases: 0, todayCases: 0, deaths: 0, todayDeaths: 0, recovered: 0, active: 0, critical: 0, casesPerOneMillion: 0, deathsPerOneMillion: 0, tests: 0, testsPerOneMillion: 0, country: "")
    }
}
