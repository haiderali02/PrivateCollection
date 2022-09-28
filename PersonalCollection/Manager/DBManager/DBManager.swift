//
//  DBManager.swift
//  PersonalCollection
//
//  Created by Haider Ali on 29/09/2022.
//  Copyright © 2022 haiderapps. All rights reserved.
//

import Foundation
import CoreData

class DBManager {
    
    static let shared = DBManager()
    
    public typealias DidFinishAuthentication = (_ success: Bool?, _ error: String?) -> Void
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data stack

    @objc lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PersonalCollection")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    @objc func saveContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func createNewUser(userName: String, userPassword: String, userDOB: String, userGender: String, completion: @escaping DidFinishAuthentication) {
        
        if !checkIfUserAlreadyExist(username: userName) {
            let newUser = CDUser(context: context)
            newUser.name = userName
            newUser.password = userPassword
            newUser.dateOfBirth = userDOB
            newUser.gender = userGender
            newUser.images = nil
            
            saveContext()
            
            completion(true, nil)
        } else {
            completion(false, "Username already exist.")
        }
      
    }
    
    func loginUser(username: String, password : String, completion: @escaping DidFinishAuthentication)
    {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: CDUser.description())

        let predicate = NSPredicate(format: "name = %@", username)

        fetchRequest.predicate = predicate
        
        do {
            let allUsers = try context.fetch(fetchRequest) as! [CDUser]
            
            if let entity = allUsers.first {
                if entity.name == username && entity.password == password
                {
                    completion(true, nil)
                }
                else
                {
                    completion(false, "Wrong username or password !!!")
                }
            } else {
                completion(false, "No Record Found")
            }
            
        } catch {
            completion(false, "Failed To Fetch Data")
        }
        
    }
    
    private func checkIfUserAlreadyExist(username: String) -> Bool {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: CDUser.description())

        let predicate = NSPredicate(format: "name = %@", username)

        fetchRequest.predicate = predicate
        
        do {
            let allUsers = try context.fetch(fetchRequest) as! [CDUser]
            
            if let entity = allUsers.first {
                if entity.name == username
                {
                    return true
                }
                else
                {
                    return false
                }
            } else {
                return false
            }
            
        } catch {
            return false
        }
        
    }
    
    func fetchAllUsers() -> [CDUser] {
        
        var allUsers: [CDUser] = []
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: CDUser.description())
        
        do {
            allUsers = try context.fetch(fetchRequest) as! [CDUser]
        } catch {
            print("Failed To Fetch Cards")
        }
        
        return allUsers
    }
}
