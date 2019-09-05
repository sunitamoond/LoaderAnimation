//
//  ViewController.swift
//  LoaderAnimation
//
//  Created by sunitamnit@gmail.com on 09/05/2019.
//  Copyright (c) 2019 sunitamnit@gmail.com. All rights reserved.
//

import UIKit
import LoaderAnimation

class ViewController: UIViewController {

    @IBOutlet var circularProgressBar: LoaderAnimation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let a = circularProgressBar
//         self.circularProgressBar.addSubview(a)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.5) {
            self.circularProgressBar.createSublayers();
           self.circularProgressBar.createAnimation()
           
        }
    }

}

