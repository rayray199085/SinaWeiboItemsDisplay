//
//  SCWeiboItem.m
//  SinaWeibo
//
//  Created by Stephen Cao on 10/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCWeiboItem.h"

@implementation SCWeiboItem

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)weiboItemWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}
@end
