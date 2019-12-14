//
//  kekkaGacha.swift
//  UNDAMESI
//
//  Created by Edasan0308 on 2018/05/25.
//  Copyright © 2018年 AIT. All rights reserved.
//

import UIKit

class kekkaGacha: UIViewController {
    
    var U_group = 0
    var U_number = 0
    
    @IBOutlet weak var A_Group_Label: UILabel!
    @IBOutlet weak var A_Number_Label: UILabel!
    @IBOutlet weak var U_Group_Label: UILabel!
    @IBOutlet weak var U_Number_Label: UILabel!
    @IBOutlet weak var Kekka_Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let A_group = String(arc4random_uniform(10))  //組
        let A_number = String(arc4random_uniform(1000)) //番号
        
        A_Group_Label.text = A_group
        A_Number_Label.text = A_number
        
        U_Group_Label.text = String(U_group)
        U_Number_Label.text = String(U_number)
        
        var A_group_index: String.Index
        var A_number_index: String.Index
        var U_group_index: String.Index
        var U_number_index: String.Index
        
        var groupHit = 0
        var numberHit = 0
        
        var roop: Int
        
        A_group_index = A_group.startIndex
        A_number_index = A_number.startIndex
        U_group_index = String(U_group).startIndex
        U_number_index = String(U_number).startIndex
        //初期Indexの設定
        
        if(String(U_number).count > A_number.count) {
            roop = A_number.count
        }
        else {
            roop = String(U_number).count
        }
        //ループ回数の設定
        
        
        for _ in 0..<roop {
            
            if(A_number[A_number_index] == String(U_number)[U_number_index]) {
                numberHit = numberHit + 1
            }
            //numberの照合
            
            A_number_index = A_number.index(after:A_number_index)
            U_number_index = String(U_number).index(after:U_number_index)
            // indexの移動
            
        }
        
        if(String(U_group).count > A_group.count) {
            roop = A_group.count
        }
        else {
            roop = String(U_group).count
        }
        //ループ回数の設定
        
        
        for _ in 0..<roop {
            
            if(A_group[A_group_index] == String(U_group)[U_group_index]) {
                groupHit = groupHit + 1
            }
            //groupの照合
            
            A_group_index = A_group.index(after:A_group_index)
            U_group_index = String(U_group).index(after:U_group_index)
            // indexの移動
        }
        
        Kekka_Label.text = getResult(A_group_count: A_group.count,A_number_count: A_number.count,groupHit: groupHit,numberHit: numberHit)
    }
    
    func getResult(A_group_count: Int, A_number_count: Int, groupHit: Int, numberHit: Int) -> String {
        if(groupHit == A_group_count && numberHit == A_number_count) {
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
        
        if(groupHit == A_group_count-1 && numberHit == A_number_count) {
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
        
        if(numberHit == A_number_count ) {
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
        
        if(numberHit == A_number_count-1 ) {
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
        
        if(numberHit == A_number_count-2) {
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
