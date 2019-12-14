//
//  ViewController.swift
//  kakeibo
//
//  Created by 大典 on 2018/04/26.
//  Copyright © 2018年 myname. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var TableView: UITableView!
    @IBAction func unwind(_segue: UIStoryboardSegue) {
    }
    var date=[String]()
    var stdate=[Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let receiv=UIApplication.shared.delegate as! AppDelegate
        receiv.tmpyear()
        var str : String
        for i in 0...8{
            let ye : Int = receiv.years[i]
            stdate.append(ye)
            str = String(ye)+"年"
            date.append(str)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return date.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Samplecell", for: indexPath)
        cell.textLabel!.text = date[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(date[indexPath.row])
        let receive=UIApplication.shared.delegate as! AppDelegate
        receive.yearstore=stdate[indexPath.row]
        self.performSegue(withIdentifier: "Tosecond", sender: nil)
    }


}

