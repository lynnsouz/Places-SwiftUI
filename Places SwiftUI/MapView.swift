//
//  MapView.swift
//  Places SwiftUI
//
//  Created by Lynneker Souza on 4/23/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
        uiView.isUserInteractionEnabled = false
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: 34.011286, longitude: -116.166868)
    }
}
