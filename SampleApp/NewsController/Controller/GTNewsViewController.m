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
#import "GTDetailViewController.h"

@interface GTNewsViewController ()<UITableViewDelegate,UITableViewDataSource,GTNormalTableViewCellDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * dataArray;
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
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.tableView registerClass:[GTNormalTableViewCell class] forCellReuseIdentifier:@"GTNormalTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.listLoad = [[GTListLoad alloc] init];
    __weak typeof(self) wself = self;
    [self.listLoad loadListDataWithFinishBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
        __strong typeof(self) strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
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
    [cell layoutTableViewCellWithItem:self.dataArray[indexPath.row]];
    return cell;
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickButton:(UIButton *)button{
    GTDeleteCellView * view = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
    CGRect rect = [tableViewCell convertRect:button.frame toView:nil];
    
    
    __weak typeof(self) wself = self;
    
    [view showFrame:rect.origin clickBlock:^{
        __strong typeof(self) strongSelf = wself;
        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationRight];
    }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GTListItem * item = self.dataArray[indexPath.row];
    GTDetailViewController * vc = [[GTDetailViewController alloc] initWithUrlString:item.articleUrl];
    vc.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    [self.navigationController pushViewController:vc animated:YES];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.uniquekey];
}

-(void)pushController{
    UIViewController * vc = [UIViewController new];
    vc.navigationItem.title = @"内容";
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController pushViewController:vc animated:YES];
}




@end
