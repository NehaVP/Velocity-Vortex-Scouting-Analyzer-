//
//  SettingViewController.m
//
//
//  Created by Neha Parmar on 8/3/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "SettingViewController.h"
#import "ViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Settings";
    
    self.navigationController.navigationBar.translucent = NO;

    
    Table_Setting.dataSource = nil;
    Table_Setting.delegate = nil;
    
    Text_Email.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"];
    
    [self setupMenuBarButtonItems];
    [self FetchList];
}

-(void)FetchList
{
    
    NSDictionary *parameters = @{@"task": @"List_team_member", @"team_number": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"] };
    
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
                 if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:[responce objectForKey:@"Message"]];
                 }
                 else
                 {
                     Array_List = [[responce objectForKey:@"emails"] mutableCopy];
                     
                     Table_Setting.dataSource = self;
                     Table_Setting.delegate = self;
                     
                     [Table_Setting reloadData];
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

-(IBAction)Btn_LeaveTeam:(id)sender
{
    [self ShowAlertWithNoAction:@"Are you sure, You want to leave the team"];
}

-(void)ShowAlertWithNoAction:(NSString *)Message
{
    UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:nil  message:Message  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *Yes_Action = [UIAlertAction
                               actionWithTitle:@"Yes"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   [self LogOut];
                               }];
    
    [alertController addAction:Yes_Action];
    
    UIAlertAction *No_Action = [UIAlertAction
                                 actionWithTitle:@"No"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction *action)
                                 {
                                 }];
    
    [alertController addAction:No_Action];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


-(void)LogOut
{
    
    NSDictionary *parameters = @{@"task": @"leave_team", @"email_id": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"] };
    
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
                 if ([[responce objectForKey:@"error"] isEqualToString:@"0"])
                 {
                     [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"UserLogin"];
                     [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"Admin"];
                     [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"TeamName"];
                     [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"TeamEmail"];
                     [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"TeamNumber"];
                     [[NSUserDefaults standardUserDefaults]synchronize];
                     
                     ViewController *leftMenuViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
                     ApplicationDelegate.window.rootViewController=[[UINavigationController alloc]initWithRootViewController:leftMenuViewController];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Array_List.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SettingTableViewCell";
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    
    cell.Label_Email.text = [Array_List objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
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
