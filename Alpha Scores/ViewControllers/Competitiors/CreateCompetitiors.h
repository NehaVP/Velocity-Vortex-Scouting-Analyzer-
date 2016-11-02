//
//  CreateCompetitiors.h
//
//
//  Created by Neha Parmar on 7/27/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompetitionListCell.h"

@interface CreateCompetitiors : UIViewController <UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
  
  
   
    
    IBOutlet UILabel *CompTitle;
    
    IBOutlet UIButton *Btn_Acitve_Competitiors;
    IBOutlet FloatEffect *Text_CompetitionName;
    IBOutlet FloatEffect *Text_StartDate;
    IBOutlet FloatEffect *Text_EndDate;
    
    //  UIPickerView *Picker_Filter;
    UIDatePicker *Picker_Start_Date;
    UIDatePicker *Picker_End_Date;
    
    //for status picker
    NSArray *Status;
    NSString *StrStatus;
    UIPickerView *PickerStatus;
    IBOutlet UITextField *statusText;
    UIToolbar *Tool_Bar_Filter;
    UIBarButtonItem *Bar_Done_Filter;

    
}

@property (nonatomic, assign) BOOL Bool_Update;

@property(nonatomic,strong)NSMutableArray *Comp_List;
//@property (strong, nonatomic) IBOutlet UIPickerView *PickerStatus;

-(IBAction)Btn_Active:(id)sender;
//-(IBAction)Btn_Admin:(id)sender;
@end
