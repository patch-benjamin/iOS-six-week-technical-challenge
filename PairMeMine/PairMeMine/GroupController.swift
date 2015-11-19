//
//  GroupController.swift
//  PairMeMine
//
//  Created by Benjamin Patch on 11/19/15.
//  Copyright © 2015 PatchWork. All rights reserved.
//

import Foundation


class GroupController {
 
    static let kGroups = "groups"
    static let sharedInstance = GroupController()
    
    var currentGroup: Group
    
    var groups: [Group] = []
    
    init() {
        
        currentGroup = Group(name: "No Groups Yet!")

        loadFromPersistentStorage()
        
        if let group = groups.first {
            currentGroup = group
        }
    }
    
    static func randomizePersons(group: Group, pairingSize: Int) -> [[Person]] {
        
        var persons = group.persons
        var pairedPersons = [[Person]]()
        var groupNumber: Int = 0
        
        while persons.count > 0{
            pairedPersons.append([])
            for var i = 0; i < pairingSize; i++ {
                if persons.count != 0 {
                    let randomInt = Int(arc4random_uniform(UInt32(persons.count)))
                    let person = persons.removeAtIndex(randomInt)
                    pairedPersons[groupNumber].append(person)
                } else {
//                    let person = Person(firstName: "Choose your partner!")
//                    pairedPersons[groupNumber].append(person)
                }
                
            }
            
            groupNumber++
            
        }
        
        return pairedPersons
    }

    
    func addGroup(group: Group) {
        self.groups.append(group)
        saveToPersistentStorage()
    }
    
    func removeGroup(index: Int) {
        groups.removeAtIndex(index)
        saveToPersistentStorage()
    }
    

    func addPersonToGroup(group: Group, person: Person) {
        group.persons.append(person)
        saveToPersistentStorage()
    }
    
    func editPersonInGroup(group: Group, person: Person, index: Int) {
        group.persons[index] = person
        saveToPersistentStorage()
    }
    
    func removePersonFromGroup(group: Group, index: Int) {
        group.persons.removeAtIndex(index)
        saveToPersistentStorage()
    }

    
    // MARK: NSCoding
    func saveToPersistentStorage(){
        
        NSKeyedArchiver.archiveRootObject(self.groups, toFile: self.filePath(GroupController.kGroups))
        
    }
    
    func loadFromPersistentStorage(){
        
        if let groups = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(GroupController.kGroups)) as? [Group] {
            self.groups = groups
        }
    }
    
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }

}