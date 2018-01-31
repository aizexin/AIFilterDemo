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

NSString *const kIFAmaroShaderString = SHADER_STRING
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

NSString *const kIFBrannanShaderString = SHADER_STRING
(
 precision lowp float;
 
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D inputImageTexture2;  //process
 uniform sampler2D inputImageTexture3;  //blowout
 uniform sampler2D inputImageTexture4;  //contrast
 uniform sampler2D inputImageTexture5;  //luma
 uniform sampler2D inputImageTexture6;  //screen
 
 mat3 saturateMatrix = mat3(
                            1.105150,
                            -0.044850,
                            -0.046000,
                            -0.088050,
                            1.061950,
                            -0.089200,
                            -0.017100,
                            -0.017100,
                            1.132900);
 
 vec3 luma = vec3(.3, .59, .11);
 
 void main()
 {
     
     vec3 texel = texture2D(inputImageTexture, textureCoordinate).rgb;
     
     vec2 lookup;
     lookup.y = 0.5;
     lookup.x = texel.r;
     texel.r = texture2D(inputImageTexture2, lookup).r;
     lookup.x = texel.g;
     texel.g = texture2D(inputImageTexture2, lookup).g;
     lookup.x = texel.b;
     texel.b = texture2D(inputImageTexture2, lookup).b;
     
     texel = saturateMatrix * texel;
     
     
     vec2 tc = (2.0 * textureCoordinate) - 1.0;
     float d = dot(tc, tc);
     vec3 sampled;
     lookup.y = 0.5;
     lookup.x = texel.r;
     sampled.r = texture2D(inputImageTexture3, lookup).r;
     lookup.x = texel.g;
     sampled.g = texture2D(inputImageTexture3, lookup).g;
     lookup.x = texel.b;
     sampled.b = texture2D(inputImageTexture3, lookup).b;
     float value = smoothstep(0.0, 1.0, d);
     texel = mix(sampled, texel, value);
     
     lookup.x = texel.r;
     texel.r = texture2D(inputImageTexture4, lookup).r;
     lookup.x = texel.g;
     texel.g = texture2D(inputImageTexture4, lookup).g;
     lookup.x = texel.b;
     texel.b = texture2D(inputImageTexture4, lookup).b;
     
     
     lookup.x = dot(texel, luma);
     texel = mix(texture2D(inputImageTexture5, lookup).rgb, texel, .5);
     
     lookup.x = texel.r;
     texel.r = texture2D(inputImageTexture6, lookup).r;
     lookup.x = texel.g;
     texel.g = texture2D(inputImageTexture6, lookup).g;
     lookup.x = texel.b;
     texel.b = texture2D(inputImageTexture6, lookup).b;
     
     gl_FragColor = vec4(texel, 1.0);
 }
 );

@implementation AIFragmentShaderConfigure
+(NSString *)get1997ShaderString {
    return kIF1977ShaderString;
}
+(NSString *)getAmaroShaderString {
    return kIFAmaroShaderString;
}
+(NSString *)getBrannanShaderString {
    return kIFBrannanShaderString;
}

@end


