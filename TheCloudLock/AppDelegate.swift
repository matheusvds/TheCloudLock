//
//  AppDelegate.swift
//  TheCloudLock
//
//  Copyright © AppCompany. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy private var router = RootRouter()
    lazy private var deeplinkHandler = DeeplinkHandler()
    lazy private var notificationsHandler = NotificationsHandler()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        // Notifications
        notificationsHandler.configure()

        // App structure
        router.loadMainAppStructure()

        return true
    }

    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        // To enable full universal link functionality add and configure the associated domain capability
        // https://developer.apple.com/library/content/documentation/General/Conceptual/AppSearch/UniversalLinks.html
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb, let url = userActivity.webpageURL {
            deeplinkHandler.handleDeeplink(with: url)
        }
        return true
    }

    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        // To enable full remote notifications functionality you should first register the device with your api service
        //https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/
        notificationsHandler.handleRemoteNotification(with: userInfo)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        if let statusBarRect = window?.windowScene?.statusBarManager?.statusBarFrame {
            let rect = CGRect(origin: statusBarRect.origin,
                              size: CGSize(width: statusBarRect.width,
                                           height: statusBarRect.height * 2))
            
            guard let touchPoint = event?.allTouches?.first?.location(in: self.window) else {
                return
            }

            if rect.contains(touchPoint) {
                NotificationCenter.default.post(statusBarTappedNotification)
            }
        }
    }
    
}

let statusBarTappedNotification = Notification(name: Notification.Name(rawValue: "statusBarTappedNotification"))
