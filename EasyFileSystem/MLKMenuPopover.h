//
//  MLKMenuPopover.h
//  FileSystem
//
//  Created by huangqiang on 12/18/15.
//  Copyright © 2015 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MLKMenuPopover;

@protocol MLKMenuPopoverDelegate

- (void)menuPopover:(MLKMenuPopover *)menuPopover didSelectMenuItemAtIndex:(NSInteger)selectedIndex;

@end

@interface MLKMenuPopover : UIView <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,assign) id<MLKMenuPopoverDelegate> menuPopoverDelegate;

- (id)initWithFrame:(CGRect)frame menuItems:(NSArray *)menuItems;
- (void)showInView:(UIView *)view;
- (void)dismissMenuPopover;
- (void)layoutUIForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;

@end
