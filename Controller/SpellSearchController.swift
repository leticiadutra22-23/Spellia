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
class SpellSearchController: UIViewController {
    var spells = [Spell]()
    var screen: SpellSearch?
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
        API.getSpells(from: url)
        self.navigationItem.setHidesBackButton(true, animated: true)

        self.screen?.searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
    }
    
    @objc func searchAction(){
        if screen?.searchField.text != " " {
            API.searchSpell(url: url, with: screen?.searchField.text ?? nil) { spells in
                DispatchQueue.main.async {
                    if spells != nil {

                        let SpellInfosController = SpellInfosController()
                        self.show(SpellInfosController, sender: self)
                    } else {
                        self.screen?.labelView.text = "Spell not found."
                    }
                }

            }

        }
    }

    func searchForSpell(_ search: UITextField){
        guard let text = search.text, !text.isEmpty else {
            return
        }
//        API.search().shared.search(with: text)
        print(text)
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

