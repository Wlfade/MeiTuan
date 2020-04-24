//
//  UIImage+GetPointColor.m
//  GetImagePointColor
//
//  Created by Huang Peng on 17/3/9.
//  Copyright © 2017年 Golf. All rights reserved.
//

#import "UIImage+GetPointColor.h"

@implementation UIImage (GetPointColor)

- (UIColor *)colorAtPixel:(CGPoint)point
{
    //判断给定的点是否被一个CGRect包含
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), point))
    {
        return nil;
    }
    
    //颜色空间DeviceRGB
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    /*
     data               指向要渲染的绘制内存的地址。这个内存块的大小至少是（bytesPerRow*height）个字节
     
     width              bitmap的宽度,单位为像素
     
     height             bitmap的高度,单位为像素
     
     bitsPerComponent   内存中像素的每个组件的位数.例如，对于32位像素格式和RGB 颜色空间，你应该将这个值设为8.
     
     bytesPerRow        bitmap的每一行在内存所占的比特数
     
     colorspace         bitmap上下文使用的颜色空间。
     
     bitmapInfo         指定bitmap是否包含alpha通道，像素中alpha通道的相对位置，像素组件是整形还是浮点型等信息的字符串。
     */
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = {0, 0, 0, 0};
    
    CGContextRef context = CGBitmapContextCreate(pixelData,
                                                 1,
                                                 1,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    CGContextTranslateCTM(context, -point.x, point.y - self.size.height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), self.CGImage);
    CGContextRelease(context);
    
    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
