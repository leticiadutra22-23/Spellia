//
//  SearchView.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 11/10/22.
//

import Foundation
import UIKit

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
        label.font = UIFont(name: "IMFellDoublePicaSC-Regular.ttf", size: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var searchField: UITextField = {
        let field = UITextField()
        
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocorrectionType = .no
        field.borderStyle = .none
        field.keyboardType = .default
        field.attributedPlaceholder = NSAttributedString(string: "Alohomora...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        field.textAlignment = .center
        field.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        field.textColor = .white
        
        field.layer.cornerRadius = 5
        return field
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont(name: "IMFellDoublePicaSC-Regular.ttf", size: 24)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = false
        button.layer.cornerRadius = 8
//        button.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(red: 117/255, green: 64/255, blue: 94/255, alpha: 1)
        
        return button
    }()
    
//    lazy var favoritesButton: UIButton = {
//        let button = UIButton()
//        button
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(subImageView)
        addSubview(labelView)
        addSubview(searchField)
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
            
            searchField.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 50),
            searchField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            searchField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            searchField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            searchField.heightAnchor.constraint(equalToConstant: 50),
            
            searchButton.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 100),
            searchButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            searchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
    
            
        ])
    }
}
