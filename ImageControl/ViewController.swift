//
//  ViewController.swift
//  ImageControl
//
//  Created by Masaki Horimoto on 2015/04/14.
//  Copyright (c) 2015年 Masaki Horimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageBeHereNow: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageBeHereNow.image = UIImage(named: "BeHereNow.jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

