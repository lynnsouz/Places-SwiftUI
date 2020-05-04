//
//  UserData.swift
//  Places SwiftUI
//
//  Created by Lynneker Souza on 5/4/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var cities: [City] = placesData.sorted(by: { $0.name < $1.name })
}
