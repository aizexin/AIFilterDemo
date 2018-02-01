//
//  IFInkwellFilter.h
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import <GPUImage/GPUImageFilterGroup.h>
#import <GPUImage/GPUImageThreeInputFilter.h>
#import <GPUImage/GPUImagePicture.h>

@interface AIFilterInkwell : GPUImageTwoInputFilter

@end

@interface IFInkwellFilter : GPUImageFilterGroup
{
    GPUImagePicture *imageSource1;
}

@end
