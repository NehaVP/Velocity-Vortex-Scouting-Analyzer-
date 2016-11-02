//
//  ViewController.m
//
//
//  Created by Neha Parmar on 7/27/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   // Text_Email.layer.borderColor=[[UIColor greenColor] CGColor];
   // Text_Team.layer.borderColor=[[UIColor greenColor]CGColor];
    
    self.navigationController.navigationBar.translucent = NO;

    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 2;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, Text_Email.frame.size.height - borderWidth, Text_Email.frame.size.width, Text_Email.frame.size.height);
    border.borderWidth = borderWidth;
    [Text_Email.layer addSublayer:border];
    Text_Email.layer.masksToBounds = YES;


 //   Text_Email.text = @"testmagento111@gmail.com";
  //  Text_Team.text = @"1012";
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}
//- (void)textFieldDidBeginEditing:(UITextField *)textField {
    //textField.layer.borderColor=[[UIColor cyanColor] CGColor];}

-(IBAction)Btn_Register:(id)sender
{
   /* LeftSideViewController *leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftSideViewController"];
    
    DashBoardViewController *contentIn = [self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
    MFSideMenuContainerViewController *container = [MFSideMenuContainerViewController
                                                    containerWithCenterViewController:[[UINavigationController alloc] initWithRootViewController:contentIn]
                                                    leftMenuViewController:leftMenuViewController
                                                    rightMenuViewController:nil];
    container.shadow.enabled = NO;
    [self.navigationController pushViewController:container animated:YES]; */
    
    
    if ([Text_Email.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Enter Email Address"];
    }
    else if ([Text_Team.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Enter Team Number"];
    }
    else
    {
        
        BOOL Bool_EmailCheck = [ApplicationDelegate NSStringIsValidEmail:Text_Email.text];
        
        if (Bool_EmailCheck)
        {
            NSDictionary *parameters = @{@"task": @"register_user", @"email": Text_Email.text , @"no": Text_Team.text};
            
            [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
             {
           //      NSLog(@" === RESPONSE === %@",responce);
                 if (isSuccess)
                 {
                     [ApplicationDelegate HideProgressView];
                     
                     if (responce == nil)
                     {
                         [self performSegueWithIdentifier:@"CreateTeamViewController" sender:nil];
                     }
                     else if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
                     {
                         if ([[responce objectForKey:@"status"]isEqualToString:@"request approved"])
                         {
                             [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"UserLogin"];
                             
                             if ([[responce objectForKey:@"is_admin"] isEqualToString:@"1"])
                             {
                                 [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"Admin"];
                             }
                             
                             
                             [[NSUserDefaults standardUserDefaults]setObject:Text_Email.text forKey:@"TeamEmail"];
                             [[NSUserDefaults standardUserDefaults]setObject:Text_Team.text forKey:@"TeamNumber"];
                             [[NSUserDefaults standardUserDefaults]setObject:[responce objectForKey:@"team_name"] forKey:@"TeamName"];
                             [[NSUserDefaults standardUserDefaults]synchronize];
                             
                             self.navigationController.navigationBar.hidden = YES;
                             
                             
                             LeftSideViewController *leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftSideViewController"];
                             
                             DashBoardViewController *contentIn = [self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
                             MFSideMenuContainerViewController *container = [MFSideMenuContainerViewController
                                                                             containerWithCenterViewController:[[UINavigationController alloc] initWithRootViewController:contentIn]
                                                                             leftMenuViewController:leftMenuViewController
                                                                             rightMenuViewController:nil];
                             container.shadow.enabled = NO;
                             [self.navigationController pushViewController:container animated:YES];
                         }
                         else
                         {
                             [self performSegueWithIdentifier:@"CreateTeamViewController" sender:nil];
                         }
                     }
                     else
                     {
                         [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"Pending"];
                         [[NSUserDefaults standardUserDefaults]setObject:Text_Email.text forKey:@"TeamEmail"];
                         [[NSUserDefaults standardUserDefaults]setObject:Text_Team.text forKey:@"TeamNumber"];
                         [[NSUserDefaults standardUserDefaults]synchronize];
                         
                         WelcomeViewController *leftMenuViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WelcomeViewController"];
                         ApplicationDelegate.window.rootViewController=[[UINavigationController alloc]initWithRootViewController:leftMenuViewController];
                     }
                 }
                 else
                 {
                     [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                     [ApplicationDelegate HideProgressView];
                 }
             }];
        }
        else
        {
            [ApplicationDelegate ShowAlertWithNoAction:@"Invalid Email Address"];
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"CreateTeamViewController"])
    {
        // Get reference to the destination view controller
        CreateTeamViewController *Obj_CreateTeamViewController = [segue destinationViewController];
        Obj_CreateTeamViewController.Str_Email = Text_Email.text;
        Obj_CreateTeamViewController.Str_Number =  Text_Team.text;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
