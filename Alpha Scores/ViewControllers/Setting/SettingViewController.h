//
//  SettingViewController.h
//
//
//  Created by Neha Parmar on 8/3/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITextField *Text_Email;
    IBOutlet UITableView *Table_Setting;
    
    NSMutableArray *Array_List;
}

-(IBAction)Btn_LeaveTeam:(id)sender;

@end
