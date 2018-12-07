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
    
    //Timerの宣言
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
        
        let buttonImage : UIImage? = UIImage(named: imageArray[imageNo])
        
        // ImageViewに画像を設定
        
        imageViewButton.setImage(buttonImage, for: .normal)
    }
    let imageArray = ["01.jpg" , "02.jpg" , "03.jpg"]
    

    @IBOutlet weak var imageViewButton: UIButton!
    let buttonImage :UIImage? = UIImage(named:"01.jpg")
    
    
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
    
    // 再生か停止の状態を示す
    @IBOutlet weak var statusLabel: UIButton!
    
    // 再生ボタンを押した時のアクション
    @IBAction func startSlide(_ sender: Any) {
        // timerの初期化
        if self.timer == nil {
        // 1秒ごとにtransition
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(transitionImage(_:)), userInfo: nil, repeats: true)
        statusLabel.setTitle("停止", for: .normal)
        // 戻る・進むボタンの無効化
        forwardButton.isEnabled = false
        backButton.isEnabled = false
            
        } else {
        self.timer.invalidate()   // 現在のタイマーを破棄する
        self.timer = nil          // startSlide() の timer == nil で判断するために、 timer = nil としておく
        statusLabel.setTitle("再生", for: .normal)
        // 戻る・進むボタンの有効化
        forwardButton.isEnabled = true
        backButton.isEnabled = true
        }
        
    }
    
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ImageViewに画像を設定
        imageViewButton.setImage(buttonImage, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController = segue.destination as! ResultViewController
        
        let buttonImage : UIImage? = UIImage(named: imageArray[imageNo])
        resultViewController.image = buttonImage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

