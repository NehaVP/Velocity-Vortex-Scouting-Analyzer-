//
//  NewPitScoutContainer.m
//
//
//  Created by Neha Parmar on 8/2/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "NewPitScoutContainer.h"

@interface NewPitScoutContainer ()

@end

@implementation NewPitScoutContainer
@synthesize Bool_Update,Dict_NewPitScoutContainer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    Lbl_Beacons_Val.layer.borderColor = [UIColor whiteColor].CGColor;
    Lbl_Beacons_Val.layer.borderWidth = 2.0;
    
    Lbl_PS_Center.layer.borderColor = [UIColor whiteColor].CGColor;
    Lbl_PS_Center.layer.borderWidth = 2.0;
    
    Lbl_PS_Corner.layer.borderColor = [UIColor whiteColor].CGColor;
    Lbl_PS_Corner.layer.borderWidth = 2.0;
    
    Lbl_TeleOP_Beacons_Val.layer.borderColor = [UIColor whiteColor].CGColor;
    Lbl_TeleOP_Beacons_Val.layer.borderWidth = 2.0;
    
    Lbl_TeleOP_PS_Center.layer.borderColor = [UIColor whiteColor].CGColor;
    Lbl_TeleOP_PS_Center.layer.borderWidth = 2.0;
    
    Lbl_TeleOP_PS_Corner.layer.borderColor = [UIColor whiteColor].CGColor;
    Lbl_TeleOP_PS_Corner.layer.borderWidth = 2.0;
    
    
    if (Bool_Update)
    {
        NSLog(@"=======>%@",Dict_NewPitScoutContainer);
        
        
        [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:Dict_NewPitScoutContainer completedOn:^(BOOL isSuccess, NSDictionary *responce)
         {
             
     //       NSLog(@"NewPitScoutContainer === > %@",responce);
     //        NSLog(@"PARKED === > %@", [[responce objectForKey:@"data"] objectForKey:@"Parked"]);
             
             
             
             if (isSuccess)
             {
                 [ApplicationDelegate HideProgressView];
                 
                 if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
                 {
                     //   [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Messege"]];
                     //                      [self.navigationController popViewControllerAnimated:YES];
                     [self ShowAlertWithAction:[responce objectForKey:@"Messege"]];
                     
                 }
                 else if ([[responce objectForKey:@"error"]isEqualToString:@"0"])
                 {
                     
                     //     NSLog(@"==== RESPONSE === %@",responce);
                     
                     Text_Team_Name.text = [[responce objectForKey:@"data"] objectForKey:@"Team_name"];
                     Text_Team_Number.text = [[responce objectForKey:@"data"] objectForKey:@"Team_number"];
                     
                     Str_ID = [[responce objectForKey:@"data"] objectForKey:@"id"];
                     //NSString *Auto_Beacons = [[responce objectForKey:@"data"] objectForKey:@"Auto_Beacons"];
                     
                     if ([[[responce objectForKey:@"data"] objectForKey:@"Parked_In"] isKindOfClass:[NSNull class]])
                     {
                         [Seg_ParkIn setSelectedSegmentIndex:2];
                     }
                     else if ([[[responce objectForKey:@"data"] objectForKey:@"Parked_In"]isEqualToString:@"Center"])
                     {
                         [Seg_ParkIn setSelectedSegmentIndex:0];
                     }
                     else if ([[[responce objectForKey:@"data"] objectForKey:@"Parked_In"]isEqualToString:@"Corner"])
                     {
                         [Seg_ParkIn setSelectedSegmentIndex:1];
                     }
                     else if ([[[responce objectForKey:@"data"] objectForKey:@"Parked_In"]isEqualToString:@"None"])
                     {
                         [Seg_ParkIn setSelectedSegmentIndex:2];
                     }
                     
                     //if([[[responce objectForKey:@"data"] objectForKey:@"Auto_Beacons"]isEqualToString:@"<null>"]) {
                     self.b = [[[responce objectForKey:@"data"] objectForKey:@"Auto_Beacons"] intValue];
                     [self->Lbl_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b]];
                     
                     self.tb = [[[responce objectForKey:@"data"] objectForKey:@"TeleOp_Beacons"] intValue];
                     [self->Lbl_TeleOP_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.tb]];
                     
                     self.ce = [[[responce objectForKey:@"data"] objectForKey:@"Auto_PScore_Center"] intValue];
                     [self->Lbl_PS_Center setText:[NSString stringWithFormat:@"%d",self.ce]];
                     
                     self.co = [[[responce objectForKey:@"data"] objectForKey:@"Auto_PScore_Corner"] intValue];
                     [self->Lbl_PS_Corner setText:[NSString stringWithFormat:@"%d", self.co]];
                     
                     self.tce = [[[responce objectForKey:@"data"] objectForKey:@"TeleOp_PScore_Center"] intValue];
                     [self->Lbl_TeleOP_PS_Center setText:[NSString stringWithFormat:@"%d",  self.tce]];
                     
                     self.tco = [[[responce objectForKey:@"data"] objectForKey:@"TeleOp_PScore_Corner"] intValue];
                     [self->Lbl_TeleOP_PS_Corner setText:[NSString stringWithFormat:@"%d", self.tco]];
                     
            //         NSLog(@"====>%@",[[responce objectForKey:@"data"] objectForKey:@"Parked"]);
                     
                     if ([[[responce objectForKey:@"data"] objectForKey:@"Parked"] isKindOfClass:[NSNull class]])
                     {
                         [Seg_Parked setSelectedSegmentIndex:2];
                     }
                     else if ([[[responce objectForKey:@"data"] objectForKey:@"Parked"]isEqualToString:@"Partially"])
                     {
                         [Seg_Parked setSelectedSegmentIndex:0];
                     }
                     else if ([[[responce objectForKey:@"data"] objectForKey:@"Parked"]isEqualToString:@"Fully"])
                     {
                         [Seg_Parked setSelectedSegmentIndex:1];
                     }
                     else if ([[[responce objectForKey:@"data"] objectForKey:@"Parked"]isEqualToString:@"None"])
                     {
                         [Seg_Parked setSelectedSegmentIndex:2];
                     }
                     
                     
                     if ([[[responce objectForKey:@"data"] objectForKey:@"Cap_Ball_Raised"] isKindOfClass:[NSNull class]])
                     {
                         
                         [Seg_Ball_Raised setSelectedSegmentIndex:2];
                     }
                     else if ([[[responce objectForKey:@"data"] objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"GT30"])
                     {
                         [Seg_Ball_Raised setSelectedSegmentIndex:1];
                     }
                     else if ([[[responce objectForKey:@"data"] objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"LT30"])
                     {
                         [Seg_Ball_Raised setSelectedSegmentIndex:0];
                     }
                     else if ([[[responce objectForKey:@"data"] objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"None"])
                     {
                         [Seg_Ball_Raised setSelectedSegmentIndex:2];
                     }
                     
                     
                     
                     
                     if ([[[responce objectForKey:@"data"] objectForKey:@"Cap_Ball_Floor"] isKindOfClass:[NSNull class]])
                     {
                         [Seg_Cap_Ball_On_Floor setSelectedSegmentIndex:1];
                     }
                     else if ([[[responce objectForKey:@"data"] objectForKey:@"Cap_Ball_Floor"]isEqualToString:@"Y"])
                     {
                         [Seg_Cap_Ball_On_Floor setSelectedSegmentIndex:0];
                     }
                     else
                     {
                         [Seg_Cap_Ball_On_Floor setSelectedSegmentIndex:1];
                     }
                     
                     
                     
                     if ([[[responce objectForKey:@"data"] objectForKey:@"Cap_Ball_Center"] isKindOfClass:[NSNull class]])
                     {
                         [Seg_Ball_Vortex setSelectedSegmentIndex:1];
                     }
                     else if ([[[responce objectForKey:@"data"] objectForKey:@"Cap_Ball_Center"]isEqualToString:@"Y"])
                     {
                         [Seg_Ball_Vortex setSelectedSegmentIndex:0];
                         
                     }
                     else
                     {
                         [Seg_Ball_Vortex setSelectedSegmentIndex:1];
                     }
                     
                     
                     
                     
                     if ([[[responce objectForKey:@"data"] objectForKey:@"Has_autnoumous"] isKindOfClass:[NSNull class]])
                     {
             //            Seg_ParkIn.userInteractionEnabled = NO;
             //            Seg_Parked.userInteractionEnabled = NO;
              //           Seg_Cap_Ball_On_Floor.userInteractionEnabled = NO;
                         //Seg_Score_Climbers.userInteractionEnabled = NO;
                         //Seg_Score_Press.userInteractionEnabled = NO;
                         //Seg_Mountain.userInteractionEnabled = NO;
                         // Seg_ClearDebris.userInteractionEnabled = NO;
                         
                         [Seg_Autonomous setSelectedSegmentIndex:1];
                     }
                     else if ([[[responce objectForKey:@"data"] objectForKey:@"Has_autnoumous"]isEqualToString:@"Y"])
                     {
                         [Seg_Autonomous setSelectedSegmentIndex:0];
                     }
                     else
                     {
                //         Seg_ParkIn.userInteractionEnabled = NO;
                 //        Seg_Parked.userInteractionEnabled = NO;
                  //       Seg_Cap_Ball_On_Floor.userInteractionEnabled = NO;
                         
                         /*
                          Seg_Score_Climbers.userInteractionEnabled = NO;
                          Seg_Score_Press.userInteractionEnabled = NO;
                          Seg_Mountain.userInteractionEnabled = NO;
                          Seg_ClearDebris.userInteractionEnabled = NO;
                          */
                         [Seg_Autonomous setSelectedSegmentIndex:1];
                     }
                 }
             }
             else
             {
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 [ApplicationDelegate HideProgressView];
             }
         }];
        
    }
    else
    {
        Seg_ParkIn.userInteractionEnabled = NO;
        Seg_Parked.userInteractionEnabled = NO;
        Seg_Cap_Ball_On_Floor.userInteractionEnabled = NO;
        
        Seg_Autonomous.selectedSegmentIndex = 1;
        Seg_ParkIn.selectedSegmentIndex = 2;
        Seg_Parked.selectedSegmentIndex = 2;
        Seg_Cap_Ball_On_Floor.selectedSegmentIndex = 1;
        
        //Seg_Tele_OP.selectedSegmentIndex = 1;
        Seg_Ball_Raised.selectedSegmentIndex = 2;
        Seg_Ball_Vortex.selectedSegmentIndex = 1;
        
        
    }
}
//becons
-(IBAction)Btn_Beacon_Inc:(id)sender
{
    if (self.b < 4)
    {
        self.b++;
        
        [self->Lbl_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b]];
    }
}
-(IBAction)Btn_Beacon_Dec:(id)sender
{
    if (self.b >0)
    {
        self.b--;
        
        [self->Lbl_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b]];
    }
}


//ps Center
-(IBAction)Btn_PS_Center_Inc:(id)sender
{
    if (self.ce < 99)
    {
        
        self.ce++;
        
        [self->Lbl_PS_Center setText:[NSString stringWithFormat:@"%d", self.ce]];
        
    }
}
-(IBAction)Btn_PS_Center_Dec:(id)sender
{
    if (self.ce > 0)
    {
        self.ce--;
        
        [self->Lbl_PS_Center setText:[NSString stringWithFormat:@"%d", self.ce]];
    }
}
//PS Corner
-(IBAction)Btn_PS_Corner_Inc:(id)sender
{
    if (self.co < 99)
    {
        
        self.co++;
        
        [self->Lbl_PS_Corner setText:[NSString stringWithFormat:@"%d", self.co]];
    }
}
-(IBAction)Btn_PS_Corner_Dec:(id)sender
{
    if (self.co > 0)
    {
        self.co--;
        
        [self->Lbl_PS_Corner setText:[NSString stringWithFormat:@"%d", self.co]];
    }
}


//tele_beacons
-(IBAction)Btn_TeleOP_Beacon_Inc:(id)sender
{
    if (self.tb < 4)
    {
        self.tb++;
        
        [self->Lbl_TeleOP_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.tb]];
    }
}

-(IBAction)Btn_TeleOP_Beacon_Dec:(id)sender
{
    if (self.tb >0)
    {
        self.tb--;
        
        [self->Lbl_TeleOP_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.tb]];
    }
}

//tele_ps
-(IBAction)Btn_TeleOP_PS_Center_Inc:(id)sender
{
    if (self.tce < 99)
    {
        self.tce++;
        
        [self->Lbl_TeleOP_PS_Center setText:[NSString stringWithFormat:@"%d", self.tce]];
    }
}
-(IBAction)Btn_TeleOP_PS_Center_Dec:(id)sender
{
    if (self.tce >0)
    {
        self.tce--;
        
        [self->Lbl_TeleOP_PS_Center setText:[NSString stringWithFormat:@"%d", self.tce]];
    }
}

-(IBAction)Btn_TeleOP_PS_Corner_Inc:(id)sender
{
    if (self.tco < 99)
    {
        self.tco++;
        
        [self->Lbl_TeleOP_PS_Corner setText:[NSString stringWithFormat:@"%d", self.tco]];
    }
}

-(IBAction)Btn_TeleOP_PS_Corner_Dec:(id)sender
{
    if (self.tco >0)
    {
        self.tco--;
        
        [self->Lbl_TeleOP_PS_Corner setText:[NSString stringWithFormat:@"%d", self.tco]];
    }
}

-(IBAction)Btn_Seg_Autonomous:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger New = segmentedControl.selectedSegmentIndex;
    
    if (New == 0)
    {
        Seg_ParkIn.userInteractionEnabled = YES;
        Seg_Parked.userInteractionEnabled = YES;
        Seg_Cap_Ball_On_Floor.userInteractionEnabled = YES;
        
        Btn_Beacons_Dec.userInteractionEnabled = YES;
        Btn_Beacons_Inc.userInteractionEnabled = YES;
        
        Btn_PS_Center_Dec.userInteractionEnabled = YES;
        Btn_PS_Center_Inc.userInteractionEnabled = YES;
        
        Btn_PS_Corner_Dec.userInteractionEnabled = YES;
        Btn_PS_Corner_Inc.userInteractionEnabled = YES;
    }
    else
    {
        Seg_ParkIn.userInteractionEnabled = NO;
        Seg_Parked.userInteractionEnabled = NO;
        Seg_Cap_Ball_On_Floor.userInteractionEnabled = NO;
        
        Btn_Beacons_Dec.userInteractionEnabled = NO;
        Btn_Beacons_Inc.userInteractionEnabled = NO;
        
        Btn_PS_Center_Dec.userInteractionEnabled = NO;
        Btn_PS_Center_Inc.userInteractionEnabled = NO;
        
        Btn_PS_Corner_Dec.userInteractionEnabled = NO;
        Btn_PS_Corner_Inc.userInteractionEnabled = NO;
        
        
    }
}


/*-(IBAction)Btn_Seg_TELE_OP:(id)sender
 {
 UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
 NSInteger New = segmentedControl.selectedSegmentIndex;
 
 if (New == 0)
 {
 Seg_Ball_Raised.userInteractionEnabled = YES;
 Seg_Ball_Vortex.userInteractionEnabled = YES;
 
 
 Btn_TeleOP_PS_Center_Dec.userInteractionEnabled = YES;
 Btn_TeleOP_PS_Center_Inc.userInteractionEnabled = YES;
 
 TeleOP_Beacons_Dec.userInteractionEnabled = YES;
 TeleOP_Beacons_Inc.userInteractionEnabled = YES;
 
 Btn_TeleOP_PS_Corner_Dec.userInteractionEnabled = YES;
 Btn_TeleOP_PS_Center_Inc.userInteractionEnabled = YES;
 }
 else
 {
 Seg_Ball_Raised.userInteractionEnabled = NO;
 Seg_Ball_Vortex.userInteractionEnabled = NO;
 
 Btn_TeleOP_PS_Center_Dec.userInteractionEnabled = NO;
 Btn_TeleOP_PS_Center_Inc.userInteractionEnabled = NO;
 
 TeleOP_Beacons_Dec.userInteractionEnabled = NO;
 TeleOP_Beacons_Inc.userInteractionEnabled = NO;
 
 Btn_TeleOP_PS_Corner_Dec.userInteractionEnabled = NO;
 Btn_TeleOP_PS_Center_Inc.userInteractionEnabled = NO;
 
 }
 }
 */

-(IBAction)Btn_Submit:(id)sender
{
    
    
    
    NSString *Str_Autonomous = [Seg_Autonomous titleForSegmentAtIndex:Seg_Autonomous.selectedSegmentIndex];
    NSInteger Int_Autonomous = Seg_Autonomous.selectedSegmentIndex;
    
    NSString *Str_ParkIn;
    NSString *Str_Parked;
    NSString *Str_Cap_Ball_On_Floor;
    
    NSString *Str_Lbl_Beacons;
    NSString *Str_Lbl_PS_Center;
    NSString *Str_Lbl_PS_Corner;
    
    
    if (Int_Autonomous == 0)
    {
        Str_ParkIn = [Seg_ParkIn titleForSegmentAtIndex:Seg_ParkIn.selectedSegmentIndex];
        Str_Parked = [Seg_Parked titleForSegmentAtIndex:Seg_Parked.selectedSegmentIndex];
        
        Str_Lbl_Beacons = [NSString stringWithFormat:@"%@", Lbl_Beacons_Val.text];
        Str_Lbl_PS_Center = [NSString stringWithFormat:@"%@", Lbl_PS_Center.text];
        Str_Lbl_PS_Corner = [NSString stringWithFormat:@"%@", Lbl_PS_Corner.text];
        
        Str_Cap_Ball_On_Floor = [Seg_Cap_Ball_On_Floor titleForSegmentAtIndex:Seg_Cap_Ball_On_Floor.selectedSegmentIndex];
        
    }
    else
    {
        Str_ParkIn = @"";
        Str_Parked = @"";
        Str_Cap_Ball_On_Floor = @"";
        
        Str_Lbl_Beacons = @"0";
        Str_Lbl_PS_Center = @"0";
        Str_Lbl_PS_Corner = @"0";
        
        
    }
    
    
    
    
    
    NSString *Str_Cap_Ball_Raised = [Seg_Ball_Raised titleForSegmentAtIndex:Seg_Ball_Raised.selectedSegmentIndex];
    NSString *Str_Ball_Vortex = [Seg_Ball_Vortex titleForSegmentAtIndex:Seg_Ball_Vortex.selectedSegmentIndex];
    
    NSString *Str_Lbl_TeleOP_Beacons_Val;
    NSString *Str_Lbl_TeleOP_PS_Center;
    NSString *Str_Lbl_TeleOP_PS_Corner;
    
    /*if (Int_Tele_OP == 0)
     {*/
    //Str_TeleOP = [Seg_Tele_OP titleForSegmentAtIndex:Seg_Tele_OP.selectedSegmentIndex];
    
    Str_Cap_Ball_Raised = [Seg_Ball_Raised titleForSegmentAtIndex:Seg_Ball_Raised.selectedSegmentIndex];
    Str_Ball_Vortex = [Seg_Ball_Vortex titleForSegmentAtIndex:Seg_Ball_Vortex.selectedSegmentIndex];
    
    Str_Lbl_TeleOP_Beacons_Val = [NSString stringWithFormat:@"%@",Lbl_TeleOP_Beacons_Val.text];
    Str_Lbl_TeleOP_PS_Center = [NSString stringWithFormat:@"%@", Lbl_TeleOP_PS_Center.text];
    Str_Lbl_TeleOP_PS_Corner = [NSString stringWithFormat:@"%@", Lbl_TeleOP_PS_Corner.text];
    NSDictionary *parameters;
    
    //   NSLog(@"===%@",Bool_Update ? @"YES" : @"NO");
    if (Bool_Update)
    {
       
        
        parameters = @{@"task": @"updatedPittScouting", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"],@"Entered_by_user":[[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"], @"Team_number":Text_Team_Number.text, @"Team_name" : Text_Team_Name.text,@"Has_autnoumous":Str_Autonomous,@"Autohas_Beacons_val":Str_Lbl_Beacons,@"Autohas_PS_Center":Str_Lbl_PS_Center,@"Autohas_PS_Corner":Str_Lbl_PS_Corner,@"Park_in": Str_ParkIn,@"Parked":Str_Parked,@"Cap_Ball_On_floor":Str_Cap_Ball_On_Floor,@"TeleOP_Has_Beacons_Val":Str_Lbl_TeleOP_Beacons_Val,@"TeleOPhas_PS_Center":Str_Lbl_TeleOP_PS_Center,@"TeleOP_has_PS_Corner":Str_Lbl_TeleOP_PS_Corner,@"Ball_Raised":Str_Cap_Ball_Raised,@"Ball_Vortex":Str_Ball_Vortex,@"id": Str_ID};/*@"Has_teleop":Str_TeleOP,*/
        //     NSLog(@"== PARAMETERS =%@",parameters);
        
    }
    else
    {
        parameters = @{@"task": @"InsertPittScouting", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"],@"Entered_by_user":[[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"], @"Team_number":Text_Team_Number.text, @"Team_name" : Text_Team_Name.text,@"Has_autnoumous":Str_Autonomous,@"Autohas_Beacons_val":Str_Lbl_Beacons,@"Autohas_PS_Center":Str_Lbl_PS_Center,@"Autohas_PS_Corner":Str_Lbl_PS_Corner,@"Park_in": Str_ParkIn,@"Parked":Str_Parked, @"Cap_Ball_On_Floor":Str_Cap_Ball_On_Floor,@"TeleOP_Has_Beacons_Val":Str_Lbl_TeleOP_Beacons_Val,@"TeleOPhas_PS_Center":Str_Lbl_TeleOP_PS_Center,@"TeleOP_has_PS_Corner":Str_Lbl_TeleOP_PS_Corner, @"Ball_Raised":Str_Cap_Ball_Raised, @"Ball_Vortex":Str_Ball_Vortex };/*@"Has_teleop":Str_TeleOP*/
        // NSLog(@"string is *********** %@",Str_Cap_Ball_Raised);
    }
    
       NSLog(@" parameters ==> %@",parameters);
    
    [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
     {
                  NSLog(@"======%@",responce);
         if (isSuccess)
         {
             Bool_Update = NO;
             Str_ID = @"";
             if ([[responce objectForKey:@"error"]isEqualToString:@"2"]) {
                 [ApplicationDelegate HideProgressView];
                 [self ShowAlertPopup:[responce objectForKey:@"Massege"]];
                 Str_ID = [responce objectForKey:@"id"];
             } else {
                 NSLog(@"4@");
                 [ApplicationDelegate HideProgressView];
                 [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Massege"]];
                 NSLog(@"5@");
             }
         }
         else
         {
             [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
             [ApplicationDelegate HideProgressView];
         }
     }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)ShowAlertPopup:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                    message:@"Pit Scouting Data already exists, Do you want to update?"
                                                   delegate:self
                                          cancelButtonTitle:@"No"
                                          otherButtonTitles:@"Yes", nil];
    [alert show];
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch(buttonIndex) {
        case 0: //"No" pressed
            //do something?
            Str_ID = @"";
            break;
        case 1: //"Yes" pressed
            //here you pop the viewController
            Bool_Update = YES;
            [self Btn_Submit:@""];
            //[self.navigationController popViewControllerAnimated:YES];
            break;
    }
}

-(void)ShowAlertWithAction:(NSString *)Message
{
    UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:nil  message:Message  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"ok"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   [self.navigationController popViewControllerAnimated:YES];
                               }];
    
    [alertController addAction:okAction];
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    [topController presentViewController:alertController animated:YES completion:nil];
    //[AppDelegate window.rootViewController presentViewController:alertController animated:YES completion:nil];
}

@end
