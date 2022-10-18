//
//  FavoritesSpells.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 13/10/22.
//

import Foundation
import UIKit

class FavoritesSpell : UIView {

    lazy var subImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "spellia-bg")
        return imageView
    }()

    lazy var favsLabel: UILabel = {
        var favs = UILabel()
        favs.text = "Favorites"
        favs.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 48)
        favs.textColor = .white
        favs.translatesAutoresizingMaskIntoConstraints = false
        return favs
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .vertical
        cv.backgroundColor = .clear
        return cv
    }()

    lazy var searchButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let largeBoldPlus = UIImage(systemName: "plus", withConfiguration: largeConfig)
        button.layer.cornerRadius = 30
        button.backgroundColor = .white
        button.setImage(largeBoldPlus?.withTintColor(UIColor(red: 177/255, green: 64/255, blue: 84/255, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
        button.frame = CGRect(x: 170, y: 700, width: 60, height: 60)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(subImageView)
        addSubview(collectionView)
        addSubview(favsLabel)
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

            favsLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            favsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),

        ])
    }


}
