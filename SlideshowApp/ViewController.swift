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
    
    @IBAction func prevImage(_ sender: Any) {
    }
    
    @IBAction func nextImage(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 画像ファイルの読み込み
        let image = UIImage(named: "01.jpg")
        
        // Image Viewに画像を設定
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

