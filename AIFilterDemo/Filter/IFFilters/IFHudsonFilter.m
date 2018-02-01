//
//  IFHudsonFilter.m
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "IFHudsonFilter.h"

NSString *const kIFHudsonShaderString = SHADER_STRING
(
 precision lowp float;
 
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D inputImageTexture2; //blowout;
 uniform sampler2D inputImageTexture3; //overlay;
 uniform sampler2D inputImageTexture4; //map
 
 void main()
 {
     
     vec4 texel = texture2D(inputImageTexture, textureCoordinate);
     
     vec3 bbTexel = texture2D(inputImageTexture2, textureCoordinate).rgb;
     
     texel.r = texture2D(inputImageTexture3, vec2(bbTexel.r, texel.r)).r;
     texel.g = texture2D(inputImageTexture3, vec2(bbTexel.g, texel.g)).g;
     texel.b = texture2D(inputImageTexture3, vec2(bbTexel.b, texel.b)).b;
     
     vec4 mapped;
     mapped.r = texture2D(inputImageTexture4, vec2(texel.r, .16666)).r;
     mapped.g = texture2D(inputImageTexture4, vec2(texel.g, .5)).g;
     mapped.b = texture2D(inputImageTexture4, vec2(texel.b, .83333)).b;
     mapped.a = 1.0;
     gl_FragColor = mapped;
 }
);

@implementation AIFilterHudson

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kIFHudsonShaderString]))
    {
		return nil;
    }
    
    return self;
}

@end

@implementation IFHudsonFilter

- (id)init
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    AIFilterHudson *filter = [[AIFilterHudson alloc] init];
    [self addFilter:filter];
    
    UIImage *image1 = [UIImage imageNamed:@"hudsonBackground"];
    imageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    [imageSource1 addTarget:filter atTextureLocation:1];
    [imageSource1 processImage];
    
    UIImage *image2 = [UIImage imageNamed:@"overlayMap"];
    imageSource2 = [[GPUImagePicture alloc] initWithImage:image2];
    [imageSource2 addTarget:filter atTextureLocation:2];
    [imageSource2 processImage];
    
    UIImage *image3 = [UIImage imageNamed:@"hudsonMap"];
    imageSource3 = [[GPUImagePicture alloc] initWithImage:image3];
    [imageSource3 addTarget:filter atTextureLocation:3];
    [imageSource3 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:filter, nil];
    self.terminalFilter = filter;
    
    return self;
}

@end
