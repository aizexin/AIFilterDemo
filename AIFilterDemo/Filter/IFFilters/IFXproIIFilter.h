//
//  IFXproIIFilter.h
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import <GPUImage/GPUImageFilterGroup.h>
#import "GPUImageSixInputFilter.h"
#import <GPUImage/GPUImagePicture.h>

@interface AIFilterIFXpro : GPUImageThreeInputFilter

@end

@interface IFXproIIFilter : GPUImageFilterGroup
{
    GPUImagePicture *imageSource1;
    GPUImagePicture *imageSource2;
}

@end
