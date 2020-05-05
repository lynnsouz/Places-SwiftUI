//
//  CityList.swift
//  Places SwiftUI
//
//  Created by Lynneker Souza on 5/4/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct CityList: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Favorites only")
            }
            ForEach(userData.cities.filter({!self.userData.showFavoritesOnly || $0.isFavorite})) { city in
                NavigationLink(destination: CityDetails(city: city)) {
                    CityRow(city: city)
                }
            }
            .navigationBarTitle(Text("Cities"))
        }
    }
}

struct CityList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CityList()
                .environmentObject(UserData())
        }
        
    }
}
