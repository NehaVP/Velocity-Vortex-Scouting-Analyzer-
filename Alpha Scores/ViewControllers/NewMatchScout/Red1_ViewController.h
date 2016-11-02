//
//  Red1_ViewController.h
//
//
//  Created by Neha Parmar on 7/30/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewMatchScout.h"

@interface Red1_ViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet RedTextField *Text_Red1_Team;
    IBOutlet RedTextField *Text_Red1_Team_Name;
    
    IBOutlet UISegmentedControl *Seg_Red1_Autonomous;
   /*New*/IBOutlet UISegmentedControl *Seg_Parked;
    /*New*/IBOutlet UISegmentedControl *Seg_Red1_Park_In;
    /*New*/IBOutlet UISegmentedControl *Seg_Red1_Cap;
    //IBOutlet UISegmentedControl *Seg_Red1_Tele_OP;
  
     /*New*/IBOutlet UISegmentedControl *Seg_Red1_Tele_OP_Ball_Raised;
    /*New*/ IBOutlet UISegmentedControl *Seg_Red1_Tele_OP_Vortex;

    
	IBOutlet UIButton *Btn_Red1_Beacons_Inc;
	IBOutlet UIButton *Btn_Red1_Beacons_Dec;
	IBOutlet UILabel *Lbl_Red1_Beacons_Val;
    
	IBOutlet UIButton *Btn_PS_Red1_Center_Inc;
	IBOutlet UIButton *Btn_PS_Red1_Center_Dec;
	IBOutlet UILabel *Lbl_PS_Red1_Center;
    
    IBOutlet UIButton *Btn_PS_Red1_Corner_Inc;
    IBOutlet UIButton *Btn_PS_Red1_Corner_Dec;
    IBOutlet UILabel *Lbl_PS_Red1_Corner;
    
    IBOutlet UIButton *TeleOP_Red1_Beacons_Inc;
    IBOutlet UIButton *TeleOP_Red1_Beacons_Dec;
    IBOutlet UILabel *Lbl_TeleOP_Red1_Beacons_Val;
    
    IBOutlet UIButton *Btn_TeleOP_PS_Red1_Center_Inc;
    IBOutlet UIButton *Btn_TeleOP_PS_Red1_Center_Dec;
    IBOutlet UILabel *Lbl_TeleOP_PS_Red1_Center;
    
    IBOutlet UIButton *Btn_TeleOP_PS_Red1_Corner_Inc;
    IBOutlet UIButton *Btn_TeleOP_PS_Red1_Corner_Dec;
    IBOutlet UILabel *Lbl_TeleOP_PS_Red1_Corner;
 }


//@property (nonatomic) int Lbl_Red1_Beacons_value;

@property (nonatomic) int r1b;
@property (nonatomic) int r1tb;
@property (nonatomic) int r1ce;
@property (nonatomic) int r1co;
@property (nonatomic) int r1tce;
@property (nonatomic) int r1tco;

@property(nonatomic,strong)NSDictionary *Dict_Red1;
@property (nonatomic, assign) BOOL Bool_Update;
//@property (nonatomic, assign) BOOL Bool_Update;

@end
