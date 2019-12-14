//
//  HomeViewController.swift
//  kakeibo
//
//  Created by 大典 on 2018/05/27.
//  Copyright © 2018年 myname. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let obj = UIApplication.shared.delegate as! AppDelegate
    @IBAction func returnToMee(_segue: UIStoryboardSegue) {
        obj.addva=0
    }
//    @IBOutlet weak var kujiButton: UIButton!
//    @IBOutlet weak var calcButton: UIButton!
//    @IBOutlet weak var kakeiboButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //JSONファイルの読み込み------------------------------------
        var FileURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
        
        //生成したパスにファイルネームの情報を付加している。
        FileURL = FileURL?.appendingPathComponent("money_data.txt")
        
        //file_url型のfile云々を取り除く整形を行う。
        let file_path = (FileURL!.path)
        
        
        let manager = FileManager()
        
        if manager.fileExists(atPath: String(describing: file_path) ) {//ファイルが存在するかを確認する
            
            let data = NSData(contentsOfFile: file_path)//データをNSデータ型に変換する
            let json = NSString(data: data! as Data, encoding: String.Encoding.utf8.rawValue)//NSデータ型からString型に変換
            
            if let data = json?.data(using: String.Encoding.utf8.rawValue) {
                do {
                    let JSONObject = try JSONSerialization.jsonObject(with: data, options: [])
                    do {
                        let top = JSONObject as! NSArray // トップレベルが配列
                        for roop in top {
                            let dictionaly_data = roop as! NSDictionary//多分Arrayの要素一個目が1回目に入るんだと思う
                            
                            //アペンドするデータを作る
                            let data = money_data()
                            data.input_data(year: dictionaly_data["year"] as! Int,month: dictionaly_data["month"] as! Int, day: dictionaly_data["day"] as! Int, value: dictionaly_data["value"] as! Int)
                            
                            //appendする
                            obj.share_data.append(data)
                        }
                    } catch {
                        print(error) // パースに失敗したときにエラーを表示
                    }
                } catch let error {
                    print(error)
                }
            } else {
                print("Invalid string")
            }
        }else{
            print("ファイルがありません。")
        }
//        kujiButton.layer.cornerRadius = 10.0;
//        calcButton.layer.cornerRadius = 10.0;
//        kakeiboButton.layer.cornerRadius = 10.0;
        // Do any additional setup after loading the view.
        if(obj.share_data.count==0){
            obj.sump()
        }
    }
    
    @IBAction func rsetButton(_ sender: Any) {
        obj.reset()
        obj.sump()
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
