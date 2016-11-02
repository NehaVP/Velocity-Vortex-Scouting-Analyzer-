//
//  AutheticateNewUser.m
//
//
//  Created by Neha Parmar on 7/28/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "AutheticateNewUser.h"
#import "JSON.h"

@interface AutheticateNewUser ()

@end

@implementation AutheticateNewUser

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem * item2= [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"store_back_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(PushBack)];
    item2.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=item2;
    
    self.title = @"Admin Authenticate New Users";
    
    self.navigationController.navigationBar.translucent = NO;

    
    [self FetchData];
}

-(IBAction)Btn_Submit:(id)sender
{
    NSMutableArray *Array = [[NSMutableArray alloc]init];
    NSString *jsonString;
    
    if (Array_UserList.count!=0)
    {
        for (int i=0; i<Array_UserList.count; i++)
        {
            NSMutableDictionary *Dict1 = [[NSMutableDictionary alloc]init];
            
            [Dict1 setObject:[[Array_UserList valueForKey:@"email"]objectAtIndex:i]forKey:@"Email"];
            [Dict1 setObject:[Array_Is_Admin_Value_Set objectAtIndex:i] forKey:@"Is_Admin"];
            [Dict1 setObject:[Array_Is_Accept_Decline_Set objectAtIndex:i] forKey:@"Is_Accept"];
            
            [Array addObject:Dict1];
        }
        
        jsonString = [Array JSONRepresentation];
        
    }
    
    NSDictionary *parameters = @{@"task": @"admin_authenticate_new_users", @"Authentication_Data": jsonString , @"team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"],@"email_id": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"]};
    
  //  NSLog(@"  ======= PARAMETERS ====== %@",parameters);
    
    [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
     {
         
//        NSLog(@" ====== RESPONSE ====== %@",responce);
         if (isSuccess)
         {
             [ApplicationDelegate HideProgressView];
             
             if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
             {
                 [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Massege"]];
             }
             else
             {
                 
                 
                 if ([[responce objectForKey:@"pending_users"]isEqualToString:@"0"]) {
                     Array_UserList = nil;
                     [Table_Admin_New_User reloadData];
                    [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Massege"]];
                 } else {
                 	Array_Is_Admin = [[NSMutableArray alloc]init];
                 	Array_Is_Admin_Value_Set = [[NSMutableArray alloc]init];
                 
                 	Array_Is_Accept_Decline = [[NSMutableArray alloc] init];
                 	Array_Is_Accept_Decline_Set = [[NSMutableArray alloc]init];
                 
                 	Array_UserList = [[responce objectForKey:@"pending_users"]mutableCopy];
                 
                 
                 	for (int i=0 ; i< Array_UserList.count; i++)
                 	{
                 	    [Array_Is_Admin_Value_Set addObject:@"0"];
                 	}
                 
                 	for (int i=0 ; i< Array_UserList.count; i++)
                 	{
                 	    [Array_Is_Accept_Decline_Set addObject:@"0"];
                 	}
                 
                 	Table_Admin_New_User.dataSource = self;
                 	Table_Admin_New_User.delegate = self;
                 
                 	[Table_Admin_New_User reloadData];
                 
                 	[ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Massege"]];
                     
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
-(void)FetchData
{
    
    
    NSDictionary *parameters = @{@"task": @"getPendingUserList", @"teamid": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"] };
    
    [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
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
                 Array_Is_Admin = [[NSMutableArray alloc]init];
                 Array_Is_Admin_Value_Set = [[NSMutableArray alloc]init];
                 
                 Array_Is_Accept_Decline = [[NSMutableArray alloc] init];
                 Array_Is_Accept_Decline_Set = [[NSMutableArray alloc]init];
                 
                 Array_UserList = [[responce objectForKey:@"data"]mutableCopy];
                 
                 
                 for (int i=0 ; i< Array_UserList.count; i++)
                 {
                     [Array_Is_Admin_Value_Set addObject:@"0"];
                 }
                 
                 for (int i=0 ; i< Array_UserList.count; i++)
                 {
                     [Array_Is_Accept_Decline_Set addObject:@"0"];
                 }
                 
                 Table_Admin_New_User.dataSource = self;
                 Table_Admin_New_User.delegate = self;
                 
                 [Table_Admin_New_User reloadData];
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
    return [Array_UserList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AuthenticateNewUserCell";
    AuthenticateNewUserCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.Label_Email.text = [[Array_UserList valueForKey:@"email"] objectAtIndex:indexPath.row];
    
    
    NSString *Str_Match = [[Array_UserList valueForKey:@"email"] objectAtIndex:indexPath.row];
    
    if ([Array_Is_Admin containsObject:Str_Match])
    {
        cell.Btn_Check_Cat.selected = YES;
    }
    else
    {
        cell.Btn_Check_Cat.selected = NO;
    }
    
    if ([Array_Is_Accept_Decline containsObject:Str_Match])
    {
        cell.Btn_Seg.selectedSegmentIndex = 0;
    }
    else
    {
        cell.Btn_Seg.selectedSegmentIndex = 1;
    }
    
    
    cell.Btn_Check_Cat.tag = indexPath.row;
    [cell.Btn_Check_Cat addTarget: self action: @selector(CellButtonSelection:) forControlEvents: UIControlEventTouchUpInside];
    
    
    cell.Btn_Seg.tag = indexPath.row;
    [cell.Btn_Seg addTarget: self action: @selector(Seg_CellButtonSelection:) forControlEvents: UIControlEventValueChanged];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (void)CellButtonSelection:(UIButton *)sender
{
    CGPoint location = [sender convertPoint:CGPointZero toView:Table_Admin_New_User];
    NSIndexPath *indexPath = [Table_Admin_New_User indexPathForRowAtPoint:location];
    
    NSString *Str = [[Array_UserList valueForKey:@"email"]objectAtIndex:indexPath.row];
    
    if ([Array_Is_Admin containsObject:Str])
    {
        [Array_Is_Admin removeObject:[[Array_UserList valueForKey:@"email"]objectAtIndex:indexPath.row]];
        [Array_Is_Admin_Value_Set replaceObjectAtIndex:indexPath.row withObject:@"0"];
    }
    else
    {
        [Array_Is_Admin addObject:[[Array_UserList valueForKey:@"email"]objectAtIndex:indexPath.row]];
        [Array_Is_Admin_Value_Set replaceObjectAtIndex:indexPath.row withObject:@"1"];
    }
    
    [Table_Admin_New_User reloadData];
}


- (void)Seg_CellButtonSelection:(UIButton *)sender
{
    CGPoint location = [sender convertPoint:CGPointZero toView:Table_Admin_New_User];
    NSIndexPath *indexPath = [Table_Admin_New_User indexPathForRowAtPoint:location];
    
    NSString *Str = [[Array_UserList valueForKey:@"email"]objectAtIndex:indexPath.row];
    
    if ([Array_Is_Accept_Decline containsObject:Str])
    {
        [Array_Is_Accept_Decline removeObject:[[Array_UserList valueForKey:@"email"]objectAtIndex:indexPath.row]];
        [Array_Is_Accept_Decline_Set replaceObjectAtIndex:indexPath.row withObject:@"0"];
    }
    else
    {
        [Array_Is_Accept_Decline addObject:[[Array_UserList valueForKey:@"email"]objectAtIndex:indexPath.row]];
        [Array_Is_Accept_Decline_Set replaceObjectAtIndex:indexPath.row withObject:@"1"];
    }
    
    [Table_Admin_New_User reloadData];
}


-(void)PushBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
