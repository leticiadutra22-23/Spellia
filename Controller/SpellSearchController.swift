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

//CLASS SpellSearchController: create a navigation to SpellInfos
class SpellSearchController: UIViewController, UISearchTextFieldDelegate, UISearchBarDelegate {
    var spells = [Spell]()
    var screen: SpellSearch?
    var infos = [SpellInfos]()
//    var APISpells: () = API.getSpells(from: url)
 
    
    override func loadView() {
        self.screen = SpellSearch()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupHideKeyboardOnTap()
        view.backgroundColor = .white
        loadView()

        self.navigationItem.setHidesBackButton(true, animated: true)

        self.screen?.searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
    }
    private let searchSpell = UISearchController(searchResultsController: nil)

    private func createSearchBar(){
        navigationItem.searchController = searchSpell
        searchSpell.searchBar.delegate = self
    }

    @objc func searchAction(){
        guard let text = screen?.searchField.text, !text.isEmpty else {
            return
        }
        print(text)
        let spellresponse: () = API.getSpells(query: text)
        print(spellresponse)

        //MARK: BREAKPOINT SÓ VAI ATÉ LINHA 51
            API.searchSpell(with: text) { [weak self] spells in
                DispatchQueue.main.async {
                    if spellresponse != nil {
                        let SpellInfosController = SpellInfosController()
                        self?.show(SpellInfosController, sender: self)
                    } else {
                        self?.screen?.labelView.text = "Spell not found."
                    }
                }

            }
    }
    
    func setupHideKeyboardOnTap() {
            self.view.addGestureRecognizer(self.endEditingRecognizer())
            self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
        }
    
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
    
}

