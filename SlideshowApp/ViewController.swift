//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Masanori Sonoda on 2018/11/22.
//  Copyright © 2018 masanori.sonoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    // バンドルした画像ファイルを読み込み
    let image = UIImage(named: "01")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

