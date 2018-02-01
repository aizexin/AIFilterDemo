//
//  GPUImageFiveInputFilter.h
//  AIFilterDemo
//
//  Created by aizexin on 2018/2/1.
//  Copyright © 2018年 aizexin. All rights reserved.
//

#import "GPUImageFourInputFilter.h"

@interface GPUImageFiveInputFilter : GPUImageFourInputFilter
{
    GPUImageFramebuffer *fifthInputFramebuffer;
    
    GLint filterfifthTextureCoordinateAttribute;
    GLint filterInputTextureUniform5;
    GPUImageRotationMode inputRotation5;
    GLuint filterSourceTexture5;
    CMTime fifthFrameTime;
    
    BOOL hasSetFourTexture, hasReceivedFifthFrame, fifthFrameWasVideo;
    BOOL fifthFrameCheckDisabled;
}
@end
