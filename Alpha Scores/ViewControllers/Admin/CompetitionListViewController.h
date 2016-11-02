//
//  CompetitionListViewController.h
//  VelocityVortex
//
//  Created by Sunny Nareshkumar Bamaniya on 10/1/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateCompetitiors.h"

@interface CompetitionListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
{
    IBOutlet UITableView *List_Table_View;
    
    NSMutableArray *Comp_List;
    
    NSMutableArray *Array_TeamData;
    
    NSMutableArray *Array_Data_Pass;
}

@property (nonatomic, assign) BOOL Bool_Update;

- (IBAction)Btn_Create_Competition:(id)sender;
- (IBAction)Btn_Edit:(id)sender;

@end
