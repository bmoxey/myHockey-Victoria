//
//  Extensions.swift
//  myHockey Victoria
//
//  Created by Brett Moxey on 14/8/2023.
//

import Foundation

extension UserDefaults {
    func setTeamtArray(_ value: [TeamStruct], forKey key: String) {
        if let encodedData = try? JSONEncoder().encode(value) {
            set(encodedData, forKey: key)
        }
    }
    
    func teamArray(forKey key: String) -> [TeamStruct]? {
        guard let savedData = data(forKey:key),
              let savedArray = try? JSONDecoder().decode([TeamStruct].self, from: savedData) else {
            return nil
        }
        return savedArray
    }
}

extension String {
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
}
