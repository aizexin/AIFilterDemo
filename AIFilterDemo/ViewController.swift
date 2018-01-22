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
    var filter:GPUImageSobelEdgeDetectionFilter?
    @IBOutlet weak var gpuImage: GPUImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoCamera = GPUImageStillCamera(sessionPreset: AVCaptureSession.Preset.vga640x480.rawValue, cameraPosition: .front)
        videoCamera!.outputImageOrientation = .portrait;
        filter = GPUImageSobelEdgeDetectionFilter()
        videoCamera?.addTarget(filter)
        filter?.addTarget(gpuImage)
        videoCamera?.startCapture()
        
    }

    @IBAction func onPanSlider(_ sender: Any) {
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
}

