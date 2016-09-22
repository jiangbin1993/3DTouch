
//
//  SecondViewController.m
//  3DTouch
//
//  Created by 斌 on 16/9/18.
//  Copyright © 2016年 斌. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

//新增一个数组属性，来存储PreviewAction；
@property (nonatomic,strong) NSArray *arrayPreviewActions;

@end

@implementation SecondViewController

//previewActionItems方法中返回存储PreviewAction的数组；
-(NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    return self.arrayPreviewActions;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    label.text = self.labelText;
    [self.view addSubview:label];
    
        //设置previewActions
    self.arrayPreviewActions = @[
                                 [UIPreviewAction actionWithTitle:@"OK" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
                                     NSLog(@"Press OK");
                                 }],
                                 [UIPreviewAction actionWithTitle:@"Cancel" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
                                     NSLog(@"Press Cancel");
                                 }],
                                 ];
    
}

@end
