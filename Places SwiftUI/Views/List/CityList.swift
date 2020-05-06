//
//  CityList.swift
//  Places SwiftUI
//
//  Created by Lynneker Souza on 5/4/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct CityList<DetailView: View>: View {
    
    @EnvironmentObject var userData: UserData
    let detailViewProducer: (City) -> DetailView
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Favorites only")
            }
            ForEach(userData.cities.filter({!self.userData.showFavoritesOnly || $0.isFavorite})) { city in
                NavigationLink(destination: self.detailViewProducer(city).environmentObject(self.userData)) {
                    CityRow(city: city)
                }
            }
            .navigationBarTitle(Text("Cities"))
        }
    }
}


#if os(watchOS)
typealias PreviewDetailView = WatchCityDetail
#else
typealias PreviewDetailView = CityDetails
#endif


struct CityList_Previews: PreviewProvider {
    static var previews: some View {
        CityList { PreviewDetailView(city: $0) }
            .environmentObject(UserData())
    }
}
