//
//  ApiManager.swift
//  Covid19
//
//  Created by Kévin Esprit on 08/05/2020.
//  Copyright © 2020 Kesprit. All rights reserved.
//

import Foundation

class ApiManager: ObservableObject {
    
    @Published var globalCovidData: CovidData = .empty
    @Published var countryCovidData: CovidData = .empty
    @Published var globalHistoryCases: GlobalCases = .empty
    @Published var countryHistoryCases: GlobalCases = .empty
    
    func fetchData() {
        fetchGlobalData()
        fetchGlobalHistoryCases()
        fetchCountryData()
        fetchCountryHistoryCases()
    }
    
    func fetchGlobalData() {
        
        guard let url = URL(string: "https://corona.lmao.ninja/v2/all?today") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let covidData = try! JSONDecoder().decode(CovidData.self, from: data!)
            
            DispatchQueue.main.async {
                self.globalCovidData = covidData
            }
        }
        .resume()
    }
    
    func fetchGlobalHistoryCases() {
        guard let url = URL(string: "https://corona.lmao.ninja/v2/historical/all?lastdays=7") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let globalCases = try! JSONDecoder().decode(GlobalCases.self, from: data!)
            
            DispatchQueue.main.async {
                self.globalHistoryCases = globalCases
            }
        }
        .resume()
    }
    
    func fetchCountryData() {
        guard let url = URL(string: "https://corona.lmao.ninja/v2/countries/france?yesterday=false") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let countryCovidData = try! JSONDecoder().decode(CovidData.self, from: data!)
            
            DispatchQueue.main.async {
                self.countryCovidData = countryCovidData
            }
        }
        .resume()
    }
    
    func fetchCountryHistoryCases() {
        guard let url = URL(string: "https://corona.lmao.ninja/v2/historical/france?lastdays=7") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let countryHistoryCases = try! JSONDecoder().decode(CountryHistoryCases.self, from: data!)
            
            DispatchQueue.main.async {
                self.countryHistoryCases = countryHistoryCases.timeline
            }
        }
        .resume()
    }
}
