//
//  Lottie+CoreDataProperties.swift
//  LottieQRSanner
//
//  Created by PC Gamer on 02/10/20.
//
//

import Foundation
import CoreData


extension Lottie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lottie> {
        return NSFetchRequest<Lottie>(entityName: "Lottie")
    }

    @NSManaged public var url: String?
    @NSManaged public var name: String?

}

extension Lottie : Identifiable {

}
