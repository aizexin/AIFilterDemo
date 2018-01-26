//
//  ViewController.swift
//  AIFilterDemo
//
//  Created by aizexin on 2018/1/22.
//  Copyright © 2018年 aizexin. All rights reserved.
//

import UIKit
import GPUImage
import Photos

class ViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var videoCamera:GPUImageStillCamera?
    var filter:GPUImageFilter?
    @IBOutlet weak var gpuImage: UIImageView!
    @IBOutlet weak var slider: UISlider!
    let classArray = ["GPUImageBulgeDistortionFilter","GPUImagePinchDistortionFilter","GPUImageStretchDistortionFilter","GPUImageSphereRefractionFilter","GPUImageGlassSphereFilter","GPUImageVignetteFilter","GPUImageKuwaharaFilter","GPUImageKuwaharaRadius3Filter","GPUImagePerlinNoiseFilter","GPUImageCGAColorspaceFilter","GPUImageMosaicFilter","GPUImageJFAVoronoiFilter","GPUImageVoronoiConsumerFilter"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        videoCamera = GPUImageStillCamera(sessionPreset: AVCaptureSession.Preset.vga640x480.rawValue, cameraPosition: .front)
//        videoCamera!.outputImageOrientation = .portrait;
//        filter = GPUImagePosterizeFilter()
//        videoCamera?.addTarget(filter)
//        filter?.addTarget(gpuImage)
//        videoCamera?.startCapture()
        
    }

    //MARK: Action
    @IBAction func onPanSlider(_ sender: UISlider) {
        print("1111")
        
//        (filter as! GPUImageNonMaximumSuppressionFilter).sharpness = CGFloat(sender.value)
    }
    
    @IBAction func onClickSnap(_ sender: Any) {
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
     
            //弹出控制器，显示界面
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("读取相册错误")
        }
        
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看info对象
        print(info)
        //显示的图片
        let image:UIImage!
        //获取选择的原图
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        gpuImage.image = AIFilterTool.applySketchFilter(image: image)
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }

}

