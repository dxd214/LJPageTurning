//
//  ViewController.m
//  LJPageTurning
//
//  Created by qianfeng on 15-8-1.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"
#import "HeadView.h"
#import "LJCollectionViewController.h"

@interface ViewController ()<HeadViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
   // [self.view addSubview:view];
    NSMutableArray *controllArr =[[NSMutableArray alloc]init];
    for (int i = 0; i<10; i++) {
        UIViewController *vc = [[UIViewController alloc]init];
        vc.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        [controllArr addObject:vc];
    }
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i = 0; i<10; i++) {
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        //NSLog(@"%u",arc4random()/255.0);
      //  button.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
       
      
        [button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [arr addObject:button];
        button.userInteractionEnabled = NO;
    }
   
    HeadView * headview = [[HeadView alloc]initWithFrame:CGRectMake(0, 20, 375, 40)];
    headview.datasource = arr;
    
    
    LJCollectionViewController *lvc = [[LJCollectionViewController alloc]initWithFrame:[UIScreen mainScreen].bounds withControllerArr:controllArr];
    lvc.headview = headview;

    [self.view addSubview:lvc.view];
   [self addChildViewController:lvc];
    
    [self.view addSubview:headview];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
