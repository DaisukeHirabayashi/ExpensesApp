//
//  Gacha_ViewController.swift
//  UNDAMESI
//
//  Created by Edasan0308 on 2018/05/21.
//  Copyright © 2018年 AIT. All rights reserved.
//

import UIKit

class Gacha_ViewController: UIViewController {
    @IBOutlet weak var U_group_label: UILabel!
    @IBOutlet weak var U_number_label: UILabel!
    
    let U_group = Int(arc4random_uniform(100))
    let U_number = Int(arc4random_uniform(1000))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:牧場
        let bo = UIImageView(frame: CGRect(x: -50, y: 20, width: self.view.frame.size.width+400, height: self.view.frame.size.height-20))
        bo.image = UIImage(named: "bokujo.png")
        bo.layer.zPosition = -1
        bo.alpha=0.5
        self.view.addSubview(bo)
        
        U_group_label.text = String(U_group)
        U_number_label.text = String(U_number)
    }
    
    @IBAction func Button(_ sender: Any) {
        let alert: UIAlertController = UIAlertController(title: "結果画面へ移行します", message: "よろしいですか？", preferredStyle:  UIAlertControllerStyle.alert)
        
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            self.performSegue(withIdentifier: "kekkaGacha", sender: nil)
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
        let kekkaGacha = segue.destination as! kekkaGacha
        kekkaGacha.U_group = U_group
        kekkaGacha.U_number = U_number
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
