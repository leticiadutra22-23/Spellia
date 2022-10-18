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
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

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
        FavoritesSpell().collectionView.frame = view.bounds

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

    func getAllItems(){
        do {
           let items = try context.fetch(FavoriteItems.fetchRequest())

            DispatchQueue.main.async {
            }
        } catch {
            //error
        }
    }

    func createItem(name: String, type: String) {
        let newItem = FavoriteItems(context: context)
        newItem.name = name
        newItem.type = type

        do {
            try context.save()
            getAllItems()
        } catch {
            //error
        }
    }

}

extension FavoritesSpellsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = FavoritesSpell().collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FavsCell

        return cell
    }
}

extension FavoritesSpellsController: UICollectionViewDelegate {

}

extension FavoritesSpellsController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 3) - 16, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
