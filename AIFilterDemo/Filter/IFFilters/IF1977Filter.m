//
//  IF1977Filter.m
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "IF1977Filter.h"
#import "AIFragmentShaderConfigure.h"

@implementation AIFilter1977

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:[AIFragmentShaderConfigure get1997ShaderString]]))
    {
        return nil;
    }
    
    return self;
}

@end

@implementation IF1977Filter

- (id)init
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    AIFilter1977 *filter = [[AIFilter1977 alloc] init];
    [self addFilter:filter];
    
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
