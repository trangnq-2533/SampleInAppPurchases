//
//  UIView+Extensions.swift
//  SampleInAppPurchases
//
//  Created by Nguyen Quynh Trang B on 08/06/2022.
//
import UIKit

extension UIView{
  @IBInspectable var cornerRadius: CGFloat {
      get {
          return layer.cornerRadius
      }
      set {
          layer.cornerRadius = newValue
          layer.masksToBounds = newValue > 0
      }
  }
    
    class var identifier: String {
        return String(describing: self)
    }
}

extension UILabel {
    override open func awakeFromNib() {
        super.awakeFromNib()
        text = text?.localized()
    }
}

extension UIButton {
    override open func awakeFromNib() {
        super.awakeFromNib()
        let title = self.title(for: .normal)?.localized()
        setTitle(title, for: .normal)
        setTitle(title, for: .selected)
    }
}
