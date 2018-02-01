//
//  IFWaldenFilter.m
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "IFWaldenFilter.h"

NSString *const kIFWaldenShaderString = SHADER_STRING
(
 precision lowp float;
 
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D inputImageTexture2; //map
 uniform sampler2D inputImageTexture3; //vigMap
 
 void main()
 {
     
     vec3 texel = texture2D(inputImageTexture, textureCoordinate).rgb;
     
     texel = vec3(
                  texture2D(inputImageTexture2, vec2(texel.r, .16666)).r,
                  texture2D(inputImageTexture2, vec2(texel.g, .5)).g,
                  texture2D(inputImageTexture2, vec2(texel.b, .83333)).b);
     
     vec2 tc = (2.0 * textureCoordinate) - 1.0;
     float d = dot(tc, tc);
     vec2 lookup = vec2(d, texel.r);
     texel.r = texture2D(inputImageTexture3, lookup).r;
     lookup.y = texel.g;
     texel.g = texture2D(inputImageTexture3, lookup).g;
     lookup.y = texel.b;
     texel.b	= texture2D(inputImageTexture3, lookup).b;
     
     gl_FragColor = vec4(texel, 1.0);
 }
);

@implementation AIFilterIFWalden

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kIFWaldenShaderString]))
    {
		return nil;
    }
    
    return self;
}

@end
@implementation IFWaldenFilter

- (id)init
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    AIFilterIFWalden *filter = [[AIFilterIFWalden alloc] init];
    [self addFilter:filter];
    
    UIImage *image1 = [UIImage imageNamed:@"waldenMap"];
    imageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    [imageSource1 addTarget:filter atTextureLocation:1];
    [imageSource1 processImage];
    
    UIImage *image2 = [UIImage imageNamed:@"vignetteMap"];
    imageSource2 = [[GPUImagePicture alloc] initWithImage:image2];
    [imageSource2 addTarget:filter atTextureLocation:2];
    [imageSource2 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:filter, nil];
    self.terminalFilter = filter;
    
    return self;
}

@end

