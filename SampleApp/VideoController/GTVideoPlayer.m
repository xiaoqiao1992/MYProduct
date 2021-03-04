//
//  GTVideoPlayer.m
//  SampleApp
//
//  Created by QQ on 2021/3/2.
//

#import "GTVideoPlayer.h"

@implementation GTVideoPlayer
#pragma mark - public
+(GTVideoPlayer *)player{
    static GTVideoPlayer * player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[GTVideoPlayer alloc] init];
    });
    return player;
}
-(void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView{
    [self stopPlay];
    
    AVAsset * asset = [AVAsset assetWithURL:[NSURL URLWithString:videoUrl]];
    self.vodeoItem = [AVPlayerItem playerItemWithAsset:asset];
    
    [_vodeoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_vodeoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
    self.avPlayer = [AVPlayer playerWithPlayerItem:self.vodeoItem];
    [self.avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"播放进度：%f", CMTimeGetSeconds(time));
    }];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
    self.playerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer:self.playerLayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlerPlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];

}

-(void)stopPlay{
    [_playerLayer removeFromSuperlayer];
    [_vodeoItem removeObserver:self forKeyPath:@"status"];
    [_vodeoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    _vodeoItem = nil;
    _avPlayer = nil;

}


-(void)handlerPlayEnd{
    NSLog(@"播放完");
    [_avPlayer seekToTime:CMTimeMake(0, 1)];
    [_avPlayer play];
}


#pragma mark - kvo
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqual:@"status"]) {
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerStatusReadyToPlay) {
            [self.avPlayer play];
            CMTime duration = self.vodeoItem.duration;
            CGFloat durationCount = CMTimeGetSeconds(duration);
            NSLog(@"%f",durationCount);
        } else {
            NSLog(@"失败");
        }
    } else if([keyPath isEqual:@"loadedTimeRanges"]){
        NSLog(@"缓冲：%@",[change objectForKey:NSKeyValueChangeNewKey]);
    }
}



@end
