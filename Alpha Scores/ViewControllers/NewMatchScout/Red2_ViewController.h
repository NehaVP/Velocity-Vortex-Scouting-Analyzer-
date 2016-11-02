//
//  Red2_ViewController.h
//
//
//  Created by Neha Parmar on 7/30/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Red2_ViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet RedTextField *Text_Red2_Team;
    IBOutlet RedTextField *Text_Red2_Team_Name;
    
    IBOutlet UISegmentedControl *Seg_Red2_Autonomous;
    IBOutlet UISegmentedControl *Seg_Red2_Parked;
    IBOutlet UISegmentedControl *Seg_Red2_Park_In;
    //IBOutlet UIButton *Red2_Beacons_Pluse;
   // IBOutlet UIButton *Red2_Beacons_Dec;
    IBOutlet UISegmentedControl *Seg_Red2_Cap;
  //  IBOutlet UISegmentedControl *Seg_Red2_Tele_OP;
    IBOutlet UISegmentedControl *Seg_Red2_Cap_Ball_Vortex;
    IBOutlet UISegmentedControl *Seg_Red2_Ball_Raised;
    
    
    IBOutlet UIButton *Btn_Red2_Beacons_Inc;
    IBOutlet UIButton *Btn_Red2_Beacons_Dec;
    IBOutlet UILabel *Lbl_Red2_Beacons_Val;
    
    IBOutlet UIButton *Btn_PS_Red2_Center_Inc;
    IBOutlet UIButton *Btn_PS_Red2_Center_Dec;
    IBOutlet UILabel *Lbl_PS_Red2_Center;
    
    IBOutlet UIButton *Btn_PS_Red2_Corner_Inc;
    IBOutlet UIButton *Btn_PS_Red2_Corner_Dec;
    IBOutlet UILabel *Lbl_PS_Red2_Corner;
    
    IBOutlet UIButton *TeleOP_Red2_Beacons_Inc;
    IBOutlet UIButton *TeleOP_Red2_Beacons_Dec;
    IBOutlet UILabel *Lbl_TeleOP_Red2_Beacons_Val;
    
    IBOutlet UIButton *Btn_TeleOP_PS_Red2_Center_Inc;
    IBOutlet UIButton *Btn_TeleOP_PS_Red2_Center_Dec;
    IBOutlet UILabel *Lbl_TeleOP_PS_Red2_Center;
    
    IBOutlet UIButton *Btn_TeleOP_PS_Red2_Corner_Inc;
    IBOutlet UIButton *Btn_TeleOP_PS_Red2_Corner_Dec;
    IBOutlet UILabel *Lbl_TeleOP_PS_Red2_Corner;

    
    
   // IBOutlet UIStepper *Red2_Beacon_Counter;
   // IBOutlet NSLayoutConstraint *lbl_Red2_Beacon_Value;
    //IBOutlet UISegmentedControl *Seg_Red2_Pre_Beacon;
   // IBOutlet UISegmentedControl *Seg_Red2_On_Mountain;
    //IBOutlet UISegmentedControl *Seg_Red2_Clear_Berris;
    //IBOutlet UISegmentedControl *Seg_Red2_Auto_Lost_Connection;
    //IBOutlet UISegmentedControl *Seg_Red2_Tele_OP_Score_Climbers;
    //IBOutlet UISegmentedControl *Seg_Red2_Score_Balls_IN;
    //IBOutlet UISegmentedControl *Seg_Red2_Release_Trigger;
    /*Removed* IBOutlet UISegmentedControl *Seg_Red2_Auto_Score_Climbers;*/
    //IBOutlet UISegmentedControl *Seg_Red2_Climbing;
    //IBOutlet UISegmentedControl *Seg_Red2_Hang;
    //IBOutlet UISegmentedControl *Seg_Red2_Tele_OP_Lost_Connection;
   
}
@property (nonatomic) int r2b;
@property (nonatomic) int r2tb;
@property (nonatomic) int r2ce;
@property (nonatomic) int r2co;
@property (nonatomic) int r2tce;
@property (nonatomic) int r2tco;

@property(nonatomic,strong)NSDictionary *Dict_Red2;
@property (nonatomic, assign) BOOL Bool_Update;

@end
