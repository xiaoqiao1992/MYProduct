//
//  GTListLoad.m
//  SampleApp
//
//  Created by QQ on 2021/2/22.
//

#import "GTListLoad.h"
#import <AFNetworking/AFNetworking.h>



@implementation GTListLoad

-(void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finish{
    
 NSArray<GTListItem *> * liatData = [self readDataFromLocat];
    if (finish) {
        finish(YES,liatData.copy);
    } 
    
    
//    NSString * urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
//    NSURL * listUrl = [NSURL URLWithString:urlString];
//    NSURLRequest * listRequest = [NSURLRequest requestWithURL:listUrl];
//    NSURLSession * session = [NSURLSession sharedSession];
//
//    __weak typeof(self) weakSelf = self;
//
//    NSURLSessionTask * dataTask = [session dataTaskWithRequest:listRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        __strong typeof(self) strongSelf = weakSelf;
//      id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSArray * dataArray = [[(NSDictionary *)jsonObj objectForKey:@"result"] objectForKey:@"data"];
//        NSMutableArray * listItemArray = [NSMutableArray array];
//        for (NSDictionary * info in dataArray) {
//            GTListItem * model = [GTListItem new];
//            [model configWithDictionary:info];
//            [listItemArray addObject:model];
//        }
//        [strongSelf archiveListDataWithArray:listItemArray.copy];
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (finish) {
//                finish(error == nil,listItemArray.copy);
//            }
//        });
//    }];

//    [dataTask resume];
}


-(NSArray<GTListItem *> *)readDataFromLocat{
    NSArray * pathArray =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString * cachPath = [pathArray firstObject];
    NSString * listDataPath = [cachPath stringByAppendingPathComponent:@"GTData/list"];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    NSData * readListData = [fileManager contentsAtPath:listDataPath];
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readListData error:nil];
    if ([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] != 0) {
        return (NSArray<GTListItem *> *)unarchiveObj;
    }
    return nil;
}

-(void)archiveListDataWithArray:(NSArray<GTListItem *> *)array{
    NSArray * pathArray =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString * cachPath = pathArray[0];
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    //创建文件夹
    NSString * dataPath = [cachPath stringByAppendingPathComponent:@"GTData"];
    NSError * creatError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];
    
    //创建文件
    NSString * listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
//    NSData * listData = [@"abc" dataUsingEncoding:NSUTF8StringEncoding];
//    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
    
  NSData * listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
//
//    NSData * readListDdta = [fileManager contentsAtPath:listDataPath];
  //id unarchive = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readListDdta error:nil];
    
    
//    [[NSUserDefaults standardUserDefaults] setObject:listData forKey:@"listData"];
//    NSData * testData = [[NSUserDefaults standardUserDefaults] dataForKey:@"listData"];
//
//    id testDataList = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:testData error:nil];
    
    //查询文件
//    BOOL fileExis = [fileManager fileExistsAtPath:listDataPath];
    //删除文件
//    if (fileExis) {
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    
//    NSFileHandle * fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//    [fileHandle seekToEndOfFile];
//    [fileHandle writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileHandle synchronizeFile];
//    [fileHandle closeFile];
    
    NSLog(@"");
}


@end
