
//
//  BestFitTeamViewController.h
//
//
//  Created by Neha Parmar on 8/5/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BestFitTeamViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource, UITextFieldDelegate, UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *Array_Team_Data;
    
    IBOutlet UITableView *Table_BestTeam;
    IBOutlet UITextField *Text_Competition;
    
    UIPickerView *Picker_Filter;
    UIBarButtonItem *Bar_Done_Filter;
    UIToolbar *Tool_Bar_Filter;
    NSInteger Int_Selection_Filter;
    NSString *Str_Filter;
    
    
    NSMutableArray *Array_Details;
    NSString *Str_Competition_ID;
}

-(IBAction)Btn_Best_Hang:(id)sender;

-(IBAction)Btn_Heightst:(id)sender;

-(IBAction)Btn_Best_Auto:(id)sender;

- (IBAction)Btn_Particle_Score:(id)sender;

- (IBAction)Btn_Cap_Ball:(id)sender;

- (IBAction)Btn_Beacons:(id)sender;

- (IBAction)Btn_Corner_Ramp:(id)sender;


@end
