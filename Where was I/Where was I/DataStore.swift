//
//  DataStore.swift
//  Where was I
//
//  Created by Mac Pro on 2/24/19.
//  Copyright © 2019 Mac Pro. All rights reserved.
//

import Foundation
struct StorageKeys{
    static let storedLat = "storedLat"
    static let storedLong = "storedLong"
}

class DataStore{
    func getDefaults() -> UserDefaults{
        return UserDefaults.standard;
    }
    func storeDataPoint(latitude:String, longitude:String){
        let def = getDefaults()
        def.setValue(latitude, forKey: StorageKeys.storedLat)
        def.setValue(longitude, forKey: StorageKeys.storedLong)
        def.synchronize();
    }
    func getLastLocation() -> VisitedPoint?{
        let defaults = getDefaults();
        if let lat = defaults.string(forKey: StorageKeys.storedLat){
            if let long = defaults.string(forKey: StorageKeys.storedLong){
                return VisitedPoint(long: long, lat: lat)
            }
        }
        return nil;
    }
}
