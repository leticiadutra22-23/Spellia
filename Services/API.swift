//
//  API.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 11/10/22.
//

import Foundation

class API {
    
    static func getSpells() async -> [Spell]{
        let link: String = "https://wizard-world-api.herokuapp.com/Spells"
        let request = URLRequest(url: URL(string: link)!)
        let decoder = JSONDecoder()
        let formatter = ISO8601DateFormatter()
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let spellInfoDecoded = try JSONDecoder().decode([Spell].self, from: data)
        } catch {
            print(error)
        }
        return []
    }
}
