//
//  IFLomofiFilter.h
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import <GPUImage/GPUImageFilterGroup.h>
#import <GPUImage/GPUImageThreeInputFilter.h>
#import <GPUImage/GPUImagePicture.h>

@interface AIFilterLomofi : GPUImageThreeInputFilter

@end

@interface IFLomofiFilter : GPUImageFilterGroup
{
    GPUImagePicture *imageSource1;
    GPUImagePicture *imageSource2;
}
@end
