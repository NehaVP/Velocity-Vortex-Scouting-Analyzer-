//
//  ReportViewController.m
//
//
//  Created by Neha Parmar on 8/5/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "ReportViewController.h"

@interface ReportViewController ()

@end

@implementation ReportViewController
@synthesize Array_TeamData,Str_Comepetition_Name,Array_Details,dictionary,Str_Competition_ID;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;


    NewMatchScout *dict=[[NewMatchScout alloc]init];
    dict.Dict_NewMatScoutt=dictionary;
    
//    NSLog(@" Array_TeamData === > %@",Array_TeamData);
    
    self.title = [NSString stringWithFormat:@"%@",[Array_TeamData valueForKey:@"team_name"]];
    
    static_data = [[NSArray alloc]initWithObjects:@"Autonomous", nil];
    
    Text_Number.text =  [Array_TeamData valueForKey:@"team_number"];
    Text_Name.text =  [Array_TeamData valueForKey:@"team_name"];
    
    
    if (![[Array_TeamData valueForKey:@"match_number"] isKindOfClass:[NSNull class]])
    {
        Match_Number.text = [Array_TeamData valueForKey:@"match_number"];
    }
    [Match_Number setHidden:true];
    [lbl_match_number setHidden: true];
    Text_Competiton_Name.text =  [Array_TeamData valueForKey:@"competition_name"];
 
    [self setupMenuBarButtonItems];
    
    
    UIBarButtonItem * item2= [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"store_back_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(PushBack)];
    item2.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=item2;
    
    Table_Report.dataSource = nil;
    Table_Report.delegate = nil;
    
    
    [self GetTimeDetails];
}

-(void)GetTimeDetails
{
//http://scoutinganalyzer.com/VelocityVortex/mobileapp/index.php?task=getTeamDetailForTeamPage&entered_by_team_number=1012&competition_name=scouting&team_number=234&comp_id=ALL

    
    NSDictionary *parameters = @{@"task": @"getTeamDetailForTeamPage", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"],@"competition_name": Text_Competiton_Name.text,@"team_number" : [Array_TeamData valueForKey:@"team_number"], @"comp_id": [Array_TeamData valueForKey:@"comp_id"]};
    
   
    [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
     {
         
   //      NSLog(@" REPORT CONTROLLER RESPONCE == %@",responce);
         
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
                 Array_ReportData = [[responce objectForKey:@"team_details"]mutableCopy];
                 
                 Table_Report.dataSource = self;
                 Table_Report.delegate = self;
                 
                 [Table_Report reloadData];
             }
         }
         else
         {
             [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
             [ApplicationDelegate HideProgressView];
         }
     }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Array_ReportData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ReportManageCell";
    ReportManageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.lbl_Autonomous.text = [[Array_ReportData valueForKey:@"percent_autonomous"]objectAtIndex:indexPath.row];
    cell.lbl_Park_Center.text = [[Array_ReportData valueForKey:@"percent_Parks_Center"]objectAtIndex:indexPath.row];
    cell.lbl_Park_Corner.text = [[Array_ReportData valueForKey:@"percent_Parks_Corner"]objectAtIndex:indexPath.row];
    
    cell.lbl_Matches_Beacons.text = [[Array_ReportData valueForKey:@"percent_MATCHES_Auto_Beacons_claimed"]objectAtIndex:indexPath.row];
    cell.lbl_Beacons.text = [[Array_ReportData valueForKey:@"percent_Auto_Beacons_claimed"]objectAtIndex:indexPath.row];
    cell.lbl_Cap_Ball_onFloor.text = [[Array_ReportData valueForKey:@"percent_Cap_Ball_on_Floor"]objectAtIndex:indexPath.row];
    
    
    //tele
    cell.lbl_Tele_Matches_Beacons.text = [[Array_ReportData valueForKey:@"percent_MATCHES_TeleOp_Beacons_claimed"]objectAtIndex:indexPath.row];
   
    cell.lbl_Tele_Beacons.text = [[Array_ReportData valueForKey:@"percent_TeleOp_Beacons_claimed"]objectAtIndex:indexPath.row];
    cell.lbl_Tele_Cap_Ball_Raised.text = [[Array_ReportData valueForKey:@"percent_Cap_Ball_Raised"]objectAtIndex:indexPath.row];
    cell.lbl_Tele_Cap_Ball_Vortex.text = [[Array_ReportData valueForKey:@"percent_Cap_Ball_Center"]objectAtIndex:indexPath.row];
    
    cell.Label_Auto_Score.text = [[Array_ReportData valueForKey:@"avg_auto_score"]objectAtIndex:indexPath.row];
    cell.Label_TELEOP_Score.text = [[Array_ReportData valueForKey:@"avg_teleop_score"]objectAtIndex:indexPath.row];
    cell.Label_Total_Score.text = [[Array_ReportData valueForKey:@"avg_total_score"]objectAtIndex:indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(IBAction)Btn_Pit_Scout:(id)sender
{
    [self performSegueWithIdentifier:@"NewPittScout" sender:nil];
}


-(IBAction)Btn_Match_Scout:(id)sender
{
 //   http://scoutinganalyzer.com/VelocityVortex/mobileapp/index.php?task=getMatchNumber&entered_by_team_number=1012&team_number=23&comp_id=78
    
    
//http://scoutinganalyzer.com/VelocityVortex/mobileapp/index.php?task=getMatchNumber&entered_by_team_number=1012&team_number=23&comp_id=78
    
    
    NSDictionary *parameters = @{@"task": @"getMatchNumber", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"], @"team_number": [Array_TeamData valueForKey:@"team_number"], @"comp_id": [Array_TeamData valueForKey:@"comp_id"]};
  //  NSLog(@" ==== PARAMETERS ====%@",parameters);
    [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
     {
         
    //     NSLog(@" ==== responce ====%@",responce);

         
         if (isSuccess)
         {
             [ApplicationDelegate HideProgressView];
             
             if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
             {
                 [self ShowAlertWithAction:[responce objectForKey:@"Message"]];
              //   [ApplicationDelegate HideProgressView];
             }
             else if ([[responce objectForKey:@"error"]isEqualToString:@"0"])
             {
                 Array_Picker_Match_Number = [[responce objectForKey:@"data"]mutableCopy];
                 [self MatchNumberPickerView];
             }
         }
         else
         {
             [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
             [ApplicationDelegate HideProgressView];
         }
     }];
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
    [self presentViewController:alertController animated:YES completion:nil];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 //    NSLog(@"ReportViewController : prepareForSegue %@",[segue identifier]);
    if ([[segue identifier] isEqualToString:@"NewPittScout"])
    {
        // Get reference to the destination view controller
        NewPittScout *Obj_NewPittScout = [segue destinationViewController];
        Obj_NewPittScout.Bool_Update = YES;
        
        NSDictionary *parameters = @{@"task": @"updatePittScouting", @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"] , @"team_number": [Array_TeamData valueForKey:@"team_number"], @"entered_by_user": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"],
            @"comp_id":[Array_TeamData valueForKey:@"comp_id"]};
        
 //       NSLog(@" === ReportViewController PARAMETERS === %@",parameters);
        
        Obj_NewPittScout.Dict_NewPitScoutt = parameters;
    }
    else if ([[segue identifier]isEqualToString:@"NewMatchScout"])
    {
        NewMatchScout *Obj_NewMatchScout = [segue destinationViewController];
        Obj_NewMatchScout.Bool_Update = YES;
        Obj_NewMatchScout.Dict_NewMatScoutt = Dict_Pass;
    }
}

-(void)MatchNumberPickerView
{
    alertController = [UIAlertController alertControllerWithTitle:@" \n\n\n\n\n\n\n\n\n\n"
                                                                             message:@""
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    if (Array_Picker_Match_Number == nil)
    {
        NSLog(@"Array_Picker_Match_Number %@",Array_Picker_Match_Number);
    }
    else
    {
        Picker_Business_Cate = [[UIPickerView alloc]init];
        Picker_Business_Cate.dataSource = self;
        Picker_Business_Cate.delegate = self;
        Picker_Business_Cate.showsSelectionIndicator = YES;
        Picker_Business_Cate.tag = 11;
        
        Bar_Done_Business_Cate = [[UIBarButtonItem alloc]
                                  initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                  target:self action:@selector(Btn_Done_Business_Cate:)];
        
        Tool_Bar_Business_Cate = [[UIToolbar alloc]initWithFrame:
                                  CGRectMake(0, self.view.frame.size.height-
                                             200, 320, 50)];
        
        [Tool_Bar_Business_Cate setBarStyle:UIBarStyleBlackOpaque];
        NSArray *toolbarItems = [NSArray arrayWithObjects:
                                 Bar_Done_Business_Cate, nil];
        
        [Tool_Bar_Business_Cate setItems:toolbarItems];
        [alertController.view addSubview:Picker_Business_Cate];
      //  [Picker_Business_Cate selectRow:2 inComponent:0 animated:YES];
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}

-(IBAction)Btn_Done_Business_Cate:(id)sender
{
   // [UIView beginAnimations:nil context:NULL];
  //  [UIView setAnimationDuration:0.3];
  //  [Picker_Business_Cate removeFromSuperview];
  //  [Tool_Bar_Business_Cate removeFromSuperview];
  //  [UIView commitAnimations];
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
        return [Array_Picker_Match_Number count];
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
        return [Array_Picker_Match_Number objectAtIndex:row];
    }
    else
    {
        return 0;
    }
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component
{
    
    if(row == 0){
    
    } else {
    
    [alertController dismissViewControllerAnimated:YES completion:nil];
    
  //  NSLog(@" did select %ld",(long)row);
    
    if (pickerView.tag == 11)
    {
        Int_Selection_Business_Cate = row;
        
        
          NSDictionary *parameters = @{@"task": @"updateNewMatchScouting", @"match_number": [Array_Picker_Match_Number objectAtIndex:row] , @"entered_by_user": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"], @"entered_by_team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"]};
         
        [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
         {
             
       //      NSLog(@" REPORTVIEWCONTROLLER - didSelectRow - RESPONCE %@",responce);
       	      if (isSuccess)
       	      {
       	          [ApplicationDelegate HideProgressView];
                 
        	         if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
        	         {
        	             [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Massege"]];
        	         }
        	         else if ([[responce objectForKey:@"error"]isEqualToString:@"0"])
        	         {
        	             Dict_Pass = [responce mutableCopy];
        	             [self performSegueWithIdentifier:@"NewMatchScout" sender:nil];
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
}

-(void)PushBack
{
    [self.navigationController popViewControllerAnimated:YES];
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
