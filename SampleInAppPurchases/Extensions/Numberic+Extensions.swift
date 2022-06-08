//
//  Numberic+Extensions.swift
//  SampleInAppPurchases
//
//  Created by Nguyen Quynh Trang B on 08/06/2022.
//
import Foundation
extension Numeric {
    func toCurrencyFormat(locale: Locale = Locale(identifier: "ja_JP")) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .currency
        guard let number = self as? NSNumber else {
            return nil
        }
        let currency = formatter.string(from: number) ?? ""
        return currency
    }
}
