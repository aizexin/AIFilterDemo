//
//  GPUImageSixInputFilter.h
//  AIFilterDemo
//
//  Created by aizexin on 2018/2/1.
//  Copyright © 2018年 aizexin. All rights reserved.
//

#import "GPUImageFiveInputFilter.h"

@interface GPUImageSixInputFilter : GPUImageFiveInputFilter
{
    GPUImageFramebuffer *sixthInputFramebuffer;
    
    GLint filtersixthTextureCoordinateAttribute;
    GLint filterInputTextureUniform6;
    GPUImageRotationMode inputRotation6;
    GLuint filterSourceTexture6;
    CMTime sixthFrameTime;
    
    BOOL hasSetFiveTexture, hasReceivedSixthFrame, sixthFrameWasVideo;
    BOOL sixthFrameCheckDisabled;
}
@end
