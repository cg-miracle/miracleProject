//
//  CGMydataModel.m
//  CGMyTest0301
//
//  Created by cgSjj on 16/3/2.
//  Copyright © 2016年 cgSjj. All rights reserved.
//

#import "CGMydataModel.h"

@implementation CGMydataModel

-(instancetype)initWithdict:(NSDictionary*)dict
{
    if (self=[super init]) {
        self.time=dict[@"time"];
        self.imageName=dict[@"imageName"];
        self.productName=dict[@"productName"];
        self.price=dict[@"price"];
        self.needJifen=dict[@"needJifen"];
        self.usedJifen=dict[@"usedJifen"];
    }
   
    return self;
}



+(instancetype)dataWithdict:(NSDictionary*)dict
{

    return [[self alloc]initWithdict:dict];

}


@end
