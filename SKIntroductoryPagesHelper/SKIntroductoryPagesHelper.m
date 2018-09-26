//
//  KBIntroductoryPagesHelper.m
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

#import "SKIntroductoryPagesHelper.h"

@interface SKIntroductoryPagesHelper()

@property (nonatomic) UIWindow * rootWindow;

@property(nonatomic,strong) SKIntroductoryPagesView *curIntroductoryPagesView;

@end

@implementation SKIntroductoryPagesHelper

+ (instancetype)shareIntance{
    static SKIntroductoryPagesHelper *shareIntance = nil;
    static dispatch_once_t onceToken;
    
    _dispatch_once(&onceToken, ^{
        shareIntance = [[SKIntroductoryPagesHelper alloc] init];
    });
    return shareIntance;
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+(void)showIntroductoryPageView:(NSArray *)imageArray{
    if (![SKIntroductoryPagesHelper shareIntance].curIntroductoryPagesView) {
        [SKIntroductoryPagesHelper shareIntance].curIntroductoryPagesView = [[SKIntroductoryPagesView alloc] initPagesViewWithFrame:CGRectMake(0, 0, KSCREENWIDTH, KSCREENHEIGHT) Images:imageArray];
    }
    
    
    [SKIntroductoryPagesHelper shareIntance].rootWindow = [UIApplication sharedApplication].delegate.window;
    [[SKIntroductoryPagesHelper shareIntance].rootWindow addSubview:[SKIntroductoryPagesHelper shareIntance].curIntroductoryPagesView];
}

@end
