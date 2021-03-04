//
//  GTListItem.h
//  SampleApp
//
//  Created by QQ on 2021/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/// 列表结构化数据
@interface GTListItem : NSObject<NSSecureCoding>

@property (nonatomic,copy,readwrite) NSString * category;
@property (nonatomic,copy,readwrite) NSString * picUrl;
@property (nonatomic,copy,readwrite) NSString * uniquekey;
@property (nonatomic,copy,readwrite) NSString * title;
@property (nonatomic,copy,readwrite) NSString * date;
@property (nonatomic,copy,readwrite) NSString * author_name;
@property (nonatomic,copy,readwrite) NSString * articleUrl;

-(void)configWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
