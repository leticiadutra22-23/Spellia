//
//  SpellInfosController.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 13/10/22.
//

import Foundation
import UIKit

class SpellInfosController: UIViewController {
    var spell: [Spell] = []
    var screen: SpellInfos?
    var spellinfo: Spell?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)
        loadView()
//        print(spellName)

        self.screen?.searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)

        func config(_ spellsinf: Spell){
            SpellInfos().spellView.text = spellsinf.name
            SpellInfos().incantationView.text = spellsinf.incantation
            SpellInfos().lightView.text = spellsinf.light
            SpellInfos().typeView.text = spellsinf.type
            SpellInfos().effectView.text = spellsinf.effect
    //        SpellInfos().verbalView.text = spellsinf.canBeVerbal

        }

        self.screen?.searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        
    }

    override func loadView() {
        self.screen = SpellInfos()
        self.view = self.screen
        
    }

    @objc func searchAction(){
        SpellSearchController()
    }
    
    func spellSetup(spellName: Spell){
        SpellInfos().spellView.text = spellName.name
    }
}
