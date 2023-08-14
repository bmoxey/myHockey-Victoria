//
//  SelectDivisionView.swift
//  myHockey Victoria
//
//  Created by Brett Moxey on 14/8/2023.
//

import SwiftUI

struct SelectDivisionView: View {
    @State private var selectedCompetition: String = ""
    @State private var newDivisions: [DivisionStruct] = []
    
    var compList: [String] {
        var uniqueComps: [String] = []
        for division in newDivisions {
            if !uniqueComps.contains(division.compName) {
                uniqueComps.append(division.compName)
            }
        }
        return uniqueComps
    }
    
    var filteredDivs: [DivisionStruct] {
        if selectedCompetition.isEmpty {
            return newDivisions
        } else {
            return newDivisions.filter { $0.compName == selectedCompetition }
        }
    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Select Surname", selection: $selectedCompetition) {
                    ForEach(compList, id: \.self) { competition in
                        Text(competition).tag(competition)
                    }
                }
                .pickerStyle(.segmented)
                                
                List(filteredDivs) { division in
                    NavigationLink(
                        destination: SelectTeamView(division: division),
                        label: {
                            Text("\(division.divisionName)")
                                .font(.system(size: 14))
                        }
                    )
                    .listStyle(.plain)
                }
                
            }
            
            .task {
                await loadData()
            }
            .navigationTitle("Select Competition")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    func loadData() async {
        var myCompName = ""
        var myCompID = ""
        var myDivName = ""
        var myDivID = ""
        guard let url = URL(string: "https://www.hockeyvictoria.org.au/games/")
        else {
            print("Invalid URL")
            return
        }
        do {
            let html = try String.init(contentsOf: url)
            let line = html.split(whereSeparator: \.isNewline)
            for i in 0 ..< line.count {
                if line[i].contains("https://www.hockeyvictoria.org.au/reports/games/download/") {
                    myCompName = GetPart(fullString: String(line[i-1]), partNumber: 3)
                    myCompName = myCompName.replacingOccurrences(of: " Competition", with: "")
                        .replacingOccurrences(of: " Hockey League RHL", with: "")
                    if newDivisions.isEmpty {
                        selectedCompetition = myCompName
                    }
                }
                if line[i].contains("https://www.hockeyvictoria.org.au/games/") {
                    myCompID = GetPart(fullString: String(line[i]), partNumber: 5)
                    myDivID = GetPart(fullString: String(line[i]), partNumber: 7)
                    myDivName = GetPart(fullString: String(line[i]), partNumber: 8)
                    if myDivID.isNumeric && myCompID.isNumeric {
                        newDivisions.append(DivisionStruct(compName: myCompName, compID: myCompID, divisionName: myDivName, divisionID: myDivID))
                    }
                }
            }
        } catch {
            print("Invalid data")
        }
        
    }
}

struct SelectDivisionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDivisionView()
    }
}
