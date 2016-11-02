//
//  CreateTeamViewController.m
//
//
//  Created by Neha Parmar on 7/27/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "CreateTeamViewController.h"

@interface CreateTeamViewController ()

@end

@implementation CreateTeamViewController
@synthesize Str_Email,Str_Number;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;

    
    self.title = @"Create Team";
    
    Text_Email.text = Str_Email;
    Text_Team.text = Str_Number;
    
    Text_Email.layer.borderColor=[[UIColor greenColor] CGColor];
    Text_Team.layer.borderColor=[[UIColor greenColor]CGColor];
    Text_Team_Name.layer.borderColor=[[UIColor greenColor]CGColor];
    
    UIBarButtonItem * item2= [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"store_back_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(PushBack)];
    item2.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=item2;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = NO;
}

-(IBAction)Btn_Create:(id)sender
{
    if ([Text_Team.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Enter Team"];
    }
    else if ([Text_Team_Name.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Enter Team Name"];
    }
    else if ([Text_Email.text isEqualToString:@""])
    {
        [ApplicationDelegate ShowAlertWithNoAction:@"Enter Email"];
    }
    else
    {
        BOOL Bool_EmailCheck = [ApplicationDelegate NSStringIsValidEmail:Text_Email.text];
        
        if (Bool_EmailCheck)
        {
          
            
            NSDictionary *parameters = @{@"task": @"insertdata", @"email": Text_Email.text , @"no": Text_Team.text, @"name": Text_Team_Name.text};
            
            [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
             {
                 if (isSuccess)
                 {
                     [ApplicationDelegate HideProgressView];
                     
                     if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
                     {
                         [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                     }
                     else
                     {
                         [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"UserLogin"];
                         [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"Admin"];

                         [[NSUserDefaults standardUserDefaults]setObject:Str_Email forKey:@"TeamEmail"];
                         [[NSUserDefaults standardUserDefaults]setObject:Str_Number forKey:@"TeamNumber"];
                         [[NSUserDefaults standardUserDefaults]setObject:Text_Team_Name.text forKey:@"TeamName"];
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

-(void)viewDidLayoutSubviews
{
    if (self.view.frame.size.height == 480)
    {
        Btn_Create.frame = CGRectMake(40, 430, 240, 40);
    }
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
