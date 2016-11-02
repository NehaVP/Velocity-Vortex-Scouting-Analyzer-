//
//  WelcomeViewController.m
//
//
//  Created by Neha Parmar on 8/3/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "WelcomeViewController.h"
#import "WelcomeMessage.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    Timer = [NSTimer scheduledTimerWithTimeInterval: 20.0
                                                  target: self
                                                selector:@selector(CheckStatus)
                                                userInfo: nil repeats:YES];
    
    self.navigationController.navigationBar.hidden = YES;
    
    self.navigationController.navigationBar.translucent = NO;

}

-(void)CheckStatus
{
    
    
    NSDictionary *parameters = @{@"task": @"checkUserStatus", @"email": [[NSUserDefaults standardUserDefaults] objectForKey:@"TeamEmail"] , @"team_id": [[NSUserDefaults standardUserDefaults] objectForKey:@"TeamNumber"]};
    
    [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
     {
         if (isSuccess)
         {
             [ApplicationDelegate HideProgressView];
             
             if (responce == nil)
             {
                 [self performSegueWithIdentifier:@"CreateTeamViewController" sender:nil];
             }
             else if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
             {
         
             }
             else if ([[responce objectForKey:@"error"]isEqualToString:@"0"])
             {
                 [Timer invalidate];
                 Timer = nil;
                 
                 [[NSUserDefaults standardUserDefaults]setObject:[responce objectForKey:@"team_name"] forKey:@"TeamName"];
                 [[NSUserDefaults standardUserDefaults]synchronize];
                 
                 [self Task];
             }
         }
         else
         {
             [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
             [ApplicationDelegate HideProgressView];
         }
     }];
}

-(void)Task
{
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"UserLogin"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    WelcomeMessage *Obj_WelcomeMessage = [self.storyboard instantiateViewControllerWithIdentifier:@"WelcomeMessage"];
    [self.navigationController pushViewController:Obj_WelcomeMessage animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
