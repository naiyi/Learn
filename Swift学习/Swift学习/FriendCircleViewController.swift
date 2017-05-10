//
//  FriendCircleViewController.swift
//  Swift学习
//
//  Created by YY on 16/12/14.
//  Copyright © 2016年 yosemite. All rights reserved.
//

import UIKit

class FriendCircleViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor=UIColor .white
        self.navigationItem.title="朋友圈"
        self.navigationItem.rightBarButtonItem=UIBarButtonItem.init(image: UIImage(named:"Fav_Note_ToolBar_Camera"), style: .plain, target: self, action: #selector(rightClicked(rightItem:)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rightClicked(rightItem:UIBarButtonItem) -> Void {
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        
        var image=UIImage()
        image=info[UIImagePickerControllerOriginalImage] as! UIImage
        print(image)
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
