//
//  SpellInfos.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 13/10/22.
//

import Foundation
import UIKit

//CLASS - SpellInfos: COMPONENTS THAT WILL SHOW ON SpellInfosController
class SpellInfos: UIView {
    var spellinfo: Spell?
    var bFav: Bool = true

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
        typeView.layer.cornerRadius = 15
        typeView.layer.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
        typeView.backgroundColor = UIColor(named: "Color")!
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
        verbalView.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 24)
        verbalView.textColor = UIColor(named: "Color")!
        verbalView.translatesAutoresizingMaskIntoConstraints = false
        return verbalView
    }()

    lazy var favoritesButton: UIButton = {
        var button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let largeBoldHeart = UIImage(systemName: "suit.heart", withConfiguration: largeConfig)
        button.setImage(largeBoldHeart?.withTintColor(UIColor(named: "Color")!, renderingMode: .alwaysOriginal), for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = .white
        button.frame = CGRect(x: 165, y: 500, width: 50, height: 50)

        return button
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 30, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 24)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(red: 177/255, green: 64/255, blue: 84/255, alpha: 1)

        return button
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(subImageView)
        addSubview(spellView)
        addSubview(incantationView)
        addSubview(lightView)
        addSubview(typeView)
        addSubview(effectView)
        addSubview(verbalView)
        addSubview(favoritesButton)
        addSubview(searchButton)
        configConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configConstraints() {
            NSLayoutConstraint.activate([
            subImageView.topAnchor.constraint(equalTo: self.topAnchor),
            subImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            spellView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            spellView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            incantationView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 70),
            incantationView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            lightView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 220),
            lightView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            typeView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 250),
            typeView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            effectView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 295),
            effectView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            verbalView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 320),
            verbalView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            searchButton.topAnchor.constraint(equalTo: incantationView.bottomAnchor, constant: 500),
            searchButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            searchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
        ])
    }
}
