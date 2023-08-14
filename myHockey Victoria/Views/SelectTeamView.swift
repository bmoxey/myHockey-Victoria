//
//  SelectTeamView.swift
//  myHockey Victoria
//
//  Created by Brett Moxey on 14/8/2023.
//

import SwiftUI

struct SelectTeamView: View {
    let division: DivisionStruct
    
    var body: some View {
        VStack {
            Text("\(division.compName)")
            Text("\(division.divisionName)")
        }
    }
}
