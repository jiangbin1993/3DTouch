//
//  ViewController.m
//  3DTouch
//
//  Created by 斌 on 16/9/18.
//  Copyright © 2016年 斌. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationController.navigationBar.translucent = NO;
    [self setTableView];
    
    // 如果forcetouch可用，则注册，并且设置代理
    if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable){
        [self registerForPreviewingWithDelegate:self sourceView:self.tableView];
    }
}

- (void)setTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark tableView的代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%lu",indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.labelText = [NSString stringWithFormat:@"%lu",indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark  UIViewControllerPreviewingDelegate代理方法
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    NSIndexPath *indexpath = [_tableView indexPathForRowAtPoint:location];
    UITableViewCell *cell = [_tableView cellForRowAtIndexPath:indexpath];
    if (!cell) {
        return nil;
    }
    //pre-peek状态下，重点显示的区域
    previewingContext.sourceRect = cell.frame;
    
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.labelText = [NSString stringWithFormat:@"%lu",indexpath.row];
    //peek状态下，显示的view大小
    vc.preferredContentSize = CGSizeMake(0, 0);
    
    return vc;
}


-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
   
    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
