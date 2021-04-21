//
//  ViewController.swift
//  Switch Bar
//
//  Created by Aiperi Kiyazova on 18/4/21.
//

import UIKit

class ViewController: UIViewController, CustomSwitchBarDelegate {

    func changeValue(value: Bool) {
        print(value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let switchBar = CustomSwitchBar()
        switchBar.delegate = self
        
        view.addSubview(switchBar)
        switchBar.snp.makeConstraints { (make) in
            switchBar.layer.cornerRadius = 25
            make.center.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(60)
        }
    }
}

