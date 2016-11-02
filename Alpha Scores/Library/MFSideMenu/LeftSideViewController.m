//
//  LeftSideViewController.m
//  Chatter
//
//  Created by Neha Parmar on 6/7/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "LeftSideViewController.h"
#import "SideMenuCell.h"

@interface LeftSideViewController ()

@end

@implementation LeftSideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BOOL Bool_Admin = [[[NSUserDefaults standardUserDefaults]objectForKey:@"Admin"]boolValue];
    
    if (Bool_Admin)
    {
        Array_List= [[NSMutableArray alloc]initWithObjects:@"Dashboard",@"New Pitt Scout",@"New Match Scout",@"Teams",@"Best Fit Team",@"Admin", @"Settings", @"About", nil];
    }
    else
    {
        Array_List= [[NSMutableArray alloc]initWithObjects:@"Dashboard",@"New Pitt Scout",@"New Match Scout",@"Teams",@"Best Fit Team", @"Settings", @"About", nil];
    }
    
    self.view.backgroundColor = [UIColor colorWithRed:21.0/255.0 green:49.0/255.0 blue:78.0/255.0 alpha:1.000];
    Table_LeftSideMenu.backgroundColor = [UIColor colorWithRed:21.0/255.0 green:49.0/255.0 blue:78.0/255.0 alpha:1.000];
}

#pragma mark - UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Array_List.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SideMenuCell";
    
    SideMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[SideMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.Label_Cate.text = [Array_List objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL Bool_Admin = [[[NSUserDefaults standardUserDefaults]objectForKey:@"Admin"]boolValue];

    if (Bool_Admin)
    {
        if (indexPath.row == 0)
        {
            DashBoardViewController *Obj_DashBoardViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_DashBoardViewController];
            navigationController.viewControllers = controllers;
        }
        else if (indexPath.row == 1)
        {
            NewPittScout *Obj_NewPittScout = [self.storyboard instantiateViewControllerWithIdentifier:@"NewPittScout"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_NewPittScout];
            navigationController.viewControllers = controllers;
        }
        else if (indexPath.row == 2)
        {
            NewMatchScout *Obj_NewMatchScout = [self.storyboard instantiateViewControllerWithIdentifier:@"NewMatchScout"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_NewMatchScout];
            navigationController.viewControllers = controllers;
        }
        else if (indexPath.row == 3)
        {
            TeamViewController *Obj_TeamViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TeamViewController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_TeamViewController];
            navigationController.viewControllers = controllers;
        }
        else if (indexPath.row == 4)
        {
            BestFitTeamViewController *Obj_BestFitTeamViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BestFitTeamViewController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_BestFitTeamViewController];
            navigationController.viewControllers = controllers;
        }
        else if (indexPath.row == 5)
        {
            AdminViewController *Obj_AdminViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AdminViewController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_AdminViewController];
            navigationController.viewControllers = controllers;
        }
        else if (indexPath.row == 6)
        {
            SettingViewController *Obj_SettingViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingViewController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_SettingViewController];
            navigationController.viewControllers = controllers;
        }
        else if (indexPath.row == 7)
        {
            SettingViewController *Obj_AboutUsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutUsViewController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_AboutUsViewController];
            navigationController.viewControllers = controllers;
        }
        else if (indexPath.row == 8)
        {
            
        }
    }
    else
    {
        if (indexPath.row == 0)
        {
            DashBoardViewController *Obj_DashBoardViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_DashBoardViewController];
            navigationController.viewControllers = controllers;
        }
        else if (indexPath.row == 1)
        {
            NewPittScout *Obj_NewPittScout = [self.storyboard instantiateViewControllerWithIdentifier:@"NewPittScout"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_NewPittScout];
            navigationController.viewControllers = controllers;
        }
        else if (indexPath.row == 2)
        {
            NewMatchScout *Obj_NewMatchScout = [self.storyboard instantiateViewControllerWithIdentifier:@"NewMatchScout"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_NewMatchScout];
            navigationController.viewControllers = controllers;
        }
        else if (indexPath.row == 3)
        {
            TeamViewController *Obj_TeamViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TeamViewController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_TeamViewController];
            navigationController.viewControllers = controllers;
        }
        else if (indexPath.row == 4)
        {
            BestFitTeamViewController *Obj_BestFitTeamViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BestFitTeamViewController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_BestFitTeamViewController];
            navigationController.viewControllers = controllers;
        }
        else if (indexPath.row == 5)
        {
            SettingViewController *Obj_SettingViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingViewController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_SettingViewController];
            navigationController.viewControllers = controllers;
        }
        else if (indexPath.row == 6)
        {
            SettingViewController *Obj_AboutUsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutUsViewController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:Obj_AboutUsViewController];
            navigationController.viewControllers = controllers;
        }

    }
    
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
