//
//  SelectTeamView.swift
//  myHockey Victoria
//
//  Created by Brett Moxey on 14/8/2023.
//

import SwiftUI


struct SelectTeamView: View {
    @State private var newTeam: [NewTeamStruct] = []
    @State private var showingConfirmationDialog = false
    @State private var selectedTeam: NewTeamStruct? = nil
    
    let division: DivisionStruct
    
    var body: some View {
        let sortedTeam = newTeam.sorted { $0.teamName < $1.teamName }
        NavigationStack {
            VStack {
                
                List(sortedTeam) { team in
                    Text(team.teamName)
                        .onTapGesture {
                            selectedTeam = team
                            showingConfirmationDialog = true
                        }

                        .alert(isPresented: $showingConfirmationDialog) {
                        Alert(
                            title: Text("Confirm Selection"),
                            message: Text("You have selected \n \(selectedTeam?.divisionName ?? "") \n \(selectedTeam?.teamName ?? "") \n Are you sure ?"),
                            primaryButton: .default(Text("Yes")) {
                               addTeamToMyArray()
                            },
                            secondaryButton: .cancel(Text("No")) {
                            }
                        )
                    }
                }
                }
            .task {
                await loadData()
            }
            .navigationTitle("Select Your Team")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func addTeamToMyArray() {
        
    }
    
    
    func loadData() async {
        var myTeamName = ""
        var myTeamID = ""
        let myURL = "https://hockeyvictoria.org.au/games/" + division.compID + "/&r=1&d=" + division.divisionID
        guard let url = URL(string: myURL)
        else {
            print("Invalid URL")
            return
        }
        do {
            let html = try String.init(contentsOf: url)
            let line = html.split(whereSeparator: \.isNewline)
            for i in 0 ..< line.count {
                if line[i].contains("https://www.hockeyvictoria.org.au/teams/") {
                    myTeamName = GetPart(fullString: String(line[i]), partNumber: 8)
                    myTeamName = ShortClubName(fullName: myTeamName)
                    myTeamID = GetPart(fullString: String(line[i]), partNumber: 7)
                    newTeam.append(NewTeamStruct(compName: division.compName, compID: division.compID, divisionName: division.divisionName, divisionID: division.divisionID, teamName: myTeamName, teamID: myTeamID))
                    myTeamName = GetPart(fullString: String(line[i]), partNumber: 22)
                    myTeamName = ShortClubName(fullName: myTeamName)
                    myTeamID = GetPart(fullString: String(line[i]), partNumber: 21)
                    newTeam.append(NewTeamStruct(compName: division.compName, compID: division.compID, divisionName: division.divisionName, divisionID: division.divisionID, teamName: myTeamName, teamID: myTeamID))

                }
            }
        } catch {
            print("Invalid Data")
        }
    }
}

