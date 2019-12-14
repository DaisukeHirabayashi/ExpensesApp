//
//  Gacha10_ViewController.swift
//  UNDAMESI
//
//  Created by Edasan0308 on 2018/05/21.
//  Copyright © 2018年 AIT. All rights reserved.
//

import UIKit

class Gacha10_ViewController: UIViewController {
    
    var U_group = [Int]();
    var U_number = [Int]();
    
    @IBOutlet weak var group1: UILabel!
    @IBOutlet weak var group2: UILabel!
    @IBOutlet weak var group3: UILabel!
    @IBOutlet weak var group4: UILabel!
    @IBOutlet weak var group5: UILabel!
    @IBOutlet weak var group6: UILabel!
    @IBOutlet weak var group7: UILabel!
    @IBOutlet weak var group8: UILabel!
    @IBOutlet weak var group9: UILabel!
    @IBOutlet weak var group10: UILabel!
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var number3: UILabel!
    @IBOutlet weak var number4: UILabel!
    @IBOutlet weak var number5: UILabel!
    @IBOutlet weak var number6: UILabel!
    @IBOutlet weak var number7: UILabel!
    @IBOutlet weak var number8: UILabel!
    @IBOutlet weak var number9: UILabel!
    @IBOutlet weak var number10: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: 背景
        let no = UIImageView(frame: CGRect(x: -200, y: 0, width: self.view.frame.size.width+700, height: self.view.frame.size.height))
        no.image = UIImage(named: "nouka.jpeg")
        no.layer.zPosition = -1
        self.view.addSubview(no)
        no.alpha=0.5

        var used_group = [Int]();
        var used_number = [Int]();
        
        var R_group = 0
        var R_number = 0
        
        var flag = false
        
        for _ in 0..<10 {
            while(flag == false)
            {
                R_group = Int(arc4random_uniform(100))
                R_number = Int(arc4random_uniform(1000))
                
                if(used_number.count != 0)
                {
                    for i in 0..<used_number.count {
                        if(R_group == used_group[i] && R_number == used_number[i]){
                            flag = false
                        }
                        else {
                            flag = true
                        }
                    }
                }
                else {
                    flag = true
                    //つかわれた番号がないときはtrueにしてループを抜ける
                }
            }
            U_group.append(R_group)
            U_number.append(R_number)
            used_group.append(R_group)
            used_number.append(R_number)
            
            flag = false
        }
        
        group1.text = String(U_group[0])
        group2.text = String(U_group[1])
        group3.text = String(U_group[2])
        group4.text = String(U_group[3])
        group5.text = String(U_group[4])
        group6.text = String(U_group[5])
        group7.text = String(U_group[6])
        group8.text = String(U_group[7])
        group9.text = String(U_group[8])
        group10.text = String(U_group[9])
        
        number1.text = String(U_number[0])
        number2.text = String(U_number[1])
        number3.text = String(U_number[2])
        number4.text = String(U_number[3])
        number5.text = String(U_number[4])
        number6.text = String(U_number[5])
        number7.text = String(U_number[6])
        number8.text = String(U_number[7])
        number9.text = String(U_number[8])
        number10.text = String(U_number[9])
    }
    
    @IBAction func push_button(_ sender: Any) {
        let alert: UIAlertController = UIAlertController(title: "結果画面へ移行します", message: "よろしいですか？", preferredStyle:  UIAlertControllerStyle.alert)
        
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            self.performSegue(withIdentifier: "kekka10Gacha", sender: nil)
            //goGachaStoryboardへ画面推移
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
        })
        
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        present(alert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let kekka10Gacha = segue.destination as! kekka10Gacha
        kekka10Gacha.U_group = U_group
        kekka10Gacha.U_number = U_number
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
