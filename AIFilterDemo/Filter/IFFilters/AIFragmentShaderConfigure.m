//
//  AIFragmentShaderConfigure.m
//  AIFilterDemo
//
//  Created by aizexin on 2018/1/31.
//  Copyright © 2018年 aizexin. All rights reserved.
//

#import "AIFragmentShaderConfigure.h"
NSString *const kIF1977ShaderString = SHADER_STRING
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



@implementation AIFragmentShaderConfigure
+(NSString *)get1997ShaderString {
    return kIF1977ShaderString;
}


@end


