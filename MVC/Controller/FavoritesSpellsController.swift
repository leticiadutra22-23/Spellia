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
        getAllItems()
        screen?.collectionView.register(FavsCell.self, forCellWithReuseIdentifier: cellID)
        screen?.collectionView.dataSource = self
        screen?.collectionView.delegate = self
        screen?.collectionView.frame = view.bounds

        self.screen?.searchButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
    }

    override func loadView() {
        self.screen = FavoritesSpell()
        self.view = self.screen

    }

//COLLECTION VIEW - SHOW FAVORITES ITEMS

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return model.count
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = FavoritesSpell().collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FavsCell
//        let model = model[indexPath.row]
//        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 30))
//        let typetitle = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 10))
//        title.text = model.name
//        typetitle.text = model.type
//        typetitle.backgroundColor = UIColor(red: 177/255, green: 64/255, blue: 84/255, alpha: 1)
//        typetitle.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 15)
//        typetitle.textAlignment = .center
//        title.font = UIFont(name: "IM_FELL_Double_Pica_SC", size: 24)
//        title.textAlignment = .center
//        cell.contentView.addSubview(title)
//        cell.contentView.addSubview(typetitle)
//        cell.backgroundColor = UIColor(red: 177/255, green: 64/255, blue: 84/255, alpha: 1)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 3) - 16, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    //MARK: APP CRASHS WHEN THE BUTTON IS PRESSED
    convenience init() {
        self.init()
    }

//BUTTON ACTION TO ADD NEW FAVORITE SEARCHING FOR A SPELL

    @objc func addAction(){
        let SpellSearchController = SpellSearchController()
        self.show(SpellSearchController, sender: self)
    }

//CORE DATA - FAVORITES

    func getAllItems(){
        do {
            model = try context.fetch(FavoriteItems.fetchRequest())
            DispatchQueue.main.async {
                self.screen = FavoritesSpell()
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
