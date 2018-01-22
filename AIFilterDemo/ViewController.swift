//
//  ViewController.swift
//  AIFilterDemo
//
//  Created by aizexin on 2018/1/22.
//  Copyright © 2018年 aizexin. All rights reserved.
//

import UIKit
import GPUImage

class ViewController: UIViewController {

    var videoCamera:GPUImageVideoCamera?
    var filter:GPUImageSobelEdgeDetectionFilter?
    @IBOutlet weak var gpuImage: GPUImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoCamera = GPUImageVideoCamera(sessionPreset: AVCaptureSession.Preset.vga640x480.rawValue, cameraPosition: .front)
        videoCamera!.outputImageOrientation = .portrait;
        filter = GPUImageSobelEdgeDetectionFilter()
        videoCamera?.addTarget(filter)
        filter?.addTarget(gpuImage)
        videoCamera?.startCapture()
        
    }

    @IBAction func onPanSlider(_ sender: Any) {
    }
    @IBAction func onClickSnap(_ sender: Any) {
        
    }
}

