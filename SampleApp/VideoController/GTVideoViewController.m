//
//  GTVideoViewController.m
//  SampleApp
//
//  Created by QQ on 2021/2/19.
//

#import "GTVideoViewController.h"
#import "GTDetailViewController.h"
#import "GTVideoCoverViewCollectionViewCell.h"
#import <AVKit/AVKit.h>
#import "GTVideoPlayer.h"
#import "GTVideoToolbar.h"


@interface GTVideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//@property (nonatomic, strong) AVPlayerViewController * VC;


@end

@implementation GTVideoViewController
-(instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//
    UICollectionViewFlowLayout * flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width /16 * 9 + GTVideoToolbarHeight);


    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
//    collectionView.contentInsetAdjustmentBehavior
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [collectionView registerClass:[GTVideoCoverViewCollectionViewCell class] forCellWithReuseIdentifier:@"GTVideoCoverViewCollectionViewCell"];
    [self.view addSubview:collectionView];
    
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSelfView)];
//    [self.view addGestureRecognizer:tap];
    
    
   
    
   
    
    
}


-(void)didSelfView{
    AVPlayerViewController * VC = [[AVPlayerViewController alloc] init];
    VC.player = [AVPlayer playerWithURL:[NSURL URLWithString:@"https://rtc.oss-cn-beijing.aliyuncs.com/record/live/700/2019-09-26-17-04-38_2019-09-26-17-16-33.mp4"]];
    VC.view.frame = self.view.bounds;
    VC.view.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    VC.showsPlaybackControls = YES;
//    [self.view addSubview:sVC.view];
    [VC.player play];
    [self.navigationController pushViewController:VC animated:YES];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GTDetailViewController * vc = [GTDetailViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}




-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GTVideoCoverViewCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTVideoCoverViewCollectionViewCell" forIndexPath:indexPath];
    if ([cell isKindOfClass:[GTVideoCoverViewCollectionViewCell class]]) {
        //http://clips.vorwaerts-gmbh.dee/big_buck_bunny.mp4
        [cell layoutWithVideoCoverUrl:@"icon.bundle/videoCover@3x.png" videoUrl:@"https://rtc.oss-cn-beijing.aliyuncs.com/record/live/700/2019-09-26-17-04-38_2019-09-26-17-16-33.mp4"];
        
    }
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.item % 3 == 0) {
//        return CGSizeMake(self.view.frame.size.width, 100);
//    } else {
//        return CGSizeMake((self.view.frame.size.width - 10)/2, 300);
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
