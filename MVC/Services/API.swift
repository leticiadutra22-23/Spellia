//
//  API.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 11/10/22.
//

import Foundation

// MARK: Gabi - Não deixar variaveis soltas no escopo global do App
struct URLFactory {
    static let url = "https://wizard-world-api.herokuapp.com/Spells"
//    static let url: URL = URL(string: "https://wizard-world-api.herokuapp.com/Spells")!
}

enum SpellError: Error {
    case emptyString

}

public class API {

    static let shared = API() // MARK: Gabi - procurar o que é Singleton

    // MARK: Gabi - Funções de get poderiam ser uma só, que recebe a url por parametro :)
    //GETSPELLS FUNC - GET SPELLS FROM API
    static func getSpells(){

        URLSession.shared.dataTask(with: URL(string: URLFactory.url)!, completionHandler: { data, response, error in

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
        let urlstring = URLFactory.url + "?Name=" + query
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
