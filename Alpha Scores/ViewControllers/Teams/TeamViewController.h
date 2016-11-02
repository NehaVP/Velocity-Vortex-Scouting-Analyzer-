//
//  TeamViewController.h
//
//
//  Created by Neha Parmar on 8/5/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReportViewController.h"

@interface TeamViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource, UITextFieldDelegate, UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate>
{
    IBOutlet UITextField *Text_Filter;
    NSMutableArray *Array_TeamData;
    
    
    NSMutableArray *Array_Details;
    
    UIPickerView *Picker_Filter;
    UIBarButtonItem *Bar_Done_Filter;
    UIToolbar *Tool_Bar_Filter;
    NSInteger Int_Selection_Filter;
    NSString *Str_Filter;
    
    IBOutlet UIButton *Btn_ZANK;
    
    IBOutlet UITableView *Table_TeamView;
    
    NSMutableArray *  Array_id;
    NSMutableArray *Array_Data_Pass;
    NSString *Str_Competition_ID;
    
}

-(IBAction)Btn_ZANK:(id)sender;

-(IBAction)Btn_Submit:(id)sender;

@end
