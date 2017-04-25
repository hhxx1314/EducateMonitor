//
//  AppDelegate.swift
//  EducateMonitor
//
//  Created by 刘通超 on 2017/3/13.
//  Copyright © 2017年 北京京师乐学教育科技有限公司. All rights reserved.
//

import UIKit
import EZSwiftExtensions
import ReachabilitySwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //根视图
        configRootController()
        //网络状态
        configNetReachability()
        //推送
        configAPNS(launchOptions: launchOptions)
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
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        JPUSHService.registerDeviceToken(deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        JPUSHService.handleRemoteNotification(userInfo)
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        JPUSHService.handleRemoteNotification(userInfo)
        completionHandler(.newData)
    }

    //MARK: 根控制器配置
    func configRootController() {
        let root = LoginViewController.instanceNib()
        window = UIWindow.init(viewController: root, backgroundColor: RandomColor())
    }
    
    func configAPNS(launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        if #available(iOS 10.0, *){
            let entiity = JPUSHRegisterEntity()
            entiity.types = Int(UNAuthorizationOptions.alert.rawValue |
                UNAuthorizationOptions.badge.rawValue |
                UNAuthorizationOptions.sound.rawValue)
            JPUSHService.register(forRemoteNotificationConfig: entiity, delegate: self)
        } else if #available(iOS 8.0, *) {
            let types = UIUserNotificationType.badge.rawValue |
                UIUserNotificationType.sound.rawValue |
                UIUserNotificationType.alert.rawValue
            JPUSHService.register(forRemoteNotificationTypes: types, categories: nil)
        }else {
            let type = UIRemoteNotificationType.badge.rawValue |
                UIRemoteNotificationType.sound.rawValue |
                UIRemoteNotificationType.alert.rawValue
            JPUSHService.register(forRemoteNotificationTypes: type, categories: nil)
        }
        
        JPUSHService.setup(withOption: launchOptions,
                           appKey: "df11e0c6804530e8950b497f",
                           channel: "app store",
                           apsForProduction: false)
    }
    
    //MARK: 网络监测配置
    func configNetReachability() {
        
        let manger = Reachability()!
        manger.whenUnreachable = { unreachable in
            print("Not reachable")
        }
        manger.whenReachable = {reachable in
            if manger.isReachableViaWiFi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
        }
        
        do {
            try manger.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
}

extension AppDelegate: JPUSHRegisterDelegate{
    
    @available(iOS 10.0, *)
    
    @available(iOS 10.0, *)
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, willPresent notification: UNNotification!, withCompletionHandler completionHandler: ((Int) -> Void)!) {
        print("will present")
    }
    
    @available(iOS 10.0, *)
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, didReceive response: UNNotificationResponse!, withCompletionHandler completionHandler: (() -> Void)!) {
        print("didReceive")
        
        LCToastView.createToast(info: "didReceive", view: self.window as! UIView).show()
    }
}


func configShare(){
    ShareSDK.registerApp("", activePlatforms: [SSDKPlatformType.typeQQ.rawValue,SSDKPlatformType.typeWechat.rawValue], onImport: { (platform) in
        switch platform
        {
        case SSDKPlatformType.typeWechat:
            ShareSDKConnector.connectWeChat(WXApi.classForCoder())
        case SSDKPlatformType.typeQQ:
            ShareSDKConnector.connectQQ(QQApiInterface.classForCoder(), tencentOAuthClass: TencentOAuth.classForCoder())
        default:
            break
        }
    }) { (platformType : SSDKPlatformType, appInfo : NSMutableDictionary?) in
        switch platformType
        {
            
        case SSDKPlatformType.typeWechat:
            //设置微信应用信息
            appInfo?.ssdkSetupWeChat(byAppId: "wx4868b35061f87885", appSecret: "64020361b8ec4c99936c0e3999a9f249")
            
        case SSDKPlatformType.typeQQ:
            //设置QQ应用信息
            appInfo?.ssdkSetupQQ(byAppId: "100371282",
                                 appKey : "aed9b0303e3ed1e27bae87c33761161d",
                                 authType : SSDKAuthTypeWeb)
        default:
            break
        }
    }
}

