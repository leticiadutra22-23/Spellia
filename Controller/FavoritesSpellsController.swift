//
//  FavoritesSpellsController.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 13/10/22.
//

import UIKit

let cellID = "Cell"

class FavoritesSpellsController: UIViewController {
    var screen: FavoritesSpell?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.isNavigationBarHidden = true
        loadView()
        FavoritesSpell().collectionView.register(FavsCell.self, forCellWithReuseIdentifier: cellID)
        FavoritesSpell().collectionView.dataSource = self
        FavoritesSpell().collectionView.delegate = self

        self.screen?.searchButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
    }

    override func loadView() {
        self.screen = FavoritesSpell()
        self.view = self.screen

    }

    @objc func addAction(){
        let SpellSearchController = SpellSearchController()
        self.show(SpellSearchController, sender: self)
    }

}

extension FavoritesSpellsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = FavoritesSpell().collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FavsCell

        cell.backgroundColor = .white

        return cell
    }
}

extension FavoritesSpellsController: UICollectionViewDelegate {

}

extension FavoritesSpellsController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 30 - 10) / 4, height: (view.frame.width - 30 - 10) / 4)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
