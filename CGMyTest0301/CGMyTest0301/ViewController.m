//
//  ViewController.m
//  CGMyTest0301
//
//  Created by cgSjj on 16/3/1.
//  Copyright © 2016年 cgSjj. All rights reserved.
//

#import "ViewController.h"
#import "CGMyView.h"
#import "CGMyCell.h"
#import "Masonry.h"
#import "CGMydataModel.h"
#import "CGXiangxiViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UITableView *firstTableview;
@property(strong,nonatomic)UITableView *secondtableview;
@property(strong,nonatomic)IBOutlet UIView *bottomView;
@property(strong,nonatomic)NSArray *productArr;
@property(strong,nonatomic)NSArray *detailedArr;
@property(strong,nonatomic)NSArray  *array;
@end

@implementation ViewController


-(NSArray *)array
{
if(!_array)
{
    NSMutableArray *muArray=[NSMutableArray array];
    for(NSDictionary *dict in self.detailedArr)
    {
     
        CGMydataModel *data=[CGMydataModel dataWithdict:dict];
        [muArray addObject:data];
    
    }
    _array=muArray;
}
    return _array;
}


-(UITableView *)secondtableview
{
if(!_secondtableview)
{
    _secondtableview=[[UITableView alloc]init];
    [self.view addSubview:_secondtableview];
    _secondtableview.dataSource=self;
    _secondtableview.delegate=self;

}
    return _secondtableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
  
    self.productArr=@[@"商品1",@"商品2",@"商品3",@"商品4",@"商品5",@"商品6"];
    self.detailedArr=@[
                        @{@"time":@"2015.02.13"},
                        @{@"time":@"2015.06.24"}
                        
                        ];
                       
    

    
    
    [self autolayout];
    [self setUp];
    

}

/**初始化*/
-(void)setUp
{

    [self.view bringSubviewToFront:self.bottomView];
    
    self.firstTableview.rowHeight=100;
    self.secondtableview.rowHeight=100;
    [self.segmentControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    [self.firstTableview registerNib:[UINib nibWithNibName:NSStringFromClass([CGMyCell class]) bundle:nil] forCellReuseIdentifier:@"abc"]
    ;
    [self.secondtableview registerNib:[UINib nibWithNibName:NSStringFromClass([CGMyCell class]) bundle:nil] forCellReuseIdentifier:@"abc"]
    ;
}


-(void)changePage:(id)sender
{

    switch ([sender selectedSegmentIndex]) {
        case 0:
            self.secondtableview.hidden = YES;
            self.firstTableview.hidden = NO;
            [self.firstTableview reloadData];
            break;
            
        case 1:
            self.secondtableview.hidden = NO;
            self.firstTableview.hidden = YES;
            [self.secondtableview reloadData];
            break;
            
        default:
            NSLog(@"segmentActionDefault");
            break;
    }

}

-(void)autolayout
{

[self.secondtableview mas_makeConstraints:^(MASConstraintMaker *make) {
    make.bottom.mas_equalTo(self.view.mas_bottom);
     make.right.mas_equalTo(self.view.mas_right);
     make.left.mas_equalTo(self.view.mas_left);
     make.top.mas_equalTo(self.view.mas_top).offset(120);
}];
    
}


#pragma mark - <UITableViewDelegate,UITableViewDataSource>


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.segmentControl.selectedSegmentIndex){
        case 0:
        {
            CGMyView *view=[CGMyView viewCreate];
            view.frame=[UIScreen mainScreen].bounds;
            [self.view addSubview:view];
        }
            break;
        case 1:
        {
            CGXiangxiViewController *xiangqin=[[CGXiangxiViewController alloc]init];
            [self.navigationController pushViewController:xiangqin animated:YES];
        }
            
            break;
        default:
            
            break;
    }


}




-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    
    CGMydataModel *data=self.array[section];
   
    if(self.segmentControl.selectedSegmentIndex==1)
    {
        if (section==0) {
            return data.time;
        }else
            return data.time;
        
    }else return nil;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    switch (self.segmentControl.selectedSegmentIndex){
        case 0:
        {
            return 1;
        }
            break;
        case 1:
        {
            return self.detailedArr.count;
        }
            break;
        default:
            return 0;
            break;
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (self.segmentControl.selectedSegmentIndex){
        case 0:
        {
            return self.productArr.count;
        }
            break;
        case 1:
        {
            return [self.detailedArr[section] count];
        }
            break;
        default:
            return 0;
            break;
    }

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    switch (self.segmentControl.selectedSegmentIndex){
        case 0:
        {
            CGMyCell *cell=[tableView dequeueReusableCellWithIdentifier:@"abc"];
            return cell;
        }
            break;
        case 1:
        {
            CGMyCell *cell=[tableView dequeueReusableCellWithIdentifier:@"abc"];
            return cell;
        }
            break;
        default:
            return nil;
            break;
    }

}

@end
