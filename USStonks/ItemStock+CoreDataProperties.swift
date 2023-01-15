//
//  ItemStock+CoreDataProperties.swift
//  
//
//  Created by Guest User on 09/01/2023.
//
//

import Foundation
import CoreData


extension ItemStock {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemStock> {
        return NSFetchRequest<ItemStock>(entityName: "ItemStock")
    }

    @NSManaged public var currency: String? = ""
    @NSManaged public var displaySymbol: String? = ""
    @NSManaged public var descriptionStock: String? = ""
    @NSManaged public var figi: String? = ""
    @NSManaged public var isin: String? = ""
    @NSManaged public var mic: String? = ""
    @NSManaged public var shareClassFIGI: String? = ""
    @NSManaged public var symbol: String? = ""
    @NSManaged public var symbol2: String? = ""
    @NSManaged public var type: String?= ""
    @NSManaged public var isFavorite:Boolean?= ""

}
