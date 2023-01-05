//
//  YBLocationAction.swift
//  youonBikePlanA
//
//  Created by gmj on 2021/12/24.
//  Copyright © 2021 audi. All rights reserved.
//

public enum GMMapSelect {
     case baiduMAP, gaodeMAP, appleMAP, qqMAP

     /// 地图app对应的url
     var URI: String {
          switch self {
          case .baiduMAP: return "baidumap://"
          case .gaodeMAP: return "iosamap://"
          case .appleMAP: return "http://maps.apple.com/"
          case .qqMAP:    return "qqmap://"
          }
     }

     /// 软件名称
     var Name: String {
          switch self {
          case .baiduMAP: return "百度地图"
          case .gaodeMAP: return "高德地图"
          case .appleMAP: return "苹果地图"
          case .qqMAP:    return "腾讯地图"
          }
     }

     /// 本地是否安装地图软件
     var canOpen: Bool {
          guard let url = URL(string: URI), UIApplication.shared.canOpenURL(url) else {
               return false
          }
          return true
     }

     /// 已经安装到手机的 地图app
     static var openMaps: [GMMapSelect] {
          let allMaps: [GMMapSelect] = [.baiduMAP, .gaodeMAP, .appleMAP, .qqMAP]
          var canOpenMaps = [GMMapSelect]()
          canOpenMaps = allMaps.filter { $0.canOpen == true }
          return canOpenMaps
     }

     /// 组装跳转的url
     func AssembleUrl(_ targetLatitude: Double, _ targetLongitute: Double, _ toName: String) -> String? {
          var urlString = ""
          switch self {
          case .baiduMAP:
               urlString = "\(self.URI)map/marker?location=\(targetLatitude),\(targetLongitute)&title=\(toName)&content=\(toName)&src=ios.baidu.youonBike"
          case .gaodeMAP:
               urlString = "\(self.URI)viewMap?sourceApplication=applicationName&poiname=\(toName)&lat=\(targetLatitude)&lon=\(targetLongitute)&dev=0"
          case .appleMAP:
               break
          case .qqMAP:
               urlString = "\(self.URI)map/marker?marker=coord:\(targetLatitude),\(targetLongitute);title:\(toName);addr:\(toName)&referer=youonBike"
          }
          return urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
     }
}


