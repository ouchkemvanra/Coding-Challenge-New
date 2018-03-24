//
//  Location.swift
//  Demo
//
//  Created by ty on on 3/21/18.
//  Copyright © 2018 vanra. All rights reserved.
//

import Foundation
class location: NSObject, NSCoding {
    var lat: Double?
    var long: Double?
    var name: String?
    var address: String?
    init(lattitude: Double, longtitude: Double, name: String, address: String) {
        self.lat = lattitude
        self.long = longtitude
        self.name = name
        self.address = address
    }
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.lat = aDecoder.decodeObject(forKey: "lat") as? Double
        self.long = aDecoder.decodeObject(forKey: "long") as? Double
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.address = aDecoder.decodeObject(forKey: "address") as? String
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.lat, forKey: "lat")
        aCoder.encode(self.long, forKey: "long")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.name, forKey: "name")
    }
}
