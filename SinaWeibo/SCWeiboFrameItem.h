//
//  SCWeiboFrameItem.h
//  SinaWeibo
//
//  Created by Stephen Cao on 10/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "SCWeiboItem.h"
#import <UIKit/UIKit.h>
#define nameFont [UIFont systemFontOfSize:12]
#define textFont [UIFont systemFontOfSize:14]

NS_ASSUME_NONNULL_BEGIN

@interface SCWeiboFrameItem : NSObject
@property(nonatomic,strong)SCWeiboItem *weibo;
@property(nonatomic,assign,readonly)CGRect iconRect;
@property(nonatomic,assign,readonly)CGRect nameRect;
@property(nonatomic,assign,readonly)CGRect vipRect;
@property(nonatomic,assign,readonly)CGRect textContentRect;
@property(nonatomic,assign,readonly)CGRect pictureRect;
@property(nonatomic,assign,readonly)CGFloat rowHeight;
@end

NS_ASSUME_NONNULL_END
