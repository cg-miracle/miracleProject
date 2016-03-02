//
//  CGMyView.m
//  CGMyTest0301
//
//  Created by cgSjj on 16/3/1.
//  Copyright © 2016年 cgSjj. All rights reserved.
//

#import "CGMyView.h"

@interface CGMyView ()

@property (weak, nonatomic) IBOutlet UITextField *lianxiren;

@property (weak, nonatomic) IBOutlet UITextField *lianxifangshi;
@property (weak, nonatomic) IBOutlet UITextField *lianxiaddress;
@property (weak, nonatomic) IBOutlet UIButton *duihuanBtn;

@end


@implementation CGMyView


-(void)setDuihuanBtn:(UIButton *)duihuanBtn
{
    _duihuanBtn=duihuanBtn;
    
    //设置button圆角
    [self.duihuanBtn.layer setMasksToBounds:YES];
    [self.duihuanBtn.layer setCornerRadius:10.0];

}


- (IBAction)duihuan:(id)sender {
    
 
    NSLog(@"联系人：%@  联系方式：%@联系地址：%@", self.lianxiren.text, self.lianxifangshi.text, self.lianxiaddress.text);
}


+(instancetype)viewCreate
{
    
    
    return [[[NSBundle mainBundle]loadNibNamed:@"CGMyView" owner:nil options:nil]lastObject];

}
- (IBAction)back:(id)sender {
    
    [self removeFromSuperview];
}

@end
