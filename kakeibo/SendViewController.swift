//
//  ViewController.swift
//  value_count
//
//  Created by k17113kk on 2018/04/30.
//  Copyright © 2018年 AIT. All rights reserved.
//

import UIKit

class SendViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var TableView: UITableView!
    var monthdate=[String]()
    var mostdate=[Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let receiv=UIApplication.shared.delegate as! AppDelegate
        receiv.tmpmonth()
        var str : String
        for i in 0...11{
            let mo : Int = receiv.monthss[i]
            mostdate.append(mo)
            str = String(mo)+"月"
            monthdate.append(str)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monthdate.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "SecoundCell", for: indexPath)
        cell.textLabel!.text = monthdate[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let receive=UIApplication.shared.delegate as! AppDelegate
        print(monthdate[indexPath.row])
        receive.monthstore=mostdate[indexPath.row]
        self.performSegue(withIdentifier: "ToDay", sender: nil)
    }



}

