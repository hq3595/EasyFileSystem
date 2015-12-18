//
//  File.h
//  EasyFileSystem
//
//  Created by huangqiang on 12/18/15.
//  Copyright © 2015 https://github.com/hq3595. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum :NSUInteger{
    FileType_file,
    FileType_Folder
}FileType;

@interface File : NSObject

@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, assign) FileType fileType;

@property (nonatomic, strong, readonly) NSMutableArray<File *> *childFiles;

-(void)addFile:(File *)file;

+(instancetype)fileWithFileType:(FileType )fileType fileName:(NSString *)fileName;

@end
