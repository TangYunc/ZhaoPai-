//
//  MainPageViewController.h
//  ZhaoPai
//
//  Created by Mr_Tang on 16/1/18.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import "BaseViewController.h"

@interface MainPageViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    UISegmentedControl *_segmentedCtrl;
}
@property(nonatomic,strong)NSArray *dataList;
@end
