//
//  NotificationService.swift
//  Garbegor
//
//  Created by Ignas Davulis on 2024-01-07.
//

import Foundation
import UserNotifications

struct NotificationService {
    private let userNotficationManager = UNUserNotificationCenter.current()
    
    func requestAuth() {
        userNotficationManager.requestAuthorization(options: [.sound, .alert]) { (authorized, err) in
            if authorized {
               print("Si senor")
            } else if !authorized {
               print("NO Senor")
            } else {
                print(err?.localizedDescription as Any)
            }
        }
    }
    
    func sendNotifiction() {
        let id = "HelloCheese"
        let trigger: UNNotificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let content: UNMutableNotificationContent = UNMutableNotificationContent()
        
//        do {
//            let notifAttachement = try UNNotificationAttachment.init(identifier: "cleaner", url: URL(filePath: Bundle.main.path(forResource: "cleaner", ofType: ".jpeg")!), options: .none)
//            content.attachments = [notifAttachement]
//        } catch let err {
//            print(err.localizedDescription)
//        }
        
        content.title = "Files have been deleted"
        content.subtitle = "Checking in"
        content.body = "This is moving"
        content.sound = UNNotificationSound.default
        
        let req: UNNotificationRequest = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        userNotficationManager.add(req) { err in
            if err != nil {
                print(err?.localizedDescription as Any)
            }
        }
    }
}
