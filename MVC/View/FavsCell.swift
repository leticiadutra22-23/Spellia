//
//  FavsCell.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 18/10/22.
//

import UIKit

//CLASS - FavsCell: CELL CONFIG THAT WILL APPEAR IN COLLECTION VIEW
class FavsCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    func setup(){
        self.backgroundColor = UIColor(red: 177/255, green: 64/255, blue: 84/255, alpha: 0.5)
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
    }

    lazy var titleCell: UILabel = {
        let tc = UILabel()
        tc.text = "Name"
        tc.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 20)
        return tc
    }()

    lazy var typeCell: UILabel = {
        let tyc = UILabel()
        tyc.text = "Type"
        tyc.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 16)
        tyc.backgroundColor = UIColor(named: "Color")
        return tyc
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
