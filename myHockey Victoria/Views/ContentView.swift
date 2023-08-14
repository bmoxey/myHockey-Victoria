//
//  ContentView.swift
//  myHockey Victoria
//
//  Created by Brett Moxey on 12/8/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var networkMonitor = NetworkMonitor()
    @State private var myTeamArray: [TeamStruct] = []
    
    init() {
        if let savedData = UserDefaults.standard.data(forKey: "TeamArrayKey"),
           let savedArray = try? JSONDecoder().decode([TeamStruct].self, from: savedData) {
            self._myTeamArray = State(initialValue: savedArray)
        }
    }
    
    var body: some View {
        VStack {
            if networkMonitor.isConnected {
                if myTeamArray.isEmpty {
                    SelectDivisionView()
                } else {
                    MainTabView()
                }
            } else {
                NoNetworkView()
            }
        }
        .onAppear { networkMonitor.start() }
        .onDisappear { networkMonitor.stop() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
