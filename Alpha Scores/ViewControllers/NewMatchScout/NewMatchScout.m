//
//  NewMatchScout.m
//
//
//  Created by Neha Parmar on 7/27/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "NewMatchScout.h"

@interface NewMatchScout ()

@property (weak, nonatomic) IBOutlet UIView *ViewContainer_Red1;
@property (weak, nonatomic) IBOutlet UIView *ViewContainer_Red2;
@property (weak, nonatomic) IBOutlet UIView *ViewContainer_Blue1;
@property (weak, nonatomic) IBOutlet UIView *ViewContainer_Blue2;

@end

@implementation NewMatchScout
@synthesize Bool_Update,Dict_NewMatScoutt;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;

  
    
    /*UIColor *color = [UIColor whiteColor];
     Text_Match_Scout_Match.attributedPlaceholder =
     [[NSAttributedString alloc] initWithString:@"Match #"
     attributes:@{
     NSForegroundColorAttributeName: color,
     NSFontAttributeName : [UIFont fontWithName:@"Roboto-Bold" size:17.0]
     }
     ];*/
    
     Text_Match_Scout_Match.layer.borderColor=[[UIColor whiteColor] CGColor];
    Text_Match_Scout_Match.layer.borderWidth=2;
   // Text_Match_Scout_Match.placeholder
     //Text_Match_Scout_Match.layer.borderColor=[[UIColor greenColor]CGColor];
    
    if (Bool_Update)
    {
        
    }
    
    NSArray *arri = [Main_Segment subviews];
    
    self.title = @"New Match Scout";
        
    Text_Match_Scout_Match.text = [[Dict_NewMatScoutt objectForKey:@"data"]objectForKey:@"match_number"];
    Text_Red_Alliance_Score.text = [[Dict_NewMatScoutt objectForKey:@"data"] objectForKey:@"red_aliance_score"];
    Text_Blue_Alliance_Score.text = [[Dict_NewMatScoutt objectForKey:@"data"] objectForKey:@"blue_aliance_score"];
    
    
    
    
    // Change the tintColor of each subview within the array:
    [[arri objectAtIndex:0] setTintColor:BlueColor];
    [[arri objectAtIndex:1] setTintColor:BlueColor];
    [[arri objectAtIndex:2] setTintColor:[UIColor redColor]];
    [[arri objectAtIndex:3] setTintColor:[UIColor redColor]];
    
    
    [UIView animateWithDuration:(0.5) animations:^{
        self.ViewContainer_Red1.alpha = 1;
        self.ViewContainer_Red2.alpha = 0;
        self.ViewContainer_Blue1.alpha = 0;
        self.ViewContainer_Blue2.alpha = 0;
    }];
    
    
    
    
    
    [self setupMenuBarButtonItems];
}


-(IBAction)Btn_Submit:(id)sender
{
    
    
    
   /* else if ([Text_Red_Alliance_Score.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Enter Red Alliance Score"];
    }
    else if ([Text_Blue_Alliance_Score.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Enter Blue Alliance Score"];
    }*/
    
    

    
    if ([Text_Match_Scout_Match.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Enter Match Scouting Match #"];
    }
    else
    {
        if (ApplicationDelegate.Str_Red1_Team_Number.length == 0)
        {
            ApplicationDelegate.Str_Red1_Team_Number = @"";
        }
        
        if (ApplicationDelegate.Str_Red1_Team_Name.length == 0)
        {
            ApplicationDelegate.Str_Red1_Team_Name = @"";
        }
        
        if (ApplicationDelegate.Str_Red2_Team_Number.length == 0)
        {
            ApplicationDelegate.Str_Red2_Team_Number = @"";
        }
        
        if (ApplicationDelegate.Str_Red2_Team_Name.length == 0)
        {
            ApplicationDelegate.Str_Red2_Team_Name = @"";
        }

        if (ApplicationDelegate.Str_Blue1_Team_Number.length == 0)
        {
            ApplicationDelegate.Str_Blue1_Team_Number = @"";
        }
        
        if (ApplicationDelegate.Str_Blue1_Team_Name.length == 0)
        {
            ApplicationDelegate.Str_Blue1_Team_Name = @"";
        }
        
        if (ApplicationDelegate.Str_Blue2_Team_Number.length == 0)
        {
            ApplicationDelegate.Str_Blue2_Team_Number = @"";
        }
        
        if (ApplicationDelegate.Str_Blue2_Team_Name.length == 0)
        {
            ApplicationDelegate.Str_Blue2_Team_Name = @"";
        }
        
   // NSString *Str_Lbl_Red1_Beacons = [ NSString stringWithFormat:@"%@",
        
        NSDictionary *parameters;
   //     NSString *Str_Red1_Lbl_Beacons;
        
        
        NSString *red1_id = [[[Dict_NewMatScoutt valueForKey:@"data"] valueForKey:@"red1"] valueForKey:@"id"];
        NSString *red2_id = [[[Dict_NewMatScoutt valueForKey:@"data"] valueForKey:@"red2"] valueForKey:@"id"];
        NSString *blue1_id = [[[Dict_NewMatScoutt valueForKey:@"data"] valueForKey:@"blue1"] valueForKey:@"id"];
        NSString *blue2_id = [[[Dict_NewMatScoutt valueForKey:@"data"] valueForKey:@"blue2"] valueForKey:@"id"];
        
        if(red1_id == nil){
        	red1_id = @"";
        }
        
        if(red2_id == nil){
            red2_id = @"";
        }
        
        if(blue1_id == nil){
            blue1_id = @"";
        }
        
        if(blue2_id == nil){
            blue2_id = @"";
        }
        
        
        
        if (Bool_Update)
        {
       

            
            parameters = @{@"task": @"updatedNewMatchScouting",@"match_number": Text_Match_Scout_Match.text, @"entered_by_user": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"] ,@"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"],@"red_score": Text_Red_Alliance_Score.text, @"blue_score": Text_Blue_Alliance_Score.text, @"red1team_number" : ApplicationDelegate.Str_Red1_Team_Number,
                @"red1_id": red1_id,
				@"red1team_name" : ApplicationDelegate.Str_Red1_Team_Name,
                @"red2team_number" : ApplicationDelegate.Str_Red2_Team_Number,
				@"red2_id": red2_id,
                @"red2team_name" : ApplicationDelegate.Str_Red2_Team_Name,
                                         
				@"blue1team_number" : ApplicationDelegate.Str_Blue1_Team_Number,
				@"blue1_id": blue1_id,
				@"blue1team_name" : ApplicationDelegate.Str_Blue1_Team_Name,
                                         
				@"blue2team_number" : ApplicationDelegate.Str_Blue2_Team_Number,
				@"blue2_id": blue2_id,
				@"blue2team_name" : ApplicationDelegate.Str_Blue2_Team_Name,
                           
                                         
                                         // Red1
                                         @"red1has_autonomous": ApplicationDelegate.Str_Red1_Autonomous,@"red1has_parked":ApplicationDelegate.Str_Red1_Parked,@"red1park_in": ApplicationDelegate.Str_Red1_Park_In,@"red1has_cap_ball":ApplicationDelegate.Str_Red1_Cap,@"red1has_ball_raised":ApplicationDelegate.Str_Red1_Ball_Raised,@"red1has_ball_vortex":ApplicationDelegate.Str_Red1_Ball_Vortex,@"red1has_beacons_value":ApplicationDelegate.Str_Lbl_Red1_Beacons,@"red1has_tele_beacons":ApplicationDelegate.Str_Lbl_Tele_Red1_Beacons,@"red1has_ps_center":ApplicationDelegate.Str_Lbl_Red1_PS_Center,@"red1has_ps_corner":ApplicationDelegate.Str_Lbl_Red1_PS_Corner,@"red1has_tele_ps_center":ApplicationDelegate.Str_Lbl_Tele_Red1_PS_Center,@"red1has_tele_ps_corner":ApplicationDelegate.Str_Lbl_Tele_Red1_PS_Corner,/*@"red1has_teleop": ApplicationDelegate.Str_Red1_Tele_OP,*/
                           
                                         // Red 2
                        @"red2has_autonomous": ApplicationDelegate.Str_Red2_Autonomous,
						@"red2has_parked":ApplicationDelegate.Str_Red2_Parked,
                    @"red2has_beacons_value":ApplicationDelegate.Str_Lbl_Red2_Beacons,
                    @"red2has_ball_On_floor":ApplicationDelegate.Str_Red2_Cap,
                    @"red2has_PS_Center":ApplicationDelegate.Str_Lbl_Red2_PS_Center,
                    @"red2has_PS_Corner":ApplicationDelegate.Str_Lbl_Red2_PS_Corner,
                    @"red2park_in":ApplicationDelegate.Str_Red2_Park_In,
                    @"red2has_tele_beacons_Val":ApplicationDelegate.Str_Lbl_Tele_Red2_Beacons,
                    @"red2has_tele_PS_center":ApplicationDelegate.Str_Lbl_Tele_Red2_PS_Center,
                    @"red2has_tele_PS_corner":ApplicationDelegate.Str_Lbl_Tele_Red2_PS_Corner,
                    @"red2has_ball_raised":ApplicationDelegate.Str_Red2_Ball_Raised,
                    @"red2has_ball_Vortex":ApplicationDelegate.Str_Red2_Tele_Ball_vortex,
                           
                                         // Blue 1
                                         
							@"blue1has_autonomous": ApplicationDelegate.Str_Blue1_Autonomous,
                            @"blue1park_in": ApplicationDelegate.Str_Blue1_Park_In,
							@"blue1parked":ApplicationDelegate.Str_Blue1_Parked,
							@"blue1ball_On_floor":ApplicationDelegate.Str_Blue1_Cap_ball,
							@"blue1has_Beacons":ApplicationDelegate.Str_Lbl_Tele_Blue1_Beacons,
							@"blue1has_PS_center":ApplicationDelegate.Str_Lbl_Blue1_PS_Center,
							@"blue1has_PS_corner":ApplicationDelegate.Str_Lbl_Blue1_PS_Corner,
                           
							//@"blue1has_teleop": ApplicationDelegate.Str_Blue1_Tele_OP,
                           
							@"blue1has_tele_beacons":ApplicationDelegate.Str_Lbl_Tele_Blue1_Beacons,
							@"blue1has_tele_ps_Center":ApplicationDelegate.Str_Lbl_Tele_Blue1_PS_Center,
							@"blue1has_tele_ps_corner":ApplicationDelegate.Str_Lbl_Tele_Blue1_PS_Corner,
							@"Cap_Ball_Raised":ApplicationDelegate.Str_Blue1_Ball_Raised,
                            @"Ball_Vortex":ApplicationDelegate.Str_Blue1_Ball_Vortex,

                           // Blue 2
                           
							@"blue2has_autonomous": ApplicationDelegate.Str_Blue2_Autonomous,
							@"blue2park_in": ApplicationDelegate.Str_Blue2_Park_In,
							//@"blue2has_teleop": ApplicationDelegate.Str_Blue2_Tele_OP,
							@"blue2parked":ApplicationDelegate.Str_Blue2_Parked,
							@"blue2ball_On_floor":ApplicationDelegate.Str_Blue2_Cap_Ball_Floor,
							@"Cap_Ball_Raised":ApplicationDelegate.Str_Blue2_Ball_Raised,
							@"Ball_Vortex":ApplicationDelegate.Str_Blue2_Ball_Vortex,
							@"blue2has_Beacons":ApplicationDelegate.Str_Lbl_Blue2_Beacons,
							@"blue2has_tele_beacons":ApplicationDelegate.Str_Lbl_Tele_Blue2_Beacons,
							@"blue2has_ps_center":ApplicationDelegate.Str_Lbl_Blue2_PS_Center,
							@"blue2has_ps_corner":ApplicationDelegate.Str_Lbl_Blue2_PS_Corner,
							@"blue2has_tele_ps_center":ApplicationDelegate.Str_Lbl_Tele_Blue2_PS_Center,
							@"blue2has_tele_ps_corner":ApplicationDelegate.Str_Lbl_Tele_Blue2_PS_Corner
                           };
        } else {
            
            parameters = @{@"task": @"InsertMatchScouting", @"match_number": Text_Match_Scout_Match.text, @"entered_by_user": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"] ,@"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"],  @"red_score": Text_Red_Alliance_Score.text, @"blue_score": Text_Blue_Alliance_Score.text,
                           
                           @"red1team_number" : ApplicationDelegate.Str_Red1_Team_Number,
                           @"red1team_name" : ApplicationDelegate.Str_Red1_Team_Name,
                           @"red2team_number" : ApplicationDelegate.Str_Red2_Team_Number,
                           @"red2team_name" : ApplicationDelegate.Str_Red2_Team_Name,
                           @"blue1team_number" : ApplicationDelegate.Str_Blue1_Team_Number,
                           @"blue1team_name" : ApplicationDelegate.Str_Blue1_Team_Name,
                           @"blue2team_number" : ApplicationDelegate.Str_Blue2_Team_Number,
                           @"blue2team_name" : ApplicationDelegate.Str_Blue2_Team_Name,
                           
                           /******Red1********/
                           
                           @"red1has_autonomous": ApplicationDelegate.Str_Red1_Autonomous,
                           @"red1_Parked":ApplicationDelegate.Str_Red1_Parked,
                           @"red1_park_in": ApplicationDelegate.Str_Red1_Park_In,
                           @"red1has_beacons":ApplicationDelegate.Str_Lbl_Red1_Beacons,
                           @"red1has_ps_center":ApplicationDelegate.Str_Lbl_Red1_PS_Center,
                           @"red1has_ps_corner":ApplicationDelegate.Str_Lbl_Red1_PS_Corner,
                           @"red1_Cap_Ball_On_Floor":ApplicationDelegate.Str_Red1_Cap,
                           @"red1has_tele_beacons":ApplicationDelegate.Str_Lbl_Tele_Red1_Beacons,
                           @"red1_Cap_Ball_Raised":ApplicationDelegate.Str_Red1_Ball_Raised,
                           @"red1_Ball_Vortex":ApplicationDelegate.Str_Red1_Ball_Vortex,
                           @"red1has_tele_ps_center":ApplicationDelegate.Str_Lbl_Tele_Red1_PS_Center,
                           @"red11has_tele_ps_corner":ApplicationDelegate.Str_Lbl_Tele_Red1_PS_Corner,
                           
                           
                           /******Red2********/
                  
                        
                           
                           @"red2has_autonomous": ApplicationDelegate.Str_Red2_Autonomous,
                           @"red2has_parked":ApplicationDelegate.Str_Red2_Parked,
                           @"red2has_beacons_value":ApplicationDelegate.Str_Lbl_Red2_Beacons,
                           @"red2has_ball_on_floor":ApplicationDelegate.Str_Red2_Cap,
                           @"red2has_PS_Center":ApplicationDelegate.Str_Lbl_Red2_PS_Center,
                           @"red2has_PS_Corner":ApplicationDelegate.Str_Lbl_Red2_PS_Corner,
                           @"red2park_in": ApplicationDelegate.Str_Red2_Park_In,
                           
                           @"red2has_tele_beacons_Val":ApplicationDelegate.Str_Lbl_Tele_Red2_Beacons,
                           @"red2has_tele_PS_center":ApplicationDelegate.Str_Lbl_Tele_Red2_PS_Center,
                           @"red2has_tele_PS_corner":ApplicationDelegate.Str_Lbl_Tele_Red2_PS_Corner,
                           @"red2has_ball_raised":ApplicationDelegate.Str_Red2_Ball_Raised,
                           @"red2has_ball_vortex":ApplicationDelegate.Str_Red2_Tele_Ball_vortex,
                           
                           
                           // Blue 1
                      
                           @"blue1has_autonomous": ApplicationDelegate.Str_Blue1_Autonomous,
                           @"blue1park_in":ApplicationDelegate.Str_Blue1_Park_In,
                           @"blue1parked":ApplicationDelegate.Str_Blue1_Parked,
                           @"blue1ball_On_floor":ApplicationDelegate.Str_Blue1_Cap_ball,
                           @"blue1has_Beacons":ApplicationDelegate.Str_Lbl_Blue1_Beacons,
                           @"blue1has_PS_center":ApplicationDelegate.Str_Lbl_Blue1_PS_Center,
                           @"blue1has_PS_corner":ApplicationDelegate.Str_Lbl_Blue1_PS_Corner,
                           @"blue1has_tele_beacons":ApplicationDelegate.Str_Lbl_Tele_Blue1_Beacons,
                           @"blue1has_tele_ps_Center":ApplicationDelegate.Str_Lbl_Tele_Blue1_PS_Center,
                           @"blue1has_tele_ps_corner":ApplicationDelegate.Str_Lbl_Tele_Blue1_PS_Corner,
                           @"blue1has_Cap_Ball_Raised":ApplicationDelegate.Str_Blue1_Ball_Raised,
                           @"blue1has_Ball_Vortex":ApplicationDelegate.Str_Blue1_Ball_Vortex,
                           
                           
                           // Blue 2
                           
                           @"blue2has_autonomous": ApplicationDelegate.Str_Blue2_Autonomous,
                           @"blue2park_in": ApplicationDelegate.Str_Blue2_Park_In,
                           @"blue2parked":ApplicationDelegate.Str_Blue2_Parked,
                           @"blue2ball_On_floor":ApplicationDelegate.Str_Blue2_Cap_Ball_Floor,
                           @"Cap_Ball_Raised":ApplicationDelegate.Str_Blue2_Ball_Raised,
                           @"Ball_Vortex":ApplicationDelegate.Str_Blue2_Ball_Vortex,
                           @"blue2has_Beacons":ApplicationDelegate.Str_Lbl_Blue2_Beacons,
                           @"blue2has_tele_beacons":ApplicationDelegate.Str_Lbl_Tele_Blue2_Beacons,
                           @"blue2has_ps_center":ApplicationDelegate.Str_Lbl_Blue2_PS_Center,
                           @"blue2has_ps_corner":ApplicationDelegate.Str_Lbl_Blue2_PS_Corner,
                           @"blue2has_tele_ps_center":ApplicationDelegate.Str_Lbl_Tele_Blue2_PS_Center,
                           @"blue2has_tele_ps_corner":ApplicationDelegate.Str_Lbl_Tele_Blue2_PS_Corner
                           };
        }
        
     //   NSLog(@" NEWMATCHSCOUT PARAMAS ==> %@",parameters);
        
        [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
         {
             
      //          NSLog(@" NEWMATCHSCOUT RESPONCE ==> %@",responce);
             
             if (Bool_Update)
             {
                 if (isSuccess)
                 {
                     [ApplicationDelegate HideProgressView];
                     [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Massege"]];
                 }
                 else
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                     [ApplicationDelegate HideProgressView];
                 }
             }
             else
             {
                 if (isSuccess)
                 {
                     [ApplicationDelegate HideProgressView];
                     [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"message"]];
                 }
                 else
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                     [ApplicationDelegate HideProgressView];
                 }
             }
         }];
    }
}



- (IBAction)segmentSwitch:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0)
    {
        [UIView animateWithDuration:(0.5) animations:^{
            self.ViewContainer_Red1.alpha = 1;
            self.ViewContainer_Red2.alpha = 0;
            self.ViewContainer_Blue1.alpha = 0;
            self.ViewContainer_Blue2.alpha = 0;
        }];
    }
    else if (selectedSegment == 1)
    {
        [UIView animateWithDuration:(0.5) animations:^{
            self.ViewContainer_Red1.alpha = 0;
            self.ViewContainer_Red2.alpha = 1;
            self.ViewContainer_Blue1.alpha = 0;
            self.ViewContainer_Blue2.alpha = 0;
        }];
    }
    else if (selectedSegment == 2)
    {
        [UIView animateWithDuration:(0.5) animations:^{
            self.ViewContainer_Red1.alpha = 0;
            self.ViewContainer_Red2.alpha = 0;
            self.ViewContainer_Blue1.alpha = 1;
            self.ViewContainer_Blue2.alpha = 0;
        }];
    }
    else if (selectedSegment == 3)
    {
        [UIView animateWithDuration:(0.5) animations:^{
            self.ViewContainer_Red1.alpha = 0;
            self.ViewContainer_Red2.alpha = 0;
            self.ViewContainer_Blue1.alpha = 0;
            self.ViewContainer_Blue2.alpha = 1;
        }];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
  //  NSLog(@" NEWMATCHSCOUT === %s", Bool_Update ? "YES" : "NO");
  //  NSLog(@" NEWMATCHSCOUT : Dict_NewMatScoutt === %@",Dict_NewMatScoutt);
    
    if (Bool_Update)
    {
        
        if ([[segue identifier] isEqualToString:@"Red1_ViewController"])
        {
       //     NSLog(@" === RED1 ===@");
            // Get reference to the destination view controller
            Red1_ViewController *Obj_NewPitScoutContainer = [segue destinationViewController];
            Obj_NewPitScoutContainer.Dict_Red1 = [[Dict_NewMatScoutt valueForKey:@"data"]valueForKey:@"red1"];
            Obj_NewPitScoutContainer.Bool_Update = YES;
        }
        else if ([[segue identifier] isEqualToString:@"Red2_ViewController"])
        {
//            NSLog(@" === RED2 ===@");
            Red2_ViewController *Obj_NewPitScoutContainer = [segue destinationViewController];
            Obj_NewPitScoutContainer.Dict_Red2 = [[Dict_NewMatScoutt valueForKey:@"data"]valueForKey:@"red2"];
            Obj_NewPitScoutContainer.Bool_Update = YES;
        }
        else if ([[segue identifier] isEqualToString:@"Blue1_ViewController"])
        {
//            NSLog(@" === BLUE1 CALLLEd ===@");
            Blue1_ViewController *Obj_NewPitScoutContainer = [segue destinationViewController];
            Obj_NewPitScoutContainer.Dict_Blue1 = [[Dict_NewMatScoutt valueForKey:@"data"]valueForKey:@"blue1"];
            Obj_NewPitScoutContainer.Bool_Update = YES;
        }
        else if ([[segue identifier] isEqualToString:@"Blue2_ViewController"])
        {
//            NSLog(@" === BLUE2 CALLLEd ===@");
            Blue2_ViewController *Obj_NewPitScoutContainer = [segue destinationViewController];
            Obj_NewPitScoutContainer.Dict_Blue2 = [[Dict_NewMatScoutt valueForKey:@"data"]valueForKey:@"blue2"];
            Obj_NewPitScoutContainer.Bool_Update = YES;
        }
    }
    // Pass the selected object to the new view controller.
    
}

- (void)setupMenuBarButtonItems
{
    self.navigationItem.leftBarButtonItem = [self leftMenuBarButtonItem];
}

- (UIBarButtonItem *)leftMenuBarButtonItem
{
    return [[UIBarButtonItem alloc]
            initWithImage:[UIImage imageNamed:@"Image_Menu"] style:UIBarButtonItemStylePlain
            target:self
            action:@selector(leftSideMenuButtonPressed:)];
}

- (void)leftSideMenuButtonPressed:(id)sender
{
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
        [self setupMenuBarButtonItems];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
