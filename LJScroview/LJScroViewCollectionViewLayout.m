//
//  LJScroViewCollectionViewLayout.m
//  SifuBang
//
//  Created by wanglijun on 2018/3/13.
//  Copyright © 2018年 sifang. All rights reserved.
//

#import "LJScroViewCollectionViewLayout.h"

#define ItemOffset 60

@interface LJScroViewCollectionViewLayout ()
@property (nonatomic, strong) NSMutableArray <UICollectionViewLayoutAttributes *>* attributesArray;
@end

@implementation LJScroViewCollectionViewLayout
-(void)prepareLayout{
    [super prepareLayout];
    [self.attributesArray removeAllObjects];
    for (int i = 0 ; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        [self.attributesArray addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
}


-(CGSize)collectionViewContentSize{
    //NSInteger items = [self.collectionView numberOfItemsInSection:0];
    return CGSizeMake(self.collectionView.frame.size.width * 2, self.collectionView.frame.size.height);
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    //NSLog(@"X%.2f, Y:%.2f, W:%.2f H:%.2f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
    return self.attributesArray;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //floor：如果参数是小数，则求小于本身最大整数.
    CGFloat contentOffsetX = self.collectionView.contentOffset.x;
    
    CGFloat itemWidth = self.collectionView.frame.size.width;
    
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    
//    NSInteger currentIndex =  [self.collectionView indexPathForItemAtPoint:CGPointMake(self.collectionView.frame.size.height * 0.5, contentOffsetX + itemWidth * 0.5)].item;
//
   NSInteger currentIndex =  [self.delegate ljScroView_currentIndexOfCollectionViewLayout:self];

    LJScroDirection currentScroDirection = [self.delegate ljScroView_currentScroDirectionOfCollectionViewLayout:self];

    attrs.zIndex = 999 -  currentIndex;
    
    if (currentIndex%3 == 0) {
        
        if (indexPath.item == 0) {
            attrs.frame =  CGRectMake(0 , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
        }else if (indexPath.item == 1){
            CGFloat x = contentOffsetX + ItemOffset -  (contentOffsetX / itemWidth) *  ItemOffset ;
            attrs.frame = CGRectMake( x , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
        }else if (indexPath.item == 2){
            
        }
        
        
    }else if (indexPath.item%3 == 1){
        if (indexPath.item == 0) {
            
        }else if (indexPath.item == 1){
            attrs.frame =  CGRectMake(0 , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
            
        }else if (indexPath.item == 2){
            CGFloat x = contentOffsetX + ItemOffset -  (contentOffsetX / itemWidth) *  ItemOffset ;
            attrs.frame = CGRectMake( x , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
        }
    }else if (indexPath.item%3 == 2){
        if (indexPath.item == 0) {
            CGFloat x = contentOffsetX + ItemOffset -  (contentOffsetX / itemWidth) *  ItemOffset ;
            attrs.frame = CGRectMake( x , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
        }else if (indexPath.item == 1){
            
        }else if (indexPath.item == 2){
            attrs.frame =  CGRectMake(0 , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
            
        }
    }
    
    
    
//    if (currentIndex == 0) {
//        if (indexPath.item == 0) {
//
//            attrs.zIndex = 3 ;
//
//            attrs.frame =  CGRectMake(0 , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
//        }else if (indexPath.item == 1){
//
//            attrs.zIndex = 2;
//
//            CGFloat x = contentOffsetX + ItemOffset -  (contentOffsetX / itemWidth) *  ItemOffset ;
//            attrs.frame = CGRectMake( x , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
//        }else if (indexPath.item == 2){
//
//            attrs.zIndex = 1;
//
//            CGFloat x = contentOffsetX*(contentOffsetX/SCREEN_WIDTH) -ItemOffset + 2 * ItemOffset * (contentOffsetX/SCREEN_WIDTH);
//            attrs.frame =  CGRectMake(x , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
//        }
//    }else if (currentIndex == 1){
//
//        if (indexPath.item == 0) {
//
//            attrs.zIndex = 1;
//
//            CGFloat x = contentOffsetX*(contentOffsetX/SCREEN_WIDTH) -ItemOffset + 2 * ItemOffset * (contentOffsetX/SCREEN_WIDTH);
//            attrs.frame =  CGRectMake(x , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
//        }else if (indexPath.item == 1){
//
//            attrs.zIndex = 3;
//
//            attrs.frame =  CGRectMake(0 , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
//        }else if (indexPath.item == 2){
//
//            attrs.zIndex = 2;
//
//            CGFloat x = contentOffsetX + ItemOffset -  (contentOffsetX / itemWidth) *  ItemOffset ;
//            attrs.frame = CGRectMake( x , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
//        }
//
//        //        NSLog(@"X:%.2f",x);
//    }else if (currentIndex == 2){
//
//        if (indexPath.item == 0) {
//
//            attrs.zIndex = 2;
//
//            CGFloat x = contentOffsetX + ItemOffset -  (contentOffsetX / itemWidth) *  ItemOffset ;
//            attrs.frame = CGRectMake( x , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
//        }else if (indexPath.item == 1){
//
//            attrs.zIndex = 1;
//
//            CGFloat x = contentOffsetX*(contentOffsetX/SCREEN_WIDTH) -ItemOffset + 2 * ItemOffset * (contentOffsetX/SCREEN_WIDTH);
//            attrs.frame =  CGRectMake(x , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
//        }else if (indexPath.item == 2){
//
//            attrs.zIndex = 3;
//
//            attrs.frame =  CGRectMake(0 , 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
//        }
//    }
    
    return attrs;
}

//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
//    NSLog(@"proposedContentOffset:%.2f",proposedContentOffset.x);
////    if (proposedContentOffset.x >= SCREEN_WIDTH * 0.5) {
////        return CGPointMake(SCREEN_WIDTH, proposedContentOffset.y);
////    }
//    if (proposedContentOffset.x == SCREEN_WIDTH){
//        return CGPointMake(60, proposedContentOffset.y);
//    }
//    return proposedContentOffset;
//}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}


-(NSMutableArray <UICollectionViewLayoutAttributes *>*)attributesArray{
    if (!_attributesArray) {
        _attributesArray = [[NSMutableArray alloc]init];
    }
    return _attributesArray;
}
@end

