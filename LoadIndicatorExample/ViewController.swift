//
//  ViewController.swift
//  LoadIndicatorExample
//
//  Created by Иван Морозов on 17.12.2019.
//  Copyright © 2019 Иван Морозов. All rights reserved.
//

import UIKit
import LoadingKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activity = LoadingIndicatorManager.show()
        let activity2 = LoadingIndicatorManager.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            activity.dispose()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            activity2.dispose()
        }
    }
}

