//
//  ChooseTableViewCell.h
//  MulChooseDemo
//
//  Created by QITMAC000242 on 7/23/16.
//  Copyright © 2016 QITMAC000242. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseTableViewCell : UITableViewCell

@property (strong, nonatomic) UIButton *selectIconBtn;
@property (strong, nonatomic) NSIndexPath *currentIndexPath;
@property (assign, nonatomic) BOOL isSelected;


@end
