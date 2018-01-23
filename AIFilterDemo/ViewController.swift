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

class ViewController: UIViewController {

    var videoCamera:GPUImageStillCamera?
    var filter:GPUImageFilter?
    @IBOutlet weak var gpuImage: GPUImageView!
    @IBOutlet weak var slider: UISlider!
    let classArray = ["GPUImageBulgeDistortionFilter","GPUImagePinchDistortionFilter","GPUImageStretchDistortionFilter","GPUImageSphereRefractionFilter","GPUImageGlassSphereFilter","GPUImageVignetteFilter","GPUImageKuwaharaFilter","GPUImageKuwaharaRadius3Filter","GPUImagePerlinNoiseFilter","GPUImageCGAColorspaceFilter","GPUImageMosaicFilter","GPUImageJFAVoronoiFilter","GPUImageVoronoiConsumerFilter"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoCamera = GPUImageStillCamera(sessionPreset: AVCaptureSession.Preset.vga640x480.rawValue, cameraPosition: .front)
        videoCamera!.outputImageOrientation = .portrait;
        filter = GPUImagePosterizeFilter()
        videoCamera?.addTarget(filter)
        filter?.addTarget(gpuImage)
        videoCamera?.startCapture()
        
        slider.minimumValue = -4
        slider.maximumValue = 4
        
    }

    //MARK: Action
    @IBAction func onPanSlider(_ sender: UISlider) {
        print("1111")
        
//        (filter as! GPUImageNonMaximumSuppressionFilter).sharpness = CGFloat(sender.value)
    }
    
    @IBAction func onClickSnap(_ sender: Any) {
        videoCamera?.capturePhotoAsPNGProcessedUp(toFilter: filter, withCompletionHandler: { (data, error) in
            PHPhotoLibrary.shared().performChanges( {
                let creationRequest = PHAssetCreationRequest.forAsset()
                let creationOptions = PHAssetResourceCreationOptions()
                creationOptions.shouldMoveFile = true
                creationRequest.addResource(with: .photo, data: data!, options: nil)
            }, completionHandler: nil)
        })
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let classString = classArray[index]
        print("-----\(classString)")
        let classobject  =  NSClassFromString(classString)
        guard let childVcType = classobject as? GPUImageFilter.Type else {
            print("没有得到的类型")
            return
        }
        videoCamera?.removeAllTargets()
        let filter2 = childVcType.init()
        filter      = filter2
        videoCamera?.addTarget(filter2)
        filter2.addTarget(gpuImage)
        index = (index + 1) % classArray.count
    }
}

