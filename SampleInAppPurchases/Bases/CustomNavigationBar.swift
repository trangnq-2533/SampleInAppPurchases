//
//  CustomNavigationBar.swift
//  SampleInAppPurchases
//
//  Created by Nguyen Quynh Trang B on 08/06/2022.
//

import UIKit
import Then
import SnapKit

class CustomNavigationBar: UIView {
    var backButtonCustomHandler: (() -> Void)?

    private lazy var backButtonImageView = UIImageView().then {
        $0.contentMode = .center
        $0.backgroundColor = .clear
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backButtonTapped)))
    }

    private lazy var titleLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
    }

    var needShowBackButton = true {
        didSet {
            reloadView()
        }
    }

    var titleString: String = "" {
        didSet {
            reloadView()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        backgroundColor = .black
        addSubview(backButtonImageView)
        backButtonImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8.0)
            $0.width.equalTo(44.0)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(44.0)
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(backButtonImageView.snp.centerY)
        }
    }

    private func reloadView() {
        titleLabel.text = titleString.localized()
        backButtonImageView.image = needShowBackButton ? R.image.ic_back() : nil
        titleLabel.isHidden = titleString.isEmpty
    }

    @objc private func backButtonTapped() {
        guard needShowBackButton else {
            return
        }
        if let backButtonCustomHandler = backButtonCustomHandler {
            backButtonCustomHandler()
            return
        }
        let currentViewController = UIApplication.topViewController()
        currentViewController?.navigationController?.popViewController(animated: true)
        if currentViewController?.presentingViewController == nil {
            currentViewController?.navigationController?.dismiss(animated: true, completion: nil)
        }
        currentViewController?.dismiss(animated: true, completion: nil)
    }
}
