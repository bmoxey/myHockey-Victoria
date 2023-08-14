//
//  Structs.swift
//  myHockey Victoria
//
//  Created by Brett Moxey on 14/8/2023.
//

import Foundation

struct DivisionStruct : Identifiable {
    var id = UUID()
    var compName: String
    var compID: String
    var divisionName: String
    var divisionID: String
}

struct TeamStruct : Identifiable, Codable {
    private var uniqueId = UUID()
    var id: UUID { uniqueId }
    var compName: String
    var compID: String
    var divisionName: String
    var divisionID: String
    var teamName: String
    var teamID: String
    var isCurrent: Bool
}
