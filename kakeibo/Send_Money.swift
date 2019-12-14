//
//  Send_Money.swift
//  value_count
//
//  Created by k17113kk on 2018/04/30.
//  Copyright © 2018年 AIT. All rights reserved.
//

//NSというのはオブジェクトcのものだった！　swiftではつけないものが多数。

import UIKit

class Send_Money: UIViewController, UITextFieldDelegate {
    @IBAction func returnTop(segue: UIStoryboardSegue){
    }
    var money = 0
    var year:Int = 0
    var month:Int = 0
    var day:Int = 0
    let df = DateFormatter()
    let obj = UIApplication.shared.delegate as! AppDelegate
    
    //金額ラベル
    @IBOutlet weak var kingaku_label: UILabel!
    
    //テキストフィールド
    @IBOutlet weak var YearField: UITextField!
    @IBOutlet weak var MonthField: UITextField!
    @IBOutlet weak var DayField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:背景
//        let ka = UIImageView(frame: CGRect(x: -20, y: -30, width: self.view.frame.size.width+150, height: self.view.frame.size.height+50))
//        ka.image = UIImage(named: "kawara.jpeg")
//        ka.layer.zPosition = -1
//        self.view.addSubview(ka)
        let ky = UIImageView(frame: CGRect(x: -100, y: 0, width: self.view.frame.size.width+600, height: self.view.frame.size.height))
        ky.image = UIImage(named: "kyanpu.jpeg")
        ky.layer.zPosition = -1
        self.view.addSubview(ky)
        ky.alpha=0.8
        
        YearField.delegate = self
        YearField.textAlignment = NSTextAlignment.center//入力テキストがセンターに
        YearField.font = UIFont.systemFont(ofSize: 20)//入力テキスト大きさ設定
        self.YearField.keyboardType = UIKeyboardType.numberPad
        
        MonthField.textAlignment = NSTextAlignment.center
        MonthField.font = UIFont.systemFont(ofSize: 20)
        self.MonthField.keyboardType = UIKeyboardType.numberPad
        
        DayField.textAlignment = NSTextAlignment.center
        DayField.font = UIFont.systemFont(ofSize: 20)
        self.DayField.keyboardType = UIKeyboardType.numberPad

        
        df.dateFormat = "yyyy"
        year = Int( df.string(from: Date()) )!
        df.dateFormat = "MM"
        month = Int( df.string(from: Date()) )!
        df.dateFormat = "dd"
        day = Int( df.string(from: Date()) )!
        YearField.text = String(year)
         MonthField.text = String(month)
         DayField.text = String(day)
    }
    
//ボタン群
    @IBAction func plas_one(_ sender: Any) {
        money = money + 1
        kingaku_label.text = "¥" + String(money)
    }

    @IBAction func plas_five(_ sender: Any) {
        money = money + 5
        kingaku_label.text = "¥" + String(money)
    }
    
    @IBAction func plas_ten(_ sender: Any) {
        money = money + 10
        kingaku_label.text = "¥" + String(money)
    }
    
    @IBAction func plas_fifty(_ sender: Any) {
        money = money + 50
        kingaku_label.text = "¥" + String(money)
    }
    
    @IBAction func plas_one_hundred(_ sender: Any) {
        money = money + 100
        kingaku_label.text = "¥" + String(money)
    }
    
    @IBAction func plas_five_hundred(_ sender: Any) {
        money = money + 500
        kingaku_label.text = "¥" + String(money)
    }
    
    @IBAction func plas_hideo(_ sender: Any) {
        money = money + 1000
        kingaku_label.text = "¥" + String(money)
    }
    
    @IBAction func plas_akiko(_ sender: Any) {
        money = money + 5000
        kingaku_label.text = "¥" + String(money)
    }
    
    @IBAction func plas_yukiti(_ sender: Any) {
        money = money + 10000
        kingaku_label.text = "¥" + String(money)
    }
    
    @IBAction func send_plas_botton(_ sender: Any) {
        //共有用変数を扱えるようにする手順。
        let data = money_data()
        data.input_data(year: year, month:month, day: day, value: money)//dataの入力
//        let obj = UIApplication.shared.delegate as! AppDelegate
        obj.share_datas.append(data)//配列にはappendを利用してデータを入れることになる。
        obj.tmp()
        money = 0
        kingaku_label.text = "¥" + String(money)
        obj.send_counter = obj.send_counter + 1
    }
    
    @IBAction func send_minus_botton(_ sender: Any) {
        let data = money_data()
        data.input_data(year: year, month:month, day: day, value: -money)
        obj.share_datas.append(data)
        obj.tmp()
        money = 0
        kingaku_label.text = "¥" + String(money)
        obj.send_counter = obj.send_counter + 1
    }
    @IBAction func edibutton(_ sender: Any) {
        year = Int(YearField.text!)!
        month = Int(MonthField.text!)!
        day = Int(DayField.text!)!
        YearField.resignFirstResponder()
        MonthField.resignFirstResponder()
        DayField.resignFirstResponder()
        YearField.endEditing(true)
        MonthField.endEditing(true)
        DayField.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        year = Int(YearField.text!)!
        month = Int(MonthField.text!)!
        day = Int(DayField.text!)!
        YearField.resignFirstResponder()
        MonthField.resignFirstResponder()
        DayField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
