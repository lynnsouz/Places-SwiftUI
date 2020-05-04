//
//  CityList.swift
//  Places SwiftUI
//
//  Created by Lynneker Souza on 5/4/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct CityList: View {
    var body: some View {
        NavigationView {
            List(placesData.sorted(by: { $0.name < $1.name })) { city in
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
        CityList()
    }
}
