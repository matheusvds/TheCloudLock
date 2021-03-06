//
//  RootRouter.swift
//  TheCloudLock
//
//  Copyright © AppCompany. All rights reserved.
//

import UIKit

class RootRouter {
    
    /** Replaces root view controller. You can specify the replacment animation type.
     If no animation type is specified, there is no animation */
    func setRootViewController(controller: UIViewController, animatedWithOptions: UIView.AnimationOptions?) {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
            fatalError("No window in app")
        }
        if let animationOptions = animatedWithOptions, window.rootViewController != nil {
            window.rootViewController = controller
            UIView.transition(with: window, duration: 0.33, options: animationOptions, animations: {
            }, completion: nil)
        } else {
            window.rootViewController = controller
        }
    }
    
    func loadMainAppStructure() {
        // Add State Selector
        addNotificationForStateSelector()
        
        // Customize your app structure here
        let tabController = BaseTabbarController()
        tabController.setViewControllers(instanceNavigationControllers(), animated: true)
        setRootViewController(controller: tabController, animatedWithOptions: nil)
    }
    
    private func instanceNavigationControllers() -> [UINavigationController] {
        return [
            instanceUnlockNavigation(),
            instanceDoorNavigation(),
            instanceUsersNavigation(),
            instanceEventNavigation()
        ]
    }
    
    private func instanceUnlockNavigation() -> UINavigationController {
        let unlockVC = UnlockController()
        unlockVC.tabBarItem = UITabBarItem(title: "Unlock",
                                           image: R.image.locker(),
                                           tag: 0)
        return BaseNavigationController(rootViewController: unlockVC)
    }
    
    private func instanceDoorNavigation() -> UINavigationController {
        let unlockVC = ListController<Doors>()
        unlockVC.tabBarItem = UITabBarItem(title: "Doors",
                                           image: R.image.door(),
                                           tag: 1)
        return BaseNavigationController(rootViewController: unlockVC)
    }
    
    private func instanceUsersNavigation() -> UINavigationController {
        let unlockVC = ListController<Users>()
        unlockVC.tabBarItem = UITabBarItem(title: "Users",
                                           image: R.image.user(),
                                           tag: 2)
        return BaseNavigationController(rootViewController: unlockVC)
    }
    
    private func instanceEventNavigation() -> UINavigationController {
        let unlockVC = ListController<Events>()
        unlockVC.tabBarItem = UITabBarItem(title: "Events",
                                           image: R.image.event(),
                                           tag: 3)
        return BaseNavigationController(rootViewController: unlockVC)
    }
    
    private func addNotificationForStateSelector() {
        _ = NotificationCenter.default.addObserver(
            forName: statusBarTappedNotification.name,
            object: .none,
            queue: .none
        ) { _ in
            let rootVC = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController
            rootVC?.present(StateTableViewController(), animated: true, completion: nil)
        }
    }
    
}
