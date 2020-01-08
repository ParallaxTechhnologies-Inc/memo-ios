//
//  SecondViewController.swift
//  Newapp
//
//  Created by 春名卓哉 on 2019/08/16.
//  Copyright © 2019 Animation. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController {
    
    let textView = UITextView()
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.view.backgroundColor = UIColor.white
        
        //ナビゲーションコントローラー作成
    
        self.navigationItem.title = "メモ覧"
        let backButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onClickBackButton(_:)))
        self.navigationItem.leftBarButtonItem = backButton
        
        //メモUserDefaultから取得して表示
        let memo: String = userDefaults.object(forKey: "memo") as? String ?? ""
        textView.text = memo
        
        //UI作成
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        textView.frame = CGRect(x: 0, y: 50, width: screenWidth, height: screenHeight/2.5)
    
        
        let button = UIButton()
        button.frame = CGRect(x: 16, y: textView.frame.maxY, width: screenWidth-32, height: 50)
        button.setTitle("登録", for: .normal)
        button.backgroundColor = UIColor.red
        button.setTitleColor(UIColor.white, for: .normal)
        
        
        //UI追加
        self.view.addSubview(textView)
        self.view.addSubview(button)
        
        
        //ボタンクリックリスナー
        button.addTarget(self, action: #selector(registerButton(sender:)), for: .touchUpInside)
    }
    

    
    @objc func onClickBackButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func registerButton(sender: UIButton){
        // キーボードを閉じる処理
        self.view.endEditing(true)
        
        //入力を保存
        userDefaults.set(textView.text, forKey: "memo")
                   userDefaults.synchronize()
        
        //Viewを閉じる
        self.dismiss(animated: true, completion: nil)
        
    }
}
