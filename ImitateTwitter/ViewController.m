//
//  ViewController.m
//  ImitateTwitter
//
//  Created by je_ffy on 15/2/10.
//  Copyright (c) 2015年 je_ffy. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "FirstTableViewCell.h"
#import "CateViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIView *headerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:(UITableViewStylePlain)];
    self.tableView.layer.masksToBounds = NO;

    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"dell"];
    self.tableView.backgroundColor = [UIColor cyanColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    UIButton *redButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 64, 40, 36)];
    [redButton setTitle:@"Next" forState:(UIControlStateNormal)];
    [redButton addTarget:self action:@selector(goToNextPage) forControlEvents:UIControlEventTouchUpInside];
    redButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:redButton];
    
    

//    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 70)];
//    [self.view addSubview:backView];
//    backView.backgroundColor = [UIColor blackColor];
//    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
//    yellowView.backgroundColor = [UIColor yellowColor];
//    self.tableView.tableHeaderView = yellowView;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)goToNextPage {
    CateViewController *cateVC = [[CateViewController alloc] init];
    [self.navigationController pushViewController:cateVC animated:NO];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    UITableView *tarTableView = (UITableView *)scrollView;
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:0];

    UITableViewCell *cell = [tarTableView cellForRowAtIndexPath:indexpath];
    if ([cell isKindOfClass:[FirstTableViewCell class]]) {
        FirstTableViewCell *tarCell = (FirstTableViewCell *)cell;
        if (scrollView.contentOffset.y <= 64.0 && scrollView.contentOffset.y >= 0) {
            [UIView animateWithDuration:0.01f animations:^{
                tarCell.showImageView.frame = CGRectMake(scrollView.contentOffset.y/2, scrollView.contentOffset.y, 90-scrollView.contentOffset.y, 90-scrollView.contentOffset.y);
            }];
        }else{
            
        }
        
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.0f;
    }else if(section == 1){
        return 50;
    }else{
        return 0;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    }else if (indexPath.section == 1){
        return 50;
    }else {
        return 0;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    }else if(section == 1){
        UIView *view         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        view.backgroundColor = [UIColor redColor];
        
        return view;
    }else {
        return nil;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"dell"];
        
        return cell;
    }
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @"test";
    return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
