//
//  API.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 11/10/22.
//

import Foundation

class API {
    
    static func getAllSpells() async -> [Spell] {
        let link: String = "https://wizard-world-api.herokuapp.com/Spells"
        let request = URLRequest(url: URL(string: link)!)
        let decoder = JSONDecoder()
        let formatter = ISO8601DateFormatter()
        
        decoder.dateDecodingStrategy = .custom({ decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            
            if let date = formatter.date(from: dateString){
                return date
            }
            
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "")
        })
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            let spellList = try decoder.decode([Spell].self, from: data)
            return spellList
        } catch {
            print(error)
            
        }
        return []

    }
    
    static func search(spellname: String) async -> [Spell]? {
        let searchUser: String = "\(spellname)"
//        let searchdata = search.data(using: String.Encoding.utf8)!
//        let base64 = searchdata.base64EncodedString()
//        print(base64)
        
        var request = URLRequest (url: URL(string: "https://wizard-world-api.herokuapp.com/Spells")!)
        request.httpMethod = "POST"
//        request.setValue("Basic \(base64)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
        }
        catch {
            print(error)
            
        }
        return nil
    }
    
}
