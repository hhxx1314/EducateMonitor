platform :ios,'8.0'

def pods
    use_frameworks!
    
    pod 'FDStackView'
    pod 'Alamofire'
    pod 'LCNibBridge'
    pod 'SwiftyJSON'
    pod 'CryptoSwift'
    pod 'EZSwiftExtensions'
    pod 'Kingfisher'
    pod 'NVActivityIndicatorView'
    pod 'PeekPop'
    pod 'PermissionScope'
    pod 'PromiseKit'
    pod 'HandyJSON'
    pod 'ChameleonFramework/Swift'
    pod 'DZNEmptyDataSet'
    pod 'Charts'
    pod 'Charts/Realm'
    pod 'Onboard'
    pod 'ReachabilitySwift'
    
    pod 'JPush'
    pod 'Bugly'
    
    # 主模块(必须)
    pod 'ShareSDK3'
    # Mob 公共库(必须) 如果同时集成SMSSDK iOS2.0:可看此注意事项：http://bbs.mob.com/thread-20051-1-1.html
    pod 'MOBFoundation'
    # UI模块(非必须，需要用到ShareSDK提供的分享菜单栏和分享编辑页面需要以下1行)
    pod 'ShareSDK3/ShareSDKUI'
    # 平台SDK模块(对照一下平台，需要的加上。如果只需要QQ、微信、新浪微博，只需要以下3行)
    pod 'ShareSDK3/ShareSDKPlatforms/QQ'
    pod 'ShareSDK3/ShareSDKPlatforms/WeChat'
end

target "EducateMonitor" do
    pods
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'RxDataSources'
end
target "EducateMonitorTests" do
    pods
    pod 'RxBlocking'
    pod 'RxTest'
end


