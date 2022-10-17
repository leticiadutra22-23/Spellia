//
//  FavoritesSpellsController.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 13/10/22.
//

import UIKit

class FavoritesSpellsController: UIViewController {
    var screen: FavoritesSpell?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadView()

    }

    override func loadView() {
        self.screen = FavoritesSpell()
        self.view = self.screen

    }
}
