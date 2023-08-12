//
//  MainTabView.swift
//  myHockey Victoria
//
//  Created by Brett Moxey on 12/8/2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Next Game View")
                .tabItem {
                    Image("hockey")
                    Text("Next Game")
                }
            Text("Game Schedule")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Schedule")
                }
            Text("Ladder")
                .tabItem {
                    Image("ladder")
                    Text("Ladder")
                }
            Text("Teams")
                .tabItem {
                    Image(systemName: "person.text.rectangle.fill")
                    Text("Teams")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
