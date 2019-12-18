//
//  LoaderExamples.swift
//  LoadIndicatorExample
//
//  Created by Иван Морозов on 17.12.2019.
//  Copyright © 2019 Иван Морозов. All rights reserved.
//

import UIKit
import LoadingKit

extension UIActivityIndicatorView: Loader {
    public func start() {
        self.startAnimating()
    }
    
    public func stop() {
        self.stopAnimating()
    }
}


public final class AwesomeLoader: UIView, Loader {
    private let containerView = UIView().apply {
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 10)
        $0.layer.shadowRadius = 10
        $0.layer.shadowOpacity = 0.3
    }
    
    private let corneredView = UIView().apply {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
        $0.clipsToBounds = true
    }
    
    private let label = UILabel().apply {
        $0.text = "( )"
        $0.textAlignment = .center
        $0.font = UIFont.monospacedSystemFont(ofSize: 20, weight: .regular)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.makeConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(containerView)
        self.containerView.addSubview(self.corneredView)
        self.corneredView.addSubview(self.label)
    }
    
    private func makeConstrains() {
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.corneredView.translatesAutoresizingMaskIntoConstraints = false
        self.label.translatesAutoresizingMaskIntoConstraints = false
        
        self.containerView.apply {
            $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
            $0.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        }
        
        self.corneredView.apply {
            $0.connect(to: self.containerView)
        }
        
        self.label.apply {
            $0.connect(to: self.corneredView)
        }
    }
    
    public func start() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = 1
        rotateAnimation.repeatCount = Float.infinity
        self.label.layer.add(rotateAnimation, forKey: nil)
    }
    
    public func stop() {}
}


extension NSObjectProtocol {
    @discardableResult
    func apply(_ action: (Self) -> Void) -> Self {
        action(self)
        return self
    }
}

extension UIView {
    func connect(to view: UIView) {
        self.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
