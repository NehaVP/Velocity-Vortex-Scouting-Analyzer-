//
//  Blue1_ViewController.h
//
//
//  Created by Neha Parmar on 7/30/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Blue1_ViewController : UIViewController
<UITextFieldDelegate>
{
    IBOutlet BlueTextField *Text_Blue1_Team;
    IBOutlet BlueTextField *Text_Blue1_Team_Name;
    
    IBOutlet UISegmentedControl *Seg_Blue1_Autonomous;
    IBOutlet UISegmentedControl *Seg_Blue1_Cap_ball;
    IBOutlet UISegmentedControl *Seg_Blue1_Park_In;
  //  IBOutlet UISegmentedControl *Seg_Blue1_Tele_OP;
    IBOutlet UISegmentedControl *Seg_Blue1_Parked;
    IBOutlet UISegmentedControl *Seg_Blue1_Ball_Raised;
    IBOutlet UISegmentedControl *Seg_Blue1_Ball_Vortex;
    
    IBOutlet UIButton *Btn_Blue1_Beacons_Inc;
    IBOutlet UIButton *Btn_Blue1_Beacons_Dec;
    IBOutlet UILabel *Lbl_Blue1_Beacons_Val;
    
    IBOutlet UIButton *Btn_PS_Blue1_Center_Inc;
    IBOutlet UIButton *Btn_PS_Blue1_Center_Dec;
    IBOutlet UILabel *Lbl_PS_Blue1_Center;
    
    IBOutlet UIButton *Btn_PS_Blue1_Corner_Inc;
    IBOutlet UIButton *Btn_PS_Blue1_Corner_Dec;
    IBOutlet UILabel *Lbl_PS_Blue1_Corner;
    
    IBOutlet UIButton *TeleOP_Blue1_Beacons_Inc;
    IBOutlet UIButton *TeleOP_Blue1_Beacons_Dec;
    IBOutlet UILabel *Lbl_TeleOP_Blue1_Beacons_Val;
    
    IBOutlet UIButton *Btn_TeleOP_PS_Blue1_Center_Inc;
    IBOutlet UIButton *Btn_TeleOP_PS_Blue1_Center_Dec;
    IBOutlet UILabel *Lbl_TeleOP_PS_Blue1_Center;
    
    IBOutlet UIButton *Btn_TeleOP_PS_Blue1_Corner_Inc;
    IBOutlet UIButton *Btn_TeleOP_PS_Blue1_Corner_Dec;
    IBOutlet UILabel *Lbl_TeleOP_PS_Blue1_Corner;

}
@property (nonatomic) int b1b;
@property (nonatomic) int b1ce;
@property (nonatomic) int b1co;

@property (nonatomic) int b1tb;
@property (nonatomic) int b1tce;
@property (nonatomic) int b1tco;

@property(nonatomic,strong)NSDictionary *Dict_Blue1;
@property (nonatomic, assign) BOOL Bool_Update;

@end
