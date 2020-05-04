//
//  City.swift
//  Places SwiftUI
//
//  Created by Lynneker Souza on 4/23/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import Foundation

import SwiftUI
import CoreLocation

struct City: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var contry: String
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}

extension City {
    var image: Image {
        Image(imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
