//
//  API.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 11/10/22.
//

import Foundation

let url = "https://wizard-world-api.herokuapp.com/Spells"

public class API {
    //GETSPELLS FUNC - GET SPELLS FROM API
    static func getSpells(query: String){
        let url = "https://wizard-world-api.herokuapp.com/Spells" + "?Name=" + query

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
//            print(result ?? "null")
        }).resume()
    }
    static func searchSpell(with query: String, completion: @escaping (Result<[Spell], Error>) -> Void){

        
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        let urlstring = url + "?Name=" + query
        guard URL(string: urlstring) != nil else {
            return
        }
        URLSession.shared.dataTask(with: URL(string: urlstring)!, completionHandler: { data, response, error in

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


//    static func searchSpell(url: String, with spellName: String?, completion: @escaping ([Spell]?) -> Void){
//        guard !(spellName?.trimmingCharacters(in: .whitespaces).isEmpty ?? false) else {
//                    return
//                }
//        let urlstring = url + (spellName ?? "")
//                guard URL(string: urlstring) != nil else {
//                    return
//                }
//        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
//
//            guard let data = data, error == nil else {
//                print ("something went wrong")
//                return
//            }
//            var findSpell: [Spell]?
//            do {
//                findSpell = try JSONDecoder().decode([Spell].self, from: data)
//                completion(findSpell)
//            } catch {
//                print (String(describing: error))
//            }
//
//            guard findSpell != nil else {
//                return
//            }
//            print(findSpell ?? "null")
//        }).resume()
//    }
}
