//
//  ViewController.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 11/10/22.
//
// MARK: Resources
// ViewCode https://pedroalvarez-29395.medium.com/view-code-em-ios-a-control-framework-to-eliminate-interface-builders-449fa1884958
// Separando View de ViewController https://swiftrocks.com/writing-cleaner-view-code-by-overriding-loadview
import UIKit

//CLASS SpellSearchController: CREATE A NAVIGATION TO SpellInfosController TO DISPLAY THE RESPONSE FROM API (SEARCH)
class SpellSearchController: UIViewController, UISearchTextFieldDelegate, UISearchBarDelegate {
    var spells = [Spell]()
    var screen: SpellSearch?
    var spellinfo: Spell?
    var infos = [SpellInfos]()

    override func loadView() {
        self.screen = SpellSearch()
        self.view = self.screen
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadView()

        self.navigationItem.setHidesBackButton(true, animated: true)

        self.screen?.searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        self.screen?.favoritesButton.addTarget(self, action: #selector(FavViewAction), for: .touchUpInside)
    }
    private let searchSpell = UISearchController(searchResultsController: nil)

    private func createSearchBar(){
        navigationItem.searchController = searchSpell
        searchSpell.searchBar.delegate = self
    }

    //BUTTON - ACTION: CONDITION TO NAVIGATE TO SpellInfosController

    @objc func searchAction(){
        guard let text = screen?.searchField.text, !text.isEmpty else {
            return
        }
        print(text)

        API.searchSpell(with: text) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let spells):
                    self.spells = spells
                    print(spells)
                    let SpellInfosController = SpellInfosController(spellinfo: self.spells[0])
                    self.show(SpellInfosController, sender: self)
                case .failure(let error):
                    print(error)
                    self.screen?.labelView.text = "Spell not found."
                }
            }
        }

    }

//BUTTON - ACTION: NAVIGATE TO FAVORITES ITEMS

    @objc func FavViewAction(){
        let FavoritesSpells = FavoritesSpellsController()
        self.show(FavoritesSpells, sender: self)
    }
}

//SCREEN CONFIGS TO SEARCH TEXT FIELD

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
