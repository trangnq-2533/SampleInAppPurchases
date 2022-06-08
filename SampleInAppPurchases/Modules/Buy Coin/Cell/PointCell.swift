//
//  PointCell.swift
//  SampleInAppPurchases
//
//  Created by Nguyen Quynh Trang B on 08/06/2022.
//

import UIKit
import StoreKit

class PointCell: UITableViewCell {

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!
    
    func updateUI(_ product: SKProduct) {
        titleLabel.text = product.localizedTitle
        priceLabel.text = product.price.floatValue.toCurrencyFormat(locale: product.priceLocale)
    }
}
