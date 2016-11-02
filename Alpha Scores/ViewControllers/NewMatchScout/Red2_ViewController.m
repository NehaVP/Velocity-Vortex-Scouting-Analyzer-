//
//  Red2_ViewController.m
//
//
//  Created by Neha Parmar on 7/30/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "Red2_ViewController.h"

@interface Red2_ViewController ()

@end

@implementation Red2_ViewController
@synthesize Dict_Red2,Bool_Update;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
 //       NSLog(@" Red2VIEWCONTROLLER ====%s", Bool_Update ? "YES" : "NO");
 //       NSLog(@" Red2VIEWCONTROLLER ==== %@",Dict_Red2);
    
    Lbl_Red2_Beacons_Val.layer.borderColor =[UIColor redColor].CGColor;
    Lbl_Red2_Beacons_Val.layer.borderWidth = 2.0;
    
    Lbl_PS_Red2_Center.layer.borderColor =[UIColor redColor].CGColor;
    Lbl_PS_Red2_Center.layer.borderWidth = 2.0;
    
    Lbl_PS_Red2_Corner.layer.borderColor =[UIColor redColor].CGColor;
    Lbl_PS_Red2_Corner.layer.borderWidth = 2.0;
    
    Lbl_TeleOP_Red2_Beacons_Val.layer.borderColor =[UIColor redColor].CGColor;
    Lbl_TeleOP_Red2_Beacons_Val.layer.borderWidth = 2.0;
    
    Lbl_TeleOP_PS_Red2_Center.layer.borderColor =[UIColor redColor].CGColor;
    Lbl_TeleOP_PS_Red2_Center.layer.borderWidth = 2.0;
    
    Lbl_TeleOP_PS_Red2_Corner.layer.borderColor =[UIColor redColor].CGColor;
    Lbl_TeleOP_PS_Red2_Corner.layer.borderWidth = 2.0;
    
    Text_Red2_Team.delegate = self;
    Text_Red2_Team_Name.delegate = self;
    
    [self disabledData];
    if (Bool_Update)
    {
        Text_Red2_Team.text = [Dict_Red2 objectForKey:@"team_number"];
        Text_Red2_Team_Name.text = [Dict_Red2 objectForKey:@"team_name"];
        
        ApplicationDelegate.Str_Red2_Team_Number = [Dict_Red2 objectForKey:@"team_number"];
        ApplicationDelegate.Str_Red2_Team_Name = [Dict_Red2 objectForKey:@"team_name"];

//        NSLog(@" ==== RED@VIEWCONTROLLER ==== %@",ApplicationDelegate.Str_Red2_Team_Number);
 //        NSLog(@" ==== RED@VIEWCONTROLLER ==== %@",Dict_Red2);
    
        if ([[Dict_Red2 objectForKey:@"Has_autnoumous"] isKindOfClass:[NSNull class]])
        {
            ApplicationDelegate.Str_Red2_Autonomous = @"N";
            [Seg_Red2_Autonomous setSelectedSegmentIndex:1];
        }
        else if ([[Dict_Red2 objectForKey:@"Has_autnoumous"] isEqualToString:@"Y"])
        {
            [self enabledData];
            [Seg_Red2_Autonomous setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Red2_Autonomous = @"Y";
        }
        else
        {
            [Seg_Red2_Autonomous setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Red2_Autonomous = @"N";
            
        }
        
        
        if ([[Dict_Red2 objectForKey:@"Parked"] isKindOfClass:[NSNull class]])
        {
            ApplicationDelegate.Str_Red2_Parked = @"";
        }
        else if ([[Dict_Red2 objectForKey:@"Parked"] isEqualToString:@"None"])
        {
            [Seg_Red2_Parked setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Red2_Parked = @"None";
        }
        else if ([[Dict_Red2 objectForKey:@"Parked"]isEqualToString:@"Fully"])
            
        {
            [Seg_Red2_Parked setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Red2_Parked = @"Fully";
        }
        else if ([[Dict_Red2 objectForKey:@"Parked"] isEqualToString:@"Partially"])
        {
            [Seg_Red2_Parked setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Red2_Parked = @"Partially";
        }
        
        else
        {
            ApplicationDelegate.Str_Red2_Parked = @"";
        }
        
        
        
        if ([[Dict_Red2 objectForKey:@"Parked_In"] isKindOfClass:[NSNull class]])
        {
            ApplicationDelegate.Str_Red2_Park_In = @"";
        }
        else if ([[Dict_Red2 objectForKey:@"Parked_In"] isEqualToString:@"None"])
        {
            [Seg_Red2_Park_In setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Red2_Park_In = @"None";
        }
        else if ([[Dict_Red2 objectForKey:@"Parked_In"] isEqualToString:@"Corner"])
        {
            [Seg_Red2_Park_In setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Red2_Park_In = @"Corner";
        }
        else if ([[Dict_Red2 objectForKey:@"Parked_In"] isEqualToString:@"Center"])
        {
            [Seg_Red2_Park_In setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Red2_Park_In = @"Center";
        }
        else
        {
            ApplicationDelegate.Str_Red2_Park_In = @"";
        }
        
      //    NSLog(@"AUTOBEACONS%@",[Dict_Red2 objectForKey:@"Auto_Beacons"]);
        
        if([[Dict_Red2 objectForKey:@"Auto_Beacons"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Red2_Beacons=@"";
            
        } else {
            self.r2b = [[Dict_Red2 objectForKey:@"Auto_Beacons"]  intValue];
            ApplicationDelegate.Str_Lbl_Red2_Beacons = [NSString stringWithFormat:@"%d",self.r2b];
            [self->Lbl_Red2_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.r2b]];
        }
        
        
        if([[Dict_Red2 objectForKey:@"Cap_Ball_Floor"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Red2_Cap =@"";
        }
        else if ([[Dict_Red2 objectForKey:@"Cap_Ball_Floor"] isEqualToString:@"N"]) {
            [Seg_Red2_Cap setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Red2_Cap = @"N";
        } else {
            [Seg_Red2_Cap setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Red2_Cap = @"Y";
        }
        
        
        if([[Dict_Red2 objectForKey:@"Auto_PScore_Center"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Red2_PS_Center=@"";
            
        } else {
            self.r2ce = [[Dict_Red2 objectForKey:@"Auto_PScore_Center"]  intValue];
            ApplicationDelegate.Str_Lbl_Red2_PS_Center = [NSString stringWithFormat:@"%d",self.r2ce];
            [self->Lbl_PS_Red2_Center setText:[NSString stringWithFormat:@"%d", self.r2ce]];
        }
        
        if([[Dict_Red2 objectForKey:@"Auto_PScore_Corner"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Red2_PS_Corner=@"";
            
        } else {
            self.r2co = [[Dict_Red2 objectForKey:@"Auto_PScore_Corner"]  intValue];
            ApplicationDelegate.Str_Lbl_Red2_PS_Corner = [NSString stringWithFormat:@"%d",self.r2co];
            [self->Lbl_PS_Red2_Corner setText:[NSString stringWithFormat:@"%d", self.r2co]];
        }
        
        // tele op beacons
        
        if([[Dict_Red2 objectForKey:@"TeleOp_Beacons"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Tele_Red2_Beacons=@"";
            
        } else {
            self.r2tb = [[Dict_Red2 objectForKey:@"TeleOp_Beacons"]  intValue];
            ApplicationDelegate.Str_Lbl_Tele_Red2_Beacons = [NSString stringWithFormat:@"%d",self.r2tb];
            [self->Lbl_TeleOP_Red2_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.r2tb]];
        }
        
        
        if([[Dict_Red2 objectForKey:@"TeleOp_PScore_Center"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Tele_Red2_PS_Center=@"";
            
        } else {
            self.r2tce = [[Dict_Red2 objectForKey:@"TeleOp_PScore_Center"]  intValue];
            ApplicationDelegate.Str_Lbl_Tele_Red2_PS_Center = [NSString stringWithFormat:@"%d",self.r2tce];
            [self->Lbl_TeleOP_PS_Red2_Center setText:[NSString stringWithFormat:@"%d", self.r2tce]];
        }
        
        if([[Dict_Red2 objectForKey:@"TeleOp_PScore_Corner"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Tele_Red2_PS_Center=@"";
            
        } else {
            self.r2tco = [[Dict_Red2 objectForKey:@"TeleOp_PScore_Corner"]  intValue];
            ApplicationDelegate.Str_Lbl_Tele_Red2_PS_Corner = [NSString stringWithFormat:@"%d",self.r2tco];
            [self->Lbl_TeleOP_PS_Red2_Corner setText:[NSString stringWithFormat:@"%d", self.r2tco]];
        }
        
        if ([[Dict_Red2 objectForKey:@"Cap_Ball_Raised"] isKindOfClass:[NSNull class]])
        {
            [Seg_Red2_Ball_Raised setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Red2_Ball_Raised = @"None";
        }
        else if ([[Dict_Red2 objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"GT30"])
        {
            [Seg_Red2_Ball_Raised setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Red2_Ball_Raised = @">30 in";
        }
        else if ([[Dict_Red2 objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"LT30"])
        {
            [Seg_Red2_Ball_Raised setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Red2_Ball_Raised = @"<30 in";
        }
        else if ([[Dict_Red2 objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"None"])
        {
            [Seg_Red2_Ball_Raised setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Red2_Ball_Raised = @"None";
        }
        
        
        
        if([[Dict_Red2 objectForKey:@"Cap_Ball_Center"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Red2_Tele_Ball_vortex = @"N";
            [Seg_Red2_Cap_Ball_Vortex setSelectedSegmentIndex:1];
        }
        else if ([[Dict_Red2 objectForKey:@"Cap_Ball_Center"] isEqualToString:@"N"]) {
            [Seg_Red2_Cap_Ball_Vortex setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Red2_Tele_Ball_vortex = @"N";
        } else {
            [Seg_Red2_Cap_Ball_Vortex setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Red2_Tele_Ball_vortex = @"Y";
        }
       
    }
}

-(void)disabledData {
    
    Seg_Red2_Autonomous.selectedSegmentIndex = 1;
    Seg_Red2_Park_In.userInteractionEnabled = NO;
    Seg_Red2_Parked.userInteractionEnabled = NO;
    Seg_Red2_Cap.userInteractionEnabled = NO;
 //   Seg_Red2_Cap_Ball_Vortex.userInteractionEnabled = NO;
 //   Seg_Red2_Ball_Raised.userInteractionEnabled = NO;
    Btn_Red2_Beacons_Dec.userInteractionEnabled = NO;
    Btn_Red2_Beacons_Inc.userInteractionEnabled = NO;
    Btn_PS_Red2_Center_Dec.userInteractionEnabled = NO;
    Btn_PS_Red2_Center_Inc.userInteractionEnabled = NO;
    Btn_PS_Red2_Corner_Dec.userInteractionEnabled = NO;
    Btn_PS_Red2_Corner_Inc.userInteractionEnabled = NO;
//    Btn_TeleOP_PS_Red2_Center_Dec.userInteractionEnabled = NO;
//    Btn_TeleOP_PS_Red2_Center_Inc.userInteractionEnabled = NO;
//    Btn_TeleOP_PS_Red2_Corner_Dec.userInteractionEnabled = NO;
 //   Btn_TeleOP_PS_Red2_Corner_Inc.userInteractionEnabled = NO;
 //   TeleOP_Red2_Beacons_Dec.userInteractionEnabled = NO;
//    TeleOP_Red2_Beacons_Inc.userInteractionEnabled = NO;
    
    
    Seg_Red2_Autonomous.selectedSegmentIndex = 1;
    Seg_Red2_Parked.selectedSegmentIndex = 2;
    Seg_Red2_Park_In.selectedSegmentIndex = 2;
    
    Seg_Red2_Cap.selectedSegmentIndex = 1;
    Seg_Red2_Ball_Raised.selectedSegmentIndex = 2;
    Seg_Red2_Cap_Ball_Vortex.selectedSegmentIndex = 1;
    
    ApplicationDelegate.Str_Red2_Team_Number =@"";
    ApplicationDelegate.Str_Red2_Team_Name =@"";
    
    ApplicationDelegate.Str_Red2_Autonomous = @"N";
    ApplicationDelegate.Str_Red2_Park_In = @"None";
    ApplicationDelegate.Str_Red2_Parked = @"None";
    ApplicationDelegate.Str_Red2_Cap = @"N";
    
    
    ApplicationDelegate.Str_Lbl_Red2_Beacons = @"0";
    ApplicationDelegate.Str_Lbl_Red2_PS_Center = @"0";
    ApplicationDelegate.Str_Lbl_Red2_PS_Corner = @"0";
    
    ApplicationDelegate.Str_Red2_Cap = @"0";
    ApplicationDelegate.Str_Lbl_Tele_Red2_Beacons = @"0";
    
    ApplicationDelegate.Str_Red2_Ball_Raised = @"None";
    ApplicationDelegate.Str_Red2_Tele_Ball_vortex = @"N";
    
    ApplicationDelegate.Str_Lbl_Tele_Red2_PS_Center = @"0";
    ApplicationDelegate.Str_Lbl_Tele_Red2_PS_Corner = @"0";

}


-(void)enabledData {
    
    //  NSLog(@"==== disabled ====");
    
    
    Seg_Red2_Autonomous.selectedSegmentIndex = 0;
    Seg_Red2_Park_In.userInteractionEnabled = YES;
    Seg_Red2_Parked.userInteractionEnabled = YES;
    Seg_Red2_Cap.userInteractionEnabled = YES;
    Seg_Red2_Cap_Ball_Vortex.userInteractionEnabled = YES;
    Seg_Red2_Ball_Raised.userInteractionEnabled = YES;
    Btn_Red2_Beacons_Dec.userInteractionEnabled = YES;
    Btn_Red2_Beacons_Inc.userInteractionEnabled = YES;
    Btn_PS_Red2_Center_Dec.userInteractionEnabled = YES;
    Btn_PS_Red2_Center_Inc.userInteractionEnabled = YES;
    Btn_PS_Red2_Corner_Dec.userInteractionEnabled = YES;
    Btn_PS_Red2_Corner_Inc.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Red2_Center_Dec.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Red2_Center_Inc.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Red2_Corner_Dec.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Red2_Corner_Inc.userInteractionEnabled = YES;
    TeleOP_Red2_Beacons_Dec.userInteractionEnabled = YES;
    TeleOP_Red2_Beacons_Inc.userInteractionEnabled = YES;
}



-(IBAction)Btn_Red2_Beacon_Inc:(id)sender
{
    if(self.r2b <4)
    {
    self.r2b++;
    
    [self->Lbl_Red2_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.r2b]];
         ApplicationDelegate.Str_Lbl_Red2_Beacons = [NSString stringWithFormat:@"%d",self.r2b];
    }
}
-(IBAction)Btn_Red2_Beacon_Dec:(id)sender
{
    if(self.r2b >0)
    {
    self.r2b--;
    
    [self->Lbl_Red2_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.r2b]];
         ApplicationDelegate.Str_Lbl_Red2_Beacons = [NSString stringWithFormat:@"%d",self.r2b];
    }
}


-(IBAction)Btn_PS_Red2_Center_Inc:(id)sender
{
    if(self.r2ce <99)
    {
        self.r2ce++;
    
    [self->Lbl_PS_Red2_Center setText:[NSString stringWithFormat:@"%d", self.r2ce]];
        ApplicationDelegate.Str_Lbl_Red2_PS_Center = [NSString stringWithFormat:@"%d",self.r2ce];

    }
}
-(IBAction)Btn_PS_Red2_Center_Dec:(id)sender
{
    if(self.r2ce>0)
    {
    self.r2ce--;
    
    [self->Lbl_PS_Red2_Center setText:[NSString stringWithFormat:@"%d", self.r2ce]];
        ApplicationDelegate.Str_Lbl_Red2_PS_Center = [NSString stringWithFormat:@"%d",self.r2ce];

    }
}

-(IBAction)Btn_PS_Red2_Corner_Inc:(id)sender
{
    if(self.r2co <99)
    {
    self.r2co++;
    
    [self->Lbl_PS_Red2_Corner setText:[NSString stringWithFormat:@"%d", self.r2co]];
          ApplicationDelegate.Str_Lbl_Red2_PS_Corner = [NSString stringWithFormat:@"%d",self.r2co];
    }
}
-(IBAction)Btn_PS_Red2_Corner_Dec:(id)sender
{
    if(self.r2co >0)
    {
    self.r2co--;
    
    [self->Lbl_PS_Red2_Corner setText:[NSString stringWithFormat:@"%d", self.r2co]];
          ApplicationDelegate.Str_Lbl_Red2_PS_Corner = [NSString stringWithFormat:@"%d",self.r2co];
    }
}

//tele_beacons
-(IBAction)Btn_TeleOP_Red2_Beacon_Inc:(id)sender
{
    if(self.r2tb <4)
    {
    self.r2tb++;
    
    [self->Lbl_TeleOP_Red2_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.r2tb]];
        ApplicationDelegate.Str_Lbl_Tele_Red2_Beacons = [NSString stringWithFormat:@"%d",self.r2tb];

    }
}
-(IBAction)Btn_TeleOP_Red2_Beacon_Dec:(id)sender
{
    if(self.r2tb >0)
    {

    self.r2tb--;
    
    [self->Lbl_TeleOP_Red2_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.r2tb]];
        ApplicationDelegate.Str_Lbl_Tele_Red2_Beacons = [NSString stringWithFormat:@"%d",self.r2tb];

    }
}

//tele_ps
-(IBAction)Btn_TeleOP_PS_Red2_Center_Inc:(id)sender
{
    if(self.r2tce <99)
    {

    self.r2tce++;
    
    [self->Lbl_TeleOP_PS_Red2_Center setText:[NSString stringWithFormat:@"%d", self.r2tce]];
    ApplicationDelegate.Str_Lbl_Tele_Red2_PS_Center = [NSString stringWithFormat:@"%d",self.r2tce];
    }
}
-(IBAction)Btn_TeleOP_PS_Red2_Center_Dec:(id)sender
{
    if(self.r2tce >0)
    {
    self.r2tce--;
    
    [self->Lbl_TeleOP_PS_Red2_Center setText:[NSString stringWithFormat:@"%d", self.r2tce]];
    ApplicationDelegate.Str_Lbl_Tele_Red2_PS_Center = [NSString stringWithFormat:@"%d",self.r2tce];
    }
}

-(IBAction)Btn_TeleOP_PS_Red2_Corner_Inc:(id)sender
{
    if(self.r2tco <99)
    {
    self.r2tco++;
    
    [self->Lbl_TeleOP_PS_Red2_Corner setText:[NSString stringWithFormat:@"%d", self.r2tco]];
      ApplicationDelegate.Str_Lbl_Tele_Red2_PS_Corner = [NSString stringWithFormat:@"%d",self.r2tco];
    }
}

-(IBAction)Btn_TeleOP_PS_Red2_Corner_Dec:(id)sender
{
    if(self.r2tco >0)
    {
    self.r2tco--;
    
    [self->Lbl_TeleOP_PS_Red2_Corner setText:[NSString stringWithFormat:@"%d", self.r2tco]];
          ApplicationDelegate.Str_Lbl_Tele_Red2_PS_Corner = [NSString stringWithFormat:@"%d",self.r2tco];
    }
}




-(IBAction)Red2_Autonomous:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger New = segmentedControl.selectedSegmentIndex;
    ApplicationDelegate.Str_Red2_Autonomous = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
    
    if (New == 0)
    {
        //   Seg_Red1_Autonomous.selectedSegmentIndex = 1;
        Seg_Red2_Park_In.userInteractionEnabled = YES;
        Seg_Red2_Parked.userInteractionEnabled = YES;
        Seg_Red2_Cap.userInteractionEnabled = YES;
        Seg_Red2_Cap_Ball_Vortex.userInteractionEnabled = YES;
        Seg_Red2_Ball_Raised.userInteractionEnabled = YES;
        Btn_Red2_Beacons_Dec.userInteractionEnabled = YES;
        Btn_Red2_Beacons_Inc.userInteractionEnabled = YES;
        Btn_PS_Red2_Center_Dec.userInteractionEnabled = YES;
        Btn_PS_Red2_Center_Inc.userInteractionEnabled = YES;
        Btn_PS_Red2_Corner_Dec.userInteractionEnabled = YES;
        Btn_PS_Red2_Corner_Inc.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Red2_Center_Dec.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Red2_Center_Inc.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Red2_Corner_Dec.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Red2_Corner_Inc.userInteractionEnabled = YES;
        TeleOP_Red2_Beacons_Dec.userInteractionEnabled = YES;
        TeleOP_Red2_Beacons_Inc.userInteractionEnabled = YES;

        
        
        
    } else {
        Seg_Red2_Park_In.userInteractionEnabled = NO;
        Seg_Red2_Parked.userInteractionEnabled = NO;
        Seg_Red2_Cap.userInteractionEnabled = NO;
//        Seg_Red2_Cap_Ball_Vortex.userInteractionEnabled = NO;
//        Seg_Red2_Ball_Raised.userInteractionEnabled = NO;
        Btn_Red2_Beacons_Dec.userInteractionEnabled = NO;
        Btn_Red2_Beacons_Inc.userInteractionEnabled = NO;
        Btn_PS_Red2_Center_Dec.userInteractionEnabled = NO;
        Btn_PS_Red2_Center_Inc.userInteractionEnabled = NO;
        Btn_PS_Red2_Corner_Dec.userInteractionEnabled = NO;
        Btn_PS_Red2_Corner_Inc.userInteractionEnabled = NO;
//        Btn_TeleOP_PS_Red2_Center_Dec.userInteractionEnabled = NO;
//        Btn_TeleOP_PS_Red2_Center_Inc.userInteractionEnabled = NO;
 //       Btn_TeleOP_PS_Red2_Corner_Dec.userInteractionEnabled = NO;
//        Btn_TeleOP_PS_Red2_Corner_Inc.userInteractionEnabled = NO;
  //      TeleOP_Red2_Beacons_Dec.userInteractionEnabled = NO;
 //       TeleOP_Red2_Beacons_Inc.userInteractionEnabled = NO;
        
        
    }

    
}
-(IBAction)Red2_Park_In:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    ApplicationDelegate.Str_Red2_Park_In = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
}
-(IBAction)Red2_Parked:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    ApplicationDelegate.Str_Red2_Parked = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
}
-(IBAction)Red2_Cap_Ball_On_Floor:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    ApplicationDelegate.Str_Red2_Cap = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
}
-(IBAction)Red2_Cap_Ball_Raised:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    ApplicationDelegate.Str_Red2_Ball_Raised = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
}
-(IBAction)Red2_Ball_Vortex:(id)sender       
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    ApplicationDelegate.Str_Red2_Tele_Ball_vortex = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
}
/*-(IBAction)Red2_Tele_OP:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    ApplicationDelegate.Str_Red2_Tele_OP = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
}*/



-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 0)
    {
        ApplicationDelegate.Str_Red2_Team_Number = textField.text;
    }
    else if (textField.tag == 1)
    {
        ApplicationDelegate.Str_Red2_Team_Name = textField.text;
    }
    
    [textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    // Dispose of any resources that can be recreated.
    [super didReceiveMemoryWarning];
}

@end
