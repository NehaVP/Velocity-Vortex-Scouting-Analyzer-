//
//  DashBoardViewController.m
//
//
//  Created by Neha Parmar on 7/27/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "DashBoardViewController.h"

@interface DashBoardViewController ()

@end

@implementation DashBoardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;

    
    CALayer * l = [image_border layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:10.0];
    image_border.layer.borderWidth = 3;
    image_border.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
    /*self.layer.masksToBounds = YES;
    self.img.layer.borderWidth = 5;
    self.img.layer.borderColor = [UIColor whiteColor].CGColor;*/
    
    self.title = @"Dashboard";
    
   
    
    
    Label_Team_No.text = [NSString stringWithFormat:@"WELCOME TEAM %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"]];
    Label_Team_Name.text = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"TeamName"]];
    
    
    
    UIFont *font1 = [UIFont boldSystemFontOfSize:17.0];
    NSDictionary *arialDict = [NSDictionary dictionaryWithObject: font1 forKey:NSFontAttributeName];
    NSMutableAttributedString *aAttrString1 = [[NSMutableAttributedString alloc] initWithString:@"User : " attributes: arialDict];
    
    UIFont *font2 = [UIFont systemFontOfSize:17.0];
    NSDictionary *arialDict2 = [NSDictionary dictionaryWithObject: font2 forKey:NSFontAttributeName];
    NSMutableAttributedString *aAttrString2 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"]] attributes: arialDict2];
    [aAttrString1 appendAttributedString:aAttrString2];
    
    Label_Team_Email.attributedText = aAttrString1;
    
    
    
    [self setupMenuBarButtonItems];
      [self CheckAdmin];
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


-(void)CheckAdmin
{
    NSDictionary *parameters = @{@"task": @"isUserAdmin", @"email_id": [[NSUserDefaults standardUserDefaults]objectForKey:@"TeamEmail"]};
    
    [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
     {
         if (isSuccess)
         {
             [ApplicationDelegate HideProgressView];
             
             if (responce == nil)
             {
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 [ApplicationDelegate HideProgressView];
             }
             else if ([[responce objectForKey:@"error"]isEqualToString:@"1"])
             {
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
                 [ApplicationDelegate HideProgressView];
             }
             else if ([[responce objectForKey:@"error"]isEqualToString:@"0"])
             {
                 if ([[responce objectForKey:@"USER_ROLE"] isEqualToString:@"ADMIN"])
                 {
                     [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"Admin"];
                     [[NSUserDefaults standardUserDefaults]synchronize];
                 }
                 else
                 {
                     [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"Admin"];
                     [[NSUserDefaults standardUserDefaults]synchronize];
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


@end
