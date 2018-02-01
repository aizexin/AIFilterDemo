//
//  IFSutroFilter.m
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "IFSutroFilter.h"

NSString *const kIFSutroShaderString = SHADER_STRING
(
 precision lowp float;
 
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D inputImageTexture2; //sutroMap;
 uniform sampler2D inputImageTexture3; //sutroMetal;
 uniform sampler2D inputImageTexture4; //softLight
 uniform sampler2D inputImageTexture5; //sutroEdgeburn
 uniform sampler2D inputImageTexture6; //sutroCurves
 
 void main()
 {
     vec3 texel = texture2D(inputImageTexture, textureCoordinate).rgb;
     
     vec2 tc = (2.0 * textureCoordinate) - 1.0;
     float d = dot(tc, tc);
     vec2 lookup = vec2(d, texel.r);
     texel.r = texture2D(inputImageTexture2, lookup).r;
     lookup.y = texel.g;
     texel.g = texture2D(inputImageTexture2, lookup).g;
     lookup.y = texel.b;
     texel.b	= texture2D(inputImageTexture2, lookup).b;
     
     vec3 rgbPrime = vec3(0.1019, 0.0, 0.0); 
     float m = dot(vec3(.3, .59, .11), texel.rgb) - 0.03058;
     texel = mix(texel, rgbPrime + m, 0.32);
     
     vec3 metal = texture2D(inputImageTexture3, textureCoordinate).rgb;
     texel.r = texture2D(inputImageTexture4, vec2(metal.r, texel.r)).r;
     texel.g = texture2D(inputImageTexture4, vec2(metal.g, texel.g)).g;
     texel.b = texture2D(inputImageTexture4, vec2(metal.b, texel.b)).b;
     
     texel = texel * texture2D(inputImageTexture5, textureCoordinate).rgb;
     
     texel.r = texture2D(inputImageTexture6, vec2(texel.r, .16666)).r;
     texel.g = texture2D(inputImageTexture6, vec2(texel.g, .5)).g;
     texel.b = texture2D(inputImageTexture6, vec2(texel.b, .83333)).b;
     
     
     gl_FragColor = vec4(texel, 1.0);
 }
);

@implementation AIFilterIFSutroFilter

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kIFSutroShaderString]))
    {
		return nil;
    }
    
    return self;
}

@end

@implementation IFSutroFilter

- (id)init
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    AIFilterIFSutroFilter *filter = [[AIFilterIFSutroFilter alloc] init];
    [self addFilter:filter];
    
    UIImage *image1 = [UIImage imageNamed:@"vignetteMap"];
    imageSource1 = [[GPUImagePicture alloc] initWithImage:image1];
    [imageSource1 addTarget:filter atTextureLocation:1];
    [imageSource1 processImage];
    
    UIImage *image2 = [UIImage imageNamed:@"sutroMetal"];
    imageSource2 = [[GPUImagePicture alloc] initWithImage:image2];
    [imageSource2 addTarget:filter atTextureLocation:2];
    [imageSource2 processImage];
    
    UIImage *image3 = [UIImage imageNamed:@"softLight"];
    imageSource3 = [[GPUImagePicture alloc] initWithImage:image3];
    [imageSource3 addTarget:filter atTextureLocation:3];
    [imageSource3 processImage];
    
    UIImage *image4 = [UIImage imageNamed:@"sutroEdgeBurn"];
    imageSource4 = [[GPUImagePicture alloc] initWithImage:image4];
    [imageSource4 addTarget:filter atTextureLocation:4];
    [imageSource4 processImage];
    
    UIImage *image5 = [UIImage imageNamed:@"sutroCurves"];
    imageSource5 = [[GPUImagePicture alloc] initWithImage:image5];
    [imageSource5 addTarget:filter atTextureLocation:5];
    [imageSource5 processImage];
    
    self.initialFilters = [NSArray arrayWithObjects:filter, nil];
    self.terminalFilter = filter;
    
    return self;
}

@end
