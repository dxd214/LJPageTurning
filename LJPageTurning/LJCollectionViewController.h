//
//  LJCollectionViewController.h
//  LJPageTurning
//
//  Created by qianfeng on 15-8-1.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeadView;

@interface LJCollectionViewController : UICollectionViewController

- (id)initWithFrame:(CGRect)frame withControllerArr:(NSArray *)controllerArr;
@property(nonatomic,strong)NSArray *headviewARR;
@property(nonatomic,strong)HeadView *headview;

@end
