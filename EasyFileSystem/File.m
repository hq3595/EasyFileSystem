//
//  File.m
//  EasyFileSystem
//
//  Created by huangqiang on 12/18/15.
//  Copyright © 2015 https://github.com/hq3595. All rights reserved.
//

#import "File.h"

@interface File ()

@property (nonatomic, strong) NSMutableArray<File *> *childFiles;

@end

@implementation File

-(instancetype) init{
    self = [super init];
    if(self){
        self.childFiles = [NSMutableArray array];
    }
    return self;
}

+(instancetype)fileWithFileType:(FileType )fileType fileName:(NSString *)fileName{
    File *file = [[[self class] alloc] init];
    file.fileType = fileType;
    file.fileName = fileName;
    return  file;
}

-(void)addFile:(File *)file{
    [self.childFiles addObject:file];
}

@end
