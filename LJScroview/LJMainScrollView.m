//
//  LJMainScrollView.m
//  LJScroView-master
//
//  Created by wanglijun on 2018/3/14.
//  Copyright © 2018年 wanglijun. All rights reserved.
//

#import "LJMainScrollView.h"

#define LJSCROVIEW_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@interface LJMainScrollView ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIImageView * centerImageView;
@property (nonatomic,strong)UIImageView * leftImageView;
@property (nonatomic,strong)UIImageView * rightImageView;

@property (nonatomic, strong) NSMutableArray <LJScroViewItem *>* dataSourceArray;


@end

@implementation LJMainScrollView
-(instancetype)initWithItems:(NSArray <LJScroViewItem *>*)Items frame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        
        self.dataSourceArray = Items.copy;
        self.pagingEnabled = YES;
        
        [self setContentSize:CGSizeMake(LJSCROVIEW_SCREEN_WIDTH * 2, 0)];
        [self setContentOffset:CGPointMake(-60, 0)];
        
        [self setsubview];
        self.delegate = self;
    }
    return self;
}

-(void)setsubview{
    _centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, LJSCROVIEW_SCREEN_WIDTH, LJSCROVIEW_SCREEN_WIDTH)];
    _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-60, 0, LJSCROVIEW_SCREEN_WIDTH, LJSCROVIEW_SCREEN_WIDTH)];
    _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 0, LJSCROVIEW_SCREEN_WIDTH, LJSCROVIEW_SCREEN_WIDTH)];
    
    [_centerImageView setBackgroundColor:[UIColor greenColor]];
    [_leftImageView setBackgroundColor:[UIColor orangeColor]];
    [_rightImageView setBackgroundColor:[UIColor blueColor]];
    
    [self addSubview:_leftImageView];
    [self addSubview:_rightImageView];
    [self addSubview:_centerImageView];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    CGFloat ItemOffset = 60;
    if ([[scrollView.subviews firstObject] isEqual:_centerImageView]) {
        _centerImageView.frame = CGRectMake(0, 0, LJSCROVIEW_SCREEN_WIDTH, LJSCROVIEW_SCREEN_WIDTH);
        
        CGFloat rightx = contentOffsetX + ItemOffset -  (contentOffsetX / LJSCROVIEW_SCREEN_WIDTH) *  ItemOffset ;
        _rightImageView.frame = CGRectMake(rightx, 0, LJSCROVIEW_SCREEN_WIDTH, LJSCROVIEW_SCREEN_WIDTH);
        
        
        CGFloat lrftx = contentOffsetX*(contentOffsetX/LJSCROVIEW_SCREEN_WIDTH) -ItemOffset + 2 * ItemOffset * (contentOffsetX/LJSCROVIEW_SCREEN_WIDTH);
        _leftImageView.frame = CGRectMake(lrftx, 0, LJSCROVIEW_SCREEN_WIDTH, LJSCROVIEW_SCREEN_WIDTH);
        
    }else if ([[scrollView.subviews firstObject] isEqual:_rightImageView]){
        
    }else if ([[scrollView.subviews firstObject] isEqual:_leftImageView]){
        
    }
}

@end
