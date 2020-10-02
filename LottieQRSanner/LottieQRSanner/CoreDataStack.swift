//
//  CoreDataStack.swift
//  LottieQRSanner
//
//  Created by PC Gamer on 02/10/20.
//

import Foundation
import CoreData


class CoreDataStack {
    
    //MARK: Shared Instance
    static let shared  = CoreDataStack()

    //MARK: Managed Object Context
    var moc: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    //MARK: Persistance Container
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LottieQRScanner")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    //MARK: Private Initializer
    private init() {}
    
    //MARK: Get All Lottie Files
    func getAllLotties() -> [Lottie] {
        
        var lotties = [Lottie]()
        let request: NSFetchRequest<Lottie> = Lottie.fetchRequest()
        
        do {
            lotties = try self.moc.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        return lotties
    }
    
    //MARK: Save a Lottie File
    func saveLottie(name : String, url : String ){
        let lottie = Lottie(context: self.moc)
        lottie.name = name
        lottie.url = url
        
        do{
            try self.moc.save()
        }catch let error as NSError{
            print(error )
        }
    }
}
