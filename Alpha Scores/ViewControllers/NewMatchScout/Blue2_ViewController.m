//
//  Blue2_ViewController.m
//
//
//  Created by Neha Parmar on 7/30/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "Blue2_ViewController.h"

@interface Blue2_ViewController ()

@end

@implementation Blue2_ViewController
@synthesize Dict_Blue2,Bool_Update;

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*colorWithRed:21.0/255.0 green:49.0/255.0 blue:78.0/255.0 alpha:1.000];*/
    
    self.navigationController.navigationBar.translucent = NO;

  
    Lbl_Blue2_Beacons_Val.layer.borderColor =[UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.000].CGColor;
    Lbl_Blue2_Beacons_Val.layer.borderWidth = 2.0;
    
    Lbl_PS_Blue2_Center.layer.borderColor = [UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.000].CGColor;
    Lbl_PS_Blue2_Center.layer.borderWidth = 2.0;
    
    Lbl_PS_Blue2_Corner.layer.borderColor = [UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.000].CGColor;
    Lbl_PS_Blue2_Corner.layer.borderWidth = 2.0;
    
Lbl_TeleOP_Blue2_Beacons_Val.layer.borderColor = [UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.000].CGColor;
    Lbl_TeleOP_Blue2_Beacons_Val.layer.borderWidth = 2.0;
    
    Lbl_TeleOP_PS_Blue2_Center.layer.borderColor = [UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.000].CGColor;
    Lbl_TeleOP_PS_Blue2_Center.layer.borderWidth = 2.0;
    
    Lbl_TeleOP_PS_Blue2_Corner.layer.borderColor = [UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.000].CGColor;
    Lbl_TeleOP_PS_Blue2_Corner.layer.borderWidth = 2.0;
    
    Text_Blue2_Team.delegate = self;
    Text_Blue2_Team_Name.delegate = self;
    
    [self disabledData];
if (Bool_Update)
    {
        
        Text_Blue2_Team.text = [Dict_Blue2 objectForKey:@"team_number"];
        Text_Blue2_Team_Name.text = [Dict_Blue2 objectForKey:@"team_name"];
        
        ApplicationDelegate.Str_Blue2_Team_Number = [Dict_Blue2 objectForKey:@"team_number"];
        ApplicationDelegate.Str_Blue2_Team_Name = [Dict_Blue2 objectForKey:@"team_name"];
        
        
        
        
        if ([[Dict_Blue2 objectForKey:@"Has_autnoumous"] isKindOfClass:[NSNull class]])
        {
            ApplicationDelegate.Str_Blue2_Autonomous = @"N";
            [Seg_Blue2_Autonomous setSelectedSegmentIndex:1];
        }
        else if ([[Dict_Blue2 objectForKey:@"Has_autnoumous"] isEqualToString:@"Y"])
        {
            [Seg_Blue2_Autonomous setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Blue2_Autonomous = @"Y";
        }
        else
        {
            [Seg_Blue2_Autonomous setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Blue2_Autonomous = @"N";
        }
        
        
        if ([[Dict_Blue2 objectForKey:@"Parked"] isKindOfClass:[NSNull class]])
        {
            ApplicationDelegate.Str_Blue2_Parked = @"";
        }
        else if ([[Dict_Blue2 objectForKey:@"Parked"] isEqualToString:@"None"])
        {
            [Seg_Blue2_Parked setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Blue2_Parked = @"None";
        }
        else if ([[Dict_Blue2 objectForKey:@"Parked"]isEqualToString:@"Fully"])
            
        {
            [Seg_Blue2_Parked setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Blue2_Parked = @"Fully";
        }
        else if ([[Dict_Blue2 objectForKey:@"Parked"] isEqualToString:@"Partially"])
        {
            [Seg_Blue2_Parked setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Blue2_Parked = @"Partially";
        }
        
        else
        {
            ApplicationDelegate.Str_Blue2_Parked = @"";
        }
        
        
        
        if ([[Dict_Blue2 objectForKey:@"Parked_In"] isKindOfClass:[NSNull class]])
        {
            ApplicationDelegate.Str_Blue2_Park_In = @"";
        }
        else if ([[Dict_Blue2 objectForKey:@"Parked_In"] isEqualToString:@"None"])
        {
            [Seg_Blue2_Park_In setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Blue2_Park_In = @"None";
        }
        else if ([[Dict_Blue2 objectForKey:@"Parked_In"] isEqualToString:@"Corner"])
        {
            [Seg_Blue2_Park_In setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Blue2_Park_In = @"Corner";
        }
        else if ([[Dict_Blue2 objectForKey:@"Parked_In"] isEqualToString:@"Center"])
        {
            [Seg_Blue2_Park_In setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Blue2_Park_In = @"Center";
        }
        else
        {
            ApplicationDelegate.Str_Blue2_Park_In = @"";
        }
        
        //    NSLog(@"AUTOBEACONS%@",[Dict_Blue2 objectForKey:@"Auto_Beacons"]);
        
        if([[Dict_Blue2 objectForKey:@"Auto_Beacons"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Blue2_Beacons=@"";
            
        } else {
            self.b2b = [[Dict_Blue2 objectForKey:@"Auto_Beacons"]  intValue];
            ApplicationDelegate.Str_Lbl_Blue2_Beacons = [NSString stringWithFormat:@"%d",self.b2b];
            [self->Lbl_Blue2_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b2b]];
        }
        
        
        if([[Dict_Blue2 objectForKey:@"Cap_Ball_Floor"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Blue2_Cap_Ball_Floor =@"";
        }
        else if ([[Dict_Blue2 objectForKey:@"Cap_Ball_Floor"] isEqualToString:@"N"]) {
            [Seg_Blue2_Cap_Ball_On_Floor setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Blue2_Cap_Ball_Floor = @"N";
        } else {
            [Seg_Blue2_Cap_Ball_On_Floor setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Blue2_Cap_Ball_Floor = @"Y";
        }
        
        
        if([[Dict_Blue2 objectForKey:@"Auto_PScore_Center"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Blue2_PS_Center=@"";
            
        } else {
            self.b2ce = [[Dict_Blue2 objectForKey:@"Auto_PScore_Center"]  intValue];
            ApplicationDelegate.Str_Lbl_Blue2_PS_Center = [NSString stringWithFormat:@"%d",self.b2ce];
            [self->Lbl_PS_Blue2_Center setText:[NSString stringWithFormat:@"%d", self.b2ce]];
        }
        
        if([[Dict_Blue2 objectForKey:@"Auto_PScore_Corner"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Blue2_PS_Corner=@"";
            
        } else {
            self.b2co = [[Dict_Blue2 objectForKey:@"Auto_PScore_Corner"]  intValue];
            ApplicationDelegate.Str_Lbl_Blue2_PS_Corner = [NSString stringWithFormat:@"%d",self.b2co];
            [self->Lbl_PS_Blue2_Corner setText:[NSString stringWithFormat:@"%d", self.b2co]];
        }
        
        // tele op beacons
        
        if([[Dict_Blue2 objectForKey:@"TeleOp_Beacons"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Tele_Blue2_Beacons=@"";
            
        } else {
            self.b2tb = [[Dict_Blue2 objectForKey:@"TeleOp_Beacons"]  intValue];
            ApplicationDelegate.Str_Lbl_Tele_Blue2_Beacons = [NSString stringWithFormat:@"%d",self.b2tb];
            [self->Lbl_TeleOP_Blue2_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b2tb]];
        }
        
        
        if([[Dict_Blue2 objectForKey:@"TeleOp_PScore_Center"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Tele_Blue2_PS_Center=@"";
            
        } else {
            self.b2tce = [[Dict_Blue2 objectForKey:@"TeleOp_PScore_Center"]  intValue];
            ApplicationDelegate.Str_Lbl_Tele_Blue2_PS_Center = [NSString stringWithFormat:@"%d",self.b2tce];
            [self->Lbl_TeleOP_PS_Blue2_Center setText:[NSString stringWithFormat:@"%d", self.b2tce]];
        }
        
        if([[Dict_Blue2 objectForKey:@"TeleOp_PScore_Corner"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Tele_Blue2_PS_Center=@"";
            
        } else {
            self.b2tco = [[Dict_Blue2 objectForKey:@"TeleOp_PScore_Corner"]  intValue];
            ApplicationDelegate.Str_Lbl_Tele_Blue2_PS_Corner = [NSString stringWithFormat:@"%d",self.b2tco];
            [self->Lbl_TeleOP_PS_Blue2_Corner setText:[NSString stringWithFormat:@"%d", self.b2tco]];
        }
        
        if ([[Dict_Blue2 objectForKey:@"Cap_Ball_Raised"] isKindOfClass:[NSNull class]])
        {
            [Seg_Blue2_Ball_Raised setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Blue2_Ball_Raised = @"None";
        }
        else if ([[Dict_Blue2 objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"GT30"])
        {
            [Seg_Blue2_Ball_Raised setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Blue2_Ball_Raised = @">30 in";
        }
        else if ([[Dict_Blue2 objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"LT30"])
        {
            [Seg_Blue2_Ball_Raised setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Blue2_Ball_Raised = @"<30 in";
        }
        else if ([[Dict_Blue2 objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"None"])
        {
            [Seg_Blue2_Ball_Raised setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Blue2_Ball_Raised = @"None";
        }
        
        
        
        if([[Dict_Blue2 objectForKey:@"Cap_Ball_Center"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Blue2_Ball_Vortex = @"N";
            [Seg_Blue2_Ball_Vortex setSelectedSegmentIndex:1];
        }
        else if ([[Dict_Blue2 objectForKey:@"Cap_Ball_Center"] isEqualToString:@"N"]) {
            [Seg_Blue2_Ball_Vortex setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Blue2_Ball_Vortex = @"N";
        } else {
            [Seg_Blue2_Ball_Vortex setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Blue2_Ball_Vortex = @"Y";
        }

    }
}



-(void)disabledData {
    
    
    Seg_Blue2_Autonomous.selectedSegmentIndex = 1;
    Seg_Blue2_Park_In.userInteractionEnabled = NO;
    Seg_Blue2_Parked.userInteractionEnabled = NO;
    Btn_Blue2_Beacons_Dec.userInteractionEnabled = NO;
    Btn_Blue2_Beacons_Inc.userInteractionEnabled = NO;
    Seg_Blue2_Cap_Ball_On_Floor.userInteractionEnabled = NO;
    Btn_PS_Blue2_Center_Dec.userInteractionEnabled = NO;
    Btn_PS_Blue2_Center_Inc.userInteractionEnabled = NO;
    Btn_PS_Blue2_Corner_Dec.userInteractionEnabled = NO;
    Btn_PS_Blue2_Corner_Inc.userInteractionEnabled = NO;
 //   TeleOP_Blue2_Beacons_Dec.userInteractionEnabled = NO;
 //   TeleOP_Blue2_Beacons_Inc.userInteractionEnabled = NO;
 //   Btn_TeleOP_PS_Blue2_Center_Dec.userInteractionEnabled = NO;
 //   Btn_TeleOP_PS_Blue2_Center_Inc.userInteractionEnabled = NO;
 //   Btn_TeleOP_PS_Blue2_Corner_Dec.userInteractionEnabled = NO;
 //   Btn_TeleOP_PS_Blue2_Corner_Inc.userInteractionEnabled = NO;
 //   Seg_Blue2_Ball_Vortex.userInteractionEnabled = NO;
 //   Seg_Blue2_Ball_Raised.userInteractionEnabled = NO;
    
    
    Seg_Blue2_Autonomous.selectedSegmentIndex = 1;
    Seg_Blue2_Parked.selectedSegmentIndex = 2;
    Seg_Blue2_Park_In.selectedSegmentIndex = 2;
    
    Seg_Blue2_Cap_Ball_On_Floor.selectedSegmentIndex = 1;
    Seg_Blue2_Ball_Raised.selectedSegmentIndex = 2;
    Seg_Blue2_Ball_Vortex.selectedSegmentIndex = 1;
    
    ApplicationDelegate.Str_Blue2_Team_Number =@"";
    ApplicationDelegate.Str_Blue2_Team_Name =@"";
    ApplicationDelegate.Str_Blue2_Autonomous = @"N";
    ApplicationDelegate.Str_Blue2_Park_In = @"None";
    ApplicationDelegate.Str_Blue2_Parked = @"None";
    ApplicationDelegate.Str_Blue2_Cap_Ball_Floor = @"N";
    
    ApplicationDelegate.Str_Lbl_Blue2_Beacons = @"0";
    ApplicationDelegate.Str_Lbl_Blue2_PS_Center = @"0";
    ApplicationDelegate.Str_Lbl_Blue2_PS_Corner = @"0";
    
    ApplicationDelegate.Str_Lbl_Tele_Blue2_Beacons = @"0";
    
    ApplicationDelegate.Str_Blue2_Ball_Raised = @"None";
    ApplicationDelegate.Str_Blue2_Ball_Vortex = @"N";
    
    ApplicationDelegate.Str_Lbl_Tele_Blue2_PS_Center = @"0";
    ApplicationDelegate.Str_Lbl_Tele_Blue2_PS_Corner = @"0";
}



-(void)enabledData {
    
    
    Seg_Blue2_Autonomous.selectedSegmentIndex = 1;
    Seg_Blue2_Park_In.userInteractionEnabled = YES;
    Seg_Blue2_Parked.userInteractionEnabled = YES;
    Btn_Blue2_Beacons_Dec.userInteractionEnabled = YES;
    Btn_Blue2_Beacons_Inc.userInteractionEnabled = YES;
    Seg_Blue2_Cap_Ball_On_Floor.userInteractionEnabled = YES;
    Btn_PS_Blue2_Center_Dec.userInteractionEnabled = YES;
    Btn_PS_Blue2_Center_Inc.userInteractionEnabled = YES;
    Btn_PS_Blue2_Corner_Dec.userInteractionEnabled = YES;
    Btn_PS_Blue2_Corner_Inc.userInteractionEnabled = YES;
    TeleOP_Blue2_Beacons_Dec.userInteractionEnabled = YES;
    TeleOP_Blue2_Beacons_Inc.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Blue2_Center_Dec.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Blue2_Center_Inc.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Blue2_Corner_Dec.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Blue2_Corner_Inc.userInteractionEnabled = YES;
    Seg_Blue2_Ball_Vortex.userInteractionEnabled = YES;
    Seg_Blue2_Ball_Raised.userInteractionEnabled = YES;
    
}





-(IBAction)Btn_Blue2_Beacon_Inc:(id)sender
{
    if(self.b2b < 4)
    {
    self.b2b++;
    
    [self->Lbl_Blue2_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b2b]];
        ApplicationDelegate.Str_Lbl_Blue2_Beacons = [NSString stringWithFormat:@"%d",self.b2b];

    }
}
-(IBAction)Btn_Blue2_Beacon_Dec:(id)sender
{
    if(self.b2b > 0)
    {
    self.b2b--;
    
    [self->Lbl_Blue2_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b2b]];
        ApplicationDelegate.Str_Lbl_Blue2_Beacons = [NSString stringWithFormat:@"%d",self.b2b];

    }
}


-(IBAction)Btn_PS_Blue2_Center_Inc:(id)sender
{
    if(self.b2ce < 99)
    {
    self.b2ce++;
    
    [self->Lbl_PS_Blue2_Center setText:[NSString stringWithFormat:@"%d", self.b2ce]];
          ApplicationDelegate.Str_Lbl_Blue2_PS_Center = [NSString stringWithFormat:@"%d",self.b2ce];
    }
}
-(IBAction)Btn_PS_Blue2_Center_Dec:(id)sender
{
    if(self.b2ce>0)
    {
    self.b2ce--;
    
    [self->Lbl_PS_Blue2_Center setText:[NSString stringWithFormat:@"%d", self.b2ce]];
          ApplicationDelegate.Str_Lbl_Blue2_PS_Center = [NSString stringWithFormat:@"%d",self.b2ce];
    }
}

-(IBAction)Btn_PS_Blue2_Corner_Inc:(id)sender
{
    if(self.b2co<99)
    {
    self.b2co++;
    
    [self->Lbl_PS_Blue2_Corner setText:[NSString stringWithFormat:@"%d", self.b2co]];
         ApplicationDelegate.Str_Lbl_Blue2_PS_Corner = [NSString stringWithFormat:@"%d",self.b2co];
    }
}
-(IBAction)Btn_PS_Blue2_Corner_Dec:(id)sender
{
    if(self.b2co>0)
    {
    self.b2co--;
    
    [self->Lbl_PS_Blue2_Corner setText:[NSString stringWithFormat:@"%d", self.b2co]];
         ApplicationDelegate.Str_Lbl_Blue2_PS_Corner = [NSString stringWithFormat:@"%d",self.b2co];
    }
}

//tele_beacons
-(IBAction)Btn_TeleOP_Blue2_Beacon_Inc:(id)sender
{
    if(self.b2tb <4)
    {
    self.b2tb++;
    
    [self->Lbl_TeleOP_Blue2_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b2tb]];
        ApplicationDelegate.Str_Lbl_Tele_Blue2_Beacons = [NSString stringWithFormat:@"%d",self.b2tb];

    }
}
-(IBAction)Btn_TeleOP_Blue2_Beacon_Dec:(id)sender
{
    if(self.b2tb>0)
    {
    self.b2tb--;
    
    [self->Lbl_TeleOP_Blue2_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b2tb]];
        ApplicationDelegate.Str_Lbl_Tele_Blue2_Beacons = [NSString stringWithFormat:@"%d",self.b2tb];

    }
}

//tele_ps
-(IBAction)Btn_TeleOP_PS_Blue2_Center_Inc:(id)sender
{
    if(self.b2tce<99)
    {
    self.b2tce++;
    
    [self->Lbl_TeleOP_PS_Blue2_Center setText:[NSString stringWithFormat:@"%d", self.b2tce]];
          ApplicationDelegate.Str_Lbl_Tele_Blue2_PS_Center = [NSString stringWithFormat:@"%d",self.b2tce];
    }
}
-(IBAction)Btn_TeleOP_PS_Blue2_Center_Dec:(id)sender
{
    if(self.b2tce > 0)
    {
    self.b2tce--;
    
    [self->Lbl_TeleOP_PS_Blue2_Center setText:[NSString stringWithFormat:@"%d", self.b2tce]];
          ApplicationDelegate.Str_Lbl_Tele_Blue2_PS_Center = [NSString stringWithFormat:@"%d",self.b2tce];
    }
}

-(IBAction)Btn_TeleOP_PS_Blue2_Corner_Inc:(id)sender
{
    if(self.b2tco < 99)
    {
    self.b2tco++;
    
    [self->Lbl_TeleOP_PS_Blue2_Corner setText:[NSString stringWithFormat:@"%d", self.b2tco]];
        ApplicationDelegate.Str_Lbl_Tele_Blue2_PS_Corner = [NSString stringWithFormat:@"%d",self.b2tco];

    }
}

-(IBAction)Btn_TeleOP_PS_Blue2_Corner_Dec:(id)sender
{
    if(self.b2tco > 0)
    {
    self.b2tco--;
    
    [self->Lbl_TeleOP_PS_Blue2_Corner setText:[NSString stringWithFormat:@"%d", self.b2tco]];
        ApplicationDelegate.Str_Lbl_Tele_Blue2_PS_Corner = [NSString stringWithFormat:@"%d",self.b2tco];

    }
}


-(IBAction)Blue2_Autonomous:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger New = segmentedControl.selectedSegmentIndex;
    ApplicationDelegate.Str_Blue2_Autonomous = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
    if (New == 0)
    {
        //   Seg_Red1_Autonomous.selectedSegmentIndex = 1;
        //Seg_Blue2_Autonomous.selectedSegmentIndex = 1;
        Seg_Blue2_Park_In.userInteractionEnabled = YES;
        Seg_Blue2_Parked.userInteractionEnabled = YES;
        Btn_Blue2_Beacons_Dec.userInteractionEnabled = YES;
        Btn_Blue2_Beacons_Inc.userInteractionEnabled = YES;
        Seg_Blue2_Cap_Ball_On_Floor.userInteractionEnabled = YES;
        Btn_PS_Blue2_Center_Dec.userInteractionEnabled = YES;
        Btn_PS_Blue2_Center_Inc.userInteractionEnabled = YES;
        Btn_PS_Blue2_Corner_Dec.userInteractionEnabled = YES;
        Btn_PS_Blue2_Corner_Inc.userInteractionEnabled = YES;
        TeleOP_Blue2_Beacons_Dec.userInteractionEnabled = YES;
        TeleOP_Blue2_Beacons_Inc.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Blue2_Center_Dec.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Blue2_Center_Inc.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Blue2_Corner_Dec.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Blue2_Corner_Inc.userInteractionEnabled = YES;
        Seg_Blue2_Ball_Vortex.userInteractionEnabled = YES;
        Seg_Blue2_Ball_Raised.userInteractionEnabled = YES;

        
        
        
    } else {
   //     Seg_Blue2_Autonomous.selectedSegmentIndex = 1;
        Seg_Blue2_Park_In.userInteractionEnabled = NO;
        Seg_Blue2_Parked.userInteractionEnabled = NO;
        Btn_Blue2_Beacons_Dec.userInteractionEnabled = NO;
        Btn_Blue2_Beacons_Inc.userInteractionEnabled = NO;
        Seg_Blue2_Cap_Ball_On_Floor.userInteractionEnabled = NO;
        Btn_PS_Blue2_Center_Dec.userInteractionEnabled = NO;
        Btn_PS_Blue2_Center_Inc.userInteractionEnabled = NO;
        Btn_PS_Blue2_Corner_Dec.userInteractionEnabled = NO;
        Btn_PS_Blue2_Corner_Inc.userInteractionEnabled = NO;
        TeleOP_Blue2_Beacons_Dec.userInteractionEnabled = NO;
        TeleOP_Blue2_Beacons_Inc.userInteractionEnabled = NO;
        Btn_TeleOP_PS_Blue2_Center_Dec.userInteractionEnabled = NO;
        Btn_TeleOP_PS_Blue2_Center_Inc.userInteractionEnabled = NO;
        Btn_TeleOP_PS_Blue2_Corner_Dec.userInteractionEnabled = NO;
        Btn_TeleOP_PS_Blue2_Corner_Inc.userInteractionEnabled = NO;
        Seg_Blue2_Ball_Vortex.userInteractionEnabled = NO;
        Seg_Blue2_Ball_Raised.userInteractionEnabled = NO;

        
    }


}
-(IBAction)Blue2_Park_In:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    ApplicationDelegate.Str_Blue2_Park_In = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
}
-(IBAction)Blue2_Parked:(id)sender
{
    UISegmentedControl *segmentControl =(UISegmentedControl *) sender;
    ApplicationDelegate.Str_Blue2_Parked = [segmentControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex];
}
-(IBAction)Blue2_Cap_Ball_On_Floor:(id)sender
{
    UISegmentedControl *segmentControl =(UISegmentedControl *) sender;
    ApplicationDelegate.Str_Blue2_Cap_Ball_Floor = [segmentControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex];
}

-(IBAction)Blue2_Ball_Raised:(id)sender
{
    UISegmentedControl *segmentControl =(UISegmentedControl *) sender;
    ApplicationDelegate.Str_Blue2_Ball_Raised = [segmentControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex];
}

-(IBAction)Blue2_Ball_Vortex:(id)sender
{
    UISegmentedControl *segmentControl =(UISegmentedControl *) sender;
    ApplicationDelegate.Str_Blue2_Ball_Vortex = [segmentControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex];
}
/*-(IBAction)Blue2_Tele_OP:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    ApplicationDelegate.Str_Blue2_Tele_OP = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
}*/




-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 0)
    {
        ApplicationDelegate.Str_Blue2_Team_Number = textField.text;
    }
    else if (textField.tag == 1)
    {
        ApplicationDelegate.Str_Blue2_Team_Name = textField.text;
    }
    
    [textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    // Dispose of any resources that can be recreated.
    [super didReceiveMemoryWarning];
}

@end
