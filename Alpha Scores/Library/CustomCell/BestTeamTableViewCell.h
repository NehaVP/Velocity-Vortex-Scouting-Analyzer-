//
//  BestTeamTableViewCell.h
//
//
//  Created by Neha Parmar on 8/5/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BestTeamTableViewCell : UITableViewCell
{
    
}

@property(nonatomic,strong)IBOutlet UILabel *Label_TeamName;
@property(nonatomic,strong)IBOutlet UILabel *Label_TeamNumber;
@property(nonatomic,strong)IBOutlet UILabel *Label_TeamScore;
@property(nonatomic,strong)IBOutlet UILabel *Label_Consistancy;

@property(nonatomic,strong)IBOutlet UILabel *Label_Stats;

@end
