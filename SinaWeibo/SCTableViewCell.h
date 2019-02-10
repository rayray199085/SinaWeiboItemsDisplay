//
//  SCTableViewCell.h
//  SinaWeibo
//
//  Created by Stephen Cao on 10/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCWeiboFrameItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface SCTableViewCell : UITableViewCell
@property(nonatomic,strong)SCWeiboFrameItem *weiboFrame;
+(instancetype)tableViewCellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
