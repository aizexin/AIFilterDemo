//
//  IFRiseFilter.h
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import <GPUImage/GPUImageFilterGroup.h>
#import "GPUImageFourInputFilter.h"
#import <GPUImage/GPUImagePicture.h>

@interface AIFilterIFRiseFilter : GPUImageFourInputFilter

@end

@interface IFRiseFilter : GPUImageFilterGroup
{
    GPUImagePicture *imageSource1;
    GPUImagePicture *imageSource2;
    GPUImagePicture *imageSource3;
}

@end


