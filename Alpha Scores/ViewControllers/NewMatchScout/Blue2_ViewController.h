//
//  Blue2_ViewController.h
//
//
//  Created by Neha Parmar on 7/30/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Blue2_ViewController : UIViewController <UITextFieldDelegate>
{
    
     IBOutlet BlueTextField *Text_Blue2_Team;
     IBOutlet BlueTextField *Text_Blue2_Team_Name;
     
     IBOutlet UISegmentedControl *Seg_Blue2_Autonomous;
     IBOutlet UISegmentedControl *Seg_Blue2_Park_In;
  //   IBOutlet UISegmentedControl *Seg_Blue2_Tele_OP;
     IBOutlet UISegmentedControl *Seg_Blue2_Parked;
     IBOutlet UISegmentedControl *Seg_Blue2_Cap_Ball_On_Floor;
     IBOutlet UISegmentedControl *Seg_Blue2_Ball_Raised;
     IBOutlet UISegmentedControl *Seg_Blue2_Ball_Vortex;
    
    IBOutlet UIButton *Btn_Blue2_Beacons_Inc;
    IBOutlet UIButton *Btn_Blue2_Beacons_Dec;
    IBOutlet UILabel *Lbl_Blue2_Beacons_Val;
    
    IBOutlet UIButton *Btn_PS_Blue2_Center_Inc;
    IBOutlet UIButton *Btn_PS_Blue2_Center_Dec;
    IBOutlet UILabel *Lbl_PS_Blue2_Center;
    
    IBOutlet UIButton *Btn_PS_Blue2_Corner_Inc;
    IBOutlet UIButton *Btn_PS_Blue2_Corner_Dec;
    IBOutlet UILabel *Lbl_PS_Blue2_Corner;
    
    IBOutlet UIButton *TeleOP_Blue2_Beacons_Inc;
    IBOutlet UIButton *TeleOP_Blue2_Beacons_Dec;
    IBOutlet UILabel *Lbl_TeleOP_Blue2_Beacons_Val;
    
    IBOutlet UIButton *Btn_TeleOP_PS_Blue2_Center_Inc;
    IBOutlet UIButton *Btn_TeleOP_PS_Blue2_Center_Dec;
    IBOutlet UILabel *Lbl_TeleOP_PS_Blue2_Center;
    
    IBOutlet UIButton *Btn_TeleOP_PS_Blue2_Corner_Inc;
    IBOutlet UIButton *Btn_TeleOP_PS_Blue2_Corner_Dec;
    IBOutlet UILabel *Lbl_TeleOP_PS_Blue2_Corner;

    
    }
/***@property (retain, nonatomic) IBOutlet UIStepper *Blue2_Beacons_stepper;
@property (retain ,nonatomic) IBOutlet UILabel *lbl_Blue2_Beacons_Value;***/
@property (nonatomic) int b2b;
@property (nonatomic) int b2tb;

@property (nonatomic) int b2ce;
@property (nonatomic) int b2co;

@property (nonatomic) int b2tce;
@property (nonatomic) int b2tco;
@property(nonatomic,strong)NSDictionary *Dict_Blue2;
@property (nonatomic, assign) BOOL Bool_Update;

@end
