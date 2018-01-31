//
//  IFBrannanFilter.m
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "IFBrannanFilter.h"
#import "AIFragmentShaderConfigure.h"

@implementation AIFilterBrannan

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:[AIFragmentShaderConfigure getBrannanShaderString]]))
    {
		return nil;
    }
    
    return self;
}
@end

@implementation IFBrannanFilter

- (id)init
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    AIFilterBrannan *filter = [[AIFilterBrannan alloc] init];
    [self addFilter:filter];
    
//    UIImage *image1 = [UIImage imageNamed:@"brannanProcess"];
//    imageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
//    [imageSource1 addTarget:filter atTextureLocation:1];
//    [imageSource1 processImage];
//    

//
//    UIImage *image3 = [UIImage imageNamed:@"brannanContrast"];
//    imageSource3 = [[GPUImagePicture alloc] initWithImage:image3];
//    [imageSource3 addTarget:filter atTextureLocation:3];
//    [imageSource3 processImage];
//    
//    UIImage *image4 = [UIImage imageNamed:@"brannanLuma"];
//    imageSource4 = [[GPUImagePicture alloc] initWithImage:image4];
//    [imageSource4 addTarget:filter atTextureLocation:4];
//    [imageSource4 processImage];
    
    UIImage *image = [UIImage imageNamed:@"1977map"];
    imageSource1 = [[GPUImagePicture alloc] initWithImage:image];
    [imageSource1 addTarget:filter atTextureLocation:1];
    [imageSource1 processImage];
    
    UIImage *image1 = [UIImage imageNamed:@"1977blowout"];
    imageSource2 = [[GPUImagePicture alloc] initWithImage:image1];
    [imageSource2 addTarget:filter atTextureLocation:2];
    [imageSource2 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:filter, nil];
    self.terminalFilter = filter;
    
    return self;
}

@end
