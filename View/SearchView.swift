//
//  SearchView.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 11/10/22.
//

import Foundation
import UIKit

class SearchView: UIView {
    
    lazy var labelView: UILabel = {
        var label = UILabel()
        label.text = "Search for a spell"
        //label.font =
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = false
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor (red: 0.45, green: 0.25, blue: 0.36, alpha: 1)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(labelView)
        addSubview(searchButton)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
