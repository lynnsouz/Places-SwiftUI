//
//  NotificationController.swift
//  WatchPlaces Extension
//
//  Created by Lynneker Souza on 5/5/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    
    var title: String?
    var message: String?
    var city: City?
    
    let cityIndexKey = "cityIndexKey"

    override var body: NotificationView {
        return NotificationView(title: title, message:  message, city: city)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceive(_ notification: UNNotification) {
        let userData = UserData()
        
        let notificationData =
            notification.request.content.userInfo as? [String: Any]
        
        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        
        title = alert?["title"] as? String
        message = alert?["body"] as? String
        
        if let index = notificationData?[cityIndexKey] as? Int {
            city = userData.cities[index]
        }
        
    }
}
