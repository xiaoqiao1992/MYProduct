//
//  GTScreen.h
//  SampleApp
//
//  Created by QQ on 2021/3/3.
//

#import <UIKit/UIKit.h>
@class GTScreen;

NS_ASSUME_NONNULL_BEGIN

#define IS_LANDSCAPE (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))
#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)


#define IS_IPHONE_X_XR_MAX (IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XMAX)


#define IS_IPHONE_X (SCREEN_WIDTH == [GTScreen sizeFor58Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor58Inch].height)

#define IS_IPHONE_XR (SCREEN_WIDTH == [GTScreen sizeFor61Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor61Inch].height && [UIScreen mainScreen].scale == 2)

#define IS_IPHONE_XMAX (SCREEN_WIDTH == [GTScreen sizeFor65Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor65Inch].height && [UIScreen mainScreen].scale == 3)


#define STATUSBARHEIGHT (IS_IPHONE_X_XR_MAX ? 44 : 20)





#define UI(x) UIAdapter(x)
#define UIRect(x,y,width,height) UIRectAdaoter(x,y,width,height)

static inline NSInteger UIAdapter(float x){
    //根据屏幕宽度比例适配
    CGFloat scal = 414 / SCREEN_WIDTH;
    return (NSInteger)x/scal;
}

static inline CGRect UIRectAdaoter(x,y,width,height){
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}


@interface GTScreen : NSObject

//iphone xs max
+ (CGSize)sizeFor65Inch;

//iphone xr
+ (CGSize)sizeFor61Inch;

// iphonex
+ (CGSize)sizeFor58Inch;

@end

NS_ASSUME_NONNULL_END
  
　
