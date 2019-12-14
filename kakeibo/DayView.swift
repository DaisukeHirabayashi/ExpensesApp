//
//  ViewController.swift
//  value_count
//
//  Created by k17113kk on 2018/04/30.
//  Copyright © 2018年 AIT. All rights reserved.
//

import UIKit

class DayViewController: UIViewController {
    
    @IBOutlet var dates: [UILabel]=[]
    @IBOutlet var daysdate: [UILabel]=[]
    @IBOutlet weak var monthlabel: UILabel!
    override func viewDidLoad() {
        
        //MARK:背景
        let fa = UIImageView(frame: CGRect(x: -20, y: 130, width: self.view.frame.size.width+50, height: self.view.frame.size.height-200))
        fa.image = UIImage(named: "family.jpeg")
        fa.layer.zPosition = -1
        self.view.addSubview(fa)
        fa.alpha=0.3
        
        
        let obj =  UIApplication.shared.delegate as! AppDelegate
        monthlabel.text="\(obj.monthstore)月"
        var count=0
        for i in 0...30{
            dates[i].text="0円"
            daysdate[i].text="\(i+1)日"
            if(obj.monthstore==2&&count==27){
                count+=1;
                break;
            }
            else if(obj.monthstore==4||obj.monthstore==6||obj.monthstore==9||obj.monthstore==11){
                if(count==29){
                    count+=1;
                    break;
                }
            }
            count+=1;
        }
        if(count<31){
            for i in count...30{
                dates[i].text=""
                daysdate[i].text=""
            }
        }
        for i in 0...obj.share_data.count-1{
            if(obj.share_data[i].year==obj.yearstore){
                if(obj.share_data[i].month==obj.monthstore){
                    print(obj.share_data[i].value!)
                    dates[(obj.share_data[i].day)!-1].text="\(obj.share_data[i].value!)円"
                    if(obj.share_data[i].value!>0){
                        dates[(obj.share_data[i].day)!-1].textColor=UIColor.cyan
                            print(obj.share_data[i].value!)
                    }
                    else{
                        dates[(obj.share_data[i].day)!-1].textColor=UIColor.red
                    }
                }
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

