//
//  AppDelegate.swift
//  Affinitee
//
//  Created by Clement Joseph on 15/06/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications
import FirebaseAuth


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        //...........
        
        registerForPushNotifications()

        //...........
        
        UINavigationBar.appearance().backgroundColor = UIColor.clear
        UIBarButtonItem.appearance().tintColor = Color.themeColor
       
        
        updateScreens()
        
        
        
       

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    // MARK: - Push notifications

    func registerForPushNotifications() {
        
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) {
                [weak self] granted, error in
                
                print("Permission granted: \(granted)")
                guard granted else { return }
                self?.getNotificationSettings()
        }
    }
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
        
    }
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        print("Device Token: \(token)")
        
        // Pass device token to auth
        Auth.auth().setAPNSToken(deviceToken, type: AuthAPNSTokenType.prod)
        
        // Further handling of the device token if needed by the app
        // ...
        
    }
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification notification: [AnyHashable : Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if Auth.auth().canHandleNotification(notification) {
            completionHandler(UIBackgroundFetchResult.noData)
            return
        }
        // This notification is not auth related, developer should handle it.
    }
    
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }
   
    
    
    
    // MARK: - Private Functions
    
    
    func updateScreens() {

        checkIfUserIsSignedIn { (success) in
            if(success){
                
                if( UserDefaults.standard.bool(forKey: AppConstants.isProfileCompleted)){
                    
                }else{
                    
                }

                showLoginScreens()

                
                showProfileCreationScreens()

                
            }else{
//                showLoginScreens()
                
                showProfileCreationScreens()

                
            }
        }
        
    }
    
    
    func checkIfUserIsSignedIn(completionHandler :(_ success:Bool) -> Void ) {
        if Auth.auth().currentUser != nil {
            completionHandler(true)
        }
        else {
            //User Not logged in
            completionHandler(false)
        }
    }
    
    func showLoginScreens() {

        let storyboard = CommonFunctions.AppStoryboard.SignUp.instance
        
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "LoginOption")
        let navigationController = UINavigationController(rootViewController: initialViewController)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
    }
    
    
    func showProfileCreationScreens() {
        
        let storyboard = CommonFunctions.AppStoryboard.ProfileCreation.instance
        
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "NameView")
        let navigationController = UINavigationController(rootViewController: initialViewController)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
    }
    
    func showMainScreens() {
        
        let storyboard = CommonFunctions.AppStoryboard.Main.instance
        
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "HomeView")
        let navigationController = UINavigationController(rootViewController: initialViewController)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
    }
    
    

    
    
    
    
    
    


}

