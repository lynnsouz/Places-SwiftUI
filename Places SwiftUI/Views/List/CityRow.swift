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
                .frame(width: 56, height: 56)
                .scaledToFill()
            Text(city.name)
                .font(.title)
            Spacer()
        }
    }
}

struct CityRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CityRow(city: placesData[0])
            CityRow(city: placesData[1])
            CityRow(city: placesData[2])
            CityRow(city: placesData[3])
            CityRow(city: placesData[4])
        }
        .previewLayout(.fixed(width: 300, height: 80))
    }
}
