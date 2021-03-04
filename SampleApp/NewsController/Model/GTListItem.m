//
//  GTListItem.m
//  SampleApp
//
//  Created by QQ on 2021/2/23.
//

#import "GTListItem.h"

@implementation GTListItem
-(void)configWithDictionary:(NSDictionary *)dictionary{
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];;
    self.uniquekey = [dictionary objectForKey:@"uniquekey"];;
    self.title = [dictionary objectForKey:@"title"];;
    self.date = [dictionary objectForKey:@"date"];;
    self.author_name = [dictionary objectForKey:@"author_name"];;
    self.articleUrl = [dictionary objectForKey:@"url"];
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    self = [super init];
    if (self) {
        self.category = [coder decodeObjectForKey:@"category"];
        self.picUrl = [coder decodeObjectForKey:@"thumbnail_pic_s"];;
        self.uniquekey = [coder decodeObjectForKey:@"uniquekey"];;
        self.title = [coder decodeObjectForKey:@"title"];;
        self.date = [coder decodeObjectForKey:@"date"];;
        self.author_name = [coder decodeObjectForKey:@"author_name"];;
        self.articleUrl = [coder decodeObjectForKey:@"url"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.picUrl forKey:@"thumbnail_pic_s"];
    [coder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.date forKey:@"category"];
    [coder encodeObject:self.category forKey:@"date"];
    [coder encodeObject:self.author_name forKey:@"author_name"];
    [coder encodeObject:self.articleUrl forKey:@"url"];

}

+(BOOL)supportsSecureCoding{
    return YES;
}


@end

