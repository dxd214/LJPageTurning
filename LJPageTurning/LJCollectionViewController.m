//
//  LJCollectionViewController.m
//  LJPageTurning
//
//  Created by qianfeng on 15-8-1.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "LJCollectionViewController.h"
#import "HeadView.h"

@interface LJCollectionViewController ()<HeadViewDelegate,UIScrollViewDelegate>//<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSArray *controllerArr;



@end

@implementation LJCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (id)initWithFrame:(CGRect)frame withControllerArr:(NSArray *)controllerArr
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    if (self = [super initWithCollectionViewLayout:layout]) {
        _controllerArr = [[NSArray alloc]initWithArray:controllerArr];
        _headviewARR = [[NSArray alloc]init];
        //_controllerArr = controllerArr;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = frame.size;
        layout.minimumLineSpacing = 0;
        
        // self.headview.indexDelegate = self;
       // self.collectionView.delegate = self;
       // self.collectionView.dataSource = self;
        
    }
    
    return self;
}
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
  return   [super initWithCollectionViewLayout:layout];
    
}
- (void)setHeadview:(HeadView *)headview
{
    _headview = headview;
    _headview.indexDelegate = self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    
   

    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _controllerArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UIViewController *vc = self.controllerArr[indexPath.item];
    [self addChildViewController:vc];
    vc.view.frame = cell.contentView.bounds;
    

    
    [cell.contentView addSubview:vc.view];
    
    cell.backgroundColor = [UIColor redColor];
    NSLog(@"%@",NSStringFromCGRect(cell.frame));
    return cell;
}



// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}


- (void)selectItem:(NSInteger)index
{
    
  
    self.collectionView.contentOffset = CGPointMake(index * self.collectionView.frame.size.width, 0);
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    NSInteger index = (NSInteger)floor((point.x / self.collectionView.frame.size.width));
    CGPoint headviewPoint = _headview.contentOffset;
    UIView *view = (UIView *)_headview.datasource[index];
    
    NSLog(@"***************%f",(_headview.contentSize.width) );
    if (((_headview.contentSize.width - headviewPoint.x) > _headview.frame.size.width) ) {
        _headview.contentOffset = CGPointMake(index * view.frame.size.width, 0);
    }
    

                                       
}
@end
