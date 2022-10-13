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

class SpellSearchController: UIViewController {
    var spells = [Spell]()
    var screen: SpellSearch?
    
    override func loadView() {
        self.screen = SpellSearch()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupHideKeyboardOnTap()
        view.backgroundColor = .white
        loadView()
        
//        self.screen.searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
    }
    
//    @objc func searchAction() {
//        do{
//            if screen.searchField.text != "" {
//                Task{
//                    let res = try await API.search(spellname: (screen.searchField.text)!)!
//                    if let res = res {
//                        let SpellInfosController = SpellInfosController()
//                        SpellInfosController.spellfinded = res
//                        show(SpellInfosController, sender: self)
//                    }else{
//                        self.screen.labelView.text = "Tente novamente"
//                    }
//
//                }
//            }
//
//
//        } catch {
//            print(error)
//        }
//
//    }
    
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

