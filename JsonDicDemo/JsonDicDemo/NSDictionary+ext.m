//
//  NSDictionary+ext.m
//  Demox
//
//  Created by ma shuang on 18/6/22.
//  Copyright © 2018年 zhuhaiyan. All rights reserved.
//

#import "NSDictionary+ext.h"

@implementation NSDictionary (ext)
//字典转json字母排序
-(NSString *)dictionaryToJsonBySort{
    //keyArray
    NSArray *keyArray =  [self.allKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *str1 = obj1;
        NSString *str2 = obj2;
        return [str1 compare:str2];
    }];
    NSMutableArray *resultArray = [NSMutableArray array];
    __block NSString *error;
    [keyArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id value = self[keyArray[idx]];
        if ([value isKindOfClass:NSString.class]) {
            [resultArray addObject:[NSString stringWithFormat:@"\"%@\" : \"%@\"",obj,value]];
            
        }else if ([value isKindOfClass:NSNumber.class]) {
            [resultArray addObject:[NSString stringWithFormat:@"\"%@\" : %@",obj,value]];
        }else if ([value isKindOfClass:NSDictionary.class]) {
            [resultArray addObject:[NSString stringWithFormat:@"\"%@\" : %@",obj,[value dictionaryToJsonBySort]]];
        }else if ([value isKindOfClass:NSArray.class]) {
            //类型错误
            error = @"类型错误";
        }
    }];
    if (error) {
        return error;
    }else{
        NSString *resultString = [resultArray componentsJoinedByString:@",\n"];
        return [NSString stringWithFormat:@"{\n %@ \n}",resultString];
    }
    
}
@end
