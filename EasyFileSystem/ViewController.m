//
//  ViewController.m
//  EasyFileSystem
//
//  Created by huangqiang on 12/18/15.
//  Copyright © 2015 https://github.com/hq3595. All rights reserved.
//

#import "ViewController.h"
#import "FileCell.h"
#import "MLKMenuPopover.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource,MLKMenuPopoverDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) MLKMenuPopover *menuPopover;
@property(nonatomic,strong) NSArray *menuItems;

@property (nonatomic, assign) NSInteger folderCount;
@property (nonatomic, assign) NSInteger fileCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.folderCount = 1;
    self.fileCount = 1;
    self.menuItems = [NSArray arrayWithObjects:@"创建文件夹", @"创建文件", nil];
    
    self.title = self.root.fileName;
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rightBtn setTitle:@"..." forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(didClickedRightBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    [self initTableView];
}

-(void)didClickedRightBtn:(UIButton *)sender{
    [self.menuPopover dismissMenuPopover];
    
    self.menuPopover = [[MLKMenuPopover alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 155, 44 + 20, 140, 88) menuItems:self.menuItems];
    
    self.menuPopover.menuPopoverDelegate = self;
    [self.menuPopover showInView:self.view];
}

#pragma mark - tableView相关
- (void)initTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.delegate       = self;
    self.tableView.dataSource     = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[FileCell class] forCellReuseIdentifier:@"fileCell"];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.root.childFiles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FileCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"fileCell"];
    // 传入节点File
    cell.data       = self.root.childFiles[indexPath.row];
    
    [cell loadContent];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80.f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    File *file = self.root.childFiles[indexPath.row];
    if(file.fileType == FileType_Folder){
        ViewController *VC = [ViewController new];
        VC.root = file;
        [self.navigationController pushViewController:VC animated:YES];
    }
}

#pragma mark MLKMenuPopoverDelegate

- (void)menuPopover:(MLKMenuPopover *)menuPopover didSelectMenuItemAtIndex:(NSInteger)selectedIndex
{
    [self.menuPopover dismissMenuPopover];
    
    if(selectedIndex == 0){
        //创建文件夹
        File *folder = [File fileWithFileType:FileType_Folder fileName:[NSString stringWithFormat:@"Folder-A-%ld",(long)self.folderCount]];
        [self.root addFile:folder];
        self.folderCount ++ ;
    }else if(selectedIndex == 1){
        //创建文件
        File *file = [File fileWithFileType:FileType_file fileName:[NSString stringWithFormat:@"File-A-%ld",(long)self.fileCount]];
        [self.root addFile:file];
        self.fileCount ++ ;
    }
    
    [self.tableView reloadData];
}

@end

