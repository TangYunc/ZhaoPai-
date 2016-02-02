//
//  MainPageViewController.m
//  ZhaoPai
//
//  Created by Mr_Tang on 16/1/18.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import "MainPageViewController.h"
#import "ZhaoPai-swift.h"
#import "MainPageCell.h"

@interface MainPageViewController ()

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatSubView];
}

//创建子视图
- (void)creatSubView{


    //1.设置导航栏的搜索框
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 143*2, 64)];
    searchBar.barStyle = UIBarStyleBlackTranslucent;
    [searchBar setBackgroundImage:[UIImage imageNamed:@"体验_u30_selected.png"]];
    [searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"体验_u30_selected.png"] forState:UIControlStateNormal];
    [searchBar setImage:[UIImage imageNamed:@"u10searchBar.png"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    searchBar.keyboardType = UIKeyboardTypeDefault;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem  alloc] initWithCustomView:searchBar];
    
    //2.创建一个扫描按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((kScreenWidth-70)/2, (kScreenHeight-49)/2, 30, 30);
//    [button setTitle:@"扫一扫" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"saoma.png"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];

    //3.创建表shi图
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];

}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier = @"cellId";
    MainPageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MainPageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    _segmentedCtrl = [[UISegmentedControl alloc] initWithItems:@[@"全部分类",@"智能排序",@"任务地图"]];
    _segmentedCtrl.frame = CGRectMake(0, 0, kScreenWidth, 44);
    _segmentedCtrl.selectedSegmentIndex = 0;
    [_segmentedCtrl setBackgroundImage:[UIImage imageNamed:@"segmentedbtn1_u99_mouseDown.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [_segmentedCtrl addTarget:self action:@selector(segMentedCtrlValueChange:) forControlEvents:UIControlEventValueChanged];

    return _segmentedCtrl;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //计算单元格高度
    CGFloat cellHeight = 10+30+20+20+10;
    return cellHeight;
}
#pragma mark - 分段控件点击事件
- (void)segMentedCtrlValueChange:(UISegmentedControl *)segmentedCtrl{

    if (segmentedCtrl.selectedSegmentIndex == 0) {
        //点击的是全部分类
        
    }else if (segmentedCtrl.selectedSegmentIndex == 1){
    //点击的是只能排序
    }else{
    //点击的是任务地图
    }
}



#pragma mark - 扫码按钮
- (void)buttonAction:(UIButton *)button{

//点击扫码
    CaptureBoard *captureBardCtrl = [CaptureBoard shareInstance];
    [captureBardCtrl viewDidAppear:YES];
    [self.navigationController pushViewController:captureBardCtrl animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
