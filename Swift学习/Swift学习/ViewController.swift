//
//  ViewController.swift
//  Swift学习
//
//  Created by YY on 16/11/10.
//  Copyright © 2016年 yosemite. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    enum dataType {//枚举
        case int
        case float
        case double
        case long
    }
    var baseView=UIView()
    
    var a:Int=10
    typealias myInt = Int//定义别名
    let isOpen=true
    var b=10//智能判断类型
    var c="asd"
    let rect=("asd",4,3.14)//元祖类似oc的结构体
    let rect1:(String,Int,Double)=("adfd",3,3.12);//指定类型的元祖
    let (name,age,sex)=("lisi",12,1)
    var str:NSString="asddssd"
    var str1:String?="qwe"//可选值
    
    var optionalValue1:String?
    
    var str2:String?="hello word"
    var str3:Character="q"
    var str4=""
   var str5=String()
    
    var str6="qWdsReSvfVd"
    var aa:NSArray=["ads",3,6,3.14]
    var arr1=["asd","zxc"]
    var dict=["asd":"1234","qwer":"09876"]
    var string1=String()//空字符串
    var arr11=Array<String>()//空数组
    var dict4 = Dictionary<Int, String>()//空字典
    var dict5=Dictionary<String, Any>()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view .backgroundColor=UIColor .white
        
        /*
        
        let label=UILabel(frame :CGRect(x:50,y:100,width:100,height:100))
        label.layer.cornerRadius=10
        label.layer.masksToBounds=true
        label.backgroundColor=UIColor .cyan
        label.textAlignment = .center
        label.textColor=UIColor .red
        label.font=UIFont.systemFont(ofSize: 22)
        label.text="adfsadfs"
        label.alpha=0.8
        
        self.view .addSubview(label)
        baseView.frame=CGRect(x:100,y:200,width:200,height:100)
        baseView.backgroundColor=UIColor .orange
        self.view .addSubview(baseView)
        
        
*/
        
        let btn=UIButton(type:.custom)
        btn.frame=CGRect(x:120,y:300,width:150,height:80)
        btn .setTitle("按钮", for:.normal)
        btn .setTitleColor(UIColor .red, for:.normal)
        btn.backgroundColor=UIColor .cyan
        btn.layer.cornerRadius=30
        btn.layer.masksToBounds=true
        btn .setImage(UIImage(named:"123"), for: .normal)
        btn.addTarget(self, action:#selector(btnClicked(btn:)), for:.touchUpInside)
        self.view .addSubview(btn)
        
 /*
        let imageView=UIImageView(frame:CGRect(x:100,y:150,width:150,height:80))
        imageView .image=UIImage(named:"123")
        self.view .addSubview(imageView)
        
        let view=UIView(frame:CGRect(x:100,y:300,width:200,height:100))
        view .backgroundColor=UIColor .orange
        self.view.addSubview(view)
        
        
        */
        for item in arr1 { //遍历数组
            print("++++++item=\(item)+++++++")
        }
        let arr2:Array=Array (arrayLiteral: "qw","asd","1234")
        let arr3=Array (arrayLiteral:"" )
        print(arr3.count,arr3[0])
        print(arr2)
        print("第一个元素\(arr1[0])")
        print("最后一个元素\(arr1.last!)")
        arr1+=["boss","loser"]//数组增加两个元素
        arr1.append("hello")//数组最后添加一个元素
        arr1.remove(at: 0)//移除第一个元素
        print("\(arr1),\(arr1.count)")
        print(dict.count)
        dict["zxcvb"]="7654"//添加元素
        print(dict)
        dict.updateValue("lkjhg", forKey: "123eds")//若键存在更新其对应的值，若不存在，添加键和值
        print(dict)
        dict.removeValue(forKey: "asd")//移除键对应的值
        print(dict)
       let str22=dict["qwer"]!//通过键取值
        print(str22)
        for value in dict.values {
            print(value)
        }
        for (key,value) in dict {
            print(key,value)
        }
        for index in 2...7 {
            print("++++\(index)++++")
        }

        for index1 in 0 ..< 3 {

            print(index1)
        }
        var i=0
        while i<10 {
            i += 1
            print(i)
        }
        
        repeat{
            i+=1
            print("+++i=\(i)++++")
        }while i<10
        
        if i==0 {
            i+=1
            print(i);
        }
        for i in 2..<8 {
            switch i {
            case 2,3:
                print(i)
            case 4...5:
                print(i)
            case 6..<7:
                print(i)
            default:
                print(i)
            }
        }
        let somePoint = (1, 1)
        switch somePoint {
        case (0, 0):
            print("is at the origin")
        case (_, 0):
            print("(\(somePoint.0), 0) is on the x-axis")
        case (0, _):
            print("(0, \(somePoint.1)) is on the y-axis")
        case (-2...2, -2...2):
            print("(\(somePoint.0), \(somePoint.1)) is inside the box")
        default:
            print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
        }
        
        let puzzleInput = "great minds think alike"

        for character1 in puzzleInput.characters {
            switch character1 {
            case "a", "e", "i", "o", "u", " ":
                continue
            default:
                break

            }
        }
        
        if isOpen {
            print("打开")
            print(a,b,c)
            print(rect.0,  rect.1,  rect.2)
            
        }else{
            print("关闭")
        }
        print(str1!)//拆包
        
        if optionalValue1==nil {
            print(optionalValue1 ?? 2)
        }else
        {
        print(optionalValue1 ?? 5)
        }
        print(str2!)
        print(str3)
        
        for character in "Dog!🐶".characters {
            print(character)//遍历字符串
        }
        
        for character1 in str6.characters {
            print(character1)
        }
        for abc in aa {
            print(abc)//遍历数组
        }
        print(str6.characters.count)//打印字符个数
        print(str6.lengthOfBytes(using:String.Encoding.utf8))//打印字节数
        print(aa.count)//数组元素个数
        print(str6[str6.startIndex])//索引第一个的值
        print(str6.uppercased())//转化为大写
        print(str6.lowercased())//转化为小写
        print(str6.localizedLowercase)//转化为小写
        print(str6.localizedUppercase)//转化为大写
        print(10%3)
        print(add(a: 3, b: 5))
        print("The current value of friendlyWelcome is \(str6)\(c)")
        print("\(str6),\(a),\(b)\(c)")
        print("woaini")
        if str5.isEmpty {
            print("为空值")
        }
        if str4==str5 {
            print("相等")
        }
        
       
        
        
        
        }
    
//    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    func backwards(s1: String, s2: String) -> Bool {
        return s1 > s2
    }

    func btnClicked(btn:UIButton) -> Void {
        print("点击")
        let  firstVC=FirstViewController()
        self .present(firstVC, animated: true, completion: nil)
    }
    
    func add(a:Int,b:Int) -> Int {// 函数
        return a+b
    }
    func sum(a:String,b:String) -> String {
        return a+b
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

