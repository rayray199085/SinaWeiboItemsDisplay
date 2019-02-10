//
//  MyTableViewController.m
//  SinaWeibo
//
//  Created by Stephen Cao on 10/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "MyTableViewController.h"
#import "SCWeiboItem.h"
#import "SCTableViewCell.h"
#import "SCWeiboFrameItem.h"

@interface MyTableViewController ()
@property(nonatomic,strong)NSArray *weiboFrameList;
@end

@implementation MyTableViewController
- (BOOL)prefersStatusBarHidden{
    return YES;
}
- (NSArray *)weiboFrameList{
    if(_weiboFrameList == nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"weibos.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempList = [NSMutableArray arrayWithCapacity:array.count];
        for(NSDictionary *dict in array){
            SCWeiboItem *item = [SCWeiboItem weiboItemWithDictionary:dict];
            SCWeiboFrameItem *frameItem = [[SCWeiboFrameItem alloc]init];
            frameItem.weibo = item;
            [tempList addObject:frameItem];
        }
        _weiboFrameList = tempList;
    }
    return _weiboFrameList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.weiboFrameList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SCWeiboFrameItem *item = self.weiboFrameList[indexPath.row];
    SCTableViewCell *cell = [SCTableViewCell tableViewCellWithTableView:tableView];
    cell.weiboFrame = item;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SCWeiboFrameItem *item =  self.weiboFrameList[indexPath.row];
    return item.rowHeight;
}
@end
