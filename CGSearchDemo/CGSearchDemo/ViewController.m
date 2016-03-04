//
//  ViewController.m
//  CGSearchDemo
//
//  Created by cgSjj on 16/3/4.
//  Copyright © 2016年 cgSjj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UISearchResultsUpdating,UISearchBarDelegate>
@property(nonatomic,strong)NSMutableArray *cities;
@property(nonatomic,strong)NSMutableArray *searchedCities;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(strong,nonatomic)UISearchController *searchController;
@end



@implementation ViewController
-(NSMutableArray *)searchedCities
{
if(!_searchedCities)
{

    _searchedCities=[NSMutableArray array];
}
    return _searchedCities;

}
-(NSMutableArray *)cities
{
    if(!_cities)
    {
        
        _cities=[NSMutableArray array];
    }
    return _cities;
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    //初始化
    
    [self setUp];

}


/**初始化*/
-(void)setUp
{
    NSArray *cities=@[@"上海",@"北京",@"深圳",@"广州",@"广东",@"sssss"];
    [self.cities addObjectsFromArray:cities];
    
    
    self.searchController=[[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater=self;
    self.searchController.dimsBackgroundDuringPresentation=NO;
    self.tableview.tableHeaderView=self.searchController.searchBar;

}


#pragma mark- UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    if(self.searchedCities!=nil)
      {
          [self.searchedCities removeAllObjects];
      }
    //利用谓词过滤
    NSPredicate *predicate=[NSPredicate  predicateWithFormat:@"SELF CONTAINS[c] %@",self.searchController.searchBar.text];
    self.searchedCities=[NSMutableArray arrayWithArray:[self.cities filteredArrayUsingPredicate:predicate] ];
    [self.tableview reloadData];
}



#pragma mark- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.searchController.active) {
        return self.searchedCities.count;
    }else
    return self.cities.count;

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    
    static NSString *flag=@"cellFlag";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:flag];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:flag];
    }
    
    if (self.searchController.active)
    {
    cell.textLabel.text=self.searchedCities[indexPath.row];
    }else
    {
        cell.textLabel.text=self.cities[indexPath.row];
    }
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
