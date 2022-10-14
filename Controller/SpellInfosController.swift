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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func loadView() {
        self.screen = SpellInfos()
        self.view = self.screen
    }

}
