//
//  CoreData.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 21/10/22.
//

import UIKit
import CoreData

class CoreData {

    static let sharedInstance = CoreData()
    private init(){}

    private let container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer

    func saveDataOf(spell:[Spell]){
        self.container?.performBackgroundTask{ [weak self] (context) in
            self?.deleteObjectsfromCoreData(context: context)
            self?.saveDataToCoreData(favitem: spell, context: context)
        }
    }

    private let fetchRequest = NSFetchRequest<FavoriteItems>(entityName: "FavoriteItems")

    private func deleteObjectsfromCoreData(context: NSManagedObjectContext) {
        do {
            let objects = try context.fetch(fetchRequest)
            _ = objects.map({context.delete($0)})

            try context.save()
        } catch {
            print("Deleting Error: \(error)")
        }
    }

    private func saveDataToCoreData(favitem:[Spell], context: NSManagedObjectContext) {
        context.perform {
            print("Are we on the main Queue?  \(String(describing: Thread.isMainThread))")
            for favr in favitem {
                let favSpell = FavoriteItems(context: context)
                favSpell.name = favr.name
                favSpell.type = favr.type
            }

            do {
                try context.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
        }
    }
}
