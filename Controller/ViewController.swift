//
//  ViewController.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 11/10/22.
//

import UIKit

class ViewController: UIViewController {
    
//    var SecondView: UIView!
    
    var screen: SearchView?
    
    override func loadView() {
        self.screen = SearchView()
        self.view = self.screen
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setupHideKeyboardOnTap()
//        view.backgroundColor = .black
        loadView()
//        SecondView.setTwoGradient(colorOne: Colors.Red, colorTwo: Colors.Dark)
    }


}

