//
//  CGXiangxiViewController.m
//  CGMyTest0301
//
//  Created by cgSjj on 16/3/1.
//  Copyright © 2016年 cgSjj. All rights reserved.
//

#import "CGXiangxiViewController.h"
#import "CGMyView.h"
#import "Masonry.h"
#import "CGMydataModel.h"
@interface CGXiangxiViewController ()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UILabel *price;
@property(nonatomic,strong)UILabel *needjifen;
@property(nonatomic,strong)UIView  *lineOne;
@property(nonatomic,strong)UIView  *lineTwo;
@property(nonatomic,strong)UIButton  *duihuanBtn;
@property(nonatomic,strong)UILabel *usedjifen;
@property(strong,nonatomic)CGMydataModel *data;
@property(nonatomic,strong)NSDictionary *dataDict;
@end

@implementation CGXiangxiViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"兑换详情";
    self.view.backgroundColor=[UIColor whiteColor];
    //假数据
    self.dataDict=@{@"imageName":@"B8E0DE5C-41CB-481C-BA62-A0C9BC29479C",
                    @"productName":@"法国原瓶进口红酒 路易拉菲干红葡萄酒",
                    @"price":@"$239.0",
                    @"needJifen":@"所需积分：1200",
                    @"usedJifen":@"可用积分：800"
                    };
    
   
    [self createChild];
    [self autoLayout];
}

-(void)createChild
{
    CGMydataModel *data=[CGMydataModel dataWithdict:self.dataDict];
 
    self.imageView=[[UIImageView alloc]init];
    self.imageView.image=[UIImage imageNamed:data.imageName];
    [self.view addSubview:self.imageView];
    
    self.titleLable=[[UILabel alloc]init];
    self.titleLable.text=data.productName;
    self.titleLable.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:self.titleLable];
    
    self.price=[[UILabel alloc]init];
    self.price.text=data.price;
    self.price.font=[UIFont systemFontOfSize:11];
    self.price.textColor=[UIColor lightGrayColor];
    [self.view addSubview:self.price];
    
    self.needjifen=[[UILabel alloc]init];
    self.needjifen.text=data.needJifen;
    self.needjifen.font=[UIFont systemFontOfSize:12];
    self.needjifen.textColor=[UIColor orangeColor];
    [self.view addSubview:self.needjifen];

    self.lineOne=[[UIView alloc]init];
    self.lineOne.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:self.lineOne];
    
    self.lineTwo=[[UIView alloc]init];
     self.lineTwo.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:self.lineTwo];
    
    self.duihuanBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.duihuanBtn setTitle:@"我要兑换" forState:UIControlStateNormal];
    [self.duihuanBtn setBackgroundColor:[UIColor orangeColor]];
    [self.duihuanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置button圆角
    [self.duihuanBtn.layer setMasksToBounds:YES];
    [self.duihuanBtn.layer setCornerRadius:10.0];
    [self.duihuanBtn addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.duihuanBtn];
    
    self.usedjifen=[[UILabel alloc]init];
    self.usedjifen.text=data.usedJifen;
    self.usedjifen.font=[UIFont systemFontOfSize:12];
    self.usedjifen.textColor=[UIColor lightGrayColor];
    [self.view addSubview:self.usedjifen];
}

-(void)autoLayout
{

[self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(self.view.mas_top).offset(80);
    make.centerX.mas_equalTo(self.view.mas_centerX);
    make.height.mas_equalTo(self.view.mas_height).multipliedBy(0.4);
    make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.6);
}];
[self.lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(self.view.mas_left);
     make.right.mas_equalTo(self.view.mas_right);
    make.top.mas_equalTo(self.imageView.mas_bottom).offset(6);
    make.height.mas_equalTo(1);
}];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineOne.mas_bottom).offset(6);
        make.left.mas_equalTo(self.view.mas_left).offset(8);
        make.right.mas_equalTo(self.view.mas_right).offset(-8);
       // make.height.mas_equalTo(30);
    }];

    [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLable.mas_bottom).offset(3);
        make.left.mas_equalTo(self.titleLable.mas_left);
        make.right.mas_equalTo(self.titleLable.mas_right);
    }];
    [self.needjifen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.price.mas_bottom).offset(3);
        make.left.mas_equalTo(self.titleLable.mas_left);
        make.right.mas_equalTo(self.titleLable.mas_right);
    }];
    [self.lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.needjifen.mas_bottom).offset(7);
        make.height.mas_equalTo(1);
    }];
    [self.duihuanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineTwo.mas_bottom).offset(11);
        make.left.mas_equalTo(self.titleLable.mas_left);
         make.right.mas_equalTo(self.titleLable.mas_right);
    }];
    [self.usedjifen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.duihuanBtn.mas_bottom).offset(5);
        
    }];

}



-(void)jump
{
    NSLog(@"兑换成功");


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
