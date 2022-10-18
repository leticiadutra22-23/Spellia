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

        self.screen?.searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        
    }

    override func loadView() {
        self.screen = SpellInfos()
        self.view = self.screen
        
    }

    @objc func searchAction(){
        let SpellSearchController = SpellSearchController()
        self.show(SpellSearchController, sender: self)
    }
}
