//
//  KisilerUygulamasiApp.swift
//  KisilerUygulamasi
//
//  Created by Halil Keremoğlu on 28.03.2025.
//

import SwiftUI
import CoreData

/*
 */
@main
struct KisilerUygulamasiApp: App {
    var body: some Scene {
        WindowGroup {
            Anasayfa()
        }
    }
}


var persistentContainer: NSPersistentContainer = {
    
    let container = NSPersistentContainer(name: "Model")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()


func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
