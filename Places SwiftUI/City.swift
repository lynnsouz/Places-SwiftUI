//
//  City.swift
//  Places SwiftUI
//
//  Created by Lynneker Souza on 4/23/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import Foundation

import SwiftUI
import MapKit

struct City: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var state: String
    var contry: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
}
