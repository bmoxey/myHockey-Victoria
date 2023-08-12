//
//  ContentView.swift
//  myHockey Victoria
//
//  Created by Brett Moxey on 12/8/2023.
//

import SwiftUI

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

struct ContentView: View {
    @StateObject var networkMonitor = NetworkMonitor()
    
    @State private var myTeamArray: [TeamStruct] = []
    
    init() {
        // Load the array from UserDefault during initialization
        if let savedData = UserDefaults.standard.data(forKey: "TeamArrayKey"),
           let savedArray = try? JSONDecoder().decode([TeamStruct].self, from: savedData) {
            self._myTeamArray = State(initialValue: savedArray)
        }
    }
    
    var body: some View {
        NavigationStack {
            if networkMonitor.isConnected {
                if myTeamArray.isEmpty {
                    GetInitialTeamView()
                } else {
                    MainTabView()
                }
            } else {
                NoNetworkView()
            }
        }
        .onAppear {
            networkMonitor.start()
            
        }
        .onDisappear() {
            networkMonitor.stop()
        }
    }
}

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
