//
//  GTDeleteCellView.h
//  SampleApp
//
//  Created by QQ on 2021/2/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView
- (void)showFrame:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END
