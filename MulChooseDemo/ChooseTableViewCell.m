//
//  ChooseTableViewCell.m
//  MulChooseDemo
//
//  Created by QITMAC000242 on 7/23/16.
//  Copyright © 2016 QITMAC000242. All rights reserved.
//

#import "ChooseTableViewCell.h"

@implementation ChooseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)dealloc {
    [_selectIconBtn removeObserver:self forKeyPath:@"selected"];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        [self createSelectBtn];
        _isSelected = NO;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 *  创建cell的选择按钮
 */
-(void)createSelectBtn {
    CGFloat btnWidth = 20;
    CGFloat btnHeight = 20;
    CGFloat btnX = self.frame.size.width;
    CGFloat btnY = 12;
    
    CGRect frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
    /**
     *  若要设置按钮图片，按钮应为自定义，否则会显示系统的蓝色
     *  或者设置按钮的背景图片，但是背景图片在图片状态selected为
     *  YES时，按钮图片仍为蓝色并出现在左上角
     */
    _selectIconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_selectIconBtn setFrame:frame];
    UIImage *unSelectImg = [UIImage imageNamed:@"table_UnSelect"];
    [_selectIconBtn setImage:unSelectImg forState:UIControlStateNormal];
    UIImage *selectedImg = [UIImage imageNamed:@"table_Selected"];
    [_selectIconBtn setImage:selectedImg forState:UIControlStateSelected];
    _selectIconBtn.userInteractionEnabled = NO;         //取消按钮与用户的交互，这样用户的点击事件就会忽略按钮直接到cell上
    /**
     *  给按钮增加观察者self，当按钮的selected值变化时，self便能响应
     */
    [_selectIconBtn addObserver:self forKeyPath:@"selected" options:NSKeyValueObservingOptionNew context:nil];
    [self addSubview:_selectIconBtn];
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if(_selectIconBtn.selected)
        _isSelected = YES;
    else
        _isSelected = NO;
}

@end
