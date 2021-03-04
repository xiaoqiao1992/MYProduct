//
//  GTNormalTableViewCell.m
//  SampleApp
//
//  Created by QQ on 2021/2/22.
//

#import "GTNormalTableViewCell.h"

@implementation GTNormalTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(290, 80, 50, 20)];
            button.layer.cornerRadius = 10;
            button.layer.masksToBounds = YES;
            button.layer.borderColor = [[UIColor grayColor] CGColor];
            button.layer.borderWidth = 2;
            
            
            [button setTitle:@"X" forState:UIControlStateNormal];
            [button setTitle:@"V" forState:UIControlStateHighlighted];
            button.backgroundColor = [UIColor blueColor];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        })];
    }
    return self;
}


-(void)buttonClick:(UIButton *)button{
    NSLog(@"didCLICK");
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickButton:)]) {
        [self.delegate tableViewCell:self clickButton:button];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
