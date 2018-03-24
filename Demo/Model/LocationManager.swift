//
//  LocationManager.swift
//  Demo
//
//  Created by ty on on 3/21/18.
//  Copyright © 2018 vanra. All rights reserved.
//

import Foundation
class LocationManager {
    static let shareInstance = LocationManager()
    private init() {}
    
    unowned private let ud = UserDefaults.standard
    
    // MARK: Location
    func saveLocation(location: location){
        var currentLocation = getLocations()
        currentLocation.append(location)
        let obj = NSKeyedArchiver.archivedData(withRootObject: currentLocation)
        ud.set(obj, forKey: "Location")
        
    }
    func deleteLocation(index: Int) {
        var savedLocation = getLocations()
        savedLocation.remove(at: index)
        let obj = NSKeyedArchiver.archivedData(withRootObject: savedLocation)
        ud.set(obj, forKey: "Location")
    }
    func deleteAllLocation(){
        var savedLocation = getLocations()
        savedLocation.removeAll()
        let obj = NSKeyedArchiver.archivedData(withRootObject: savedLocation)
        ud.set(obj, forKey: "Location")
    }
    
    
    func getLocations() -> [location] {
        if let locations = ud.data(forKey: "Location"){
            let loca = NSKeyedUnarchiver.unarchiveObject(with: locations) as! [location]
            if loca.count > 0{
                return loca
            }
            else{
                let tmpData = dummyData
                let obj = NSKeyedArchiver.archivedData(withRootObject: tmpData)
                ud.set(obj, forKey: "Location")
                return tmpData
            }
        }
        else{
            let tmpData = dummyData
            let obj = NSKeyedArchiver.archivedData(withRootObject: tmpData)
            ud.set(obj, forKey: "Location")
            return tmpData
        }
    }
    
}
