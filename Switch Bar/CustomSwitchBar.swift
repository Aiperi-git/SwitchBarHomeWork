//
//  CustomSwitchBar.swift
//  Switch Bar
//
//  Created by Aiperi Kiyazova on 18/4/21.
//
import UIKit
import SnapKit

protocol CustomSwitchBarDelegate {
    func changeValue(value: Bool)
}

class CustomSwitchBar: UIView {
    
    private lazy var leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private lazy var middleView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var riathView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private var value = Bool()
    private var a = 0
    
    public var delegate: CustomSwitchBarDelegate? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .black

        setupUI()

        setValue(value: value)

        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetViewDidTapped))

        gesture.numberOfTapsRequired = 1
        isUserInteractionEnabled = true
        addGestureRecognizer(gesture)
    }
    
    @objc func targetViewDidTapped(view: UIView) {
        setValue(value: value)
    }
    
    public func setValue(value: Bool) {
        self.value = value
        
        if (a == 0) {
            leftView.isHidden = false
            riathView.isHidden = true
            middleView.isHidden = true
        } else if (a == 1) {
            leftView.isHidden = true
            middleView.isHidden = false
            riathView.isHidden = true
        } else {
            leftView.isHidden = true
            middleView.isHidden = true
            riathView.isHidden = false
        }
        a = a + 1
        
        if (a >  2) {
            a = 0
        }
        
        delegate?.changeValue(value: value)
    }
    
    private func setupUI() {
        
        addSubview(leftView)
        leftView.snp.makeConstraints { (make) in
            leftView.layer.cornerRadius = 20
            make.bottom.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(150)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(40)
        }
        addSubview(middleView)
        middleView.snp.makeConstraints { (make) in
            middleView.layer.cornerRadius = 20
            make.bottom.equalToSuperview().offset(-80)
            make.top.equalToSuperview().offset(80)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(40)
        }
        
        addSubview(riathView)
        riathView.snp.makeConstraints { (make) in
            riathView.layer.cornerRadius = 20
            make.bottom.equalToSuperview().offset(-150)
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.width.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
