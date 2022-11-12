//
//  LocalState.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 12/11/22.
//

import Foundation

public class LocalState {
    
    private enum Keys: String {
        case hasOnbordered
    }
    
    public static var hasOnbordered: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnbordered.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnbordered.rawValue)
            UserDefaults.standard.synchronize() //true if the data was saved successfully to disk,
        }
    }
    
}
