//
//  GTVideoCoverViewCollectionViewCell.m
//  SampleApp
//
//  Created by QQ on 2021/3/1.
//

#import "GTVideoCoverViewCollectionViewCell.h"
#import "GTVideoPlayer.h"
#import "GTVideoToolbar.h"

@interface GTVideoCoverViewCollectionViewCell()

@property (nonatomic, strong) UIImageView * coverView;
@property (nonatomic, strong) UIImageView * playButton;
@property (nonatomic, strong) NSString * videoUrl;
@property (nonatomic, strong) GTVideoToolbar * toolBar;
@end


@implementation GTVideoCoverViewCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - GTVideoToolbarHeight)];
            _coverView;
        })];
        
        [self addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50)/2, (frame.size.height - 50 - GTVideoToolbarHeight)/2, 50, 50)];
            _playButton.image = [UIImage imageNamed:@"icon.bundle/videoPlay@3x.png"];
            _playButton.backgroundColor = [UIColor redColor];
            _playButton;
        })];
        
       
        [self addSubview:({
            _toolBar = [[GTVideoToolbar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width, GTVideoToolbarHeight)];
            _toolBar;
        })];
        
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSelf)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

-(void)didSelf{
    NSLog(@"点击播放");
    [[GTVideoPlayer player] playVideoWithUrl:_videoUrl attachView:_coverView];
}
#pragma mark - public

-(void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
    _coverView.image = [UIImage imageNamed:@"videoCoverUrl"];
    _videoUrl = videoUrl;
    [_toolBar layoutWithModel:nil];
}

@end
