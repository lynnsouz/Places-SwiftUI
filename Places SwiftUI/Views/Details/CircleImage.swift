//
//  CircleImage.swift
//  Places SwiftUI
//
//  Created by Lynneker Souza on 4/23/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .frame(width: 200, height: 200)
            .scaleEffect(1/3)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("NYC2"))
    }
}
