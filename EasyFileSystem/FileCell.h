//
//  FileCell.h
//  EasyFileSystem
//
//  Created by huangqiang on 12/18/15.
//  Copyright © 2015 https://github.com/hq3595. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileCell : UITableViewCell

@property (nonatomic, weak) id                data;

- (void)loadContent;

@end
