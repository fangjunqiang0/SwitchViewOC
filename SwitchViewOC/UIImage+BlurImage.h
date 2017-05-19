//
//  UIImage+BlurImage.h
//  SwitchViewOC
//
//  Created by 鹭源 on 2017/5/16.
//  Copyright © 2017年 luyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BlurImage)
+(UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
@end
