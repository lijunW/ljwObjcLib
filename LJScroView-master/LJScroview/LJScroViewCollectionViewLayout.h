//
//  LJScroViewCollectionViewLayout.h
//  SifuBang
//
//  Created by wanglijun on 2018/3/13.
//  Copyright © 2018年 sifang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "LJScroView.h"

@class LJScroViewCollectionViewLayout;

@protocol LJScroViewCollectionViewLayoutDelegate <NSObject>
-(NSInteger)ljScroView_currentIndexOfCollectionViewLayout:(LJScroViewCollectionViewLayout *)layout;
-(LJScroDirection)ljScroView_currentScroDirectionOfCollectionViewLayout:(LJScroViewCollectionViewLayout *)layout;
@end

@interface LJScroViewCollectionViewLayout : UICollectionViewLayout
@property (nonatomic,assign) id <LJScroViewCollectionViewLayoutDelegate> delegate;
@end
