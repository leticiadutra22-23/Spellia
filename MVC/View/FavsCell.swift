//
//  FavsCell.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 18/10/22.
//

import UIKit

class FavsCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    func setup(){
        self.backgroundColor = .red
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
