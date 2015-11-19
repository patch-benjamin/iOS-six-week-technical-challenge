//
//  PersonController.swift
//  PairMeMine
//
//  Created by Benjamin Patch on 11/18/15.
//  Copyright © 2015 PatchWork. All rights reserved.
//

import Foundation


//class PersonController {

//    static let kPersons = "persons"
//    static let sharedInstance = PersonController()
//    
//    var group: Group? = nil
//    
//    var persons: [Person] {
//        get {
//            if let persons = group?.persons {
//                return persons
//            } else {
//                print("Persons: No Persons in Group.")
//                return []
//            }
//        }
//        set {
//            if let group = group {
//                group.persons = newValue
//            } else {
//                print("Persons: No Group to add/edit/delete person from.")
//            }
//        }
//    }
//        
//    var isOddNumberOfPersons: Bool {
//        return persons.count % 2 == 0
//    }
//    
//    
//    init() {
//        loadFromPersistentStorage()
//    }
//    
//    func addPerson(person: Person) {
//        self.persons.append(person)
//        saveToPersistentStorage()
//    }
//    
//    func editPerson(person: Person, index: Int) {
//        persons[index] = person
//        saveToPersistentStorage()
//    }
//    
//    func removePerson(index: Int) {
//        persons.removeAtIndex(index)
//        saveToPersistentStorage()
//    }
//    
//    func randomizePersons(groupSize: Int) -> [[Person]] {
//        
//        var persons = self.persons
//        var pairedPersons = [[Person]]()
//        var groupNumber: Int = 0
//        
//        while persons.count > 1 {
//            pairedPersons.append([])
//            for var i = 0; i < groupSize; i++ {
//        
//                let randomInt = Int(arc4random_uniform(UInt32(persons.count)))
//                let person = persons.removeAtIndex(randomInt)
//                pairedPersons[groupNumber].append(person)
//            
//            }
//            
//            groupNumber++
//        
//        }
//        
//        return pairedPersons
//    }
//    
//    
//    // MARK: NSCoding
//    func saveToPersistentStorage(){
//        
//        NSKeyedArchiver.archiveRootObject(self.persons, toFile: self.filePath(PersonController.kPersons))
//
//    }
//    
//    func loadFromPersistentStorage(){
//        
//        if let persons = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(PersonController.kPersons)) as? [Person] {
//            self.persons = persons
//        }
//    }
//
//    
//    func filePath(key: String) -> String {
//        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
//        let documentsPath: AnyObject = directorySearchResults[0]
//        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
//        
//        return entriesPath
//    }
//
//}