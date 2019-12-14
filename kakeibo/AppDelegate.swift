//
//  AppDelegate.swift
//  value_count
//
//  Created by k17113kk on 2018/04/30.
//  Copyright © 2018年 AIT. All rights reserved.
//

import UIKit

class money_data {
    var year:Int? = 0
    var month:Int? = 0
    var day:Int? = 0
    var value:Int? = 0
    
    
    func input_data(year: Int = 0,month:Int = 0, day:Int = 0, value:Int = 0){
        self.year = year
        self.month = month
        self.day = day
        self.value = value
    }
}
struct money_date{
    var year:Int? = 0
    var month:Int? = 0
    var day:Int? = 0
    var value:Int? = 0
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var send_counter = 0
    //var share_data:[money_date] = [money_date]();//classインスタンスを作成。
    var share_data:[money_data] = []
    var share_datas:[money_data] = []
    var years:[Int]=[]
    var monthss:[Int]=[]
    var yearstore:Int=0
    var monthstore:Int=0
    var addva:Int=0
    func tmp(){
        for i in 0...share_data.count-1{
            if(share_data[i].year==share_datas[0].year){
                if(share_data[i].month==share_datas[0].month){
                    if(share_data[i].day==share_datas[0].day){
                        share_data[i].value=share_data[i].value!+share_datas[0].value!
                        share_datas.removeAll()
                        return 
                    }
                }
            }
        }
        share_data.append(share_datas[0])
        share_datas.removeAll()
    }
    func reset(){
        share_data.removeAll()
    }
    func tmpmonth(){
        for i in 1...12{
            monthss.append(i)
        }
    }
    func tmpyear(){
        for i in 2010...2018{
            years.append(i)
        }
    }
    func sump(){
        let damy=money_data()
        damy.input_data(year: 1998,month:1,day:31,value:0)
        share_data.append(damy);
    }
    func addvalue(){
        for i in 0...share_data.count-1{
            addva=addva+share_data[i].value!
        }
    }
    private func data_writeing(){
        //JSONにするための辞書を作成する。
        var json_array = [Dictionary<String,Int>]()
        
        for i in 0..<share_data.count {
            var json_dictionary = Dictionary<String,Int>()
            json_dictionary["year"] = share_data[i].year
            json_dictionary["month"] = share_data[i].month
            json_dictionary["day"] = share_data[i].day
            json_dictionary["value"] = share_data[i].value
            
            //dictionaryを配列に追加
            json_array.append(json_dictionary)
        }
        
        var json_string:String!//以下のdo chachで値が代入されない可能性があるので、それを！で保証しておく。
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json_array, options: [])//まずデータ型に変換する。
            json_string = String(bytes: jsonData, encoding: .utf8)!
            //            print(json_string)  // 生成されたJSON文字列 => 上記のjson_array （確認用）
        } catch let error {
            print(error)
        }
        
        //ファイル出力の時。
        let textFileName = "money_data.txt"
        
        // DocumentディレクトリのfileURLを取得
        if let FileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
            
            // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
            let targetTextFilePath = FileURL.appendingPathComponent(textFileName)
            
                        print("書き込むファイルのパス: \(targetTextFilePath)")//実際にできてるか確認するときに使う。
            
            do {
                try json_string.write(to: targetTextFilePath, atomically: true, encoding: String.Encoding.utf8)
            } catch let error as NSError {
                print("failed to write: \(error)")
            }
        }//falseだったならここでエラー処理になると思う。
        
    }
    //let sample: money_data = money_data()単体インスタンスの生成例。
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        data_writeing();
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        data_writeing()
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

