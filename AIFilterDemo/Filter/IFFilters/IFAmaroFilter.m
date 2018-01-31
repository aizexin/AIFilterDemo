//
//  IFAmaroFilter.m
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "IFAmaroFilter.h"
#import "AIFragmentShaderConfigure.h"

@implementation AIFilterAmaro

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:[AIFragmentShaderConfigure getAmaroShaderString]]))
    {
		return nil;
    }
    
    return self;
}

@end

@implementation IFAmaroFilter

- (id)init
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    AIFilterAmaro *filter = [[AIFilterAmaro alloc] init];
    [self addFilter:filter];
    
    UIImage *image1 = [UIImage imageNamed:@"blackboard1024"];
    imageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    [imageSource1 addTarget:filter atTextureLocation:1];
    [imageSource1 processImage];
    
    UIImage *image2 = [UIImage imageNamed:@"overlayMap"];
    imageSource2 = [[GPUImagePicture alloc] initWithImage:image2];
    [imageSource2 addTarget:filter atTextureLocation:2];
    [imageSource2 processImage];
    
    UIImage *image3 = [UIImage imageNamed:@"amaroMap"];
    imageSource3 = [[GPUImagePicture alloc] initWithImage:image3];
    [imageSource3 addTarget:filter atTextureLocation:3];
    [imageSource3 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:filter, nil];
    self.terminalFilter = filter;
    
    return self;
}

@end
