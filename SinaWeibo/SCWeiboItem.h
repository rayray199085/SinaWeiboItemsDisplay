//
//  SCWeiboItem.h
//  SinaWeibo
//
//  Created by Stephen Cao on 10/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCWeiboItem : NSObject
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *picture;
@property(nonatomic,assign,getter=isVip)BOOL vip;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)weiboItemWithDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
