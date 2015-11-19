//
//  Group.swift
//  PairMeMine
//
//  Created by Benjamin Patch on 11/19/15.
//  Copyright © 2015 PatchWork. All rights reserved.
//

import Foundation


class Group: NSObject, NSCoding {
    
    static let kName = "name"
    static let kPersons = "persons"

    let name: String
    var persons: [Person] = []
    
    init(name: String, persons: [Person] = []) {
        self.name = name
        self.persons = persons
    }
    
    
    
    // TODO: Implement NSCoding
    required convenience init?(coder decoder: NSCoder) {
        guard let name = decoder.decodeObjectForKey(Group.kName) as? String,
            let persons = decoder.decodeObjectForKey(Group.kPersons) as? [Person] else { return nil }
        
        self.init(name: name, persons: persons)
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.name, forKey: Group.kName)
        coder.encodeObject(self.persons, forKey: Group.kPersons)
    }

}