//
//  TransViewsState.m
//  SwitchViewOC
//
//  Created by 鹭源 on 2017/5/17.
//  Copyright © 2017年 luyuan. All rights reserved.
//

#import "TransViewsState.h"

@interface TransViewsState()
@property (nonatomic, strong) NSArray *nStateArray;
@property (nonatomic, strong) NSArray *oStateArray;

@end

@implementation TransViewsState
+ (instancetype)transViewsStateWithNewState:(NSArray *)newState oldState:(NSArray *)oldState
{
    return [[self alloc]initWithNewState:newState oldState:oldState];
}

- (instancetype)initWithNewState:(NSArray *)newState oldState:(NSArray *)oldState
{
    self = [super init];
    if (self) {
        _nStateArray = [NSArray arrayWithArray:newState];
        _oStateArray = [NSArray arrayWithArray:oldState];
    }
    return self;
}

- (NSArray *)deletedArray
{
    if (!_deletedArray) {
        NSMutableArray *mOldStateArray = [NSMutableArray arrayWithArray:_oStateArray];
        for (NSInteger i = self.deleteIndexArray.count - 1; i >= 0; i--) {
            NSIndexPath *indexpath = self.deleteIndexArray[i];
            NSInteger num = indexpath.row;
            [mOldStateArray removeObjectAtIndex:num];
        }
        _deletedArray = mOldStateArray;
        
    }
    return _deletedArray;
}
- (NSArray *)insertedArray
{
    if (!_insertedArray) {
        NSMutableArray *mDeletedArray = [NSMutableArray arrayWithArray:self.deletedArray];
        
        for (NSInteger i = 0; i < self.insertIndexArray.count; i++) {
            NSIndexPath *indexpath = self.insertIndexArray[i];
            NSInteger num = indexpath.row;
            [mDeletedArray addObject:_nStateArray[num]];
        }
        _insertedArray = mDeletedArray;
    }
    return _insertedArray;
}

- (NSArray <NSIndexPath *> *)deleteIndexArray
{
    if (!_deleteIndexArray) {
        _deleteIndexArray = [self deleteViewsStateWithNewState:_nStateArray oldState:_oStateArray];
    }
    return _deleteIndexArray;
}
- (NSArray <NSIndexPath *> *)insertIndexArray
{
    if (!_insertIndexArray) {
        _insertIndexArray = [self insertViewsStateWithNewState:_nStateArray oldState:_oStateArray];
    }
    return _insertIndexArray;
}
- (NSArray<NSIndexPath *>  *)insertViewsStateWithNewState:(NSArray *)newState oldState:(NSArray *)oldState
{
    NSMutableArray *insertViewsState = [NSMutableArray arrayWithCapacity:newState.count];
    
    
    NSMutableArray *mdeleteArray = [NSMutableArray arrayWithArray:self.deletedArray];
    for (NSInteger i = 0; i < newState.count; i++) {
        if (0 == mdeleteArray.count) {
            [insertViewsState addObject:[NSIndexPath indexPathForRow:i inSection:_cellSection]];
        }
        for (NSInteger j = 0; j< mdeleteArray.count; j++) {
            if ([newState[i] isEqualToNumber: mdeleteArray[j]]) {
                [mdeleteArray removeObjectAtIndex:j];
                break;
            }
            else {
                [insertViewsState addObject:[NSIndexPath indexPathForRow:i inSection:_cellSection]];
            }
        }
    }
    
    return insertViewsState;
    
}
- (NSArray<NSIndexPath *>  *)deleteViewsStateWithNewState:(NSArray *)newState oldState:(NSArray *)oldState
{
    NSMutableArray *deleteViewsState = [NSMutableArray arrayWithCapacity:oldState.count];
    NSMutableArray *mNewState = [NSMutableArray arrayWithArray:newState];
    for (NSInteger i = 0; i < oldState.count; i++) {
        
        if (0 == mNewState.count) {
            [deleteViewsState addObject:[NSIndexPath indexPathForRow:i inSection:_cellSection]];
        }
        else{
            
            for (NSInteger j = 0; j< mNewState.count; j++) {
                
                if ([oldState[i] isEqualToNumber: mNewState[j]]) {
                    [mNewState removeObjectAtIndex:j];
                    break;
                }
                else if (![oldState[i] isEqualToNumber: mNewState[j]]){
                    [mNewState removeObjectAtIndex:j];
                }
                j--;
                
                if (0 == mNewState.count){
                    [deleteViewsState addObject:[NSIndexPath indexPathForRow:i inSection:_cellSection]];
                }
               
            }
            
        }
        
        
    }
    
    return deleteViewsState;
}


@end
