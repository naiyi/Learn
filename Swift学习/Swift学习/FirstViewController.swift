//
//  FirstViewController.swift
//  Swift学习
//
//  Created by YY on 16/12/12.
//  Copyright © 2016年 yosemite. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource {
var dataArr=Array<String>()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor=UIColor.cyan
        self.navigationItem.title="微信"
        
        self.navigationItem.rightBarButtonItem=UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(btn1Clicked(rightItem:)))
        self.navigationItem.leftBarButtonItem=UIBarButtonItem.init(title:"添加",style:UIBarButtonItemStyle.plain,target:self,action:#selector(btn2Clicked(rightItem:)))
//       let image = self .createImageWithColor(UIColor (red: 31/255, green: 185/255, blue: 34/255, alpha: 1))
        let imageView=UIImageView(frame:CGRect(x:50,y:100,width:200,height:80))
        imageView.tag=0x100
//        imageView.image=image
        self.view .addSubview(imageView)
        
        print(UIDevice .current.systemName)
        print(UIDevice .current.systemVersion)
        print(UIDevice.current.name)
        print(UIDevice.current.model)
        print(UIDevice.current.localizedModel)
        
        

//        let now=NSDate();
//        let formatter = DateFormatter()
//        formatter.dateFormat="yyyy年MM月dd日HH:mm:ss"
//        print(formatter.string(from: now as Date))
//        
//        let timeInterval:TimeInterval=now.timeIntervalSince1970
//        print(timeInterval)
        
        //时间戳
        let timeStamp = 1463637809
        
        //转换为时间
        let timeInterval:TimeInterval = TimeInterval(timeStamp)
        let date = NSDate(timeIntervalSince1970: timeInterval)
        
        //格式话输出
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        print("对应的日期时间：\(dformatter.string(from: date as Date))")
        
        
        
        let tableView=UITableView.init(frame: CGRect(x:0,y:64,width:MainScreenW,height:MainScreenH-64), style: .grouped)
        tableView.backgroundColor=UIColor .groupTableViewBackground
        self.view .addSubview(tableView)
        tableView .delegate=self
        tableView.dataSource=self
        dataArr=["聊天1","聊天2","聊天3","聊天4","聊天5","聊天6","聊天7","聊天8","聊天9"]
        tableView .register(UITableViewCell .classForCoder(), forCellReuseIdentifier: "cellid")
//        tableView .separatorStyle = .singleLineEtched
        
        
    }
    
    func btn1Clicked(rightItem:UIBarButtonItem) -> Void {
        let alertController=UIAlertController.init(title: "提示", message: nil, preferredStyle: .actionSheet)
        let action1=UIAlertAction.init(title: "相机", style: UIAlertActionStyle.default, handler: { (alertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                
                //创建图片控制器
                let picker = UIImagePickerController()
                //设置代理
                picker.delegate = self
                //设置来源
                picker.sourceType = UIImagePickerControllerSourceType.camera
//                picker.cameraDevice=UIImagePickerControllerCameraDevice.front
                //允许编辑
                picker.allowsEditing = true
                //打开相机
                self.present(picker, animated: true, completion: { () -> Void in
                    print("+++++\(picker)++++")
                })
            }
            
    })
        alertController .addAction(action1)
        let action2=UIAlertAction.init(title: "相册", style: UIAlertActionStyle.default, handler: { (alertAction) in
//
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePickerController=UIImagePickerController()
                imagePickerController .delegate=self
                imagePickerController.allowsEditing=true
                self .present(imagePickerController, animated: true, completion: nil)
            }
        })
        alertController .addAction(action2)
        let action3=UIAlertAction.init(title: "取消", style: UIAlertActionStyle.destructive, handler: { (alertAction) in
            alertController .removeFromParentViewController()
        })
        alertController .addAction(action3)
        self.present(alertController, animated: true, completion: nil)

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
//            tableView .deleteRows(at: [indexPath], with: .automatic)
//            dataArr .remove(at: indexPath .row)
//            tableView .reloadData()
        }
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let rowAction1=UITableViewRowAction.init(style: .default, title: "删除") { (UITableViewRowAction, IndexPath) in
            print("删除成功")
            self.dataArr .remove(at: indexPath .row)
            tableView .deleteRows(at: [indexPath], with: .automatic)
            tableView .reloadData()
        }
       
        let rowAction2=UITableViewRowAction.init(style: .normal, title: "标为未读") { (UITableViewRowAction, IndexPath) in
            print("消息未读")
            
        }
        let arr=Array (arrayLiteral: rowAction1,rowAction2)
        return arr
       
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
      print(info)
        
        var image=UIImage()
        image=info[UIImagePickerControllerOriginalImage] as! UIImage
        print(image)
    }
    func btn2Clicked(rightItem:UIBarButtonItem) -> Void {
        
    }
    func createImageWithColor(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self .present(ViewController(), animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(ChatViewController(), animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr .count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView .dequeueReusableCell(withIdentifier: "cellid")
        
        cell?.textLabel?.text=dataArr[indexPath .row]
        cell?.imageView?.image=UIImage(named:"headimage")
        return cell!
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
