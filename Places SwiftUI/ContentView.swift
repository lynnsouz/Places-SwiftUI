//
//  ContentView.swift
//  Places SwiftUI
//
//  Created by Lynneker Souza on 4/23/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var data = [City(id: 0, name: "New York City", imageName: "NYC", state: "New York", contry: "EUA 🇺🇸", latitude: 40.7591212, longitude: -74.0042501),
                       City(id: 1, name: "Miami", imageName: "NYC", state: "Florida", contry: "EUA 🇺🇸", latitude: 25.7784254, longitude: -80.266927),
                       City(id: 2, name: "São Paulo", imageName: "SaoPaulo", state: "São Paulo", contry: "BRA 🇧🇷", latitude: -23.5630164, longitude: -46.6566169),
                       City(id: 3, name: "Brasília", imageName: "bsb", state: "Distrito Federal", contry: "BRA 🇧🇷", latitude: -15.7925501, longitude: -47.8874471),
                       City(id: 4, name: "Curitiba", imageName: "curitiba", state: "Paraná", contry: "BRA 🇧🇷", latitude: -25.4562375, longitude: -49.2692353),
                       City(id: 5, name: "Florianópolis", imageName: "floripa", state: "Santa Catarina", contry: "BRA 🇧🇷", latitude: -27.6310815, longitude: -48.5856772)]
    
    @State private var city = 0
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                MapView(latitude: data[city].latitude, longitude: data[city].longitude)
                    .frame(height: 300)
                CircleImage(imageName: data[city].imageName)
                    .offset(y: 100)
            }
            .padding(.bottom, 100)
            Spacer()
            VStack(alignment: .leading){
                Text(data[city].name)
                    .font(.title)
                HStack {
                    Text(data[city].state)
                        .font(.subheadline)
                    Spacer()
                    Text(data[city].contry)
                        .font(.subheadline)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: { self.city = self.city == self.data.count-1 ? 0 : self.city+1 }) {
                Text("Change")
                    .foregroundColor(.white)
            }.frame(width: 128, height: 32, alignment: .center)
                .font(.headline)
                .background(Color.blue)
                .cornerRadius(16)
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
