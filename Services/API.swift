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
    static func getSpells(from url: String){
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
            print(result ?? "null")
        }).resume()
    }

    static func searchSpell(url: String, spellName: String, completion: @escaping ([Spell]?) -> Void){
        let search: String = "\(spellName)"
        let searchdata = search.data(using: String.Encoding.utf8)!
        let base64 = searchdata.base64EncodedString()
        print(base64)

        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in

            guard let data = data, error == nil else {
                print ("something went wrong")
                return
            }
            var findSpell: [Spell]?
            do {
                findSpell = try JSONDecoder().decode([Spell].self, from: data)
                completion(findSpell)
            } catch {
                print (String(describing: error))
            }

            guard findSpell != nil else {
                return
            }
            print(findSpell ?? "null")
        }).resume()
    }
}
