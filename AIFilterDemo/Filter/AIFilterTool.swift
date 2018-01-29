//
//  AIFilterTool.swift
//  AIFilterDemo
//
//  Created by aizexin on 2018/1/26.
//  Copyright © 2018年 aizexin. All rights reserved.
//

import UIKit
import GPUImage

class AIFilterTool: NSObject {
    class func applySketchFilter(image: UIImage) -> UIImage {
        let filter = FWSierraFilter()
        filter.forceProcessing(at: CGSize.init(width: image.size.width, height: image.size.height ))
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    
    class func applyValenciaFilter(image: UIImage) -> UIImage {
        let filter = FWValenciaFilter()
        filter.forceProcessing(at: CGSize.init(width: image.size.width, height: image.size.height ))
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    
}
