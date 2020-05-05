//
//  PageView.swift
//  Places SwiftUI
//
//  Created by Lynneker Souza on 5/5/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(citiesData.map { FeaturedView(cities: $0) })
            .aspectRatio(3/2, contentMode: .fit)
    }
}
