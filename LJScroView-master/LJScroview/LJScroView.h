//
//  LJScroView.h
//  SifuBang
//
//  Created by wanglijun on 2018/3/13.
//  Copyright © 2018年 sifang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJScroViewItem.h"
#import "LJMainScrollView.h"

typedef enum : NSUInteger {
    LJScroDirectionToLeft = 0,
    LJScroDirectionToRight,
} LJScroDirection;

@interface LJScroView : UIView
-(instancetype)initWithItems:(NSArray <LJScroViewItem *>*)Items frame:(CGRect)frame;
@end
