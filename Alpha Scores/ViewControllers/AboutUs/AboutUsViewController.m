//
//  DashBoardViewController.m
//
//
//  Created by Neha Parmar on 7/27/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()
@property (strong, nonatomic) IBOutlet UILabel *website_link1;

@property (strong, nonatomic) IBOutlet UILabel *website_link2;
@end

@implementation AboutUsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    [self setupMenuBarButtonItems];
 //   NSString *link = _website_link2.text;
    UITapGestureRecognizer *tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Prof_lbl_Pressed:)];//your action selector
    [tap setNumberOfTapsRequired:1];
    _website_link1.userInteractionEnabled= YES;
    [_website_link1 addGestureRecognizer:tap];
    
    UITapGestureRecognizer *tap1= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Prof_lbl_Pressed:)];//your action selector
    [tap1 setNumberOfTapsRequired:1];
    _website_link2.userInteractionEnabled= YES;
    [_website_link2 addGestureRecognizer:tap1];

    
    
}

- (void)Prof_lbl_Pressed:(UIGestureRecognizer *)sender
{
    
    UILabel *view = (UILabel*)sender.view;
    NSString *link = view.text;
 //   NSLog(@"%@",link);
   // NSString *searchString = textfiled.text; // UItextField.text
    NSString *finalString = [NSString stringWithFormat:@"%@",link];
    
   [[UIApplication sharedApplication]openURL:[NSURL URLWithString:finalString]];

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
