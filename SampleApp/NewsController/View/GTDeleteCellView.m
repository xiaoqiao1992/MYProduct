//
//  GTDeleteCellView.m
//  SampleApp
//
//  Created by QQ on 2021/2/22.
//

#import "GTDeleteCellView.h"

@interface GTDeleteCellView ()
@property (nonatomic, strong) UIView * backGroundView;
@property (nonatomic, strong) UIButton * deleteButton;

@property (nonatomic, copy, readwrite) dispatch_block_t deleteBlock;

@end


@implementation GTDeleteCellView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _backGroundView = [[UIView alloc] initWithFrame:self.bounds];
            _backGroundView.backgroundColor = [UIColor blackColor];
            _backGroundView.alpha = 0.5;
            _backGroundView;
        })];
        
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            [_deleteButton addTarget:self action:@selector(didclickButton) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor blueColor];
            _deleteButton;
        })];
    }
    return self;
}

-(void)didclickButton{
    if (_deleteBlock) {
        _deleteBlock();
    }
    [self removeFromSuperview];
}

-(void)showFrame:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock{
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    _deleteBlock = [clickBlock copy];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)dismiss{
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
