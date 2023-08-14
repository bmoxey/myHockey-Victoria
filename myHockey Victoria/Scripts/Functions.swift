//
//  Functions.swift
//  myHockey Victoria
//
//  Created by Brett Moxey on 14/8/2023.
//

import Foundation

func GetPart(fullString: String, partNumber: Int) -> String {
    let newString = fullString.replacingOccurrences(of: "<", with: ">")
        .replacingOccurrences(of: "=", with: ">")
        .replacingOccurrences(of: "\"", with: ">")
        .replacingOccurrences(of: "/", with: ">")
    let newStringSplit = newString.split(separator: ">")
    if newStringSplit.count > partNumber {
        return String(newStringSplit[partNumber])
    } else {
        return ""
    }
}
