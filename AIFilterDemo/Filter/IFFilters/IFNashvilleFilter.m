//
//  IFNashvilleFilter.m
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "IFNashvilleFilter.h"

NSString *const kIFNashvilleShaderString = SHADER_STRING
(
 precision lowp float;
 
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D inputImageTexture2;
 
 void main()
 {
     vec3 texel = texture2D(inputImageTexture, textureCoordinate).rgb;
     texel = vec3(
                  texture2D(inputImageTexture2, vec2(texel.r, .16666)).r,
                  texture2D(inputImageTexture2, vec2(texel.g, .5)).g,
                  texture2D(inputImageTexture2, vec2(texel.b, .83333)).b);
     gl_FragColor = vec4(texel, 1.0);
 }
);

@implementation AIFilterIFNashville

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kIFNashvilleShaderString]))
    {
		return nil;
    }
    
    return self;
}

@end

@implementation IFNashvilleFilter

- (id)init
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    AIFilterIFNashville *filter = [[AIFilterIFNashville alloc] init];
    [self addFilter:filter];
    
    UIImage *image1 = [UIImage imageNamed:@"nashvilleMap"];
    imageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    [imageSource1 addTarget:filter atTextureLocation:1];
    [imageSource1 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:filter, nil];
    self.terminalFilter = filter;
    
    return self;
}

@end
