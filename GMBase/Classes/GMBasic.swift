//
//  GMBasic.swift
//  GMBase
//
//  Created by gmj on 2023/1/6.
//
// 这个类里面存放一些 屏幕宽高啊 颜色之类的 较为基础的数据

public struct Screen {
    static let width: CGFloat = UIScreen.main.bounds.size.width
    static let height: CGFloat = UIScreen.main.bounds.size.height
    static let isiPhone5 = height == 568
    static let isiPhone6 = height == 667
    static let isiPhone6p = height == 736
    static let isiPhoneX = height >= 812
    static let isIphone11 = UIDevice().modelName == "iPhone 11"
}

extension UIDevice {
    /// 获取设备具体详细的型号
    var modelName: String {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod1,1":
            return "iPod Touch 1G"
        case "iPod2,1":
            return "iPod Touch 2G"
        case "iPod3,1":
            return "iPod Touch 3G"
        case "iPod4,1":
            return "iPod Touch 4G"
        case "iPod5,1":
            return "iPod Touch 5G"
        case "iPod7,1":
            return "iPod Touch 6G"
            
        case "iPhone1,1":
            return "iPhone 2G"
        case "iPhone1,2":
            return "iPhone 3G"
        case "iPhone2,1":
            return "iPhone 3GS"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":
            return "iPhone 4"
        case "iPhone4,1":
            return "iPhone 4s"
            
        case "iPhone5,1":
            return "iPhone 5"
        case "iPhone5,2":
            return "iPhone 5 (GSM+CDMA)"
        case "iPhone5,3":
            return "iPhone 5c (GSM)"
        case "iPhone5,4":
            return "iPhone 5c (GSM+CDMA)"
            
        case "iPhone6,1":
            return "iPhone 5s (GSM)"
        case "iPhone6,2":
            return "iPhone 5s (GSM+CDMA)"
            
        case "iPhone7,2":
            return "iPhone 6"
        case "iPhone7,1":
            return "iPhone 6 Plus"
        case "iPhone8,1":
            return "iPhone 6s"
        case "iPhone8,2":
            return "iPhone 6s Plus"
            
        case "iPhone8,4":
            return "iPhone SE"
            /// "国行、日版、港行iPhone 7"
        case "iPhone9,1":
            return "iPhone 7"
            /// "港行、国行iPhone 7 Plus"
        case "iPhone9,2":
            return "iPhone 7 Plus"
            /// "美版、台版iPhone 7"
        case "iPhone9,3":
            return "iPhone 7"
            /// "美版、台版iPhone 7 Plus"
        case "iPhone9,4":
            return "iPhone 7 Plus"
            
        case "iPhone10,1", "iPhone10,4":
            return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":
            return "iPhone 8 Plus"
            
        case "iPhone10,3", "iPhone10,6":
            return "iPhone X"
            
        case "iPhone11,2":
            return "iPhone XS"
        case "iPhone11,4", "iPhone11,6":
            return "iPhone XS Max"
        case "iPhone11,8":
            return "iPhone XR"

        case "iPhone12,1":
            return "iPhone 11"
        case "iPhone12,3":
            return "iPhone 11 Pro"
        case "iPhone12,5":
            return "iPhone 11 Pro Max"
    
            
        case "iPhone13,1":
            return "iPhone 12 mini"
        case "iPhone13,2":
            return "iPhone 12"
        case "iPhone13,3":
            return "iPhone 12  Pro"
        case "iPhone13,4":
            return "iPhone 12  Pro Max"
            
        case "iPad1,1":
            return "iPod Touch 1G"
        case "iPad1,2":
            return "iPad 3G"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
            return "iPod Touch 2G"
        case "iPad2,5", "iPad2,6", "iPad2,7":
            return "iPad Mini 1G"
        case "iPad3,1", "iPad3,2", "iPad3,3":
            return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":
            return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":
            return "iPad Air"
        case "iPad4,4", "iPad4,5", "iPad4,6":
            return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":
            return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":
            return "iPad Mini 4"
        case "iPad5,3", "iPad5,4":
            return "iPad Air 2"
        case "iPad6,3", "iPad6,4":
            return "iPad Pro 9.7"
        case "iPad6,7", "iPad6,8":
            return "iPad Pro 12.9"
            
        case "AppleTV2,1":
            return "Apple TV 2"
        case "AppleTV3,1", "AppleTV3,2":
            return "Apple TV 3"
        case "AppleTV5,3":
            return "Apple TV 4"
            
        case "i386", "x86_64":
            return "iPhone 11 Pro"
            
        default:
            return "iPhone"
        }
    }
    
    /// 底部安全区高度
    static func safeDistanceBottom() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.bottom
        } else if #available(iOS 11.0, *) {
            guard let window = UIApplication.shared.windows.first else { return 0 }
            return window.safeAreaInsets.bottom
        }
        return 0;
    }
    
    /// 顶部安全区高度
    static func safeDistanceTop() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.top
        } else if #available(iOS 11.0, *) {
            guard let window = UIApplication.shared.windows.first else { return 0 }
            return window.safeAreaInsets.top
        }
        return 0;
    }
    
    /// 顶部状态栏高度（包括安全区）
    static func statusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let statusBarManager = windowScene.statusBarManager else { return 0 }
            statusBarHeight = statusBarManager.statusBarFrame.height
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }
    
    /// 导航栏高度
    public static func navigationBarHeight() -> CGFloat {
        return 44.0
    }
    
    /// 状态栏+导航栏的高度
    public static func navigationFullHeight() -> CGFloat {
        return UIDevice.statusBarHeight() + UIDevice.navigationBarHeight()
    }
    
    /// 底部导航栏高度
    public static func tabBarHeight() -> CGFloat {
        return 49.0
    }
    
    /// 底部导航栏高度（包括安全区）
    public static func tabBarFullHeight() -> CGFloat {
        return UIDevice.tabBarHeight() + UIDevice.safeDistanceBottom()
    }
}

public extension UIColor {
     /// 在门锁升级页面中 背景的颜色
     static var bgView: UIColor = UIColor(hex: "#F8F8FA")
     /// 在门锁升级页面中 按钮的文字颜色
     static var buttonText: UIColor = UIColor(hex: "#1D78F7")
     /// 按钮禁用的背景色
     static var buttonDisable: UIColor = UIColor(hex: "#60A0F9")
     /// 在门锁升级页面中 升级按钮的 背景色
     static var buttonBg: UIColor = UIColor(hex: "#1D78F7", alpha: 0.06)
     /// 在门锁升级页面中 升级按钮的 边框颜色
     static var buttonBorder: UIColor = UIColor(hex: "#1D78F7", alpha: 0.1)
     /// 在门锁升级页面中 安装按钮 disable状态下 文本颜色
     static var buttonTextDisable: UIColor = UIColor(hex: "#BBBDC6")
     /// 在门锁升级页面中 安装按钮 disable状态下 背景颜色
     static var buttonDisableBg: UIColor = UIColor(hex: "#1F2642", alpha: 0.04)
     /// 在门锁升级页面中 安装按钮 disable状态下 边框颜色
     static var buttonDisableBorder: UIColor = UIColor(hex: "#1F2642", alpha: 0.06)
     /// 在拍摄身份证页面中的 提示语背景色
     static var darkBlueView: UIColor = UIColor(hex: "#1F2642")
     /// 在拍摄身份证页面中的 顶部和底部 视图的背景色
     static var idTopAndBottomBg: UIColor = UIColor(hex: "#131415")
     /// 灰色 小字体
     static var smallText: UIColor = UIColor(hex: "#8F92A0")
     /// 分割线 颜色
     static var lineGray: UIColor = UIColor(hex: "#E8E9EC")
     /// 橙色字体
     static var orangeColor: UIColor = UIColor(hex: "#FF531A")
     /// 橙色背景
     static var orangeBg: UIColor = UIColor(hex: "#FF531A", alpha: 0.04)
     /// 灰色
     static var greyColor: UIColor = UIColor(hex: "#62677A")
     /// 红色
     static var redColor: UIColor = UIColor(hex: "#FF4A50")
     /// tableview 的背景色 浅灰
     static var tableBackColor: UIColor = UIColor(hex: "#F6F6F6")
     /// 门卡开锁记录log页面中 的灰色
     static var point: UIColor = UIColor(hex: "#D8D8D8")
     /// 门卡开锁记录log页面中 的 开锁失败时 的颜色
     static var pinkDot: UIColor = UIColor(hex: "#FF3434")
     /// 粉色按钮 bgColor
     static var pinkDotBg: UIColor = UIColor(hex: "#FF3434", alpha: 0.06)
}

extension UIColor {
     /// 16进制字符串转颜色
     /// - Parameter hex: 16进制字符串
     public convenience init(hex: String, alpha: CGFloat = 1.0) {
          
          var red:   CGFloat = 0.0
          var green: CGFloat = 0.0
          var blue:  CGFloat = 0.0
          var alpha: CGFloat = alpha
          var hex:   String = hex
          
          if hex.hasPrefix("#") {
               let index = hex.index(hex.startIndex, offsetBy: 1)
               hex = String(hex[index...])
          }
          
          let scanner = Scanner(string: hex)
          var hexValue: CUnsignedLongLong = 0
          if scanner.scanHexInt64(&hexValue) {
               switch (hex.count) {
               case 3:
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
               case 4:
                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    alpha = CGFloat(hexValue & 0x000F)             / 15.0
               case 6:
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
               case 8:
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
               default:
                    print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
               }
          } else {
               print("Scan hex error")
          }
          
          self.init(red:red, green:green, blue:blue, alpha:alpha)
     }
}

public extension Date {
    var timeStamp: Double {
         let timeInterval: TimeInterval = self.timeIntervalSince1970
         let timeStamp = Double(timeInterval)
         return timeStamp
    }
    
    var milliStamp: Double {
         let timeInterval: TimeInterval = self.timeIntervalSince1970
         let millisecond = CLongLong(round(timeInterval * 1000))
         return Double(integerLiteral: millisecond)
    }
}

//封装的日志输出功能
public func GMLog<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
#if DEBUG
    //获取文件名
    let fileName = (file as NSString).lastPathComponent
    //日志内容
    // 创建一个日期格式器
    let dformatter = DateFormatter()
    // 为日期格式器设置格式字符串
    dformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    dformatter.locale = NSLocale.system
    dformatter.calendar = Calendar(identifier: .gregorian)
    // 使用日期格式器格式化当前日期、时间
    let datestr = dformatter.string(from: Date())
    let consoleStr = "\(datestr) \(fileName)-(\(line)) \(function): \(message)"
    //打印日志内容
    print(consoleStr)
    //将内容同步写到文件中去（Caches文件夹下）// NSDocumentDirectory
    let cachePath = FileManager.default.urls(for: .documentDirectory,
                                             in: .userDomainMask)[0]
    let logURL = cachePath.appendingPathComponent("log.txt")
    
    appendText(fileURL: logURL, string: "\(datestr) \(consoleStr)")
#endif
}

//在文件末尾追加新内容
func appendText(fileURL: URL, string: String) {
    do {
        //如果文件不存在则新建一个
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            FileManager.default.createFile(atPath: fileURL.path, contents: nil)
        }
        
        let fileHandle = try FileHandle(forWritingTo: fileURL)
        let stringToWrite = "\n" + string
        
        //找到末尾位置并添加
        fileHandle.seekToEndOfFile()
        fileHandle.write(stringToWrite.data(using: String.Encoding.utf8)!)
        
    } catch let error as NSError {
        print("failed to append: \(error)")
    }
}

