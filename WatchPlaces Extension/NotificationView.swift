//
//  NotificationView.swift
//  WatchPlaces Extension
//
//  Created by Lynneker Souza on 5/5/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    
    let title: String?
    let message: String?
    let city: City?
    
    init(title: String? = nil,
         message: String? = nil,
         city: City? = nil) {
        self.title = title
        self.message = message
        self.city = city
    }
    
    var body: some View {
        VStack {
            
            if city != nil {
                CircleImage(image: city!.image)
                    .frame(width: 120, height: 120)
                    .scaleEffect(2/3)
                    .scaledToFit()
            }
            
            Text(title ?? "Unknown Landmark")
                .font(.headline)
                .lineLimit(0)
            
            Divider()
            
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
                .lineLimit(0)
        }
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        let city = UserData().cities[2]
        return Group {
            NotificationView()
            NotificationView(title: city.name,
                             message: "You are at \(city.name).",
                             city: city)
        }
        .previewLayout(.sizeThatFits)
    }
}
