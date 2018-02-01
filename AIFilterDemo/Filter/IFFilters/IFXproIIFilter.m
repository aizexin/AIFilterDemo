//
//  IFXproIIFilter.m
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "IFXproIIFilter.h"

NSString *const kIFXproIIShaderString = SHADER_STRING
(
 precision lowp float;
 
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D inputImageTexture2; //map
 uniform sampler2D inputImageTexture3; //vigMap
 
 void main()
 {
     
     vec3 texel = texture2D(inputImageTexture, textureCoordinate).rgb;
     
     vec2 tc = (2.0 * textureCoordinate) - 1.0;
     float d = dot(tc, tc);
     vec2 lookup = vec2(d, texel.r);
     texel.r = texture2D(inputImageTexture3, lookup).r;
     lookup.y = texel.g;
     texel.g = texture2D(inputImageTexture3, lookup).g;
     lookup.y = texel.b;
     texel.b	= texture2D(inputImageTexture3, lookup).b;
     
     vec2 red = vec2(texel.r, 0.16666);
     vec2 green = vec2(texel.g, 0.5);
     vec2 blue = vec2(texel.b, .83333);
     texel.r = texture2D(inputImageTexture2, red).r;
     texel.g = texture2D(inputImageTexture2, green).g;
     texel.b = texture2D(inputImageTexture2, blue).b;
     
     gl_FragColor = vec4(texel, 1.0);
     
 }
);

@implementation AIFilterIFXpro

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kIFXproIIShaderString]))
    {
		return nil;
    }
    
    return self;
}

@end

@implementation IFXproIIFilter

- (id)init
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    AIFilterIFXpro *filter = [[AIFilterIFXpro alloc] init];
    [self addFilter:filter];
    
    UIImage *image1 = [UIImage imageNamed:@"xproMap"];
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
