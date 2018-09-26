//
//  KBIntroductoryPagesView.m
//  365kb
//
//  Created by apple on 2018/5/11.
//  Copyright © 2018年 绿盾金服. All rights reserved.
//

/**
 屏幕宽
 */
#define KSCREENWIDTH          [UIScreen mainScreen].bounds.size.width

/**
 屏幕高
 */
#define KSCREENHEIGHT          [UIScreen mainScreen].bounds.size.height

//iOS11以上
#define IS_SYSTEM_IOS11_UP [[[UIDevice currentDevice] systemVersion] floatValue]>=11.0

/**
 RGB
 */
#define UIColorFromRGB(rgbValue)          [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/**
 主题色
 */
#define kMainColor          UIColorFromRGB(0xFC6B61)

#import "SKIntroductoryPagesView.h"
#import "Masonry.h"
#import "SKQuickControl.h"

@interface SKIntroductoryPagesView() <UIScrollViewDelegate>

@property(nonatomic)NSArray *imageArray;


@end


@implementation SKIntroductoryPagesView

-(instancetype)initPagesViewWithFrame:(CGRect)frame Images:(NSArray *)images
{
    if (self = [super initWithFrame:frame]) {
        self.imageArray=images;
        [self loadPageView];
    }
    return self;
}
-(void)loadPageView{
    
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(-94);
        make.size.mas_equalTo(CGSizeMake(120, 30));
    }];
    
    [self setAllImageView];
}
- (void)setAllImageView{
    for (int i=0; i<self.imageArray.count; i++) {
        UIImageView *imageView = [UIImageView imageViewWithFrame:CGRectMake(KSCREENWIDTH*i, 0, KSCREENWIDTH, KSCREENHEIGHT) image:self.imageArray[i]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.scrollView addSubview:imageView];
        
        if (i==self.imageArray.count-1) {
            [imageView addSubview:self.startButton];
        }
    }
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [UIScrollView scrollViewWithFrame:CGRectZero contentSize:CGSizeMake(KSCREENWIDTH*self.imageArray.count, 0) delegate:self];
        if (IS_SYSTEM_IOS11_UP) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        
    }
    return _scrollView;
}

- (UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
        _pageControl.pageIndicatorTintColor = UIColorFromRGB(0xDDDDDD);
        _pageControl.currentPageIndicatorTintColor = kMainColor;
        _pageControl.numberOfPages = 3;
        _pageControl.currentPage = 0;
        _pageControl.userInteractionEnabled = NO;
    }
    return _pageControl;
}
- (UIButton *)startButton{
    if (!_startButton) {
        _startButton = [UIButton buttonWithFrame:CGRectMake((KSCREENWIDTH-120)/2, KSCREENHEIGHT-89-40, 120, 40) title:@"立即体验" titleColor:[UIColor whiteColor] font:kPfFont(15) image:nil color:kMainColor tag:1 target:self action:@selector(clostPages)];
        _startButton.layer.cornerRadius = 6;
    }
    return _startButton;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGPoint point = scrollView.contentOffset;
    //round()四舍五入
    NSInteger index = round(point.x/KSCREENWIDTH);
    self.pageControl.currentPage = index;
    if (self.pageControl.currentPage == self.imageArray.count-1) {
        self.pageControl.hidden = YES;
    }else{
        self.pageControl.hidden = NO;
    }
}
- (void)clostPages{
    [self removeFromSuperview];
}
@end
