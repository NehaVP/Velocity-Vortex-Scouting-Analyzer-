//
//  Blue1_ViewController.m
//
//
//  Created by Neha Parmar on 7/30/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "Blue1_ViewController.h"

@interface Blue1_ViewController ()

@end

@implementation Blue1_ViewController
@synthesize Dict_Blue1,Bool_Update;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;

    
    Lbl_Blue1_Beacons_Val.layer.borderColor =[UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.000].CGColor;
    Lbl_Blue1_Beacons_Val.layer.borderWidth = 2.0;
    
    Lbl_PS_Blue1_Center.layer.borderColor =[UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.000].CGColor;
    Lbl_PS_Blue1_Center.layer.borderWidth = 2.0;
    
    Lbl_PS_Blue1_Corner.layer.borderColor =[UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.000].CGColor;
    Lbl_PS_Blue1_Corner.layer.borderWidth = 2.0;
    
    Lbl_TeleOP_Blue1_Beacons_Val.layer.borderColor =[UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.000].CGColor;
    Lbl_TeleOP_Blue1_Beacons_Val.layer.borderWidth = 2.0;
    
    Lbl_TeleOP_PS_Blue1_Center.layer.borderColor =[UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.000].CGColor;
    Lbl_TeleOP_PS_Blue1_Center.layer.borderWidth = 2.0;
    
    Lbl_TeleOP_PS_Blue1_Corner.layer.borderColor =[UIColor colorWithRed:0.0/255.0 green:122.0/255.0 blue:255.0/255.0 alpha:1.000].CGColor;
    Lbl_TeleOP_PS_Blue1_Corner.layer.borderWidth = 2.0;
    
    Text_Blue1_Team.delegate = self;
    Text_Blue1_Team_Name.delegate = self;
    
       [self disabledData];
//    NSLog(@" BLUE1 VIEWCONTROLLER ---- %@",Dict_Blue1);
//    NSLog(@"%s",Bool_Update ? "YES" : "NO");
    
    if (Bool_Update)
    {
        
        Text_Blue1_Team.text = [Dict_Blue1 objectForKey:@"team_number"];
        Text_Blue1_Team_Name.text = [Dict_Blue1 objectForKey:@"team_name"];
        Lbl_Blue1_Beacons_Val.text = [Dict_Blue1 objectForKey:@"Blue1_Beacons"];
        
        ApplicationDelegate.Str_Blue1_Team_Number = [Dict_Blue1 objectForKey:@"team_number"];
        ApplicationDelegate.Str_Blue1_Team_Name = [Dict_Blue1 objectForKey:@"team_name"];
        
        if ([[Dict_Blue1 objectForKey:@"Has_autnoumous"] isKindOfClass:[NSNull class]])
        {
            ApplicationDelegate.Str_Blue1_Autonomous = @"N";
            [Seg_Blue1_Autonomous setSelectedSegmentIndex:1];
        }
        else if ([[Dict_Blue1 objectForKey:@"Has_autnoumous"] isEqualToString:@"Y"])
        {
            [self enabledData];
            [Seg_Blue1_Autonomous setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Blue1_Autonomous = @"Y";
        }
        else
        {
            [Seg_Blue1_Autonomous setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Blue1_Autonomous = @"N";
        }
        
        
        if ([[Dict_Blue1 objectForKey:@"Parked"] isKindOfClass:[NSNull class]])
        {
            ApplicationDelegate.Str_Blue1_Parked = @"";
        }
        else if ([[Dict_Blue1 objectForKey:@"Parked"] isEqualToString:@"None"])
        {
            [Seg_Blue1_Parked setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Blue1_Parked = @"None";
        }
        else if ([[Dict_Blue1 objectForKey:@"Parked"]isEqualToString:@"Fully"])
            
        {
            [Seg_Blue1_Parked setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Blue1_Parked = @"Fully";
        }
        else if ([[Dict_Blue1 objectForKey:@"Parked"] isEqualToString:@"Partially"])
        {
            [Seg_Blue1_Parked setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Blue1_Parked = @"Partially";
        }
        
        else
        {
            ApplicationDelegate.Str_Blue1_Parked = @"";
        }
        
        
        
        if ([[Dict_Blue1 objectForKey:@"Parked_In"] isKindOfClass:[NSNull class]])
        {
            ApplicationDelegate.Str_Blue1_Park_In = @"";
        }
        else if ([[Dict_Blue1 objectForKey:@"Parked_In"] isEqualToString:@"None"])
        {
            [Seg_Blue1_Park_In setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Blue1_Park_In = @"None";
        }
        else if ([[Dict_Blue1 objectForKey:@"Parked_In"] isEqualToString:@"Corner"])
        {
            [Seg_Blue1_Park_In setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Blue1_Park_In = @"Corner";
        }
        else if ([[Dict_Blue1 objectForKey:@"Parked_In"] isEqualToString:@"Center"])
        {
            [Seg_Blue1_Park_In setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Blue1_Park_In = @"Center";
        }
        else
        {
            ApplicationDelegate.Str_Blue1_Park_In = @"";
        }
        
        //    NSLog(@"AUTOBEACONS%@",[Dict_Blue1 objectForKey:@"Auto_Beacons"]);
        
        if([[Dict_Blue1 objectForKey:@"Auto_Beacons"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Blue1_Beacons=@"";
            
        } else {
            self.b1b = [[Dict_Blue1 objectForKey:@"Auto_Beacons"]  intValue];
            ApplicationDelegate.Str_Lbl_Blue1_Beacons = [NSString stringWithFormat:@"%d",self.b1b];
            [self->Lbl_Blue1_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b1b]];
        }
        
        
        if([[Dict_Blue1 objectForKey:@"Cap_Ball_Floor"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Blue1_Cap_ball =@"";
        }
        else if ([[Dict_Blue1 objectForKey:@"Cap_Ball_Floor"] isEqualToString:@"N"]) {
            [Seg_Blue1_Cap_ball setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Blue1_Cap_ball = @"N";
        } else {
            [Seg_Blue1_Cap_ball setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Blue1_Cap_ball = @"Y";
        }
        
        
        if([[Dict_Blue1 objectForKey:@"Auto_PScore_Center"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Blue1_PS_Center=@"";
            
        } else {
            self.b1ce = [[Dict_Blue1 objectForKey:@"Auto_PScore_Center"]  intValue];
            ApplicationDelegate.Str_Lbl_Blue1_PS_Center = [NSString stringWithFormat:@"%d",self.b1ce];
            [self->Lbl_PS_Blue1_Center setText:[NSString stringWithFormat:@"%d", self.b1ce]];
        }
        
        if([[Dict_Blue1 objectForKey:@"Auto_PScore_Corner"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Blue1_PS_Corner=@"";
            
        } else {
            self.b1co = [[Dict_Blue1 objectForKey:@"Auto_PScore_Corner"]  intValue];
            ApplicationDelegate.Str_Lbl_Blue1_PS_Corner = [NSString stringWithFormat:@"%d",self.b1co];
            [self->Lbl_PS_Blue1_Corner setText:[NSString stringWithFormat:@"%d", self.b1co]];
        }
        
        // tele op beacons
        
        if([[Dict_Blue1 objectForKey:@"TeleOp_Beacons"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Tele_Blue1_Beacons=@"";
            
        } else {
            self.b1tb = [[Dict_Blue1 objectForKey:@"TeleOp_Beacons"]  intValue];
            ApplicationDelegate.Str_Lbl_Tele_Blue1_Beacons = [NSString stringWithFormat:@"%d",self.b1tb];
            [self->Lbl_TeleOP_Blue1_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b1tb]];
        }
        
        
        if([[Dict_Blue1 objectForKey:@"TeleOp_PScore_Center"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Tele_Blue1_PS_Center=@"";
            
        } else {
            self.b1tce = [[Dict_Blue1 objectForKey:@"TeleOp_PScore_Center"]  intValue];
            ApplicationDelegate.Str_Lbl_Tele_Blue1_PS_Center = [NSString stringWithFormat:@"%d",self.b1tce];
            [self->Lbl_TeleOP_PS_Blue1_Center setText:[NSString stringWithFormat:@"%d", self.b1tce]];
        }
        
        if([[Dict_Blue1 objectForKey:@"TeleOp_PScore_Corner"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Tele_Blue1_PS_Center=@"";
            
        } else {
            self.b1tco = [[Dict_Blue1 objectForKey:@"TeleOp_PScore_Corner"]  intValue];
            ApplicationDelegate.Str_Lbl_Tele_Blue1_PS_Corner = [NSString stringWithFormat:@"%d",self.b1tco];
            [self->Lbl_TeleOP_PS_Blue1_Corner setText:[NSString stringWithFormat:@"%d", self.b1tco]];
        }
        
        if ([[Dict_Blue1 objectForKey:@"Cap_Ball_Raised"] isKindOfClass:[NSNull class]])
        {
            [Seg_Blue1_Ball_Raised setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Blue1_Ball_Raised = @"None";
        }
        else if ([[Dict_Blue1 objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"GT30"])
        {
            [Seg_Blue1_Ball_Raised setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Blue1_Ball_Raised = @">30 in";
        }
        else if ([[Dict_Blue1 objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"LT30"])
        {
            [Seg_Blue1_Ball_Raised setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Blue1_Ball_Raised = @"<30 in";
        }
        else if ([[Dict_Blue1 objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"None"])
        {
            [Seg_Blue1_Ball_Raised setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Blue1_Ball_Raised = @"None";
        }
        
        
        
        if([[Dict_Blue1 objectForKey:@"Cap_Ball_Center"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Blue1_Ball_Vortex = @"N";
            [Seg_Blue1_Ball_Vortex setSelectedSegmentIndex:1];
          //  NSLog(@" ===> 1 @");
        }
        else if ([[Dict_Blue1 objectForKey:@"Cap_Ball_Center"] isEqualToString:@"N"]) {
//            NSLog(@" ===> 2 @");
            [Seg_Blue1_Ball_Vortex setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Blue1_Ball_Vortex = @"N";
        } else {
  //          NSLog(@" ===> 3 @");
            [Seg_Blue1_Ball_Vortex setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Blue1_Ball_Vortex = @"Y";
        }
        
        NSLog(@" ===> %@",Dict_Blue1);
        
    }
}



-(void)disabledData {
    
    Seg_Blue1_Autonomous.selectedSegmentIndex = 1;
    Seg_Blue1_Park_In.userInteractionEnabled = NO;
    Seg_Blue1_Parked.userInteractionEnabled = NO;
    Btn_Blue1_Beacons_Dec.userInteractionEnabled = NO;
    Btn_Blue1_Beacons_Inc.userInteractionEnabled = NO;
    Seg_Blue1_Cap_ball.userInteractionEnabled = NO;
    Btn_PS_Blue1_Center_Dec.userInteractionEnabled = NO;
    Btn_PS_Blue1_Center_Inc.userInteractionEnabled = NO;
    Btn_PS_Blue1_Corner_Dec.userInteractionEnabled = NO;
    Btn_PS_Blue1_Corner_Inc.userInteractionEnabled = NO;
//    TeleOP_Blue1_Beacons_Dec.userInteractionEnabled = NO;
 //   TeleOP_Blue1_Beacons_Inc.userInteractionEnabled = NO;
//    Btn_TeleOP_PS_Blue1_Center_Dec.userInteractionEnabled = NO;
//    Btn_TeleOP_PS_Blue1_Center_Inc.userInteractionEnabled = NO;
//    Btn_TeleOP_PS_Blue1_Corner_Dec.userInteractionEnabled = NO;
//    Btn_TeleOP_PS_Blue1_Corner_Inc.userInteractionEnabled = NO;
//    Seg_Blue1_Ball_Vortex.userInteractionEnabled = NO;
//    Seg_Blue1_Ball_Raised.userInteractionEnabled = NO;
    
    Seg_Blue1_Autonomous.selectedSegmentIndex = 1;
    Seg_Blue1_Park_In.selectedSegmentIndex = 2;
    
    Seg_Blue1_Cap_ball.selectedSegmentIndex = 1;
    Seg_Blue1_Parked.selectedSegmentIndex = 2;
    Seg_Blue1_Ball_Raised.selectedSegmentIndex = 2;
    Seg_Blue1_Ball_Vortex.selectedSegmentIndex = 1;
    
    ApplicationDelegate.Str_Blue1_Team_Number =@"";
    ApplicationDelegate.Str_Blue1_Team_Name =@"";
    ApplicationDelegate.Str_Blue1_Autonomous = @"N";
    ApplicationDelegate.Str_Blue1_Park_In = @"None";
    ApplicationDelegate.Str_Blue1_Parked = @"None";
    ApplicationDelegate.Str_Blue1_Cap_ball = @"N";
    
    ApplicationDelegate.Str_Lbl_Blue1_Beacons = @"0";
    ApplicationDelegate.Str_Lbl_Blue1_PS_Center = @"0";
    ApplicationDelegate.Str_Lbl_Blue1_PS_Corner = @"0";
    
    ApplicationDelegate.Str_Lbl_Tele_Blue1_Beacons = @"0";
    
    ApplicationDelegate.Str_Blue1_Ball_Raised = @"None";
    ApplicationDelegate.Str_Blue1_Ball_Vortex = @"N";
    
    ApplicationDelegate.Str_Lbl_Tele_Blue1_PS_Center = @"0";
    ApplicationDelegate.Str_Lbl_Tele_Blue1_PS_Corner = @"0";
}


-(void)enabledData {
    
    Seg_Blue1_Autonomous.selectedSegmentIndex = 0;
    Seg_Blue1_Park_In.userInteractionEnabled = YES;
    Seg_Blue1_Parked.userInteractionEnabled = YES;
    Btn_Blue1_Beacons_Dec.userInteractionEnabled = YES;
    Btn_Blue1_Beacons_Inc.userInteractionEnabled = YES;
    Seg_Blue1_Cap_ball.userInteractionEnabled = YES;
    Btn_PS_Blue1_Center_Dec.userInteractionEnabled = YES;
    Btn_PS_Blue1_Center_Inc.userInteractionEnabled = YES;
    Btn_PS_Blue1_Corner_Dec.userInteractionEnabled = YES;
    Btn_PS_Blue1_Corner_Inc.userInteractionEnabled = YES;
    TeleOP_Blue1_Beacons_Dec.userInteractionEnabled = YES;
    TeleOP_Blue1_Beacons_Inc.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Blue1_Center_Dec.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Blue1_Center_Inc.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Blue1_Corner_Dec.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Blue1_Corner_Inc.userInteractionEnabled = YES;
    Seg_Blue1_Ball_Vortex.userInteractionEnabled = YES;
    Seg_Blue1_Ball_Raised.userInteractionEnabled = YES;
    
}


-(IBAction)Btn_Blue1_Beacons_Inc:(id)sender
{
    if (self.b1b < 4)
    {
        self.b1b++;
        [self->Lbl_Blue1_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b1b]];
         ApplicationDelegate.Str_Lbl_Blue1_Beacons = [NSString stringWithFormat:@"%d", self.b1b];
    }
}
-(IBAction)Btn_Blue1_Beacons_Dec:(id)sender
{
    if (self.b1b > 0)
    {
        self.b1b--;
        [self->Lbl_Blue1_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b1b]];
         ApplicationDelegate.Str_Lbl_Blue1_Beacons = [NSString stringWithFormat:@"%d", self.b1b];
    }
}

-(IBAction)Btn_PS_Blue1_Center_Inc:(id)sender
{
    if(self.b1ce <99)
    {
        self.b1ce++;
        
        [self->Lbl_PS_Blue1_Center setText:[NSString stringWithFormat:@"%d", self.b1ce]];
        ApplicationDelegate.Str_Lbl_Blue1_PS_Center = [NSString stringWithFormat:@"%d", self.b1ce];

    }
}
-(IBAction)Btn_PS_Blue1_Center_Dec:(id)sender
{
    if(self.b1ce >0)
    {
        self.b1ce--;
        
        [self->Lbl_PS_Blue1_Center setText:[NSString stringWithFormat:@"%d", self.b1ce]];
        ApplicationDelegate.Str_Lbl_Blue1_PS_Center = [NSString stringWithFormat:@"%d", self.b1ce];
    }
}


-(IBAction)Btn_PS_Blue1_Corner_Inc:(id)sender
{
    if(self.b1co <99)
    {
    self.b1co++;
    
    [self->Lbl_PS_Blue1_Corner setText:[NSString stringWithFormat:@"%d", self.b1co]];
        ApplicationDelegate.Str_Lbl_Blue1_PS_Corner = [NSString stringWithFormat:@"%d", self.b1co];

    }
}
-(IBAction)Btn_PS_Blue1_Corner_Dec:(id)sender
{
    if(self.b1co >0)
    {
    self.b1co--;
    
    [self->Lbl_PS_Blue1_Corner setText:[NSString stringWithFormat:@"%d", self.b1co]];
        ApplicationDelegate.Str_Lbl_Blue1_PS_Corner = [NSString stringWithFormat:@"%d", self.b1co];

     }
}

//tele_beacons
-(IBAction)Btn_TeleOP_Blue1_Beacon_Inc:(id)sender
{
    if(self.b1tb < 4)
    {
    self.b1tb++;
    
    [self->Lbl_TeleOP_Blue1_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b1tb]];
         ApplicationDelegate.Str_Lbl_Tele_Blue1_Beacons = [NSString stringWithFormat:@"%d", self.b1tb];
    }
}
-(IBAction)Btn_TeleOP_Blue1_Beacon_Dec:(id)sender
{
    if(self.b1tb>0)
    {
    self.b1tb--;
    
    [self->Lbl_TeleOP_Blue1_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.b1tb]];
         ApplicationDelegate.Str_Lbl_Tele_Blue1_Beacons = [NSString stringWithFormat:@"%d", self.b1tb];
    }
}

//tele_ps
-(IBAction)Btn_TeleOP_PS_Blue1_Center_Inc:(id)sender
{
    if(self.b1tce <99)
    
    {
    self.b1tce++;
    
    [self->Lbl_TeleOP_PS_Blue1_Center setText:[NSString stringWithFormat:@"%d", self.b1tce]];
        ApplicationDelegate.Str_Lbl_Tele_Blue1_PS_Center = [NSString stringWithFormat:@"%d", self.b1tce];
    }
}
-(IBAction)Btn_TeleOP_PS_Blue1_Center_Dec:(id)sender
{
    if(self.b1tce >0)
    {
    self.b1tce--;
    
    [self->Lbl_TeleOP_PS_Blue1_Center setText:[NSString stringWithFormat:@"%d", self.b1tce]];
        ApplicationDelegate.Str_Lbl_Tele_Blue1_PS_Center = [NSString stringWithFormat:@"%d", self.b1tce];
  }
}

-(IBAction)Btn_TeleOP_PS_Blue1_Corner_Inc:(id)sender
{
    if(self.b1tco< 99)
    {
    self.b1tco++;
    
    [self->Lbl_TeleOP_PS_Blue1_Corner setText:[NSString stringWithFormat:@"%d", self.b1tco]];
         ApplicationDelegate.Str_Lbl_Tele_Blue1_PS_Corner = [NSString stringWithFormat:@"%d", self.b1tco];
    }
}

-(IBAction)Btn_TeleOP_PS_Blue1_Corner_Dec:(id)sender
{
    if(self.b1tco > 0)
    {
    self.b1tco--;
    
    [self->Lbl_TeleOP_PS_Blue1_Corner setText:[NSString stringWithFormat:@"%d", self.b1tco]];
         ApplicationDelegate.Str_Lbl_Tele_Blue1_PS_Corner = [NSString stringWithFormat:@"%d", self.b1tco];
    }
}

-(IBAction)Blue1_Autonomous:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger New = segmentedControl.selectedSegmentIndex;
    ApplicationDelegate.Str_Blue1_Autonomous = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
    
    if (New == 0)
    {
        //   Seg_Red1_Autonomous.selectedSegmentIndex = 1;
        Seg_Blue1_Park_In.userInteractionEnabled = YES;
        Seg_Blue1_Parked.userInteractionEnabled = YES;
        Btn_Blue1_Beacons_Dec.userInteractionEnabled = YES;
        Btn_Blue1_Beacons_Inc.userInteractionEnabled = YES;
        Seg_Blue1_Cap_ball.userInteractionEnabled = YES;
        Btn_PS_Blue1_Center_Dec.userInteractionEnabled = YES;
        Btn_PS_Blue1_Center_Inc.userInteractionEnabled = YES;
        Btn_PS_Blue1_Corner_Dec.userInteractionEnabled = YES;
        Btn_PS_Blue1_Corner_Inc.userInteractionEnabled = YES;
        TeleOP_Blue1_Beacons_Dec.userInteractionEnabled = YES;
        TeleOP_Blue1_Beacons_Inc.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Blue1_Center_Dec.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Blue1_Center_Inc.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Blue1_Corner_Dec.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Blue1_Corner_Inc.userInteractionEnabled = YES;
        Seg_Blue1_Ball_Vortex.userInteractionEnabled = YES;
        Seg_Blue1_Ball_Raised.userInteractionEnabled = YES;
        
        
        
    } else {
        Seg_Blue1_Park_In.userInteractionEnabled = NO;
        Seg_Blue1_Parked.userInteractionEnabled = NO;
        Btn_Blue1_Beacons_Dec.userInteractionEnabled = NO;
        Btn_Blue1_Beacons_Inc.userInteractionEnabled = NO;
        Seg_Blue1_Cap_ball.userInteractionEnabled = NO;
        Btn_PS_Blue1_Center_Dec.userInteractionEnabled = NO;
        Btn_PS_Blue1_Center_Inc.userInteractionEnabled = NO;
        Btn_PS_Blue1_Corner_Dec.userInteractionEnabled = NO;
        Btn_PS_Blue1_Corner_Inc.userInteractionEnabled = NO;
  //      TeleOP_Blue1_Beacons_Dec.userInteractionEnabled = NO;
  //      TeleOP_Blue1_Beacons_Inc.userInteractionEnabled = NO;
 //       Btn_TeleOP_PS_Blue1_Center_Dec.userInteractionEnabled = NO;
 //       Btn_TeleOP_PS_Blue1_Center_Inc.userInteractionEnabled = NO;
  //      Btn_TeleOP_PS_Blue1_Corner_Dec.userInteractionEnabled = NO;
  //      Btn_TeleOP_PS_Blue1_Corner_Inc.userInteractionEnabled = NO;
 //       Seg_Blue1_Ball_Vortex.userInteractionEnabled = NO;
 //       Seg_Blue1_Ball_Raised.userInteractionEnabled = NO;
        
    }

    
}
-(IBAction)Blue1_Park_In:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    ApplicationDelegate.Str_Blue1_Park_In = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
}
-(IBAction)Blue1_Parked:(id)sender
{
    UISegmentedControl *segmentControl =(UISegmentedControl *) sender;
    ApplicationDelegate.Str_Blue1_Parked = [segmentControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex];
}

-(IBAction)Blue1_Cap_Ball_On_Floor:(id)sender
{
    UISegmentedControl *segmentControl =(UISegmentedControl *) sender;
    ApplicationDelegate.Str_Blue1_Cap_ball = [segmentControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex];
}

-(IBAction)Blue1_Ball_Raised:(id)sender
{
    UISegmentedControl *segmentControl =(UISegmentedControl *) sender;
    ApplicationDelegate.Str_Blue1_Ball_Raised = [segmentControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex];
}

-(IBAction)Blue1_Ball_Vortex:(id)sender
{
    UISegmentedControl *segmentControl =(UISegmentedControl *) sender;
    ApplicationDelegate.Str_Blue1_Ball_Vortex = [segmentControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex];
}


/*-(IBAction)Blue1_Tele_OP:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    ApplicationDelegate.Str_Blue1_Tele_OP = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
}*/


-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 0 )
    {
        ApplicationDelegate.Str_Blue1_Team_Number = textField.text;
    }
    else if (textField.tag == 1)
    {
        ApplicationDelegate.Str_Blue1_Team_Name = textField.text;
    }
    
    [textField resignFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    // Dispose of any resources that can be recreated.
    [super didReceiveMemoryWarning];
}

@end
