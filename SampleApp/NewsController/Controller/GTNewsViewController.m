//
//  ViewController.m
//  SampleApp
//
//  Created by QQ on 2021/2/3.
//

#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDeleteCellView.h"
#import "GTListLoad.h"

@interface GTNewsViewController ()<UITableViewDelegate,UITableViewDataSource,GTNormalTableViewCellDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) GTListLoad * listLoad;

@end

@implementation GTNewsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArray = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        [self.dataArray addObject:@(i)];
    }
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.tableView registerClass:[GTNormalTableViewCell class] forCellReuseIdentifier:@"GTNormalTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.listLoad = [[GTListLoad alloc] init];
    [self.listLoad loadListData];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GTNormalTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GTNormalTableViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    return cell;
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickButton:(UIButton *)button{
    GTDeleteCellView * view = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
    CGRect rect = [tableViewCell convertRect:button.frame toView:nil];
    
    
    __weak typeof(self) wself = self;
    
    [view showFrame:rect.origin clickBlock:^{
        __strong typeof(self) strongSelf = wself;
        [strongSelf.dataArray removeLastObject];
        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationRight];
    }];
    
}

-(void)pushController{
    UIViewController * vc = [UIViewController new];
    vc.navigationItem.title = @"内容";
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController pushViewController:vc animated:YES];
}




@end
