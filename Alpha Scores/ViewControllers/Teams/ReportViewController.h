//
//  ReportViewController.h
//
//
//  Created by Neha Parmar on 8/5/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BestFitTeamViewController.h"
#import "NewMatchScout.h"
@interface ReportViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>
{
    IBOutlet UITextField *Text_Number;
    IBOutlet UITextField *Text_Name;
   
    IBOutlet UITextField *Match_Number;
    
    IBOutlet UITextField *Text_Competiton_Name;
    IBOutlet UITextField *Text_Match_Won;
    IBOutlet UITextField *Text_Match_Lost;
    
    NSArray *static_data;
    NSMutableArray *Array_ReportData;
    
    IBOutlet UITableView *Table_Report;
    
    NSDictionary *Dict_Pass;
    
    IBOutlet UILabel *lbl_match_number;
    UIAlertController *alertController;
    
    NSMutableArray *Array_Picker_Match_Number;
    UIPickerView *Picker_Business_Cate;
    UIBarButtonItem *Bar_Done_Business_Cate;
    UIToolbar *Tool_Bar_Business_Cate;
    NSInteger Int_Selection_Business_Cate;
    NSString *Str_Business_Id;
}

-(IBAction)Btn_Pit_Scout:(id)sender;
-(IBAction)Btn_Match_Scout:(id)sender;

@property(nonatomic,strong)NSMutableArray *Array_TeamData;
@property(nonatomic,strong)NSMutableArray *Array_Details;
@property(nonatomic,strong)NSDictionary *dictionary;
@property(nonatomic,strong)NSString *Str_Comepetition_Name;

@property(nonatomic,strong)NSString *Str_Competition_ID;


@end
