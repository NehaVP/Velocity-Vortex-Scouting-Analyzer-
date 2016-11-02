//
//  AutheticateNewUser.h
//
//
//  Created by Neha Parmar on 7/28/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutheticateNewUser : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *Table_Admin_New_User;
    
    NSMutableArray *Array_UserList;
    
    
    NSMutableArray *Array_Is_Admin;
    NSMutableArray *Array_Is_Admin_Value_Set;
    
    NSMutableArray *Array_Is_Accept_Decline;
    NSMutableArray *Array_Is_Accept_Decline_Set;
}

-(IBAction)Btn_Submit:(id)sender;

@end
