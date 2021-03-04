//
//  GTListLoad.m
//  SampleApp
//
//  Created by QQ on 2021/2/22.
//

#import "GTListLoad.h"
#import <AFNetworking/AFNetworking.h>

@implementation GTListLoad

-(void)loadListData{
  
    NSString * urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL * listUrl = [NSURL URLWithString:urlString];
//    [[AFHTTPSessionManager manager] GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//    }];
    NSURLRequest * listRequest = [NSURLRequest requestWithURL:listUrl];
    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionTask * dataTask = [session dataTaskWithRequest:listRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
      id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSLog(@"");
    }];

    [dataTask resume];
}


@end
