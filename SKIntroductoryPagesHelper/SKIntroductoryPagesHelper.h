//
//  KBIntroductoryPagesHelper.h
//  365kb
//
//  Created by apple on 2018/5/11.
//  Copyright © 2018年 绿盾金服. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKIntroductoryPagesView.h"

@interface SKIntroductoryPagesHelper : NSObject

+ (instancetype)shareInstance;

+(void)showIntroductoryPageView:(NSArray *)imageArray;

@end
