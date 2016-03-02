//
//  CGMydataModel.h
//  CGMyTest0301
//
//  Created by cgSjj on 16/3/2.
//  Copyright © 2016年 cgSjj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGMydataModel : NSObject
@property(nonatomic,copy)NSString *imageName;
@property(nonatomic,copy)NSString *productName;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *needJifen;
@property(nonatomic,copy)NSString *usedJifen;
@property(nonatomic,copy)NSString *time;
-(instancetype)initWithdict:(NSDictionary*)dict;
+(instancetype)dataWithdict:(NSDictionary*)dict;
@end
