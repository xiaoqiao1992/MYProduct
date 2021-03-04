//
//  GTListLoad.h
//  SampleApp
//
//  Created by QQ on 2021/2/22.
//

#import <Foundation/Foundation.h>
#import "GTListItem.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<GTListItem *> * dataArray);


@interface GTListLoad : NSObject

/// 列表请求
-(void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finish;
@end

NS_ASSUME_NONNULL_END
