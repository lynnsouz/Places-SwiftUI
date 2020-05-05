//
//  FeaturedCity.swift
//  Places SwiftUI
//
//  Created by Lynneker Souza on 5/5/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct FeaturedView: View {
    var cities: City
    
    var body: some View {
        ZStack(alignment: .bottom) {
            cities.image
                .resizable()
            
            Rectangle()
                .foregroundColor(.black)
                .frame(height: 80)
                .opacity(0.25)
                .blur(radius: 10)
            
            
            HStack {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text(cities.name)
                        .font(.title)
                        .foregroundColor(.white)
                    Text(cities.state)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct FeaturedCity_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView(cities: placesData[0])
            .aspectRatio(3/2, contentMode: .fit)
    }
}
