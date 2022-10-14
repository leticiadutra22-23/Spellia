//
//  SpellInfos.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 13/10/22.
//

import Foundation
import UIKit

class SpellInfos: UIView {
    
    lazy var subImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "spellia-bg")
        return imageView
    }()
    
    lazy var spellView: UILabel = {
        var spellView = UILabel()
        spellView.text = "Feitiço"
        spellView.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 48)
        spellView.textColor = .white
        spellView.translatesAutoresizingMaskIntoConstraints = false
        return spellView
    }()
    
    lazy var incantationView: UILabel = {
        var incantationView = UILabel()
        incantationView.text = "Encantamento"
        incantationView.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 32)
        incantationView.textColor = .white
        incantationView.translatesAutoresizingMaskIntoConstraints = false
        return incantationView
    }()
    
    lazy var lightView: UILabel = {
        var lightView = UILabel()
        lightView.text = "Luzinha"
        lightView.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 24)
        lightView.textColor = .white
        lightView.translatesAutoresizingMaskIntoConstraints = false
        return lightView
    }()
    
    lazy var typeView: UILabel = {
        var typeView = UILabel()
        typeView.text = "Tipo do Feitiço"
        typeView.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 24)
        typeView.textColor = .white
        typeView.translatesAutoresizingMaskIntoConstraints = false
        return typeView
    }()
    
    lazy var effectView: UILabel = {
        var effectView = UILabel()
        effectView.text = "Efeito do Feitiço"
        effectView.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 24)
        effectView.textColor = .white
        effectView.translatesAutoresizingMaskIntoConstraints = false
        return effectView
    }()
    
    lazy var verbalView: UILabel = {
        var verbalView = UILabel()
        verbalView.text = "Can be verbal"
        verbalView.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 24)
        verbalView.textColor = UIColor(red: 177/255, green: 64/255, blue: 84/255, alpha: 1)
        verbalView.translatesAutoresizingMaskIntoConstraints = false
        return verbalView
    }()
    
//    lazy var verbalView: UILabel = {
//        var verbalView = UILabel()
//        verbalView.text = "Can be verbal"
//        verbalView.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 24)
//        verbalView.textColor = .white
//        verbalView.translatesAutoresizingMaskIntoConstraints = false
//        return verbalView
//    }()
}
