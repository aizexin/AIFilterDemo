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

    @IBOutlet weak var preview: GPUImageView!
    @IBOutlet weak var snap: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        filter = IFNormalFilter()
        videoCamera = GPUImageStillCamera(sessionPreset: AVCaptureSession.Preset.vga640x480.rawValue, cameraPosition: .front)
        videoCamera?.outputImageOrientation = .portrait;
        videoCamera?.addTarget(filter)
        filter?.addTarget(preview)
        videoCamera?.startCapture()
    }

    //MARK: Action
    @IBAction func onClickSnap(_ sender: Any) {
        videoCamera?.capturePhotoAsImageProcessedUp(toFilter: filter, with: .upMirrored, withCompletionHandler: { (image, error) in
            guard let filterImage = image else {
                return
            }
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: filterImage)
            }, completionHandler: nil)
            let photoVC = AIPhotoViewController()
            photoVC.image = filterImage;
            self.present(photoVC, animated: true, completion: nil)
            
        })
    }
    
}

extension UIScrollView {
    
    var capture: UIImage? {
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(self.contentSize)
        do {
            let savedContentOffset = self.contentOffset
            let savedFrame = self.frame
            self.contentOffset = .zero
            self.frame = CGRect(x: 0, y: 0, width: self.contentSize.width, height: self.contentSize.height)
            
            UIGraphicsBeginImageContextWithOptions(CGSize(width: self.contentSize.width, height: self.contentSize.height), false, 0.0)
            
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
            image = UIGraphicsGetImageFromCurrentImageContext()
            self.contentOffset = savedContentOffset
            self.frame = savedFrame
        }
        UIGraphicsEndImageContext()
        if image != nil {
            return image!
        }
        return nil
    }
}

