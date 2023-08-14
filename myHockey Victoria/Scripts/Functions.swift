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

func ShortClubName(fullName: String) -> String {
    let newString = fullName.replacingOccurrences(of: " Hockey", with: "")
        .replacingOccurrences(of: " Club", with: "")
        .replacingOccurrences(of: " Association", with: "")
        .replacingOccurrences(of: " Sports INC", with: "")
        .replacingOccurrences(of: "University", with: "Uni")
        .replacingOccurrences(of: "Eastern Christian Organisation (ECHO)", with: "ECHO")
        .replacingOccurrences(of: "Melbourne High School Old Boys", with: "M.H.S.O.B.")
        .replacingOccurrences(of: "Peninsula ", with: "Pen ")
        .replacingOccurrences(of: "Greater ", with: "")
        .replacingOccurrences(of: "United", with: "Utd")
        .replacingOccurrences(of: "Grammarians'", with: "Grammar")
    return newString
}

func ShortDivName(fullName: String) -> String {
    let newString = fullName.replacingOccurrences(of: "GAME Clothing ", with: "")
    return newString
}

func ShortCompName(fullName: String) -> String {
    let newString = fullName.replacingOccurrences(of: " Competition", with: "")
        .replacingOccurrences(of: " Hockey League RHL", with: "")
    return newString
}
