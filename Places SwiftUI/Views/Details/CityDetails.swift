//
//  ContentView.swift
//  Places SwiftUI
//
//  Created by Lynneker Souza on 4/23/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct CityDetails: View {
    @EnvironmentObject var userData: UserData
    var city: City
    
    var cityIndex: Int {
        userData.cities.firstIndex(where: { $0.id == city.id })!
    }
    
    var body: some View {
        VStack() {
            ZStack(alignment: .bottom) {
                MapView(coordinate: city.locationCoordinate)
                    .frame(height: 400)
                CircleImage(image: city.image)
                    .offset(y: 100)
            }
            .padding(.bottom, 100)
            VStack(alignment: .leading){
                HStack {
                    Text(city.name)
                        .font(.title)
                    Button(action: {
                        self.userData.cities[self.cityIndex].isFavorite.toggle()
                    }) {
                        if self.userData.cities[self.cityIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                HStack {
                    Text(city.state)
                        .font(.subheadline)
                    Spacer()
                    Text(city.contry)
                        .font(.subheadline)
                }
            }
            .padding(.horizontal)
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetails(city: placesData[3])
    }
}
