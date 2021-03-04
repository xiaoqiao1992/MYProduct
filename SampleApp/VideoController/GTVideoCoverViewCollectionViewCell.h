//
//  GTVideoCoverViewCollectionViewCell.h
//  SampleApp
//
//  Created by QQ on 2021/3/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoCoverViewCollectionViewCell : UICollectionViewCell

-(void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
