//
//  NoNetworkView.swift
//  myHockey Victoria
//
//  Created by Brett Moxey on 12/8/2023.
//

import SwiftUI

struct NoNetworkView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("dontknow")
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 240)
            Spacer()
            Text("No Network Detected")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "wifi.slash")
                .foregroundColor(.red)
                .font(.system(size: 128, weight: .bold))
            Spacer()
            Spacer()
        }
    }
}

struct NoNetworkView_Previews: PreviewProvider {
    static var previews: some View {
        NoNetworkView()
    }
}
