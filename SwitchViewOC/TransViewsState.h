//
//  TransViewsState.h
//  SwitchViewOC
//
//  Created by 鹭源 on 2017/5/17.
//  Copyright © 2017年 luyuan. All rights reserved.
//
/*
 1、初始化时传入tableviewcell变化前后状态；
 2、自动计算删除后数据数组、需要删除cell的indexpath数组、插入后数据数组、需要插入cell的indexpath数组
 3、同时存在删除和插入cell时，一定要先删除后插入
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TransViewsState : NSObject
//删除后的数组
@property (nonatomic, strong) NSArray *deletedArray;
//插入后的数组
@property (nonatomic, strong) NSArray *insertedArray;
//需要删除cell的数组
@property (nonatomic, strong) NSArray<NSIndexPath *> *deleteIndexArray;
//需要插入cell的数组
@property (nonatomic, strong) NSArray<NSIndexPath *> *insertIndexArray;
@property (nonatomic) NSInteger cellSection;

+ (instancetype)transViewsStateWithNewState:(NSArray *)newState oldState:(NSArray *)oldState;
- (instancetype)initWithNewState:(NSArray *)newState oldState:(NSArray *)oldState;

@end
