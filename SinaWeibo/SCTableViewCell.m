//
//  SCTableViewCell.m
//  SinaWeibo
//
//  Created by Stephen Cao on 10/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCTableViewCell.h"
@interface SCTableViewCell ()
@property(nonatomic, weak) UIImageView *iconView;
@property(nonatomic, weak) UIImageView *vipView;
@property(nonatomic, weak) UIImageView *picture;
@property(nonatomic, weak) UILabel *nickNameLabel;
@property(nonatomic, weak) UILabel *textContentLabel;

@end
@implementation SCTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    UIImageView *icon = [[UIImageView alloc] init];
    [self.contentView addSubview:icon];
    self.iconView = icon;
    UILabel *nickName = [[UILabel alloc] init];
    [self.contentView addSubview:nickName];
    nickName.font = nameFont;
    self.nickNameLabel = nickName;
    UIImageView *vip = [[UIImageView alloc] init];
    vip.image = [UIImage imageNamed:@"vip"];
    [self.contentView addSubview:vip];
    self.vipView = vip;
    UILabel *text = [[UILabel alloc] init];
    text.font = textFont;
    text.numberOfLines = 0;
    [self.contentView addSubview:text];
    self.textContentLabel = text;
    UIImageView *picture = [[UIImageView alloc] init];
    [self.contentView addSubview:picture];
    self.picture = picture;
  }
  return self;
}
- (void)setWeiboFrame:(SCWeiboFrameItem *)weiboFrame {
  _weiboFrame = weiboFrame;
  [self setSubViewsData];
  [self setSubViewsFrame];
}

- (void)setSubViewsData {
  SCWeiboItem *item = self.weiboFrame.weibo;
  self.iconView.image = [UIImage imageNamed:item.icon];
  self.nickNameLabel.text = item.name;
  if (item.isVip) {
    self.vipView.hidden = NO;
    self.nickNameLabel.textColor = [UIColor redColor];
  } else {
    self.vipView.hidden = YES;
    self.nickNameLabel.textColor = [UIColor blackColor];
  }
  self.textContentLabel.text = item.text;
  if (item.picture != nil) {
    self.picture.hidden = NO;
    self.picture.image = [UIImage imageNamed:item.picture];
  } else {
    self.picture.hidden = YES;
  }
}

- (void)setSubViewsFrame {
  SCWeiboFrameItem *item = self.weiboFrame;
  self.iconView.frame = item.iconRect;
  self.nickNameLabel.frame = item.nameRect;
  self.vipView.frame = item.vipRect;
  self.textContentLabel.frame = item.textContentRect;
  self.picture.frame = item.pictureRect;
}

- (void)awakeFromNib {
  [super awakeFromNib];
  // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];

  // Configure the view for the selected state
}
+ (instancetype)tableViewCellWithTableView:(UITableView *)tableView{
  static NSString *identifier = @"weibo_item";
  SCTableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:identifier];
  if (cell == nil) {
    cell = [[SCTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                  reuseIdentifier:identifier];
  }
  return cell;
}

@end
