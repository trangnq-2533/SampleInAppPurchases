//
//  HomeViewController.swift
//  SampleInAppPurchases
//
//  Created by Nguyen Quynh Trang B on 07/06/2022.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func buyCoinButtonTapped(_ sender: Any) {
        guard let pointPurchasesViewController = R.storyboard.pointPurchases.instantiateInitialViewController() else {
            return
        }
        self.navigationController?.pushViewController(pointPurchasesViewController, animated: true)
    }
    
    @IBAction private func changeSubscriptionPlanButtonTapped(_ sender: Any) {
    }
}
