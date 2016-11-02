//
//  CreateCompetitiors.m
//
//
//  Created by Neha Parmar on 7/27/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "CreateCompetitiors.h"

@interface CreateCompetitiors ()

@end

@implementation CreateCompetitiors
@synthesize Comp_List,Bool_Update;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"NEXTBOOL%@",Bool_Update ? @"Yes" : @"No");
    
    
    
    self.navigationController.navigationBar.translucent = NO;

    
//    NSLog(@" ====> %@",Comp_List);
    if(Bool_Update == YES)
    {
     //   CompTitle.text = @"Edit Competition";
        self.title = @"Edit Competition";
        NSString *str_status = [Comp_List valueForKey:@"status"];
        if([str_status isEqualToString:@"Not Active"]){
        	[statusText setText: @"Deactive"];
        } else {
        	[statusText setText: @"Active"];
        }
        
    }
    else{
     //   CompTitle.text = @"Create Competition";
        self.title = @"Create Competition";
    }
    
    
    Status = [NSArray arrayWithObjects:@"Active",@"Deactive", nil];
   // StatusID = [NSArray arrayWithObjects:@"0", @"1", nil];
    
    
    statusText.delegate = self;
  //  statusText.text = @"Select status";
    
    [self setupMenuBarButtonItems];
    
    
    Text_StartDate.delegate = self;
    Text_EndDate.delegate = self;
   // NSLog(@"------%@",[Comp_List valueForKey:@"competition_name"]);
    
    Text_CompetitionName.text =  [Comp_List valueForKey:@"competition_name"];
    
    Text_StartDate.text = [Comp_List valueForKey:@"start_date"];
    Text_EndDate.text = [Comp_List valueForKey:@"end_date"];
    
    
    // code for date picker
    Picker_Start_Date = [[UIDatePicker alloc]init];
    [Picker_Start_Date setDatePickerMode:UIDatePickerModeDate];
    Picker_Start_Date.date = [NSDate date];
    [Picker_Start_Date addTarget:self action:@selector(startDateChanged:) forControlEvents:UIControlEventValueChanged];
    Text_StartDate.inputView = Picker_Start_Date;
    
    Picker_End_Date = [[UIDatePicker alloc]init];
    [Picker_End_Date setDatePickerMode:UIDatePickerModeDate];
    Picker_End_Date.date = [NSDate date];
    [Picker_End_Date addTarget:self action:@selector(endDateChanged:) forControlEvents:UIControlEventValueChanged];
    Text_EndDate.inputView = Picker_End_Date;
    
    UIBarButtonItem * item2= [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"store_back_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(PushBack)];
    item2.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=item2;
    
    [self BindPickerView];
    
}



-(void)BindPickerView
{
    statusText.delegate = self;
    
    PickerStatus = [[UIPickerView alloc]init];
    PickerStatus.dataSource = self;
    PickerStatus.delegate = self;
    PickerStatus.showsSelectionIndicator = YES;
    PickerStatus.tag = 11;
    
    //select bydefault value in picker
	if(Bool_Update == YES) {
        
        if([statusText.text isEqualToString:@"Active"]){
           	[PickerStatus selectRow:0 inComponent:0 animated:YES];
        } else {
            [PickerStatus selectRow:1 inComponent:0 animated:YES];
        }
        
	}

    
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
    
    
    statusText.inputView = PickerStatus;
    statusText.inputAccessoryView = Tool_Bar_Filter;
}


-(IBAction)Btn_Done_Business_Cate:(id)sender
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [PickerStatus removeFromSuperview];
    [Tool_Bar_Filter removeFromSuperview];
    [UIView commitAnimations];
//    //[statusText resignFirstResponder];
//    
    [self.view endEditing:YES];
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [Status count];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow: (NSInteger)row forComponent:(NSInteger)component
{
    return Status[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    if (pickerView.tag == 11)
    {
	//	  NSLog(@" ==== >%@",[Status objectAtIndex:row]);
         [statusText setText:[Status objectAtIndex:row]];
    }
}

/*
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    UILabel *label = (UILabel *)view;
    if (!label)
    {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 44)];
    }
    
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Active" size:18];
    label.textAlignment = NSTextAlignmentCenter;
    
    //Assign the text of the label to the NSString at the index of "row" from your data array
   // NSLog(@"======>%ld",(long)row);
    label.text = Status[row];
    
    return label;
}
*/
-(IBAction)Btn_Active:(id)sender
{
    
    NSDictionary *parameters;
    
    if ([Text_CompetitionName.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Enter Competition Name"];
    }
    else if([Text_StartDate.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Select start date"];
    }
    //else
  	//  NSLog(@"Comp_Name %@",Text_CompetitionName.text);
    //  NSLog(@"The flagWayTwo result is - %@",Bool_Update ? @"YES":@"NO");
    
    if([statusText.text isEqualToString:@"Active"]){
        StrStatus = @"0";
    } else {
        StrStatus = @"1";
    }

    if(Bool_Update)
    {
        //        NSLog(@"The flagWayTwo result is - %@",Bool_Update ? @"YES":@"NO");
        
        
        
        
        //http://scoutinganalyzer.com/VelocityVortex/mobileapp/index.php?task=edit_comp&comp_id=88&comp_name=Test%20Ws&end_date=2016-10-31&status=Active
        
        //  parameters = @{@"task":@"edit_comp",@"comp_name": Text_CompetitionName.text , @"end_date": Text_EndDate.text,@"comp_id":[Comp_List valueForKey:@"comp_id"],@"status":[Comp_List valueForKey:@"status"]};
        parameters = @{@"task":@"edit_comp",@"comp_name": Text_CompetitionName.text , @"end_date": Text_EndDate.text,@"comp_id":[Comp_List valueForKey:@"comp_id"],@"status":StrStatus, @"entered_by_team_number":[[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"]};
        
        
    } else {
        
        parameters = @{@"task": @"create_competition", @"Competition_name": Text_CompetitionName.text , @"start_date": Text_StartDate.text, @"end_date": Text_EndDate.text, @"Team_name":[[NSUserDefaults standardUserDefaults]objectForKey:@"TeamName"], @"Team_number":[[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"], @"email_id": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"], @"status":StrStatus};
    }
    
    
    
    [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
     {
         
   //       NSLog(@">>>>%@",Bool_Update ? @"YES":@"NO");
         if (Bool_Update)
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
         else
         {
             
             if (isSuccess)
             {
                 [ApplicationDelegate HideProgressView];
                 
                 if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"msg"]];
                 }
                 else
                 {
                     [self ShowAlertWithNoAction:[responce objectForKey:@"msg"]];
                 }
             }
             else
             {
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 [ApplicationDelegate HideProgressView];
             }
         }
     }];
    
}

-(void)ShowAlertWithNoAction:(NSString *)Message
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

#pragma mark - Date Picker Events
-(void)startDateChanged:(UIDatePicker *)sender
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd"];
    Text_StartDate.text = [df stringFromDate:sender.date];
    
}
-(void)endDateChanged:(UIDatePicker *)sender
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd"];
    Text_EndDate.text = [df stringFromDate:sender.date];
}

-(void)viewDidLayoutSubviews
{
    if (self.view.frame.size.height == 480)
    {
        Btn_Acitve_Competitiors.frame = CGRectMake(40, 430, 240, 40);
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

-(void)PushBack
{
    [self.navigationController popViewControllerAnimated:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}





@end
