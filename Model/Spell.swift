//
//  Spell.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 11/10/22.
//

import Foundation

// MODEL - SPELL INFORMATIONS
struct Spell: Decodable {
    var id: UUID
    var name: String
    var incantation: String?
    var canBeVerbal: Bool?
    var type: String
    var effect: String?
    var light: String?
    var creator: String?
}
