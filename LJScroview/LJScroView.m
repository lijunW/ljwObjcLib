//
//  LJScroView.m
//  SifuBang
//
//  Created by wanglijun on 2018/3/13.
//  Copyright © 2018年 sifang. All rights reserved.
//

#import "LJScroView.h"

#import "LJScroViewCell.h"
#import "LJScroViewCollectionViewLayout.h"



@interface LJScroView ()<UICollectionViewDataSource, UICollectionViewDelegate,LJScroViewCollectionViewLayoutDelegate>
@property (nonatomic, weak) UICollectionView *mainView; // 显示图片的collectionView
@property (nonatomic, weak) LJScroViewCollectionViewLayout *flowLayout;

@property (nonatomic, weak) NSTimer *timer;

@property (nonatomic, strong) NSMutableArray <LJScroViewItem *>* dataSourceArray;

@property (nonatomic, assign) NSInteger currentItemIndex;
@property (nonatomic, assign) NSInteger currentCollectViewIndex;

@property (nonatomic, assign) LJScroDirection scroDirection;
@end

NSString * const LJScroViewCellID = @"LJScroViewCell";
static NSInteger LJScroViewNumberOfItemsMax = 3;

@implementation LJScroView

-(instancetype)initWithItems:(NSArray <LJScroViewItem *>*)Items frame:(CGRect)frame{
    self = [super initWithFrame:frame] ;
    if (self) {
        self.dataSourceArray = Items.copy;
        [self initialization];
        [self setupMainView];
    }
    return self;
}
- (void)initialization{
    _scroDirection = LJScroDirectionToRight;
    _currentItemIndex = 0 ;
    _currentCollectViewIndex = 0 ;
}

-(void)setupMainView{
    
    LJScroViewCollectionViewLayout *flowLayout = [[LJScroViewCollectionViewLayout alloc] init];
    flowLayout.delegate = self;
    _flowLayout = flowLayout;
    
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    mainView.backgroundColor = [UIColor greenColor];
    mainView.pagingEnabled = YES;
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.showsVerticalScrollIndicator = NO;
    [mainView registerClass:[LJScroViewCell class] forCellWithReuseIdentifier:LJScroViewCellID];
    
    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.scrollsToTop = NO;
    [self addSubview:mainView];
    
    mainView.contentOffset = CGPointMake(SCREEN_WIDTH * 50000, 0);
    
    _mainView = mainView;
}


#pragma mark - LJScroViewCollectionViewLayoutDelegate
-(NSInteger)ljScroView_currentIndexOfCollectionViewLayout:(LJScroViewCollectionViewLayout *)layout{
    return self.currentCollectViewIndex;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return LJScroViewNumberOfItemsMax;
}
-(LJScroDirection)ljScroView_currentScroDirectionOfCollectionViewLayout:(LJScroViewCollectionViewLayout *)layout{
    return self.scroDirection;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LJScroViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LJScroViewCellID forIndexPath:indexPath];
    
    self.currentItemIndex = indexPath.item;
    
    LJScroViewCell * ljScroViewCell = (LJScroViewCell *)cell;
    
    LJScroViewItem * item = [self.dataSourceArray objectAtIndex:indexPath.item%self.dataSourceArray.count];
    [ljScroViewCell.imageView sd_internalSetImageWithURL:[NSURL URLWithString:item.fullImageUrlString] placeholderImage:[UIImage imageNamed:@"1254x1647fn3.jpeg"] options:0 operationKey:nil setImageBlock:nil progress:nil completed:nil];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    if ([self.delegate respondsToSelector:@selector(cycleScrollView:didSelectItemAtIndex:)]) {
//        [self.delegate cycleScrollView:self didSelectItemAtIndex:[self pageControlIndexWithCurrentCellIndex:indexPath.item]];
//    }
//    if (self.clickItemOperationBlock) {
//        self.clickItemOperationBlock([self pageControlIndexWithCurrentCellIndex:indexPath.item]);
//    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.currentCollectViewIndex =  [self.mainView indexPathForItemAtPoint:CGPointMake(scrollView.contentOffset.x + SCREEN_WIDTH * 0.5,self.mainView.frame.size.height * 0.5)].item;
    NSLog(@"currentCollectViewIndex:%ld",_currentCollectViewIndex);
}

-(NSMutableArray<LJScroViewItem *> *)dataSourceArray{
    if (!_dataSourceArray) {
        _dataSourceArray = [[NSMutableArray alloc]init];
    }
    return _dataSourceArray;
}

@end
