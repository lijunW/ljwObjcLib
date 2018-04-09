//
//  LJScroViewCell.m
//  SifuBang
//
//  Created by wanglijun on 2018/3/13.
//  Copyright © 2018年 sifang. All rights reserved.
//

#import "LJScroViewCell.h"

@implementation LJScroViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setSubviews];
    }
    return self;
}

-(void)setSubviews{

    //self.backgroundColor = UIColorWhite;
   //self.contentView.backgroundColor = [UIColor qmui_randomColor];
    
//        self.qmui_shouldShowDebugColor = YES;
//        self.qmui_needsDifferentDebugColor = YES;
    
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}
@end
