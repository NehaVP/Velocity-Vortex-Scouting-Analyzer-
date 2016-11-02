//
//  NewPittScout.m
//
//
//  Created by Neha Parmar on 7/27/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "NewPittScout.h"

@interface NewPittScout ()

@end

@implementation NewPittScout
@synthesize Bool_Update,Dict_NewPitScoutt;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title =  @"Pitt Scouting";
    
    
    self.navigationController.navigationBar.translucent = NO;

    
    [self setupMenuBarButtonItems];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    
    if (Bool_Update)
    {
        if ([[segue identifier] isEqualToString:@"NewPitScoutContainer"])
        {
            // Get reference to the destination view controller
            NewPitScoutContainer *Obj_NewPitScoutContainer = [segue destinationViewController];
            Obj_NewPitScoutContainer.Dict_NewPitScoutContainer = Dict_NewPitScoutt;
            Obj_NewPitScoutContainer.Bool_Update = YES;
        }
    }
    // Pass the selected object to the new view controller.
 
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
