//
//  PointPurchasesViewController.swift
//  SampleInAppPurchases
//
//  Created by Nguyen Quynh Trang B on 08/06/2022.
//

import UIKit
import Then
import StoreKit

class PointPurchasesViewController: BaseViewController {

    @IBOutlet private var tableView: UITableView!
    private var products: [SKProduct] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        customNavigationBar?.titleString = R.string.localizable.homeBuyCoin()
        tableView.do{
            $0.dataSource = self
            $0.registerWithNib(PointCell.self)
        }
        updateUI()
        NotificationCenter.default.addObserver(self, selector: #selector(fetchProductsDidComplete), name: .fetchProductsDidComplete, object: nil)
    }
    
    private func updateUI() {
        products = StoreService.instance.fetched.sorted(by: {
            $0.price.floatValue > $1.price.floatValue
        })
        tableView.reloadData()
    }
    
    @objc private func fetchProductsDidComplete(){
        DispatchQueue.main.async {
            self.updateUI()
        }
    }
}

extension PointPurchasesViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PointCell = tableView.dequeueReusableCell(for: indexPath)
        let product = products[indexPath.row]
        cell.updateUI(product)
        return cell
    }
}
