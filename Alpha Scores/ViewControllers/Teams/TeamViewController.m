//
//  TeamViewController.m
//
//
//  Created by Neha Parmar on 8/5/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "TeamViewController.h"

@interface TeamViewController ()

@end

@implementation TeamViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    
    self.title = @"Teams";
    
    self.navigationController.navigationBar.translucent = NO;

    
    Text_Filter.delegate = self;
    Text_Filter.text = @"ALL";
    
    Table_TeamView.dataSource = self;
    Table_TeamView.delegate = self;
    
    [self setupMenuBarButtonItems];
    
    [self FetchFiletering:@"ALL"];
    Str_Competition_ID = @"ALL";
}

-(void)FetchFiletering:(NSString *)Str_Name
{
    
    
    NSDictionary *parameters = @{@"task": @"getTeamListForTeamPage", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"] , @"competition_name": Str_Name };
    
    [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
     {
    //     NSLog(@"TEAMVIEW CONTROLLER ===> %@",responce);
         if (isSuccess)
         {
             if (responce == nil)
             {
                 [ApplicationDelegate HideProgressView];
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
             }
             else if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
             {
                 [self GetCompitionList];
             }
             else
             {
                 Array_TeamData = [[responce objectForKey:@"data"]mutableCopy];
                 
                 Table_TeamView.delegate = self;
                 Table_TeamView.dataSource = self;
                 
                 [Table_TeamView reloadData];
             
                 
                 
                 [self GetCompitionList];
            }
         }
         else
         {
             [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
             [ApplicationDelegate HideProgressView];
         }
     }];
}

-(void)GetCompitionList
{
 //   http://www.scoutinganalyzer.com/VelocityVortex/mobileapp/index.php?task=getCompetitionList&entered_by_team_number=1012
    
    NSDictionary *parameters = @{@"task": @"getCompetitionList", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"]};
    
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
                 Array_Details = [[responce objectForKey:@"competition_name"]mutableCopy];
             }
         }
         else
         {
             [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
             [ApplicationDelegate HideProgressView];
         }
     }];

}

-(IBAction)Btn_Submit:(id)sender
{
    
    if ([Text_Filter.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Select Filter By"];
    }
    else
    {
        NSString *Str_Rank;
        
        if (Btn_ZANK.isSelected)
        {
            Str_Rank = @"1";
        }
        else
        {
            Str_Rank = @"0";
        }
        
        NSDictionary *parameters = @{@"task": @"getTeamListForTeamPage", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"] , @"is_rank_order_terms": Str_Rank, @"competition_name": Str_Competition_ID };
        
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
                     Array_TeamData = [[responce objectForKey:@"data"]mutableCopy];
                     
                     Table_TeamView.delegate = self;
                     Table_TeamView.dataSource = self;
                     
                     [Table_TeamView reloadData];
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

-(IBAction)Btn_ZANK:(id)sender
{
    if (Btn_ZANK.selected)
    {
        Btn_ZANK.selected = NO;
    }
    else
    {
        Btn_ZANK.selected = YES;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Array_TeamData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BestTeamTableViewCell";
    BestTeamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (![[[Array_TeamData valueForKey:@"team_name"]objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]])
    {
        cell.Label_TeamName.text = [[Array_TeamData valueForKey:@"team_name"]objectAtIndex:indexPath.row];
    }
    else
    {
        cell.Label_TeamName.text = @"";
    }
    
    if (![[[Array_TeamData valueForKey:@"team_number"]objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]])
    {
        cell.Label_TeamNumber.text = [[Array_TeamData valueForKey:@"team_number"]objectAtIndex:indexPath.row];
    }
    else
    {
        cell.Label_TeamNumber.text = @"";
    }
    
    
    if (![[[Array_TeamData valueForKey:@"avg_total_score"]objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]])
    {
        cell.Label_TeamScore.text = [[Array_TeamData valueForKey:@"avg_total_score"]objectAtIndex:indexPath.row];
    }
    else
    {
        cell.Label_TeamScore.text = @"";
    }
    
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(action:)];
    [tapRecognizer setNumberOfTouchesRequired:1];
    [tapRecognizer setDelegate:self];
    cell.Label_Stats.userInteractionEnabled = YES;
    cell.Label_Stats.tag = indexPath.row;
    [cell.Label_Stats addGestureRecognizer:tapRecognizer];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void) action:(id)sender
{
    UITapGestureRecognizer *tapRecognizer = (UITapGestureRecognizer *)sender;
    Array_Data_Pass = [Array_TeamData objectAtIndex:[tapRecognizer.view tag]];
//    Array_id = [Array_Details objectAtIndex:[tapRecognizer.view tag]];
    [self performSegueWithIdentifier:@"ReportViewController" sender:nil];
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
        Text_Filter.delegate = self;
        
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
        
        Text_Filter.inputView = Picker_Filter;
        Text_Filter.inputAccessoryView = Tool_Bar_Filter;
    }
}

-(IBAction)Btn_Done_Business_Cate:(id)sender
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [Picker_Filter removeFromSuperview];
    [Tool_Bar_Filter removeFromSuperview];
    [UIView commitAnimations];
    
    [Text_Filter resignFirstResponder];
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
        return [[Array_Details  valueForKey:@"name"]objectAtIndex:row];
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
        //Int_Selection_Business_Cate = row;
        [Text_Filter setText:[[Array_Details valueForKey:@"name"]objectAtIndex:row]];
        Str_Competition_ID = [[Array_Details valueForKey:@"id"]objectAtIndex:row];
        
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"ReportViewController"])
    {
     // Get reference to the destination view controller
        ReportViewController *Obj_ReportViewController = [segue destinationViewController];
        Obj_ReportViewController.Array_TeamData = Array_Data_Pass;
        Obj_ReportViewController.Str_Competition_ID = Str_Competition_ID;
//        Obj_ReportViewController.Array_Details = Array_id;
        Obj_ReportViewController.Str_Comepetition_Name = Text_Filter.text;
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
