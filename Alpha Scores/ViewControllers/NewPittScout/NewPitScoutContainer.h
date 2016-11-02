//
//  NewPitScoutContainer.h
//
//
//  Created by Neha Parmar on 8/2/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewPitScoutContainer : UIViewController
{
    
    
    
    /*IBOutlet UISegmentedControl *Seg_Score_Climbers;
    //IBOutlet UISegmentedControl *Seg_Score_Press;
    
    
    //IBOutlet UISegmentedControl *Seg_Mountain;
   // IBOutlet UISegmentedControl *Seg_ClearDebris;
    
    
   // IBOutlet UISegmentedControl *Seg_Score_Climbers1;
   // IBOutlet UISegmentedControl *Seg_Score_Balls;
    
   // IBOutlet UISegmentedControl *Seg_Release;
   // IBOutlet UISegmentedControl *Seg_Climbling;
   // IBOutlet UISegmentedControl *Seg_Hang;*/
    
    
    IBOutlet FloatEffect *Text_Team_Number;
     //IBOutlet RedTextField *Text_Team_Number;
     IBOutlet FloatEffect *Text_Team_Name;
    
         IBOutlet UISegmentedControl *Seg_Autonomous;
     IBOutlet UISegmentedControl *Seg_ParkIn;
    // IBOutlet UISegmentedControl *Seg_Tele_OP;
    
     IBOutlet UISegmentedControl *Seg_Parked;
 // auto beacons
IBOutlet UIButton *Btn_Beacons_Inc;
IBOutlet UIButton *Btn_Beacons_Dec;
IBOutlet UILabel *Lbl_Beacons_Val;
    //auto ps center
IBOutlet UIButton *Btn_PS_Center_Inc;
IBOutlet UIButton *Btn_PS_Center_Dec;
IBOutlet UILabel *Lbl_PS_Center;
    //auto ps corner
IBOutlet UIButton *Btn_PS_Corner_Inc;
IBOutlet UIButton *Btn_PS_Corner_Dec;
IBOutlet UILabel *Lbl_PS_Corner;
    //tele beacons
IBOutlet UIButton *TeleOP_Beacons_Inc;
IBOutlet UIButton *TeleOP_Beacons_Dec;
IBOutlet UILabel *Lbl_TeleOP_Beacons_Val;
    //tele ps center
IBOutlet UIButton *Btn_TeleOP_PS_Center_Inc;
IBOutlet UIButton *Btn_TeleOP_PS_Center_Dec;
IBOutlet UILabel *Lbl_TeleOP_PS_Center;
    //tele ps corner
IBOutlet UIButton *Btn_TeleOP_PS_Corner_Inc;
IBOutlet UIButton *Btn_TeleOP_PS_Corner_Dec;
IBOutlet UILabel *Lbl_TeleOP_PS_Corner;

     IBOutlet UISegmentedControl *Seg_Cap_Ball_On_Floor;
     IBOutlet UISegmentedControl *Seg_Ball_Raised;
     IBOutlet UISegmentedControl *Seg_Ball_Vortex;
    
    NSString *Str_ID;
}

@property (nonatomic, assign) BOOL Bool_Update;

@property(nonatomic,strong)NSDictionary *Dict_NewPitScoutContainer;
@property (nonatomic) int b;
@property (nonatomic) int tb;

@property (nonatomic) int ce;
@property (nonatomic) int co;

@property (nonatomic) int tce;
@property (nonatomic) int tco;

-(IBAction)Btn_Submit:(id)sender;

-(IBAction)Btn_Seg_Autonomous:(id)sender;

-(IBAction)Btn_Seg_TELE_OP:(id)sender;

@end
