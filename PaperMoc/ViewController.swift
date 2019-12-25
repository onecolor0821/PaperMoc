//
//  ViewController.swift
//  PaperMoc
//
//  Created by 一色潤 on 2019/12/20.
//  Copyright © 2019 com.litech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    @IBOutlet weak var imageView: UIImageView!

    @IBAction func startCamera(_ sender: UIBarButtonItem) {
        
        //UIImagePickerController起動時にカメラの使用の宣言。一個目のsourceTypeは任意(以降は定型文)。
        let sourceType:UIImagePickerController.SourceType = UIImagePickerController.SourceType.camera

        //起動時にカメラが使えるかどうか
        if
        /*UIImagePickerを操作*/ UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker, animated: true)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.imageView.image = image
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        self.dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
