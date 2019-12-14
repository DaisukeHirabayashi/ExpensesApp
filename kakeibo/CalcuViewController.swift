//
//  ViewController.swift
//  calcTest
//
//  Created by k17097kk on 2018/04/27.
//  Copyright © 2018年 AIT. All rights reserved.
//

import UIKit            //9桁まで

class CalcuViewController: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var tokutenLabel: UILabel!
    
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    
    @IBAction func finishButton(_ sender: Any) {
        
//        let alert = UIAlertController(title: "足し算クイズ",message: "??",preferredStyle: .alert)
//        let defaultAction = UIAlertAction(title:"OK",style:.default,handler:{action in
//
//            }
//        })
//        alert.addAction(defaultAction)
//        present(alert,animated: true,completion: nil)
//        
        let share = UIApplication.shared.delegate as! AppDelegate
        let df=DateFormatter()
        df.dateFormat = "yyyy"
        var year = Int( df.string(from: Date()) )!
        df.dateFormat = "MM"
        var month = Int( df.string(from: Date()) )!
        df.dateFormat = "dd"
        var day = Int( df.string(from: Date()) )!
        let date = money_data()
        date.input_data(year: year,month: month,day:day,value:tr*100+fa*(-100))
        share.share_datas.append(date)
        share.tmp()
        
    }
    //MARK:inputButton!
    var num:Int=0;
    var ketacnt:Int=0;
    var maxketa:Int=6;
    var commcnt:Int=0;
    var flg=0;
    @IBAction func oneButton(_ sender: Any) {
        if(ketacnt<=maxketa){
            num=num*10+1
            inputLabel.text="\(num)"
            ketacnt=ketacnt+1
        }
    }
    @IBAction func twoButton(_ sender: Any) {
        if(ketacnt<=maxketa){
            num=num*10+2
            inputLabel.text="\(num)"
            ketacnt=ketacnt+1
        }
    }
    @IBAction func threeButton(_ sender: Any) {
        if(ketacnt<=maxketa){
            num=num*10+3
            inputLabel.text="\(num)"
            ketacnt=ketacnt+1
        }
    }
    @IBAction func fourButton(_ sender: Any) {
        if(ketacnt<=maxketa){
            num=num*10+4
            inputLabel.text="\(num)"
            ketacnt=ketacnt+1
        }
    }
    @IBAction func fiveButton(_ sender: Any) {
        if(ketacnt<=maxketa){
            num=num*10+5
            inputLabel.text="\(num)"
            ketacnt=ketacnt+1
        }
    }
    @IBAction func sixButton(_ sender: Any) {
        if(ketacnt<=maxketa){
            num=num*10+6
            inputLabel.text="\(num)"
            ketacnt=ketacnt+1
        }
    }
    @IBAction func sevenButton(_ sender: Any) {
        if(ketacnt<=maxketa){
            num=num*10+7
            inputLabel.text="\(num)"
            ketacnt=ketacnt+1
        }
    }
    @IBAction func eightButton(_ sender: Any) {
        if(ketacnt<=maxketa){
            num=num*10+8
            inputLabel.text="\(num)"
            ketacnt=ketacnt+1
        }
    }
    @IBAction func nineButton(_ sender: Any) {      //9
        if(ketacnt<=maxketa){
            num=num*10+9
            inputLabel.text="\(num)"
            ketacnt=ketacnt+1
        }
    }
    @IBAction func zeroButton(_ sender: Any) {      //0
        if(ketacnt<=maxketa){
            if(0<num){
                ketacnt=ketacnt+1
                num=num*10
                inputLabel.text="\(num)"
            }else if(num==0){
            num=0;
            }
        }
    }
    @IBAction func minusButton(_ sender: Any) {     //-
        num=num-num*2
        inputLabel.text="\(num)"
    }
    @IBAction func deleteButton(_ sender: Any) {        //消
        if(0<ketacnt){
            ketacnt=ketacnt-1
            num=num/10
            inputLabel.text="\(num)"
        }
    }
    @IBAction func nextQuesrionButton(_ sender: Any) {      //次の問題
        flg=0;
        question()
    }
    
    //MARK:questionCalc!
    var a=0     //2つランダムの数字
    var b=0
    var operat=0
    var tr=0    //正答数カウント
    var fa=0
    var correct=0
    var operaStr:String=""
    var seconds=0
    //
    func question(){
        num=0
        correct=0
        inputLabel.text=""
        a=Int(arc4random()%1000)
        b=Int(arc4random()%100)
        operat=Int(arc4random()%100)
        operat=operat%4
        switch operat{
            case 0:
                a=a%100
                operaStr="+"
                correct=a+b
            case 1:
                a=a%100
                operaStr="-"
                correct=a-b
            case 2:
                a=a%10
                operaStr="×"
                correct=a*b
            case 3:
                operaStr="÷"
                while (a%b != 0){
                    b=b-1
                }
                correct=a/b
            default:
                break
        }
        questionLabel.text="\(a)\(operaStr)\(b)="
        counterLabel.text="正解:\(tr)     不正解:\(fa)"          //いらない
        
    }
    //MARK:確定処理
    @IBAction func enterButton(_ sender: Any) {         //確定
        commcnt=Int(arc4random()%5)
        if(-2<=tr-fa && tr-fa<=2){
            commentLabel.text="\(comm[commcnt+10])>"   //
        }else if(3<=tr-fa && tr-fa<=5){
            commentLabel.text="\(comm[commcnt+5])>" //
        }else if(6<=tr-fa){
            commentLabel.text="\(comm[commcnt])>"   //
        }else if(-3<=tr-fa && tr-fa<=(-5)){
            commentLabel.text="\(comm[commcnt+15])>" //
        }else if(tr-fa<=(-6)){
            commentLabel.text="\(comm[commcnt+20])>"    //
        }

        
        guard let answer = Int(inputLabel.text!)else{
            return
        }
        var check=""
        if (answer == correct && flg==0){
            check="正解"
            tr=tr+1;
            flg=1;
            tokutenLabel.text="\((tr-fa)*100)円獲得中！>"
        }else if(answer != correct && flg==0){
            check="不正解"
            fa=fa+1
            flg=1;
            tokutenLabel.text="現在:\((tr-fa)*100)円！>"
        }
        questionLabel.text="\(check)"
        counterLabel.text="正解:\(tr)     不正解:\(fa)"
    }
    //MARK:叱咤激励
    let comm:[String]=["計算の貴公子エビ！？","やばいエビ","やるじゃんエビ！","見直したエビ！！","これはすごいエビ！", //0,1,2,3,4, 6/
                        "その調子エビ〜","なかなかすごいエビ","もっともっとエビ！","いいんじゃないエビ！","つよいエビ・・・", //5,6,7,8,9, 3/5
                        "がんばれエビ！!","もうすこしエビ！","まだやれるエビ！","やればできるエビ！","はやくはやくエビ！", //10,11,12,13,14, -2/2
                       "おちついてエビ！","どうしたエビ！？","あせらないでエビ・・・","一尾ずつ丁寧にエビ。","ここをなんとかエビ・・・！！",  //15,16,17,18,19 -3/-5
                       "もしかしてやる気ないエビ・・・？","阿鼻叫喚エビ・・・","やる気ないならやめるエビ。","エビ・・・？？？","どうしたエビ・・・"]   //20,21,22,23,24 -6/
    //MARK:そのた
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        //background image
        let bg = UIImageView(frame: CGRect(x: -200, y: 0, width: self.view.frame.size.width+400, height: self.view.frame.size.height))
        bg.image = UIImage(named: "kaitei.jpeg")
        bg.layer.zPosition = -1
        self.view.addSubview(bg)
        
//        let sh = UIImageView(frame: CGRect(x: 200, y: 100
//            , width: self.view.frame.size.width-200, height: self.view.frame.size.height-530))
//        sh.image = UIImage(named: "shrimp.jpeg")
//        sh.layer.zPosition = -1
//        self.view.addSubview(sh)
        
//        let fu = UIImageView(frame: CGRect(x: 110, y: 300
//            , width: self.view.frame.size.width-200, height: self.view.frame.size.height-1200))
//        fu.image = UIImage(named: "fukidashi.png")
//        fu.layer.zPosition = -1
//        self.view.addSubview(fu)
        question()
//        let color1 = UIColor(red: 0,green: 0,blue: 0,alpha: 1.0);   //緑？
//        let color2 = UIColor(red:0.91764705882,green:0.57647058823,blue:0.38823529411,alpha:1.0);       //オレンジ
////        let color3 = UIColor(red: 0.62352941176,green: 0.5294117647,blue: 0.74901960784,alpha:1.0)
//        let color4 = UIColor(red:0.94117647058,green: 0.80784313725,blue: 0.41176470588,alpha:1.0)      //黄?
//          oneButton.backgroundColor = color1;
//        twoButton.backgroundColor = color4;
//        threeButton.backgroundColor = color1;
//        fourButton.backgroundColor = color4;
//        fiveButton.backgroundColor = color1;
//        sixButton.backgroundColor = color4;
//        sevenButton.backgroundColor = color1;
//        eightButton.backgroundColor = color4;
//        nineButton.backgroundColor = color1;
//        zeroButton.backgroundColor = color1;
//        minusButton.backgroundColor = color4;
//        deleteButton.backgroundColor = color4;
//        enterButton.backgroundColor = color2;
//        
//        oneButton.layer.cornerRadius = 8.0;
//        twoButton.layer.cornerRadius = 8.0;
//        threeButton.layer.cornerRadius = 8.0;
//        fourButton.layer.cornerRadius = 8.0;
//        fiveButton.layer.cornerRadius = 8.0;
//        sixButton.layer.cornerRadius = 8.0;
//        sevenButton.layer.cornerRadius = 8.0;
//        eightButton.layer.cornerRadius = 8.0;
//        nineButton.layer.cornerRadius = 8.0;
//        zeroButton.layer.cornerRadius = 8.0;
//        minusButton.layer.cornerRadius = 8.0;
//        deleteButton.layer.cornerRadius = 8.0;
//        enterButton.layer.cornerRadius = 30.0;
//        updateDateLabel()
//        Timer.scheduledTimer(timeInterval:１,target:self,selector: #selector(MainViewController.updateDateLabel), userInfo: nil, repeats: true)
//        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateDateLabel", userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
//    func updateDateLabel(){
//        let calendar = Calendar.current
//        seconds = calendar.component(.second, from: Date())
//        timeLabel.text="\(seconds)"             //時間だす
//    }

}

