//
//  Red1_ViewController.m
//
//
//  Created by Neha Parmar on 7/30/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "Red1_ViewController.h"

@interface Red1_ViewController ()

@end

@implementation Red1_ViewController
@synthesize Dict_Red1,Bool_Update;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;

//    NSLog(@" Red1VIEWCONTROLLER ====%s", Bool_Update ? "YES" : "NO");
//    NSLog(@" Red1VIEWCONTROLLER ==== %@",Dict_Red1);
    
    Lbl_Red1_Beacons_Val.layer.borderColor =[UIColor redColor].CGColor;
    Lbl_Red1_Beacons_Val.layer.borderWidth = 2.0;
    
    Lbl_PS_Red1_Center.layer.borderColor =[UIColor redColor].CGColor;
    Lbl_PS_Red1_Center.layer.borderWidth = 2.0;
    
    Lbl_PS_Red1_Corner.layer.borderColor =[UIColor redColor].CGColor;
    Lbl_PS_Red1_Corner.layer.borderWidth = 2.0;
    
    Lbl_TeleOP_Red1_Beacons_Val.layer.borderColor =[UIColor redColor].CGColor;
    Lbl_TeleOP_Red1_Beacons_Val.layer.borderWidth = 2.0;
    
    Lbl_TeleOP_PS_Red1_Center.layer.borderColor =[UIColor redColor].CGColor;
    Lbl_TeleOP_PS_Red1_Center.layer.borderWidth = 2.0;
    
    Lbl_TeleOP_PS_Red1_Corner.layer.borderColor =[UIColor redColor].CGColor;
    Lbl_TeleOP_PS_Red1_Corner.layer.borderWidth = 2.0;
    
    /*self.Red1_Beacon_Counter.wraps = YES; self.Red1_Beacon_Counter.autorepeat = YES;
     NSUInteger value = self.Red1_Beacon_Counter.value; selflbl_Red1_Beacon_Value.text = [NSString stringWithFormat:@"%01d",value];
     
     self.Red1_Beacon_Counter.maximumValue = 100;
     */

    
    Text_Red1_Team.delegate = self;
    Text_Red1_Team_Name.delegate = self;
    [self disabledData];

    if (Bool_Update)
    {
    	Text_Red1_Team.text = [Dict_Red1 objectForKey:@"team_number"];
        Text_Red1_Team_Name.text = [Dict_Red1 objectForKey:@"team_name"];
        
        ApplicationDelegate.Str_Red1_Team_Number = [Dict_Red1 objectForKey:@"team_number"];
        ApplicationDelegate.Str_Red1_Team_Name = [Dict_Red1 objectForKey:@"team_name"];
        
        
        if ([[Dict_Red1 objectForKey:@"Has_autnoumous"] isKindOfClass:[NSNull class]])
        {
            ApplicationDelegate.Str_Red1_Autonomous = @"N";
             [Seg_Red1_Autonomous setSelectedSegmentIndex:1];
        }
        else if ([[Dict_Red1 objectForKey:@"Has_autnoumous"] isEqualToString:@"Y"])
        {
            [self enabledData];
            [Seg_Red1_Autonomous setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Red1_Autonomous = @"Y";
        }
        else
        {
            [Seg_Red1_Autonomous setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Red1_Autonomous = @"N";
        }
        
        
        if ([[Dict_Red1 objectForKey:@"Parked"] isKindOfClass:[NSNull class]])
        {
            ApplicationDelegate.Str_Red1_Parked = @"";
        }
        else if ([[Dict_Red1 objectForKey:@"Parked"] isEqualToString:@"None"])
        {
            [Seg_Parked setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Red1_Parked = @"None";
        }
        else if ([[Dict_Red1 objectForKey:@"Parked"]isEqualToString:@"Fully"])
       
        {
            [Seg_Parked setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Red1_Parked = @"Fully";
        }
        else if ([[Dict_Red1 objectForKey:@"Parked"] isEqualToString:@"Partially"])
        {
            [Seg_Parked setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Red1_Parked = @"Partially";
        }

        else
        {
            ApplicationDelegate.Str_Red1_Parked = @"";
        }
        
        
        
        if ([[Dict_Red1 objectForKey:@"Parked_In"] isKindOfClass:[NSNull class]])
        {
            ApplicationDelegate.Str_Red1_Park_In = @"";
        }
        else if ([[Dict_Red1 objectForKey:@"Parked_In"] isEqualToString:@"None"])
        {
            [Seg_Red1_Park_In setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Red1_Park_In = @"None";
        }
        else if ([[Dict_Red1 objectForKey:@"Parked_In"] isEqualToString:@"Corner"])
        {
            [Seg_Red1_Park_In setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Red1_Park_In = @"Corner";
        }
         else if ([[Dict_Red1 objectForKey:@"Parked_In"] isEqualToString:@"Center"])
        {
            [Seg_Red1_Park_In setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Red1_Park_In = @"Center";
        }
        else
        {
            ApplicationDelegate.Str_Red1_Park_In = @"";
        }
        
      //  NSLog(@"AUTOBEACONS%@",[Dict_Red1 objectForKey:@"Auto_Beacons"]);
        
        if([[Dict_Red1 objectForKey:@"Auto_Beacons"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Red1_Beacons=@"";
        
        } else {
            self.r1b = [[Dict_Red1 objectForKey:@"Auto_Beacons"]  intValue];
             ApplicationDelegate.Str_Lbl_Red1_Beacons = [NSString stringWithFormat:@"%d",self.r1b];
             [self->Lbl_Red1_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.r1b]];
        }
    
        
        if([[Dict_Red1 objectForKey:@"Cap_Ball_Floor"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Red1_Cap=@"";
        }
        else if ([[Dict_Red1 objectForKey:@"Cap_Ball_Floor"] isEqualToString:@"N"]) {
         [Seg_Red1_Cap setSelectedSegmentIndex:1];
         ApplicationDelegate.Str_Red1_Cap = @"N";
        } else {
         [Seg_Red1_Cap setSelectedSegmentIndex:0];
         ApplicationDelegate.Str_Red1_Cap = @"Y";
        }
        
        
        if([[Dict_Red1 objectForKey:@"Auto_PScore_Center"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Red1_PS_Center=@"";
            
        } else {
            self.r1ce = [[Dict_Red1 objectForKey:@"Auto_PScore_Center"]  intValue];
            ApplicationDelegate.Str_Lbl_Red1_PS_Center = [NSString stringWithFormat:@"%d",self.r1ce];
            [self->Lbl_PS_Red1_Center setText:[NSString stringWithFormat:@"%d", self.r1ce]];
        }
        
        if([[Dict_Red1 objectForKey:@"Auto_PScore_Corner"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Red1_PS_Corner=@"";
            
        } else {
            self.r1co = [[Dict_Red1 objectForKey:@"Auto_PScore_Corner"]  intValue];
            ApplicationDelegate.Str_Lbl_Red1_PS_Corner = [NSString stringWithFormat:@"%d",self.r1co];
            [self->Lbl_PS_Red1_Corner setText:[NSString stringWithFormat:@"%d", self.r1co]];
        }

       // tele op beacons
        
        if([[Dict_Red1 objectForKey:@"TeleOp_Beacons"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Tele_Red1_Beacons=@"";
            
        } else {
            self.r1tb = [[Dict_Red1 objectForKey:@"TeleOp_Beacons"]  intValue];
            ApplicationDelegate.Str_Lbl_Tele_Red1_Beacons = [NSString stringWithFormat:@"%d",self.r1tb];
            [self->Lbl_TeleOP_Red1_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.r1tb]];
        }
        
        
        if([[Dict_Red1 objectForKey:@"TeleOp_PScore_Center"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Tele_Red1_PS_Center=@"";
            
        } else {
            self.r1tce = [[Dict_Red1 objectForKey:@"TeleOp_PScore_Center"]  intValue];
            ApplicationDelegate.Str_Lbl_Tele_Red1_PS_Center = [NSString stringWithFormat:@"%d",self.r1tce];
            [self->Lbl_TeleOP_PS_Red1_Center setText:[NSString stringWithFormat:@"%d", self.r1tce]];
        }

        if([[Dict_Red1 objectForKey:@"TeleOp_PScore_Corner"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Lbl_Tele_Red1_PS_Center=@"";
            
        } else {
            self.r1tco = [[Dict_Red1 objectForKey:@"TeleOp_PScore_Corner"]  intValue];
            ApplicationDelegate.Str_Lbl_Tele_Red1_PS_Corner = [NSString stringWithFormat:@"%d",self.r1tco];
            [self->Lbl_TeleOP_PS_Red1_Corner setText:[NSString stringWithFormat:@"%d", self.r1tco]];
        }

        if ([[Dict_Red1 objectForKey:@"Cap_Ball_Raised"] isKindOfClass:[NSNull class]])
        {
            [Seg_Red1_Tele_OP_Ball_Raised setSelectedSegmentIndex:2];
            ApplicationDelegate.Str_Red1_Ball_Raised = @"None";
        }
        else if ([[Dict_Red1 objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"GT30"])
        {
            [Seg_Red1_Tele_OP_Ball_Raised setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Red1_Ball_Raised = @">30 in";
        }
        else if ([[Dict_Red1 objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"LT30"])
        {
            [Seg_Red1_Tele_OP_Ball_Raised setSelectedSegmentIndex:0];
              ApplicationDelegate.Str_Red1_Ball_Raised = @"<30 in";
        }
        else if ([[Dict_Red1 objectForKey:@"Cap_Ball_Raised"]isEqualToString:@"None"])
        {
            [Seg_Red1_Tele_OP_Ball_Raised setSelectedSegmentIndex:2];
              ApplicationDelegate.Str_Red1_Ball_Raised = @"None";
        }

        
        
        if([[Dict_Red1 objectForKey:@"Cap_Ball_Center"]isKindOfClass:[NSNull class]]) {
            ApplicationDelegate.Str_Red1_Ball_Vortex = @"N";
            [Seg_Red1_Tele_OP_Vortex setSelectedSegmentIndex:1];
        }
        else if ([[Dict_Red1 objectForKey:@"Cap_Ball_Center"] isEqualToString:@"N"]) {
            [Seg_Red1_Tele_OP_Vortex setSelectedSegmentIndex:1];
            ApplicationDelegate.Str_Red1_Ball_Vortex = @"N";
        } else {
            [Seg_Red1_Tele_OP_Vortex setSelectedSegmentIndex:0];
            ApplicationDelegate.Str_Red1_Ball_Vortex = @"Y";
        }   
    }
}

-(void)disabledData {
    
  //  NSLog(@"==== disabled ====");
    
    ApplicationDelegate.Str_Red1_Team_Number =@"";
    ApplicationDelegate.Str_Red1_Team_Name =@"";
    
    Seg_Red1_Autonomous.selectedSegmentIndex = 1;
    Seg_Parked.selectedSegmentIndex = 2;
    Seg_Red1_Park_In.selectedSegmentIndex = 2;
    
    Seg_Red1_Cap.selectedSegmentIndex = 1;
    Seg_Red1_Tele_OP_Vortex.selectedSegmentIndex = 1;
    Seg_Red1_Tele_OP_Ball_Raised.selectedSegmentIndex = 2;
    
    ApplicationDelegate.Str_Red1_Autonomous = @"N";
    ApplicationDelegate.Str_Red1_Park_In = @"None";
    ApplicationDelegate.Str_Red1_Parked = @"None";
    ApplicationDelegate.Str_Red1_Cap = @"N";
    
    
    ApplicationDelegate.Str_Lbl_Red1_Beacons = @"0";
    ApplicationDelegate.Str_Lbl_Red1_PS_Center = @"0";
    ApplicationDelegate.Str_Lbl_Red1_PS_Corner = @"0";
    
    ApplicationDelegate.Str_Red1_Cap = @"0";
    ApplicationDelegate.Str_Lbl_Tele_Red1_Beacons = @"0";
    
    ApplicationDelegate.Str_Red1_Ball_Raised = @"None";
    ApplicationDelegate.Str_Red1_Ball_Vortex = @"N";
    
    ApplicationDelegate.Str_Lbl_Tele_Red1_PS_Center = @"0";
    ApplicationDelegate.Str_Lbl_Tele_Red1_PS_Corner = @"0";
    
    
    
    
    //Seg_Red1_Autonomous
    Seg_Red1_Autonomous.selectedSegmentIndex = 1;
    Seg_Red1_Park_In.userInteractionEnabled = NO;
    Seg_Parked.userInteractionEnabled = NO;
    Seg_Red1_Cap.userInteractionEnabled = NO;
 //   Seg_Red1_Tele_OP_Vortex.userInteractionEnabled = NO;
  //  Seg_Red1_Tele_OP_Ball_Raised.userInteractionEnabled = NO;
    Btn_Red1_Beacons_Dec.userInteractionEnabled = NO;
    Btn_Red1_Beacons_Inc.userInteractionEnabled = NO;
    Btn_PS_Red1_Center_Dec.userInteractionEnabled = NO;
    Btn_PS_Red1_Center_Inc.userInteractionEnabled = NO;
    Btn_PS_Red1_Corner_Dec.userInteractionEnabled = NO;
    Btn_PS_Red1_Corner_Inc.userInteractionEnabled = NO;
//    Btn_TeleOP_PS_Red1_Center_Dec.userInteractionEnabled = NO;
//    Btn_TeleOP_PS_Red1_Center_Inc.userInteractionEnabled = NO;
//    Btn_TeleOP_PS_Red1_Corner_Dec.userInteractionEnabled = NO;
//    Btn_TeleOP_PS_Red1_Corner_Inc.userInteractionEnabled = NO;
//    TeleOP_Red1_Beacons_Dec.userInteractionEnabled = NO;
 //   TeleOP_Red1_Beacons_Inc.userInteractionEnabled = NO;
}


-(void)enabledData {
    
    //  NSLog(@"==== disabled ====");
    
    
    //Seg_Red1_Autonomous
    Seg_Red1_Autonomous.selectedSegmentIndex = 0;
    Seg_Red1_Park_In.userInteractionEnabled = YES;
    Seg_Parked.userInteractionEnabled = YES;
    Seg_Red1_Cap.userInteractionEnabled = YES;
    Seg_Red1_Tele_OP_Vortex.userInteractionEnabled = YES;
    Seg_Red1_Tele_OP_Ball_Raised.userInteractionEnabled = YES;
    Btn_Red1_Beacons_Dec.userInteractionEnabled = YES;
    Btn_Red1_Beacons_Inc.userInteractionEnabled = YES;
    Btn_PS_Red1_Center_Dec.userInteractionEnabled = YES;
    Btn_PS_Red1_Center_Inc.userInteractionEnabled = YES;
    Btn_PS_Red1_Corner_Dec.userInteractionEnabled = YES;
    Btn_PS_Red1_Corner_Inc.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Red1_Center_Dec.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Red1_Center_Inc.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Red1_Corner_Dec.userInteractionEnabled = YES;
    Btn_TeleOP_PS_Red1_Corner_Inc.userInteractionEnabled = YES;
    TeleOP_Red1_Beacons_Dec.userInteractionEnabled = YES;
    TeleOP_Red1_Beacons_Inc.userInteractionEnabled = YES;
}



-(IBAction)Btn_Red1_Beacon_Inc:(id)sender
{
    if(self.r1b < 4)
    {
    self.r1b++;
    
    [self->Lbl_Red1_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.r1b]];
     ApplicationDelegate.Str_Lbl_Red1_Beacons = [NSString stringWithFormat:@"%d",self.r1b];
    }
}
-(IBAction)Btn_Red1_Beacon_Dec:(id)sender
{
    if(self.r1b >0)
    {
    self.r1b--;
    
    [self->Lbl_Red1_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.r1b]];
     ApplicationDelegate.Str_Lbl_Red1_Beacons = [NSString stringWithFormat:@"%d",self.r1b];

    }
}


-(IBAction)Btn_PS_Red1_Center_Inc:(id)sender
{
    if(self.r1ce < 99)
    {
    self.r1ce++;
    
    [self->Lbl_PS_Red1_Center setText:[NSString stringWithFormat:@"%d", self.r1ce]];
         ApplicationDelegate.Str_Lbl_Red1_PS_Center =  [NSString stringWithFormat:@"%d",self.r1ce];
    }
}
-(IBAction)Btn_PS_Red1_Center_Dec:(id)sender
{
    if(self.r1ce >0)
    {
    self.r1ce--;
    
    [self->Lbl_PS_Red1_Center setText:[NSString stringWithFormat:@"%d", self.r1ce]];
         ApplicationDelegate.Str_Lbl_Red1_PS_Center =  [NSString stringWithFormat:@"%d",self.r1ce];
    }
}

-(IBAction)Btn_PS_Red1_Corner_Inc:(id)sender
{
    if(self.r1co < 99)
    {

    self.r1co++;
    
    [self->Lbl_PS_Red1_Corner setText:[NSString stringWithFormat:@"%d", self.r1co]];
          ApplicationDelegate.Str_Lbl_Red1_PS_Corner =  [NSString stringWithFormat:@"%d",self.r1co];
    }
}
-(IBAction)Btn_PS_Red1_Corner_Dec:(id)sender
{
    if(self.r1co >0)
    {
    self.r1co--;
    
    [self->Lbl_PS_Red1_Corner setText:[NSString stringWithFormat:@"%d", self.r1co]];
          ApplicationDelegate.Str_Lbl_Red1_PS_Corner =  [NSString stringWithFormat:@"%d",self.r1co];
    }
}

//tele_beacons
-(IBAction)Btn_TeleOP_Red1_Beacon_Inc:(id)sender
{
    if(self.r1tb < 4)
    {
    self.r1tb++;
    
    [self->Lbl_TeleOP_Red1_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.r1tb]];
        ApplicationDelegate.Str_Lbl_Tele_Red1_Beacons =  [NSString stringWithFormat:@"%d",self.r1tb];
    }
}
-(IBAction)Btn_TeleOP_Red1_Beacon_Dec:(id)sender
{
    if(self.r1tb > 0)
    {
    self.r1tb--;
    
    [self->Lbl_TeleOP_Red1_Beacons_Val setText:[NSString stringWithFormat:@"%d", self.r1tb]];
        ApplicationDelegate.Str_Lbl_Tele_Red1_Beacons =  [NSString stringWithFormat:@"%d",self.r1tb];
    }
}

//tele_ps
-(IBAction)Btn_TeleOP_PS_Red1_Center_Inc:(id)sender
{
    if(self.r1tce <99)
    {
    self.r1tce++;
    
    [self->Lbl_TeleOP_PS_Red1_Center setText:[NSString stringWithFormat:@"%d", self.r1tce]];
        ApplicationDelegate.Str_Lbl_Tele_Red1_PS_Center =  [NSString stringWithFormat:@"%d",self.r1tce];
    }
}
-(IBAction)Btn_TeleOP_PS_Red1_Center_Dec:(id)sender
{
    if(self.r1tce >0)
    {
    self.r1tce--;
    
    [self->Lbl_TeleOP_PS_Red1_Center setText:[NSString stringWithFormat:@"%d", self.r1tce]];
        ApplicationDelegate.Str_Lbl_Tele_Red1_PS_Center =  [NSString stringWithFormat:@"%d",self.r1tce];
    }
}

-(IBAction)Btn_TeleOP_PS_Red1_Corner_Inc:(id)sender
{
    if(self.r1tco <99)
    {
    self.r1tco++;
    
    [self->Lbl_TeleOP_PS_Red1_Corner setText:[NSString stringWithFormat:@"%d", self.r1tco]];
     ApplicationDelegate.Str_Lbl_Tele_Red1_PS_Corner = [NSString stringWithFormat:@"%d",self.r1tco];
    }
}

-(IBAction)Btn_TeleOP_PS_Red1_Corner_Dec:(id)sender
{
    if(self.r1tco >0)
    {
    self.r1tco--;
    
    [self->Lbl_TeleOP_PS_Red1_Corner setText:[NSString stringWithFormat:@"%d", self.r1tco]];
        ApplicationDelegate.Str_Lbl_Tele_Red1_PS_Corner = [NSString stringWithFormat:@"%d",self.r1tco];
    }
}


-(IBAction)Red1_Autonomous:(id)sender
{
    
    //UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;

    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger New = segmentedControl.selectedSegmentIndex;
    ApplicationDelegate.Str_Red1_Autonomous = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
    
    if (New == 0)
    {
     //   Seg_Red1_Autonomous.selectedSegmentIndex = 1;
        Seg_Red1_Park_In.userInteractionEnabled = YES;
        Seg_Parked.userInteractionEnabled = YES;
        Seg_Red1_Cap.userInteractionEnabled = YES;
        Seg_Red1_Tele_OP_Vortex.userInteractionEnabled = YES;
        Seg_Red1_Tele_OP_Ball_Raised.userInteractionEnabled = YES;
        Btn_Red1_Beacons_Dec.userInteractionEnabled = YES;
        Btn_Red1_Beacons_Inc.userInteractionEnabled = YES;
        Btn_PS_Red1_Center_Dec.userInteractionEnabled = YES;
        Btn_PS_Red1_Center_Inc.userInteractionEnabled = YES;
        Btn_PS_Red1_Corner_Dec.userInteractionEnabled = YES;
        Btn_PS_Red1_Corner_Inc.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Red1_Center_Dec.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Red1_Center_Inc.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Red1_Corner_Dec.userInteractionEnabled = YES;
        Btn_TeleOP_PS_Red1_Corner_Inc.userInteractionEnabled = YES;
        TeleOP_Red1_Beacons_Dec.userInteractionEnabled = YES;
        TeleOP_Red1_Beacons_Inc.userInteractionEnabled = YES;
        
        
        
    } else {
   //     Seg_Red1_Autonomous.selectedSegmentIndex = 1;
        Seg_Red1_Park_In.userInteractionEnabled = NO;
        Seg_Parked.userInteractionEnabled = NO;
        Seg_Red1_Cap.userInteractionEnabled = NO;
 //       Seg_Red1_Tele_OP_Vortex.userInteractionEnabled = NO;
 //       Seg_Red1_Tele_OP_Ball_Raised.userInteractionEnabled = NO;
        Btn_Red1_Beacons_Dec.userInteractionEnabled = NO;
        Btn_Red1_Beacons_Inc.userInteractionEnabled = NO;
        Btn_PS_Red1_Center_Dec.userInteractionEnabled = NO;
        Btn_PS_Red1_Center_Inc.userInteractionEnabled = NO;
        Btn_PS_Red1_Corner_Dec.userInteractionEnabled = NO;
        Btn_PS_Red1_Corner_Inc.userInteractionEnabled = NO;
   //     Btn_TeleOP_PS_Red1_Center_Dec.userInteractionEnabled = NO;
   //     Btn_TeleOP_PS_Red1_Center_Inc.userInteractionEnabled = NO;
  //      Btn_TeleOP_PS_Red1_Corner_Dec.userInteractionEnabled = NO;
  //      Btn_TeleOP_PS_Red1_Corner_Inc.userInteractionEnabled = NO;
  //      TeleOP_Red1_Beacons_Dec.userInteractionEnabled = NO;
 //       TeleOP_Red1_Beacons_Inc.userInteractionEnabled = NO;
        
        
    }

    
    
}

-(IBAction)Red1_Park_In:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    ApplicationDelegate.Str_Red1_Park_In = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
}


/*-(IBAction)Red1_Tele_OP:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    ApplicationDelegate.Str_Red1_Tele_OP = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
}*/

-(IBAction)Red1_Parked:(id)sender
{
    UISegmentedControl *segmentControl =(UISegmentedControl *) sender;
    ApplicationDelegate.Str_Red1_Parked = [segmentControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex];
}

-(IBAction)Red1_Cap_Ball_On_Floor:(id)sender
{
    UISegmentedControl *segmentControl =(UISegmentedControl *) sender;
    ApplicationDelegate.Str_Red1_Cap = [segmentControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex];
}

-(IBAction)Red1_Ball_Raised:(id)sender
{
    UISegmentedControl *segmentControl =(UISegmentedControl *) sender;
    ApplicationDelegate.Str_Red1_Ball_Raised = [segmentControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex];
}

-(IBAction)Red1_Ball_Vortex:(id)sender
{
    UISegmentedControl *segmentControl =(UISegmentedControl *) sender;
    ApplicationDelegate.Str_Red1_Ball_Vortex = [segmentControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex];
}



-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag ==0)
    {
        ApplicationDelegate.Str_Red1_Team_Number = textField.text;
    }
    else if (textField.tag == 1)
    {
        ApplicationDelegate.Str_Red1_Team_Name = textField.text;
    }
    
    [textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
