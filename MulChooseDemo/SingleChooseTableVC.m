//
//  SingleChooseTableVC.m
//  MulChooseDemo
//
//  Created by QITMAC000242 on 7/23/16.
//  Copyright © 2016 QITMAC000242. All rights reserved.
//

#import "SingleChooseTableVC.h"
#import "ChooseTableViewCell.h"

@interface SingleChooseTableVC ()

@property (strong, nonatomic) UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) NSIndexPath *currentIndexPath;    //用来保存当前被选cell的位置，若不设这个值，tableView可进行多选

@end

@implementation SingleChooseTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"TableView单选";
    self.view.backgroundColor = [UIColor whiteColor];
    _dataArray = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",nil];
    
    _myTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (ChooseTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    ChooseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell) {
        cell = [[ChooseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(_currentIndexPath != indexPath) {
        ChooseTableViewCell *cell = [tableView cellForRowAtIndexPath:_currentIndexPath];
        cell.selectIconBtn.selected = NO;
        _currentIndexPath = indexPath;
    }
    
    ChooseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(!cell.isSelected) {
        cell.selectIconBtn.selected = YES;
    }
    else
        cell.selectIconBtn.selected = NO;

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
