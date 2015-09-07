//
//  HeadView.h
//  LJPageTurning
//
//  Created by qianfeng on 15-8-1.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeadViewDelegate <NSObject>

- (void)selectItem:(NSInteger)index;

@end

@interface HeadView : UICollectionView

@property(nonatomic,strong)NSArray *datasource;

@property(nonatomic,weak)id<HeadViewDelegate> indexDelegate;

//@property(nonatomic,strong)UIView *view;

@end
