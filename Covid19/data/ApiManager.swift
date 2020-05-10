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
    @Published var countriesCovidData: [CovidData] = []
    
    var selectedCountry: String = "France" {
        didSet {
            fetchData()
        }
    }
    
    private let baseUrl: String = "https://corona.lmao.ninja/v2/"
    
    func fetchData() {
        fetchGlobalData()
        fetchGlobalHistoryCases()
        fetchCountryData()
        fetchCountryHistoryCases()
        fetchCountries()
    }
    
    func fetchGlobalData() {
        fetch(with: "\(baseUrl)all?today", for: CovidData.self) {
            self.globalCovidData = $0
        }
    }
    
    func fetchGlobalHistoryCases() {
        fetch(with: "\(baseUrl)historical/all?lastdays=7", for: GlobalCases.self) {
            self.globalHistoryCases = $0
        }
    }
    
    func fetchCountryData() {
        fetch(with: "\(baseUrl)countries/\(selectedCountry.lowercased())?yesterday=false", for: CovidData.self) {
            self.countryCovidData = $0
        }
    }
    
    func fetchCountryHistoryCases() {
        fetch(with: "\(baseUrl)historical/\(selectedCountry.lowercased())?lastdays=7", for: CountryHistoryCases.self) {
            self.countryHistoryCases = $0.timeline
        }
    }
    
    func fetchCountries() {
        fetch(with: "\(baseUrl)countries?yesterday=false", for: [CovidData].self) {
            self.countriesCovidData = $0
        }
    }
    
    private func fetch<T: Decodable>(with url: String, for type: T.Type, completion: @escaping (T) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else { return }
            
            guard let decodedDatas = try? JSONDecoder().decode(T.self, from: data!) else { return }
            
            DispatchQueue.main.async {
                completion(decodedDatas)
            }
        }
        .resume()
    }
}
