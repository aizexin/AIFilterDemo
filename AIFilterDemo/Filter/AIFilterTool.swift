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
    class func applySierraFilter(image: UIImage) -> UIImage {
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
    
    class func applySketchBookFilter(image: UIImage) -> UIImage {
        let filter = GPUImageSketchFilter()
        filter.texelWidth = 0.005
        filter.texelHeight = 0.005
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIF1977Filter(image: UIImage) -> UIImage {
        let filter = IF1977Filter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFAmaroFilter(image: UIImage) -> UIImage {
        let filter = IFAmaroFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFBrannanFilter(image: UIImage) -> UIImage {
        let filter = IFBrannanFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFEarlybirdFilter(image: UIImage) -> UIImage {
        let filter = IFEarlybirdFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFHefeFilter(image: UIImage) -> UIImage {
        let filter = AIFilterHefe()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    
}
