//
//  ViewController.swift
//  value_count
//
//  Created by k17113kk on 2018/04/30.
//  Copyright © 2018年 AIT. All rights reserved.
//

import UIKit

class DaysView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var sended_money_label: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        let obj =  UIApplication.shared.delegate as! AppDelegate
        
        
        if obj.share_data.count > 0{
            print(obj.share_data.count)
            sended_money_label.text = (String)(describing: obj.share_data[obj.share_data.count-1].value!)
            date.text = (String)(describing: obj.share_data[obj.share_data.count-1].year!) + "/" + (String)(describing: obj.share_data[obj.share_data.count-1].month!) + "/" + (String)(describing: obj.share_data[obj.share_data.count-1].day!)
            
            //データが送られているかをチェック
            for i in 0..<obj.share_data.count {
                print( (String)(i) + (String)(describing: obj.share_data[i].year!) + "/" + (String)(describing: obj.share_data[i].month! ) + "/" + (String)(describing: obj.share_data[i].day! ) + "/" + (String)(describing: obj.share_data[i].value! ) )
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

