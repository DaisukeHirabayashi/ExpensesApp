//
//  DayViewController.swift
//  kakeibo
//
//  Created by 大典 on 2018/05/10.
//  Copyright © 2018年 myname. All rights reserved.
//

import UIKit

class MonthViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var data=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let recei=UIApplication.shared.delegate as! AppDelegate
        recei.tmpmonth()
        var str : String
        for i in recei.monthss{
            let mo : Int = recei.monthss[i]
            str = String(mo)+"月"
            data.append(str)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath)
        cell.textLabel!.text = data[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(date[indexPath.row])
        let receive=UIApplication.shared.delegate as! AppDelegate
        receive.yearstore=stdate[indexPath.row]
        self.performSegue(withIdentifier: "Tosecond", sender: nil)
    }

}
