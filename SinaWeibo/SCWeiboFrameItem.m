//
//  SCWeiboFrameItem.m
//  SinaWeibo
//
//  Created by Stephen Cao on 10/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCWeiboFrameItem.h"

@implementation SCWeiboFrameItem
- (void)setWeibo:(SCWeiboItem *)weibo{
    _weibo = weibo;
    SCWeiboItem *item = self.weibo;
    CGFloat margin = 10;
    CGFloat iconW = 35;
    _iconRect = CGRectMake(margin, margin, iconW, iconW);
    
    CGRect nameRect = [self calculateTextSize:item.name andWithMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andWithFont:nameFont];
    CGFloat nameW = nameRect.size.width;
    CGFloat nameH = nameRect.size.height;
    _nameRect = CGRectMake(CGRectGetMaxX(_iconRect) + margin, margin + iconW/2 - nameH/2, nameW, nameH);
    
    CGFloat vipW = nameH;
    _vipRect = CGRectMake(_nameRect.origin.x + nameW + margin, _nameRect.origin.y , vipW, vipW);
    
    CGRect textContentRect = [self calculateTextSize:item.text andWithMaxSize:CGSizeMake(355, MAXFLOAT) andWithFont:textFont];
    
    CGFloat textContentW = textContentRect.size.width;
    CGFloat textContentH = textContentRect.size.height;
    _textContentRect = CGRectMake(margin, CGRectGetMaxY(_iconRect) +margin, textContentW, textContentH);
    
    CGFloat pictureW = 100;
    _pictureRect = CGRectMake(margin, CGRectGetMaxY(_textContentRect) + margin, pictureW, pictureW);
    
    if(item.picture != nil){
        _rowHeight = CGRectGetMaxY(_pictureRect) + margin;
    }else{
        _rowHeight = CGRectGetMaxY(_textContentRect) + margin;
    }
}
-(CGRect)calculateTextSize:(NSString *)text andWithMaxSize:(CGSize )size andWithFont:(UIFont *)font{
    NSDictionary *fontDict = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil];
}
@end
