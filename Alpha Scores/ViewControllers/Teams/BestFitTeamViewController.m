//
//  BestFitTeamViewController.m
//
//
//  Created by Neha Parmar on 8/5/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "BestFitTeamViewController.h"

@interface BestFitTeamViewController ()

@end

@implementation BestFitTeamViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupMenuBarButtonItems];
    
    [self FetchFiletering];
    
    self.title = @"Best Fit Team";
    
    Table_BestTeam.dataSource = nil;
    Table_BestTeam.delegate = nil;
    
    Text_Competition.delegate = self;
    Text_Competition.text = @"ALL";
    Str_Competition_ID = @"ALL";
    
    self.navigationController.navigationBar.translucent = NO;
}

-(void)FetchFiletering
{
    //  http://www.scoutinganalyzer.com/VelocityVortex/mobileapp/index.php?task=getCompetitionList&entered_by_team_number=1012
    
    NSDictionary *parameters = @{@"task": @"getCompetitionList", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"]};
    
    [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
     {
         if (isSuccess)
         {
             if (responce == nil)
             {
                 [ApplicationDelegate HideProgressView];
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
             }
             else if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
             {
                 [ApplicationDelegate HideProgressView];
                 [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Message"]];
             }
             else
             {
                 Array_Details = [[responce objectForKey:@"competition_name"]mutableCopy];
                 
                 [self FetchList:@"ALL"];
                 Str_Competition_ID = @"ALL";
             }
         }
         else
         {
             [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
             [ApplicationDelegate HideProgressView];
         }
     }];
}

-(void)FetchList:(NSString *)Str_Id
{
    //  http://www.scoutinganalyzer.com/VelocityVortex/mobileapp/index.php?task=GetAllDataForFitBestTeam&entered_by_team_number=1012&competition_name=78
    
    NSDictionary *parameters = @{@"task": @"GetAllDataForFitBestTeam", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"], @"competition_name": Str_Id};
    
    [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
     {
         if (isSuccess)
         {
             [ApplicationDelegate HideProgressView];

             
             if (responce == nil)
             {
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
             }
             else if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
             {
                 [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Message"]];
             }
             else
             {
                 Array_Team_Data = [[responce objectForKey:@"data"]mutableCopy];
                 
                 Table_BestTeam.dataSource = self;
                 Table_BestTeam.delegate = self;
                 [Table_BestTeam reloadData];
             }
         }
         else
         {
             [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
             [ApplicationDelegate HideProgressView];
         }
     }];
}

-(IBAction)Btn_Heightst:(id)sender
{
//  http://www.scoutinganalyzer.com/VelocityVortex/mobileapp/new_index.php?task=getHighestScore&entered_by_team_number=1012&competition_name=ALL
    
    if ([Text_Competition.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Select Competition"];
    }
    else
    {
        NSDictionary *parameters = @{@"task": @"getHighestScore", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"], @"competition_name": Str_Competition_ID };
     //   NSLog(@" ==== PARAMETERS  ====%@",parameters);
        [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
         {
       //      NSLog(@" ==== responce  ====%@",responce);

             if (isSuccess)
             {
                 [ApplicationDelegate HideProgressView];
                 
                 if (responce == nil)
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 }
                 else if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Message"]];
                 }
                 else
                 {
                     Array_Team_Data = [[responce objectForKey:@"data"]mutableCopy];
                     
                     Table_BestTeam.dataSource = self;
                     Table_BestTeam.delegate = self;
                     
                     [Table_BestTeam reloadData];
                 }
             }
             else
             {
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 [ApplicationDelegate HideProgressView];
             }
         }];
    }
}

- (IBAction)Btn_Particle_Score:(id)sender
{
    //     http://www.scoutinganalyzer.com/VelocityVortex/mobileapp/index.php?task=GetPracticalScore&entered_by_team_number=1012&competition_name=ALL
    
    if ([Text_Competition.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Select Competition"];
    }
    else
    {
        NSDictionary *parameters = @{@"task": @"GetPracticalScore", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"], @"competition_name": Str_Competition_ID };
        
        [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
         {
             if (isSuccess)
             {
                 [ApplicationDelegate HideProgressView];
                 
                 if (responce == nil)
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 }
                 else if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Message"]];
                 }
                 else
                 {
                     Array_Team_Data = [[responce objectForKey:@"data"]mutableCopy];
                     
                     Table_BestTeam.dataSource = self;
                     Table_BestTeam.delegate = self;
                     
                     [Table_BestTeam reloadData];
                 }
             }
             else
             {
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 [ApplicationDelegate HideProgressView];
             }
         }];
    }
}

-(IBAction)Btn_Best_Auto:(id)sender
{
 //   http://www.scoutinganalyzer.com/VelocityVortex/mobileapp/index.php?task=GetBestAutonomous&entered_by_team_number=1012&competition_name=ALL

    if ([Text_Competition.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Select Competition"];
    }
    else
    {
        NSDictionary *parameters = @{@"task": @"GetBestAutonomous", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"], @"competition_name": Str_Competition_ID };
        
        [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
         {
             if (isSuccess)
             {
                 [ApplicationDelegate HideProgressView];
                 
                 if (responce == nil)
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 }
                 else if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Message"]];
                 }
                 else
                 {
                     Array_Team_Data = [[responce objectForKey:@"data"]mutableCopy];
                     
                     Table_BestTeam.dataSource = self;
                     Table_BestTeam.delegate = self;
                     
                     [Table_BestTeam reloadData];
                 }
             }
             else
             {
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 [ApplicationDelegate HideProgressView];
             }
         }];
    }
}

- (IBAction)Btn_Cap_Ball:(id)sender
{
    // http://www.scoutinganalyzer.com/VelocityVortex/mobileapp/index.php?task=getCapBall&entered_by_team_number=1012&competition_name=ALL
    
    if ([Text_Competition.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Select Competition"];
    }
    else
    {
        NSDictionary *parameters = @{@"task": @"GetCapBall", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"], @"competition_name": Str_Competition_ID };
        
        [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
         {
             if (isSuccess)
             {
                 [ApplicationDelegate HideProgressView];
                 
                 if (responce == nil)
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 }
                 else if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Message"]];
                 }
                 else
                 {
                     Array_Team_Data = [[responce objectForKey:@"data"]mutableCopy];
                     
                     Table_BestTeam.dataSource = self;
                     Table_BestTeam.delegate = self;
                     
                     [Table_BestTeam reloadData];
                 }
             }
             else
             {
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 [ApplicationDelegate HideProgressView];
             }
         }];
    }
}

- (IBAction)Btn_Beacons:(id)sender
{
    // http://www.scoutinganalyzer.com/VelocityVortex/mobileapp/index.php?task=GetBeacons&entered_by_team_number=1012&competition_name=ALL
    
    if ([Text_Competition.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Select Competition"];
    }
    else
    {
        NSDictionary *parameters = @{@"task": @"GetBeacons", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"], @"competition_name": Str_Competition_ID };
        
        [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
         {
             if (isSuccess)
             {
                 [ApplicationDelegate HideProgressView];
                 
                 if (responce == nil)
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 }
                 else if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Message"]];
                 }
                 else
                 {
                     Array_Team_Data = [[responce objectForKey:@"data"]mutableCopy];
                     
                     Table_BestTeam.dataSource = self;
                     Table_BestTeam.delegate = self;
                     
                     [Table_BestTeam reloadData];
                 }
             }
             else
             {
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 [ApplicationDelegate HideProgressView];
             }
         }];
    }
}

- (IBAction)Btn_Corner_Ramp:(id)sender
{
 //    http://www.scoutinganalyzer.com/VelocityVortex/mobileapp/index.php?task=getCorenerRamp&entered_by_team_number=1012&competition_name=ALL

    if ([Text_Competition.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Select Competition"];
    }
    else
    {
        NSDictionary *parameters = @{@"task": @"getCorenerRamp", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"], @"competition_name": Text_Competition.text };
        
          NSLog(@"------>%@", Text_Competition.text);
        
        [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
         {
             if (isSuccess)
             {
                 [ApplicationDelegate HideProgressView];
                 
                 if (responce == nil)
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 }
                 else if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Message"]];
                 }
                 else
                 {
                     Array_Team_Data = [[responce objectForKey:@"data"]mutableCopy];
                     
                     Table_BestTeam.dataSource = self;
                     Table_BestTeam.delegate = self;
                     
                     [Table_BestTeam reloadData];
                 }
             }
             else
             {
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 [ApplicationDelegate HideProgressView];
             }
         }];
    }
}

/*-(IBAction)Btn_Best_Hang:(id)sender
 {
 
 if ([Text_Competition.text isEqualToString:@""])
 {
 [ApplicationDelegate ShowAlertWithNoAction:@"Select Competition"];
 }
 else
 {
 NSDictionary *parameters = @{@"task": @"GetBestHang", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"], @"competition_name": Text_Competition.text };
 
 [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
 {
 if (isSuccess)
 {
 [ApplicationDelegate HideProgressView];
 
 if (responce == nil)
 {
 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
 }
 else if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
 {
 [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Message"]];
 }
 else
 {
 Array_Team_Data = [[responce objectForKey:@"data"]mutableCopy];
 
 Table_BestTeam.dataSource = self;
 Table_BestTeam.delegate = self;
 
 [Table_BestTeam reloadData];
 }
 }
 else
 {
 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
 [ApplicationDelegate HideProgressView];
 }
 }];
 }
 }*/


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Array_Team_Data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BestTeamTableViewCell";
    BestTeamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.Label_TeamNumber.text = [[Array_Team_Data valueForKey:@"team_number"] objectAtIndex:indexPath.row];
    cell.Label_TeamName.text = [[Array_Team_Data valueForKey:@"team_name"] objectAtIndex:indexPath.row];
    cell.Label_Consistancy.text = [[Array_Team_Data valueForKey:@"avg_total_score"] objectAtIndex:indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - Text field delegates

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag == 1 )
    {
        [self FilterPickerView];
    }
}

-(void)FilterPickerView
{
    if (Array_Details == nil)
    {
        NSLog(@"Array_Details %@",Array_Details);
    }
    else
    {
        Text_Competition.delegate = self;
        
        Picker_Filter = [[UIPickerView alloc]init];
        Picker_Filter.dataSource = self;
        Picker_Filter.delegate = self;
        Picker_Filter.showsSelectionIndicator = YES;
        Picker_Filter.tag = 11;
        
        Bar_Done_Filter = [[UIBarButtonItem alloc]
                           initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                           target:self action:@selector(Btn_Done_Business_Cate:)];
        
        Tool_Bar_Filter = [[UIToolbar alloc]initWithFrame:
                           CGRectMake(0, self.view.frame.size.height-
                                      200, 320, 50)];
        
        [Tool_Bar_Filter setBarStyle:UIBarStyleBlackOpaque];
        NSArray *toolbarItems = [NSArray arrayWithObjects:
                                 Bar_Done_Filter, nil];
        
        [Tool_Bar_Filter setItems:toolbarItems];
        
        Text_Competition.inputView = Picker_Filter;
        Text_Competition.inputAccessoryView = Tool_Bar_Filter;
    }
}

-(IBAction)Btn_Done_Business_Cate:(id)sender
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [Picker_Filter removeFromSuperview];
    [Tool_Bar_Filter removeFromSuperview];
    [UIView commitAnimations];
    [Text_Competition resignFirstResponder];
}

#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView.tag == 11)
    {
        return [Array_Details count];
    }
    else
    {
        return 0;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow: (NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView.tag == 11)
    {
        return [[Array_Details valueForKey:@"name"]objectAtIndex:row];
    }
    else
    {
        return 0;
    }
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag == 11)
    {
        [Text_Competition setText:[[Array_Details valueForKey:@"name"]objectAtIndex:row]];
        Str_Competition_ID = [[Array_Details valueForKey:@"id"]objectAtIndex:row];
    }
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
