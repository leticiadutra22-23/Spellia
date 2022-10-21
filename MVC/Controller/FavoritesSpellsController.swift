//
//  FavoritesSpellsController.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 13/10/22.
//

import UIKit

let cellID = "Cell"
var model = [FavoriteItems]()

//CLASS CONTROLLER FROM FavoritesSpells

class FavoritesSpellsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var screen: FavoritesSpell!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.isNavigationBarHidden = true
        loadView()
        getAllItems()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        screen.collectionView.setCollectionViewLayout(layout, animated: true)
        screen.collectionView.register(FavsCell.self, forCellWithReuseIdentifier: cellID)
        screen.collectionView.dataSource = self
        screen.collectionView.delegate = self
        screen.collectionView.frame = view.bounds

        self.screen?.searchButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
    }

    override func loadView() {
        self.screen = FavoritesSpell()
        self.view = self.screen

    }

//COLLECTION VIEW - SHOW FAVORITES ITEMS

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FavsCell
        let model = model[indexPath.row]
        let title = cell.titleCell
        let typetitle = cell.typeCell
        title.text = model.name
        typetitle.text = model.type
        typetitle.textAlignment = .center
        title.textAlignment = .center
        cell.contentView.addSubview(title)
        cell.contentView.addSubview(typetitle)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = (collectionView.frame.width - 40) / 2 - lay.minimumInteritemSpacing

        return CGSize(width: widthPerItem, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }

//BUTTON ACTION TO ADD NEW FAVORITE SEARCHING FOR A SPELL

    @objc func addAction(){
        let SpellSearchController = SpellSearchController()
        self.show(SpellSearchController, sender: self)
    }

//CORE DATA - FAVORITES (SAVE ITEMS AND ADD NEW)

    func getAllItems(){
        do {
            model = try context.fetch(FavoriteItems.fetchRequest())
            DispatchQueue.main.async {
                self.screen!.collectionView.reloadData()
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
