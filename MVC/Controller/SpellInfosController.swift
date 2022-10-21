//
//  SpellInfosController.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 13/10/22.
//

import Foundation
import UIKit


//CLASS CONTROLLER FROM SpellInfos - SHOW SPELLS INFORMATIONS
class SpellInfosController: UIViewController {

    var screen: SpellInfos?
    var spellinfo: Spell
    var favspell: FavoritesSpellsController?
    var bFav: Bool = true

    init(spellinfo: Spell) {
        self.spellinfo = spellinfo
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)
        loadView()

//        self.screen?.favoritesButton.addTarget(self, action: #selector(buttonColor), for: .touchUpInside)
        self.screen?.favoritesButton.addTarget(self, action: #selector(favAction), for: .touchUpInside)
        self.screen?.searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        
    }

    override func loadView() {
        self.screen = SpellInfos()
        self.screen?.spellView.text = spellinfo.name
        self.view = self.screen
        self.screen?.incantationView.text = "Incantation: " + (spellinfo.incantation ?? "")
        self.screen?.lightView.text = "Light: " + (spellinfo.light ?? "")
        self.screen?.typeView.text = "Type: " + spellinfo.type
        self.screen?.effectView.text = spellinfo.effect
        if spellinfo.canBeVerbal == true {
            self.screen?.verbalView.text = "Can be verbal"
        }
        
    }

//BUTTON - ACTION: NAVIGATE TO PREVIEW SCREEN (SpellSearchController)

    @objc func searchAction(){
        let SpellSearchController = SpellSearchController()
        self.show(SpellSearchController, sender: self)
    }

//FUNCTION - ACTION: MODIFY THE BUTTON IMAGE WHEN USER TAPS ON IT
    @objc func buttonColor(){
        bFav = !bFav
        if bFav {
            let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
            let largeBoldHeart = UIImage(systemName: "suit.heart.fill", withConfiguration: largeConfig)
            screen?.favoritesButton.setImage(largeBoldHeart?.withTintColor(UIColor(named: "Color")!, renderingMode: .alwaysOriginal), for: .normal)
        } else {
            let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
            let largeBoldHeart = UIImage(systemName: "suit.heart", withConfiguration: largeConfig)
            screen?.favoritesButton.setImage(largeBoldHeart?.withTintColor(UIColor(named: "Color")!, renderingMode: .alwaysOriginal), for: .normal)
        }
    }

//BUTTON - ACTION: ADD FAVORITE ITEM INTO FavoritesSpells COLLECTION VIEW
    @objc func favAction(){
        buttonColor()
        guard let field = screen?.spellView, let text = field.text, let typefield = screen?.typeView, let texttype = typefield.text, !text.isEmpty else {
            return
        }
        favspell?.createItem(name: text, type: texttype)
    }
}
