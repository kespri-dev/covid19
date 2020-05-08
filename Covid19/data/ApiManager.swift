//
//  ApiManager.swift
//  Covid19
//
//  Created by Kévin Esprit on 08/05/2020.
//  Copyright © 2020 Kesprit. All rights reserved.
//

import Foundation

class ApiManager: ObservableObject {
    
    @Published var covidData: CovidData = .empty
    @Published var globalCases: GlobalCases = .empty
    
    func fetchData() {
        fetchAllData()
        fetchGlobalCases()
    }
    
    func fetchAllData() {
        
        guard let url = URL(string: "https://corona.lmao.ninja/v2/all?today") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let covidData = try! JSONDecoder().decode(CovidData.self, from: data!)
            
            DispatchQueue.main.async {
                self.covidData = covidData
            }
        }
        .resume()
    }
    
    func fetchGlobalCases() {
        guard let url = URL(string: "https://corona.lmao.ninja/v2/historical/all?lastdays=7") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let globalCases = try! JSONDecoder().decode(GlobalCases.self, from: data!)
            
            DispatchQueue.main.async {
                self.globalCases = globalCases
            }
        }
        .resume()
    }
}
