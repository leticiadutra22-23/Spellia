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

        self.screen?.favoritesButton.addTarget(self, action: #selector(favAction), for: .touchUpInside)
        self.screen?.searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        
    }

    override func loadView() {
        self.screen = SpellInfos()
        self.screen?.spellView.text = spellinfo.name
        self.view = self.screen
        self.screen?.incantationView.text = spellinfo.incantation
        self.screen?.lightView.text = spellinfo.light
        self.screen?.typeView.text = spellinfo.type
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

    //BUTTON - ACTION: ADD FAVORITE ITEM INTO FavoritesSpells COLLECTION VIEW

    @objc func favAction(){
        self.screen = SpellInfos()
        screen?.favoritesButton.setImage(UIImage(named: "suit.heart.fill"), for: .normal)
        guard let field = screen?.favoritesButton, let text = screen?.spellView.text, let texttype = screen?.typeView.text, !text.isEmpty else {
            return
        }
        favspell?.createItem(name: text, type: texttype)
    }
}
