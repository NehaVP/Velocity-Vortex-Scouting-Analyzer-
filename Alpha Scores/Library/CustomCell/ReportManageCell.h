//
//  ReportManageCell.h
//
//
//  Created by Neha Parmar on 8/5/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportManageCell : UITableViewCell
{
    
}
@property (strong, nonatomic) IBOutlet UILabel *lbl_Autonomous;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Park_Center;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Park_Corner;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Matches_Beacons;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Beacons;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Cap_Ball_onFloor;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Tele_Matches_Beacons;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Tele_Beacons;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Tele_Cap_Ball_Raised;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Tele_Cap_Ball_Vortex;



@property(nonatomic,strong) IBOutlet UILabel *Label_Auto_Score;
@property(nonatomic,strong) IBOutlet UILabel *Label_TELEOP_Score;
@property(nonatomic,strong) IBOutlet UILabel *Label_Total_Score;



/*
@property(nonatomic,strong) IBOutlet UILabel *Label_Non_Autonomous;
@property(nonatomic,strong) IBOutlet UILabel *Label_Auto_Climbers;

@property(nonatomic,strong) IBOutlet UILabel *Label_Beacon_Button;
@property(nonatomic,strong) IBOutlet UILabel *Label_ParksIn;
@property(nonatomic,strong) IBOutlet UILabel *Label_Parks_Mountain;

@property(nonatomic,strong) IBOutlet UILabel *Label_Berris;
@property(nonatomic,strong) IBOutlet UILabel *Label_Lost_Connection;

@property(nonatomic,strong) IBOutlet UILabel *Label_TELEPO_Climbers;
@property(nonatomic,strong) IBOutlet UILabel *Label_TELEPO_Climbing;

@property(nonatomic,strong) IBOutlet UILabel *Label_Hang;
@property(nonatomic,strong) IBOutlet UILabel *Label_TelePO_Lost_Connection;
*/



//@property(nonatomic,strong) IBOutlet UILabel *Label_Score;



@end
