//
//  CategoryHome.swift
//  Places SwiftUI
//
//  Created by Lynneker Souza on 5/4/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var userData: UserData
    
    var contries: [String: [City]] {
        Dictionary(
            grouping: placesData.sorted(by: { $0.name < $1.name }),
            by: { $0.contry }
        )
    }
    
    var featured: [City] {
        placesData.filter { $0.isFeatured }.sorted(by: { $0.name < $1.name })
    }
    
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                PageView(featured.map { FeaturedView(cities: $0) })
                    .scaledToFill()
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(contries.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.contries[key]!)
                }
                .listRowInsets(EdgeInsets())
                NavigationLink(destination: CityList().environmentObject(userData)) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Contries"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                Text("User Profile")
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
