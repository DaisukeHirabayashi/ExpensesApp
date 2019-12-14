//
//  kekka10Gacha.swift
//  UNDAMESI
//
//  Created by Edasan0308 on 2018/05/25.
//  Copyright © 2018年 AIT. All rights reserved.
//

import UIKit

class kekka10Gacha: UIViewController {

    @IBOutlet weak var A_Number_Label: UILabel!
    @IBOutlet weak var A_Group_Label: UILabel!
    
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
    @IBOutlet weak var kekka1: UILabel!
    @IBOutlet weak var kekka2: UILabel!
    @IBOutlet weak var kekka3: UILabel!
    @IBOutlet weak var kekka4: UILabel!
    @IBOutlet weak var kekka5: UILabel!
    @IBOutlet weak var kekka6: UILabel!
    @IBOutlet weak var kekka7: UILabel!
    @IBOutlet weak var kekka8: UILabel!
    @IBOutlet weak var kekka9: UILabel!
    @IBOutlet weak var kekka10: UILabel!
    
    var U_group = [Int]();
    var U_number = [Int]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let A_group = String(arc4random_uniform(100))
        let A_number = String(arc4random_uniform(1000))
        
        A_Group_Label.text = String(A_group)
        A_Number_Label.text = String(A_number)
        
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
        
        var A_group_index: String.Index
        var A_number_index: String.Index
        var U_group_index: String.Index
        var U_number_index: String.Index
        //数値照合するためのIndex変数の用意
        
        var groupHit: [Int] = [0,0,0,0,0,0,0,0,0,0]
        var numberHit: [Int] = [0,0,0,0,0,0,0,0,0,0]
        //hit数を管理するための配列の用意
        
        var roop = 0
        //ループ回数の変数
        
        for n in 0..<U_group.count {
            
            A_group_index = A_group.startIndex
            A_number_index = A_number.startIndex
            U_group_index = String(U_group[n]).startIndex
            U_number_index = String(U_number[n]).startIndex
            //初期Indexの設定
            
            if(String(U_number[n]).count > A_number.count) {
                roop = A_number.count
            }
            else {
                roop = String(U_number[n]).count
            }
            //ループ回数の設定
            
            
            for _ in 0..<roop {
                
                if(A_number[A_number_index] == String(U_number[n])[U_number_index]) {
                    numberHit[n] = numberHit[n] + 1
                }
                //numberの照合
                
                A_number_index = A_number.index(after:A_number_index)
                U_number_index = String(U_number[n]).index(after:U_number_index)
                // indexの移動
                
            }
            
            if(String(U_group[n]).count > A_group.count) {
                roop = A_group.count
            }
            else {
                roop = String(U_group[n]).count
            }
            //ループ回数の設定
            
            
            for _ in 0..<roop {
                
                if(A_group[A_group_index] == String(U_group[n])[U_group_index]) {
                    groupHit[n] = groupHit[n] + 1
                }
                //groupの照合
                
                A_group_index = A_group.index(after:A_group_index)
                U_group_index = String(U_group[n]).index(after:U_group_index)
                // indexの移動
            }
        }
        
        kekka1.text = getResult(A_group_count: A_group.count,A_number_count: A_number.count,groupHit: groupHit,numberHit: numberHit,number: 0)
        
        kekka2.text = getResult(A_group_count: A_group.count,A_number_count: A_number.count,groupHit: groupHit,numberHit: numberHit,number: 1)
        
        kekka3.text = getResult(A_group_count: A_group.count,A_number_count: A_number.count,groupHit: groupHit,numberHit: numberHit,number: 2)
        
        kekka4.text = getResult(A_group_count: A_group.count,A_number_count: A_number.count,groupHit: groupHit,numberHit: numberHit,number: 3)
        
        kekka5.text = getResult(A_group_count: A_group.count,A_number_count: A_number.count,groupHit: groupHit,numberHit: numberHit,number: 4)
        
        kekka6.text = getResult(A_group_count: A_group.count,A_number_count: A_number.count,groupHit: groupHit,numberHit: numberHit,number: 5)
        
        kekka7.text = getResult(A_group_count: A_group.count,A_number_count: A_number.count,groupHit: groupHit,numberHit: numberHit,number: 6)
        
        kekka8.text = getResult(A_group_count: A_group.count,A_number_count: A_number.count,groupHit: groupHit,numberHit: numberHit,number: 7)
        
        kekka9.text = getResult(A_group_count: A_group.count,A_number_count: A_number.count,groupHit: groupHit,numberHit: numberHit,number: 8)
        
        kekka10.text = getResult(A_group_count: A_group.count,A_number_count: A_number.count,groupHit: groupHit,numberHit: numberHit,number: 9)
    }
    
    func getResult(A_group_count: Int, A_number_count: Int, groupHit: [Int], numberHit: [Int], number: Int) -> String {
        if(groupHit[number] == A_group_count && numberHit[number] == A_number_count) {
            let share=UIApplication.shared.delegate as! AppDelegate
            let df=DateFormatter()
            df.dateFormat = "yyyy"
            var year = Int( df.string(from: Date()) )!
            df.dateFormat = "MM"
            var month = Int( df.string(from: Date()) )!
            df.dateFormat = "dd"
            var day = Int( df.string(from: Date()) )!
            let date = money_data()
            date.input_data(year: year,month: month,day:day,value:200000000)
            share.share_datas.append(date)
            share.tmp()
            return "1等"
        }
        
        if(groupHit[number] == A_group_count-1 && numberHit[number] == A_number_count) {
            let share=UIApplication.shared.delegate as! AppDelegate
            let df=DateFormatter()
            df.dateFormat = "yyyy"
            var year = Int( df.string(from: Date()) )!
            df.dateFormat = "MM"
            var month = Int( df.string(from: Date()) )!
            df.dateFormat = "dd"
            var day = Int( df.string(from: Date()) )!
            let date = money_data()
            date.input_data(year: year,month: month,day:day,value:10000000)
            share.share_datas.append(date)
            share.tmp()
            return "2等"
        }
        
        if(numberHit[number] == A_number_count ) {
            let share=UIApplication.shared.delegate as! AppDelegate
            let df=DateFormatter()
            df.dateFormat = "yyyy"
            var year = Int( df.string(from: Date()) )!
            df.dateFormat = "MM"
            var month = Int( df.string(from: Date()) )!
            df.dateFormat = "dd"
            var day = Int( df.string(from: Date()) )!
            let date = money_data()
            date.input_data(year: year,month: month,day:day,value:300000)
            share.share_datas.append(date)
            share.tmp()
            return "3等"
        }
        
        if(numberHit[number] == A_number_count-1 ) {
            let share=UIApplication.shared.delegate as! AppDelegate
            let df=DateFormatter()
            df.dateFormat = "yyyy"
            var year = Int( df.string(from: Date()) )!
            df.dateFormat = "MM"
            var month = Int( df.string(from: Date()) )!
            df.dateFormat = "dd"
            var day = Int( df.string(from: Date()) )!
            let date = money_data()
            date.input_data(year: year,month: month,day:day,value:5000)
            share.share_datas.append(date)
            share.tmp()
            return "4等"
        }
        
        if(numberHit[number] == A_number_count-2) {
            let share=UIApplication.shared.delegate as! AppDelegate
            let df=DateFormatter()
            df.dateFormat = "yyyy"
            var year = Int( df.string(from: Date()) )!
            df.dateFormat = "MM"
            var month = Int( df.string(from: Date()) )!
            df.dateFormat = "dd"
            var day = Int( df.string(from: Date()) )!
            let date = money_data()
            date.input_data(year: year,month: month,day:day,value:1000)
            share.share_datas.append(date)
            share.tmp()
            return "5等"
        }
        return "該当なし"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
