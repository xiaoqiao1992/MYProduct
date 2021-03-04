//
//  GTNormalTableViewCell.h
//  SampleApp
//
//  Created by QQ on 2021/2/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTNormalTableViewCellDelegate <NSObject>

-(void)tableViewCell:(UITableViewCell *)tableViewCell clickButton:(UIButton *)button;

@end

@interface GTNormalTableViewCell : UITableViewCell

@property (nonatomic, weak) id<GTNormalTableViewCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
