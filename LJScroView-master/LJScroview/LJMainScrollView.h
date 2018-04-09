//
//  LJMainScrollView.h
//  LJScroView-master
//
//  Created by wanglijun on 2018/3/14.
//  Copyright © 2018年 wanglijun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJScroViewItem.h"

@interface LJMainScrollView : UIScrollView
-(instancetype)initWithItems:(NSArray <LJScroViewItem *>*)Items frame:(CGRect)frame;
@end
