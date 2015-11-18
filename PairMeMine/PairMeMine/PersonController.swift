//
//  PersonController.swift
//  PairMeMine
//
//  Created by Benjamin Patch on 11/18/15.
//  Copyright © 2015 PatchWork. All rights reserved.
//

import Foundation


class PersonController {
 
    static let kPersons = "persons"
    static let sharedInstance = PersonController()
    
    var persons: [Person] = []
        
    var isOddNumberOfPersons: Bool {
        return persons.count % 2 == 0
    }
    
    
    init() {
        loadFromPersistentStorage()
    }
    
    func addPerson(person: Person) {
        self.persons.append(person)
        saveToPersistentStorage()
    }
    
    func editPerson(person: Person, index: Int) {
        persons[index] = person
        saveToPersistentStorage()
    }
    
    func removePerson(index: Int) {
        persons.removeAtIndex(index)
        saveToPersistentStorage()
    }
    
    func randomizePersons() -> [(Person, Person?)] {
        var persons = self.persons
        var pairedPersons = [(Person, Person?)]()
        while persons.count > 1 {
            
            var randomInt = Int(arc4random_uniform(UInt32(persons.count)))
            let person1 = persons.removeAtIndex(randomInt)
            
            randomInt = Int(arc4random_uniform(UInt32(persons.count)))
            let person2 = persons.removeAtIndex(randomInt)
            
            pairedPersons.append((person1, person2))
        }
        
        if let person = persons.first {
            pairedPersons.append((person, nil))
        }
        
        return pairedPersons
    }
    
    
    // MARK: NSCoding
    func saveToPersistentStorage(){
        
        NSKeyedArchiver.archiveRootObject(self.persons, toFile: self.filePath(PersonController.kPersons))

    }
    
    func loadFromPersistentStorage(){
        
        if let persons = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(PersonController.kPersons)) as? [Person] {
            self.persons = persons
        }
    }

    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }

}