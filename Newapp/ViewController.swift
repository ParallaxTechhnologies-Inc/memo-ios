//
//  ViewController.swift
//  Newapp
//
//  Created by 春名卓哉 on 2019/08/16.
//  Copyright © 2019 Animation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //コメントアウトは先頭スラッシュ
        //self.view.backgroundColor = UIColor.yellow
        
        //インスタンス化(UI作成)
        let label = UILabel()
        let button = UIButton()
        let imageView = UIImageView()
        
        //インスタンス化したUIの位置設定
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        label.frame = CGRect(x: 0, y: (screenHeight/2)-25, width: screenWidth, height: 50)
        button.frame = CGRect(x: (screenWidth/2)-50, y: label.frame.maxY+32, width: 100, height: 50)
        imageView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        
        //インスタンス化したUIの内容設定
        label.text = "アプリ"
        label.font = UIFont.systemFont(ofSize: 72)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = UIColor.white
        
        
        
        button.setTitle("メモ", for: .normal)
        button.layer.cornerRadius = 10.0
        button.backgroundColor = UIColor.green
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(pushButton(sender:)), for: .touchUpInside)
        imageView.image = UIImage(named: "background")
        
        //ViewControllerが保持するViewにインスタンス化したUIを追加する
        self.view.addSubview(label)
        self.view.addSubview(button)
        self.view.addSubview(imageView)
        
        
        self.view.sendSubviewToBack(imageView)
        
        

    }
    
    @objc func pushButton(sender: UIButton){
        
        //デバックの意味
        print("ボタンが押されました")
        
        
        
        
        //画面遷移
        let nextvc = SecondViewController()
        let navVC = UINavigationController(rootViewController: nextvc)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    
    
    
 

}

