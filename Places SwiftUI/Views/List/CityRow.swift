//
//  CityRow.swift
//  Places SwiftUI
//
//  Created by Lynneker Souza on 5/4/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct CityRow: View {
    var city: City
    
    var body: some View {
        HStack {
            city.image
                .resizable()
                .frame(width: 48, height: 48)
                .scaledToFill()
            
            Text(city.name)
                
            Spacer()
            if city.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.large)
                    .foregroundColor(.yellow)
                
            }
        }
    }
}

struct CityRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Group {
                CityRow(city: citiesData[0])
                CityRow(city: citiesData[1])
                CityRow(city: citiesData[2])
                CityRow(city: citiesData[3])
                
                
                CityRow(city: citiesData[4])
                
            }
            .previewLayout(.fixed(width: 300, height: 80))
            CityRow(city: citiesData[3])
                .previewDevice("Apple Watch Series 4 - 40mm")
        }
        
    }
}
