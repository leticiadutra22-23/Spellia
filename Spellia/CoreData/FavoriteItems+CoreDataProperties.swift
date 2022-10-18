//
//  FavoriteItems+CoreDataProperties.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 18/10/22.
//
//

import Foundation
import CoreData


extension FavoriteItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteItems> {
        return NSFetchRequest<FavoriteItems>(entityName: "FavoriteItems")
    }

    @NSManaged public var name: String?
    @NSManaged public var type: String?

}

extension FavoriteItems : Identifiable {

}
