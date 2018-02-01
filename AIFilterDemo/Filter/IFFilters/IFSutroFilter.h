//
//  IFSutroFilter.h
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import <GPUImage/GPUImageFilterGroup.h>
#import "GPUImageSixInputFilter.h"
#import <GPUImage/GPUImagePicture.h>

@interface AIFilterIFSutroFilter : GPUImageSixInputFilter

@end

@interface IFSutroFilter : GPUImageFilterGroup
{
    GPUImagePicture *imageSource1;
    GPUImagePicture *imageSource2;
    GPUImagePicture *imageSource3;
    GPUImagePicture *imageSource4;
    GPUImagePicture *imageSource5;
}

@end
