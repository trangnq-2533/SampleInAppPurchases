//
//  Utils.swift
//  SampleInAppPurchases
//
//  Created by Nguyen Quynh Trang B on 08/06/2022.
//
import UIKit
class Utils {
    class func isNotchDevice() -> Bool {
        let safeAreaInsetsBottom = UIApplication.keyWindow()?.safeAreaInsets.bottom ?? 0.0
        return safeAreaInsetsBottom > 0.0
    }
}
