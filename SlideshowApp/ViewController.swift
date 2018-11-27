//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Masanori Sonoda on 2018/11/22.
//  Copyright © 2018 masanori.sonoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //画像の番号を初期化する
    var imageNo = 0
    
    
    var timer: Timer!
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        if imageNo > 2 {
            imageNo = 0
        }
        
        if imageNo < 0 {
            imageNo = 2
        }
        
        // 画像ファイルの読み込み
        let image = UIImage(named: imageArray[imageNo])
        
        // ImageViewに画像を設定
        imageView.image = image
    }
    let imageArray = ["01.jpg" , "02.jpg" , "03.jpg"]
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func prevImage(_ sender: Any) {

        imageNo -= 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()

    }
    
    @IBAction func nextImage(_ sender: Any) {

        imageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    
    @objc func transionImage (_ timer: Timer) {
        self.imageNo += 1
        
        displayImage()
    }
    
    @IBAction func startSlide(_ sender: Any) {
        if self.timer == nil {
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(transionImage(_:)), userInfo: nil, repeats: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 画像ファイルの読み込み
        let image = UIImage(named: "01.jpg")
        
        // ImageViewに画像を設定
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

