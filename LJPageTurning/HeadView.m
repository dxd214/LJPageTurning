//
//  HeadView.m
//  LJPageTurning
//
//  Created by qianfeng on 15-8-1.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "HeadView.h"

@interface HeadView()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>



@end

@implementation HeadView

- (instancetype)initWithFrame:(CGRect)frame
{
   
        _datasource = [[NSArray alloc]init];
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
       // self.collectionViewLayout = layout;
    layout.minimumLineSpacing = 0;
        self.delegate = self;
        self.dataSource = self;
    

        self.backgroundColor = [UIColor whiteColor];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
  
    return [super initWithFrame:frame collectionViewLayout:layout];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([self class])];
    UICollectionViewCell *cell = [self dequeueReusableCellWithReuseIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
    for (UIView *view in cell.subviews) {
        [view removeFromSuperview];
    }

       [cell addSubview:(UIView *)self.datasource[indexPath.item]];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datasource.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIView *view = (UIView *)self.datasource[indexPath.item];
    //NSLog(@"%d",indexPath.item);
 
    return CGSizeMake(view.bounds.size.width, view.bounds.size.height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.indexDelegate respondsToSelector:@selector(selectItem:)]) {
        [self.indexDelegate selectItem:indexPath.item];
    }
    
}




@end
