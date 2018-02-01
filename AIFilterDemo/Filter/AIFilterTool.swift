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
    //可用
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
    //可用
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
    //可用
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
    //可用
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
    //可用
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
    //可用
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
        let filter = IFHefeFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    //可用
    class func applyIFHudsonFilter(image: UIImage) -> UIImage {
        let filter = IFHudsonFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFInkwellFilter(image: UIImage) -> UIImage {
        let filter = IFInkwellFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    
    class func applyIFLomofiFilter(image: UIImage) -> UIImage {
        let filter = IFLomofiFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFLordKelvinFilter(image: UIImage) -> UIImage {
        let filter = IFLordKelvinFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFNashvilleFilter(image: UIImage) -> UIImage {
        let filter = IFNashvilleFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFNormalFilter(image: UIImage) -> UIImage {
        let filter = IFNormalFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFRiseFilter(image: UIImage) -> UIImage {
        let filter = IFRiseFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFSierraFilter(image: UIImage) -> UIImage {
        let filter = IFSierraFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFSutroFilter(image: UIImage) -> UIImage {
        let filter = IFSutroFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFToasterFilter(image: UIImage) -> UIImage {
        let filter = IFToasterFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFValenciaFilter(image: UIImage) -> UIImage {
        let filter = IFValenciaFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFWaldenFilter(image: UIImage) -> UIImage {
        let filter = IFWaldenFilter()
        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    class func applyIFXproIIFilter(image: UIImage) -> UIImage {
        let filter = IFXproIIFilter()
        filter.forceProcessing(at: CGSize.init(width: image.size.width, height: image.size.height ))

        let pic    = GPUImagePicture.init(image: image)
        pic?.addTarget(filter)
        pic?.processImage()
        filter.useNextFrameForImageCapture()
        let image2 = filter.imageFromCurrentFramebuffer()
        let filterImage = UIImage.init(cgImage: image2!.cgImage!, scale: 2, orientation: image.imageOrientation)
        return filterImage
    }
    
    
    class func applyFilter(filter: GPUImageFilterGroup,image: UIImage) -> UIImage {
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
