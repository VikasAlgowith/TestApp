//
//  PersistentStorage.swift
//  coreDataDemo
//
//  Created by CodeCat15 on 6/12/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import CoreData



final class PersistentStorage
{

    private init(){}
    static let shared = PersistentStorage()

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "TestApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    lazy var context = persistentContainer.viewContext
    // MARK: - Core Data Saving support

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func insertRecords(records: [Employee]){


        PersistentStorage.shared.persistentContainer.performBackgroundTask { privateManagedContext in
            //insert code
            records.forEach { empRecores in
                let cdEmp = CDEmployee(context: privateManagedContext)
                cdEmp.employee_name = empRecores.employee_name
                cdEmp.employee_age = Int64(empRecores.employee_age ?? 0)
                cdEmp.employee_salary = Int64(empRecores.employee_salary ?? 0)
            }

            if(privateManagedContext.hasChanges){
                try? privateManagedContext.save()
                debugPrint("Insert record operation is completed")
            }
        }

    }

}
