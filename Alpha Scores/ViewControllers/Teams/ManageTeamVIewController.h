//
//  ManageTeamVIewController.h
//
//
//  Created by Neha Parmar on 8/3/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageTeamVIewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *Table_ManageTeam;

    IBOutlet UIButton *Btn_Admin;
    IBOutlet UIButton *Btn_RemoveTeam;
    
     NSMutableArray *Array_List;
    NSMutableArray *Array_Selection;
}

-(IBAction)Btn_Submit:(id)sender;

-(IBAction)Btn_Admin:(id)sender;

-(IBAction)Btn_RemoveTeam:(id)sender;

@end
