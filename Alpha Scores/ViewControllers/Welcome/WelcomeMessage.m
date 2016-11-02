//
//  WelcomeMessage.m
//
//
//  Created by Neha Parmar on 8/4/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "WelcomeMessage.h"

@interface WelcomeMessage ()

@end

@implementation WelcomeMessage

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval: 5.0
                                                  target: self
                                                selector:@selector(ShowDashBoard)
                                                userInfo: nil repeats:NO];
    
    self.navigationController.navigationBar.translucent = NO;

}

-(void)ShowDashBoard
{
    LeftSideViewController *leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftSideViewController"];
    
    DashBoardViewController *contentIn = [self.storyboard instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
    MFSideMenuContainerViewController *container = [MFSideMenuContainerViewController
                                                    containerWithCenterViewController:[[UINavigationController alloc] initWithRootViewController:contentIn]
                                                    leftMenuViewController:leftMenuViewController
                                                    rightMenuViewController:nil];
    container.shadow.enabled = NO;
    [self.navigationController pushViewController:container animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
