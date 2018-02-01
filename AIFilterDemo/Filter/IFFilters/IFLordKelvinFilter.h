//
//  IFLordKelvinFilter.h
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import <GPUImage/GPUImageFilterGroup.h>
#import <GPUImage/GPUImageThreeInputFilter.h>
#import <GPUImage/GPUImagePicture.h>

@interface AIFilterLordKelvin : GPUImageTwoInputFilter

@end

@interface IFLordKelvinFilter : GPUImageFilterGroup
{
    GPUImagePicture *imageSource1;
}

@end
