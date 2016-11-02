//
//  ManageTeamVIewController.m
//
//
//  Created by Neha Parmar on 8/3/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "ManageTeamVIewController.h"

@interface ManageTeamVIewController ()

@end

@implementation ManageTeamVIewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Manage Team";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationController.navigationBar.translucent = NO;


    Table_ManageTeam.dataSource = nil;
    Table_ManageTeam.delegate = nil;
    
    [self FetchList];
    
    UIBarButtonItem * item2= [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"store_back_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(PushBack)];
    item2.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=item2;
    
    
    Array_Selection = [[NSMutableArray alloc]init];
}

-(IBAction)Btn_Submit:(id)sender
{
    if (Btn_Admin.selected == NO && Btn_RemoveTeam.selected == NO)
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Select Option"];
    }
    else
    {
        if (Array_Selection.count == 0)
        {
            [ApplicationDelegate ShowAlertWithNoAction:@"Select Email Id"];
        }
        else
        {
          
            
            NSString *Str_Select;
            
            NSString *Str_email_ids = [Array_Selection componentsJoinedByString:@","];
 //           NSLog(@"=====%@",Str_email_ids);
            
            if (Btn_Admin.selected)
            {
                Str_Select = @"1";
            }
            else
            {
                Str_Select = @"0";
            }
            
            NSDictionary *parameters = @{@"task": @"manage_team", @"email_id": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"] ,@"is_adminORremove": Str_Select, @"team_number" : [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"], @"current_email_id": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"], @"email_ids":Str_email_ids  };
            NSLog(@" === parameters == %@",parameters);
            [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
             {
               NSLog(@" === RESPONSE == %@",responce);
                 if (isSuccess)
                 {
                     [ApplicationDelegate HideProgressView];
                     
                     if (responce == nil)
                     {
                         [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Massege"]];
                     }
                     else
                     {
                         Array_List = [[responce  objectForKey:@"emails"]mutableCopy];
                         
                         Table_ManageTeam.dataSource = self;
                         Table_ManageTeam.delegate = self;
                         
                         [Table_ManageTeam reloadData];
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

-(IBAction)Btn_Admin:(id)sender
{
    if (Btn_Admin.selected)
    {
        Btn_RemoveTeam.selected = NO;
         Btn_Admin.selected = NO;
    }
    else
    {
         Btn_Admin.selected = YES;
         Btn_RemoveTeam.selected = NO;
    }
}

-(IBAction)Btn_RemoveTeam:(id)sender
{
    if (Btn_RemoveTeam.selected)
    {
        Btn_Admin.selected = NO;
        Btn_RemoveTeam.selected = NO;
    }
    else
    {
        Btn_RemoveTeam.selected = YES;
        Btn_Admin.selected = NO;
    }
}

-(void)FetchList
{
  
    
    NSDictionary *parameters = @{@"task": @"List_team_member", @"team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"], @"current_email_id": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"] };
    
    [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
     {
         if (isSuccess)
         {
             [ApplicationDelegate HideProgressView];
             
             if (responce == nil)
             {
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
             }
             else
             {
                 Array_List = [[responce  objectForKey:@"emails"]mutableCopy];
                 
                 Table_ManageTeam.dataSource = self;
                 Table_ManageTeam.delegate = self;
                 
                 [Table_ManageTeam reloadData];
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
    return Array_List.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ManageTeamCell";
    ManageTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    cell.Label_Email.text = [Array_List objectAtIndex:indexPath.row];
    
    NSString *Str_Match = [Array_List objectAtIndex:indexPath.row];
    
    if ([Array_Selection containsObject:Str_Match])
    {
        cell.Btn_Check_Cat.selected = YES;
    }
    else
    {
        cell.Btn_Check_Cat.selected = NO;
    }
    
    
    cell.Btn_Check_Cat.tag = indexPath.row;
    [cell.Btn_Check_Cat addTarget: self action: @selector(CellButtonSelection:) forControlEvents: UIControlEventTouchUpInside];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)CellButtonSelection:(UIButton *)sender
{
    CGPoint location = [sender convertPoint:CGPointZero toView:Table_ManageTeam];
    NSIndexPath *indexPath = [Table_ManageTeam indexPathForRowAtPoint:location];
    
    NSString *Str = [Array_List objectAtIndex:indexPath.row];
    
    if ([Array_Selection containsObject:Str])
    {
        [Array_Selection removeObject:[Array_List objectAtIndex:indexPath.row]];
    }
    else
    {
        [Array_Selection addObject:[Array_List objectAtIndex:indexPath.row]];
    }
    
    [Table_ManageTeam reloadData];
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
