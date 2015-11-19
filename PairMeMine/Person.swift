//
//  Person.swift
//  PairMeMine
//
//  Created by Benjamin Patch on 11/18/15.
//  Copyright © 2015 PatchWork. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {
    
    static let kFirstName = "firstName"
    static let kLastName = "lastName"
    
    let firstName: String
    let lastName: String
    
    var name:String {
        return "\(firstName) \(lastName)"
    }
    
    init(firstName: String, lastName: String = "") {
        
        self.firstName = firstName.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).capitalizedString
        self.lastName = lastName.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).capitalizedString
    
    }
    
    required convenience init?(coder decoder: NSCoder) {
        guard let firstName = decoder.decodeObjectForKey(Person.kFirstName) as? String,
            let lastName = decoder.decodeObjectForKey(Person.kLastName) as? String else { return nil }
        guard firstName != "" else { return nil }
        
        self.init(firstName: firstName, lastName: lastName)
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.firstName, forKey: Person.kFirstName)
        coder.encodeObject(self.lastName, forKey: Person.kLastName)
    }

}
