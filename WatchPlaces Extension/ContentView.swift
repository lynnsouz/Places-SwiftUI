//
//  ContentView.swift
//  WatchPlaces Extension
//
//  Created by Lynneker Souza on 5/5/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CityList { WatchCityDetail(city: $0) }
            .environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CityList { WatchCityDetail(city: $0) }
            .environmentObject(UserData())
    }
}
