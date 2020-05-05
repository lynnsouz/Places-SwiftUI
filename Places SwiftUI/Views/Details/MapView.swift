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
    
    let coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let newCoodinate = CLLocationCoordinate2D(latitude: coordinate.latitude > 0 ? coordinate.latitude-0.5 : coordinate.latitude-0.6 , longitude: coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: newCoodinate, span: span)
        uiView.setRegion(region, animated: true)
        uiView.isUserInteractionEnabled = false
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: citiesData[0].locationCoordinate)
    }
}
