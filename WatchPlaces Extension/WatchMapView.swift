//
//  WatchMapView.swift
//  WatchPlaces Extension
//
//  Created by Lynneker Souza on 5/5/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct WatchMapView: WKInterfaceObjectRepresentable {
    var locationCoordinate: CLLocationCoordinate2D
    
    func makeWKInterfaceObject(context: WKInterfaceObjectRepresentableContext<WatchMapView>) -> WKInterfaceMap {
        return WKInterfaceMap()
    }
    
    func updateWKInterfaceObject(_ map: WKInterfaceMap, context: WKInterfaceObjectRepresentableContext<WatchMapView>) {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02,
                                    longitudeDelta: 0.02)
        
        let region = MKCoordinateRegion(
            center: locationCoordinate,
            span: span)
        
        map.setRegion(region)
    }
}

struct WatchMapView_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            WatchMapView(locationCoordinate: citiesData[0].locationCoordinate)
                .previewDevice("Apple Watch Series 4 - 44mm")
            WatchMapView(locationCoordinate: citiesData[2].locationCoordinate)
                .previewDevice("Apple Watch Series 2 - 38mm")
        }
        
    }
}
