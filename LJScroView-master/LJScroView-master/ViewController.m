//
//  ViewController.m
//  LJScroView-master
//
//  Created by wanglijun on 2018/3/14.
//  Copyright © 2018年 wanglijun. All rights reserved.
//

#import "ViewController.h"

#import "LJScroView.h"

@interface ViewController ()
@property (nonatomic,strong)LJMainScrollView * ljScroView;
@property (nonatomic,strong)NSMutableArray * dataSourceArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSourceArray = [[NSMutableArray alloc]init];
    
    NSArray * iamgeUrls = @[@"http://ovn0zb2g7.bkt.clouddn.com/3d%E7%90%83%E4%BA%8C%E8%BF%9B%E5%88%B6%E4%BB%A3%E7%A0%81-10777513.jpg",@"http://ovn0zb2g7.bkt.clouddn.com/60bc7af2044147ed152eb7848bd29739.jpg",@"http://ovn0zb2g7.bkt.clouddn.com/7eb4452c79bef82cd4f1cb4a75e7ad01.jpg",@"http://ovn0zb2g7.bkt.clouddn.com/89afaf2122da19c1edb97bfbfb874593.jpg",@"http://ovn0zb2g7.bkt.clouddn.com/Simulator%20Screen%20Shot%20-%20iPhone%206s%20Plus%20-%202018-01-11%20at%2015.57.49.png",@"http://ovn0zb2g7.bkt.clouddn.com/favicon.png",@"http://ovn0zb2g7.bkt.clouddn.com/head7_100x100@@2x.png"];
    
    for (NSString * imageUrl in iamgeUrls) {
        LJScroViewItem * item = [[LJScroViewItem alloc] init];
        item.fullImageUrlString = imageUrl;
        [self.dataSourceArray addObject:item];
    }
    
    self.ljScroView = [[LJMainScrollView alloc]initWithItems:self.dataSourceArray frame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
    
    [self.view addSubview:self.ljScroView];
    
    
    
}


@end
