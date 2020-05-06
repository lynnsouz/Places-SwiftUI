//
//  WatchCityDetail.swift
//  WatchPlaces Extension
//
//  Created by Lynneker Souza on 5/5/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct WatchCityDetail: View {
    @EnvironmentObject var userData: UserData
    var city: City
    
    var cityIndex: Int {
        userData.cities.firstIndex(where: { $0.id == city.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: self.city.image)
                    .frame(width: 120, height: 120)
                    .scaleEffect(2/3)
                    .scaledToFit()
                
                Text(self.city.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn: $userData.cities[self.cityIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                Text(self.city.state)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(self.city.contry)
                    .font(.caption)
                
                Divider()
                
                WatchMapView(locationCoordinate: self.city.locationCoordinate)
                    .scaledToFit()
                
            }
            .padding(8)
        }
        .navigationBarTitle("Cities")
    }
}

struct WatchCityDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return Group {
            WatchCityDetail(city: userData.cities[2]).environmentObject(userData)
                .previewDevice("Apple Watch Series 4 - 44mm")
            WatchCityDetail(city: userData.cities[0]).environmentObject(userData)
                .previewDevice("Apple Watch Series 2 - 38mm")
        }
    }
}
