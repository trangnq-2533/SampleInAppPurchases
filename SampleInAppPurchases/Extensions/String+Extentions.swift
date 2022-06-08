//
//  String+Extentions.swift
//  SampleInAppPurchases
//
//  Created by Nguyen Quynh Trang B on 08/06/2022.
//

import UIKit

extension String{
  func localized() -> String {
      return NSLocalizedString(self, comment: self)
  }
}
