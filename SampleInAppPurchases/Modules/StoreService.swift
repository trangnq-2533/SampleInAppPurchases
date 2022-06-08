//
//  StoreService.swift
//  SampleInAppPurchases
//
//  Created by Nguyen Quynh Trang B on 08/06/2022.
//

import StoreKit

class StoreService: NSObject{
  static let instance = StoreService()

  private var productRequest: SKProductsRequest!

  var fetched = [SKProduct]()

  func fetchProducts() {
      productRequest = SKProductsRequest(productIdentifiers: Set(
        [
            "jp.shuta.app.staging.1000coins",
            "jp.shuta.app.staging.10000coins",
            "jp.shuta.app.staging.2000coins",
            "jp.shuta.app.staging.3000coins",
            "jp.shuta.app.staging.500coins",
            "jp.shuta.app.staging.5000coins"
        ]
      ))
      productRequest.delegate = self
      productRequest.start()
  }
}

extension StoreService: SKProductsRequestDelegate {
    func productsRequest(_: SKProductsRequest, didReceive response: SKProductsResponse) {
        fetched.removeAll()
        fetched.append(contentsOf: response.products)
        NotificationCenter.default.post(name: .fetchProductsDidComplete, object: nil)
    }
}
