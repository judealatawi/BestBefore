//
//  UserNotificationsView.swift
//  Best Before
//
//  Created by Jude Alatawi on 21/06/1444 AH.
//

import SwiftUI
import UserNotifications


class NotificationManagerClass{
    static let instance = NotificationManagerClass()
    
    func requestAuthorization(){
        let options : UNAuthorizationOptions = [.alert, .badge, .sound]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if success {
                print("Working!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func ScheduleNotification (date: Date, body : String ){
        
        let dateComponents = Calendar.current.dateComponents([ .day, .month, .year, .hour, .minute], from: date)
        
        let stringbody1 = NSLocalizedString("Your",comment: "")
        let stringbody2 = " \(body) "
        let stringbody3 = NSLocalizedString("expired" ,comment: "")
        let stringtitle = NSLocalizedString("Throw it in the bin",comment: "")
        
        let content = UNMutableNotificationContent()
        content.title = stringbody1 + stringbody2 + stringbody3
        content.subtitle = stringtitle
        content.sound = UNNotificationSound.default
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}
