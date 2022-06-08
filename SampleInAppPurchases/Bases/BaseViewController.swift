//
//  BaseViewController.swift
//  SampleInAppPurchases
//
//  Created by Nguyen Quynh Trang B on 08/06/2022.
//

import UIKit

private struct Constant {
    static let notchDeviceNavigationBarHeight: CGFloat = 88.0
    static let normalDeviceNavigationBarHeight: CGFloat = 64.0
    static let topMostConstraintIdentifier = "topMostConstraint"
    static let bottomMostConstraintIdentifier = "bottomMostConstraint"
}

class BaseViewController : UIViewController{
    var needShowNavigationBar: Bool = true
    var customNavigationBar: CustomNavigationBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        if needShowNavigationBar {
            let navigationBar = CustomNavigationBar()
            navigationBar.needShowBackButton = navigationController?.viewControllers.first != self
            view.addSubview(navigationBar)
            view.bringSubviewToFront(navigationBar)
            let navigationBarHeight = Utils.isNotchDevice() ? Constant.notchDeviceNavigationBarHeight : Constant.normalDeviceNavigationBarHeight
            navigationBar.snp.makeConstraints {
                $0.top.left.right.equalToSuperview()
                $0.height.equalTo(navigationBarHeight)
            }
            customNavigationBar = navigationBar
            let statusBarHeight = UIApplication.keyWindow()?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0
            view.constraints.filter {
                $0.identifier == Constant.topMostConstraintIdentifier
            }.forEach {
                $0.constant += navigationBarHeight - statusBarHeight
            }
        }
    }
}
