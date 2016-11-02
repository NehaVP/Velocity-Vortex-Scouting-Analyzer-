//
//  SideMenuCell.m
//  CarApp
//
//  Created by Darshak Parmar on 31/03/16.
//  Copyright © 2016 Darshak Parmar. All rights reserved.
//

#import "SideMenuCell.h"
@interface SideMenuCell()
@property (strong, nonatomic) IBOutlet UIView *vw_backCell;

@end
@implementation SideMenuCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
   
    //self.selectionStyle  = UITableViewCellSelectionStyleNone;
    // Configure the v iew for the selected state
}

@end
