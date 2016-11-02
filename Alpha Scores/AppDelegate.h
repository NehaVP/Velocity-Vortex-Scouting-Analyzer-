//
//  AppDelegate.h
//
//
//  Created by Neha Parmar on 7/27/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
typedef void(^myCompletion)(BOOL isSuccess,NSDictionary *responce);
typedef void(^connection)(BOOL);

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
     UIBackgroundTaskIdentifier bgTask;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong,nonatomic) NSString *Main_URL;


-(void)WebServiceName:(NSString *)serviceName params:(NSDictionary *)parameters completedOn:(myCompletion)block;

-(void)ShowProgressView;

-(void)HideProgressView;

- (void)CheckReachability:(connection)block;

-(void)ShowAlertWithNoAction:(NSString *)Message;

-(BOOL)NSStringIsValidEmail:(NSString *)checkString;



// Red 1 Team

@property(retain,nonatomic) NSString *Str_Red1_Team_Number;
@property(retain,nonatomic) NSString *Str_Red1_Team_Name;

@property(retain,nonatomic) NSString *Str_Red1_Autonomous;
@property(retain,nonatomic) NSString *Str_Red1_Parked;
/**/@property(strong,nonatomic) NSString *Str_Red1_Park_In;
//@property(strong,nonatomic) NSString *Str_Red1_Beacons;
/*Cap_BAll_On_Floor*/@property(strong,nonatomic) NSString *Str_Red1_Cap;
@property(retain,nonatomic) NSString *Str_Lbl_Red1_Beacons;
@property(retain,nonatomic) NSString *Str_Lbl_Red1_PS_Center;
@property(retain,nonatomic) NSString *Str_Lbl_Red1_PS_Corner;

///////@property(strong,nonatomic) NSString *Str_Red1_Tele_OP;

@property(strong,nonatomic) NSString *Str_Red1_Ball_Raised;
@property(strong,nonatomic) NSString *Str_Red1_Ball_Vortex;
@property(retain,nonatomic) NSString *Str_Lbl_Tele_Red1_Beacons;
@property(retain,nonatomic) NSString *Str_Lbl_Tele_Red1_PS_Center;
@property(retain,nonatomic) NSString *Str_Lbl_Tele_Red1_PS_Corner;




// Red 2 Team


@property(retain,nonatomic) NSString *Str_Red2_Team_Number;
@property(retain,nonatomic) NSString *Str_Red2_Team_Name;

@property(retain,nonatomic) NSString *Str_Red2_Autonomous;
@property(strong,nonatomic) NSString *Str_Red2_Park_In;
@property(strong,nonatomic) NSString *Str_Red2_Parked;
//@property(strong,nonatomic) NSString *Str_Red2_Beacons;
@property(strong,nonatomic) NSString *Str_Red2_Cap;

//////@property(strong,nonatomic) NSString *Str_Red2_Tele_OP;
@property(strong,nonatomic) NSString *Str_Red2_Tele_Ball_vortex;
@property(strong,nonatomic) NSString *Str_Red2_Ball_Raised;

@property(retain,nonatomic) NSString *Str_Lbl_Red2_Beacons;
@property(retain,nonatomic) NSString *Str_Lbl_Red2_PS_Center;
@property(retain,nonatomic) NSString *Str_Lbl_Red2_PS_Corner;

@property(retain,nonatomic) NSString *Str_Lbl_Tele_Red2_Beacons;
@property(retain,nonatomic) NSString *Str_Lbl_Tele_Red2_PS_Center;
@property(retain,nonatomic) NSString *Str_Lbl_Tele_Red2_PS_Corner;



// Blue 1 Team

@property(retain,nonatomic) NSString *Str_Blue1_Team_Number;
@property(retain,nonatomic) NSString *Str_Blue1_Team_Name;
@property(retain,nonatomic) NSString *Str_Blue1_Autonomous;
@property(strong,nonatomic) NSString *Str_Blue1_Park_In;
@property(strong,nonatomic) NSString *Str_Blue1_Parked;
//@property(strong,nonatomic) NSString *Str_Blue1_Beacons;
@property(strong,nonatomic) NSString *Str_Blue1_Cap_ball;
///////@property(strong,nonatomic) NSString *Str_Blue1_Tele_OP;
@property(strong,nonatomic) NSString *Str_Blue1_Ball_Vortex;
@property(strong,nonatomic) NSString *Str_Blue1_Ball_Raised;

@property(retain,nonatomic) NSString *Str_Lbl_Blue1_Beacons;

@property(retain,nonatomic) NSString *Str_Lbl_Blue1_PS_Center;
@property(retain,nonatomic) NSString *Str_Lbl_Blue1_PS_Corner;

@property(retain,nonatomic) NSString *Str_Lbl_Tele_Blue1_Beacons;

@property(retain,nonatomic) NSString *Str_Lbl_Tele_Blue1_PS_Center;
@property(retain,nonatomic) NSString *Str_Lbl_Tele_Blue1_PS_Corner;


// Blue 2 Team


//

@property(retain,nonatomic) NSString *Str_Blue2_Team_Number;
@property(retain,nonatomic) NSString *Str_Blue2_Team_Name;

@property(retain,nonatomic) NSString *Str_Blue2_Autonomous;
@property(strong,nonatomic) NSString *Str_Blue2_Park_In;
@property(strong,nonatomic) NSString *Str_Blue2_Parked;
//@property(strong,nonatomic) NSString *Str_Blue2_Beacons;
@property(strong,nonatomic) NSString *Str_Blue2_Cap_Ball_Floor;

/////////@property(strong,nonatomic) NSString *Str_Blue2_Tele_OP;
@property(strong,nonatomic) NSString *Str_Blue2_Ball_Vortex;
@property(strong,nonatomic) NSString *Str_Blue2_Ball_Raised;

@property(retain,nonatomic) NSString *Str_Lbl_Blue2_Beacons;

@property(retain,nonatomic) NSString *Str_Lbl_Blue2_PS_Center;
@property(retain,nonatomic) NSString *Str_Lbl_Blue2_PS_Corner;

@property(retain,nonatomic) NSString *Str_Lbl_Tele_Blue2_Beacons;

@property(retain,nonatomic) NSString *Str_Lbl_Tele_Blue2_PS_Center;
@property(retain,nonatomic) NSString *Str_Lbl_Tele_Blue2_PS_Corner;

@end

