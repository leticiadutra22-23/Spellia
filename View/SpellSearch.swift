//
//  SearchView.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 11/10/22.
//

import Foundation
import UIKit

//CLASSE - SpellSearch: View configs and components
class SpellSearch: UIView {
    
    lazy var subImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "spellia-bg")
        return imageView
    }()
    
    lazy var labelView: UILabel = {
        var label = UILabel()
        label.text = "Search for a spell"
        label.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var searchField: UISearchTextField = {
        let field = UISearchTextField()

        field.borderStyle = .none
        field.keyboardType = .default
        field.attributedPlaceholder = NSAttributedString(string: "Alohomora...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        field.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 24)
        field.textAlignment = .center
        field.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        field.textColor = .white
        field.frame = CGRect(x: 40, y: 400, width: 300, height: 60)
        field.layer.cornerRadius = 5
        return field
    }()

    lazy var returnView: UILabel = {
        var returnView = UILabel()
        returnView.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 20)
        returnView.textColor = UIColor(red: 177/255, green: 64/255, blue: 84/255, alpha: 1)
        returnView.translatesAutoresizingMaskIntoConstraints = false
        return returnView
    }()

    lazy var searchButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 30, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 24)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 8
//        button.frame = CGRect(x: 800, y: 800, width: 30, height: 50)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(red: 177/255, green: 64/255, blue: 84/255, alpha: 1)
        
        return button
    }()
    
    lazy var favoritesButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let largeBoldHeart = UIImage(systemName: "suit.heart.fill", withConfiguration: largeConfig)
        
        button.layer.cornerRadius = 30
        button.backgroundColor = .white
        button.setImage(largeBoldHeart?.withTintColor(UIColor(red: 177/255, green: 64/255, blue: 84/255, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
        button.frame = CGRect(x: 300, y: 90, width: 60, height: 60)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(subImageView)
        addSubview(favoritesButton)
        addSubview(labelView)
        addSubview(searchField)
        addSubview(returnView)
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

            labelView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 200),
            labelView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            returnView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 230),
            returnView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            searchButton.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 100),
            searchButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            searchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
        ])
    }
}
