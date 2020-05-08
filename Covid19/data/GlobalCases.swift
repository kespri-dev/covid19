//
//  GlobalCases.swift
//  Covid19
//
//  Created by Kévin Esprit on 08/05/2020.
//  Copyright © 2020 Kesprit. All rights reserved.
//

import Foundation

struct GlobalCases: Decodable, Hashable {
    
    enum CodingKeys: CodingKey {
        case cases
    }
    
    var cases: [GlobalCase] = []
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let cases = try values.decode([String:Int].self, forKey: .cases)
        self.cases = cases.map { GlobalCase(date: $0, number: $1) }
    }

    init() {
        self.cases = []
    }
    
    static var empty: Self {
        .init()
    }
}

struct GlobalCase: Decodable, Hashable {
    
    let date: String
    let number: Int
}
