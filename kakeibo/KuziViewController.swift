//
//  ViewController.swift
//  UNDAMESI
//
//  Created by Edasan0308 on 2018/05/08.
//  Copyright © 2018年 AIT. All rights reserved.
//

import UIKit

class KuziViewController: UIViewController{
    @IBOutlet weak var myLabel: UILabel!
    @IBAction func returnKuzi(segue: UIStoryboardSegue){
        r.addvalue()
        myLabel.text="\(r.addva)"
    }
    var allMoney = 100000
    let r=UIApplication.shared.delegate as! AppDelegate
    @IBAction func tapButton(_ sender: Any) {
        let alert: UIAlertController = UIAlertController(title: "シングルガチャ", message: "500円消費します。ガチャを引きますか？", preferredStyle:  UIAlertControllerStyle.alert)
        
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            if(self.r.addva > 500) {
                let share=UIApplication.shared.delegate as! AppDelegate
                let df=DateFormatter()
                df.dateFormat = "yyyy"
                var year = Int( df.string(from: Date()) )!
                df.dateFormat = "MM"
                var month = Int( df.string(from: Date()) )!
                df.dateFormat = "dd"
                var day = Int( df.string(from: Date()) )!
                let date = money_data()
                date.input_data(year: year,month: month,day:day,value:-500)
                share.share_datas.append(date)
                share.tmp()
                share.addva=0
                self.performSegue(withIdentifier: "goGacha", sender: nil)
            }
                //goGachaStoryboardへ画面推移
                
            else {
                let alertController = UIAlertController(title: "宝くじを買うことができません", message: "所持金が不足しています", preferredStyle: .alert)
                
                let action1 = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                }
                
                alertController.addAction(action1)
                self.present(alertController, animated: true, completion: nil)
            }
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
        })
        
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func tapButton2(_ sender: Any) {
        
        
        let alert2: UIAlertController = UIAlertController(title: "10連ガチャ", message: "5000円消費します。ガチャを引きますか？", preferredStyle:  UIAlertControllerStyle.alert)
        
        let defaultAction2: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            if(self.r.addva > 5000) {
                let share=UIApplication.shared.delegate as! AppDelegate
                let df=DateFormatter()
                df.dateFormat = "yyyy"
                var year = Int( df.string(from: Date()) )!
                df.dateFormat = "MM"
                var month = Int( df.string(from: Date()) )!
                df.dateFormat = "dd"
                var day = Int( df.string(from: Date()) )!
                let date = money_data()
                date.input_data(year: year,month: month,day:day,value:-5000)
                share.share_datas.append(date)
                share.tmp()
                share.addva=0
                self.performSegue(withIdentifier: "go10Gacha", sender: nil)
            }
                //goGachaStoryboardへ画面推移
                
            else {
                let alertController = UIAlertController(title: "宝くじを買うことができません", message: "所持金が不足しています", preferredStyle: .alert)
                
                let action1 = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                }
                
                alertController.addAction(action1)
                self.present(alertController, animated: true, completion: nil)
            }
            
        })
        let cancelAction2: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
        })
        
        alert2.addAction(cancelAction2)
        alert2.addAction(defaultAction2)
        
        present(alert2, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:背景
        let ro = UIImageView(frame: CGRect(x: -200, y: -100, width: self.view.frame.size.width+400, height: self.view.frame.size.height+200))
        ro.image = UIImage(named: "road.png")
        ro.layer.zPosition = -1
        self.view.addSubview(ro)
        ro.alpha=0.8
        
        r.addvalue()
        myLabel.text="\(r.addva)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

