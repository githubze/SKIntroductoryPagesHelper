//
//  KBIntroductoryPagesView.h
//  365kb
//
//  Created by apple on 2018/5/11.
//  Copyright © 2018年 绿盾金服. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKIntroductoryPagesView : UIView

//调用方法
-(instancetype)initPagesViewWithFrame:(CGRect)frame Images:(NSArray *)images;

/**
 轮播
 */
@property (nonatomic, strong) UIScrollView * scrollView;

/**
 分页空间
 */
@property (nonatomic, strong) UIPageControl * pageControl;

/**
 button
 */
@property (nonatomic, strong) UIButton * startButton;

@end
