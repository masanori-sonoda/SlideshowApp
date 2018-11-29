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
    
    
    @objc func transitionImage (_ timer: Timer) {
        // 画像番号を１ずつ増やす
        self.imageNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
        
    }
    
    @IBOutlet weak var statusLabel: UIButton! 

    @IBAction func startSlide(_ sender: Any) {
        // timerの初期化
        if self.timer == nil {
        // 1秒ごとにtransition
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(transitionImage(_:)), userInfo: nil, repeats: true)
        statusLabel.setTitle("停止", for: .normal)
        
        forwardButton.isEnabled = false
        backButton.isEnabled = false
            
        } else {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startSlide() の timer == nil で判断するために、 timer = nil としておく
            statusLabel.setTitle("再生", for: .normal)
            
            forwardButton.isEnabled = true
            backButton.isEnabled = true
        }
        
    }
    
    
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    // 画像をタップしたら画面が遷移
    @IBAction func tapView(_ sender: Any) {
        
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

