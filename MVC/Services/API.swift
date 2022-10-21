//
//  API.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 11/10/22.
//

import Foundation

let url = "https://wizard-world-api.herokuapp.com/Spells"

enum SpellError: Error {
    case emptyString

}

public class API {

    static let shared = API()
    
    //GETSPELLS FUNC - GET SPELLS FROM API
    static func getSpells(){

        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in

            guard let data = data, error == nil else {
                print ("something went wrong")
                return
            }
            var result: [Spell]?
            do {
                result = try JSONDecoder().decode([Spell].self, from: data)
            } catch {
                print (String(describing: error))
            }

            guard result != nil else {
                return
            }
        }).resume()
    }

    //FUNC SEARCHSPELL - SEARCH FOR USER INPUT (SPELL NAME) IN API
    static func searchSpell(with query: String, completion: @escaping (Result<[Spell], Error>) -> Void){

        
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            completion(.failure(SpellError.emptyString))
            print ("something went wrong")
            return
        }
        let urlstring = url + "?Name=" + query
        guard URL(string: urlstring) != nil else {
            print ("something went wrong")
            return
        }
        URLSession.shared.dataTask(with: URL(string: urlstring)!, completionHandler: { data, response, error in

            guard let data = data, error == nil else {
                print ("something went wrong")
                return
            }
            do {
                let result = try JSONDecoder().decode([Spell].self, from: data)
                completion(.success(result))
            } catch {
                print (String(describing: error))
            }
        }).resume()
    }
}
