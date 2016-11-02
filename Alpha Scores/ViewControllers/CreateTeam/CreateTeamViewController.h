//
//  CreateTeamViewController.h
//
//
//  Created by Neha Parmar on 7/27/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateTeamViewController : UIViewController
{
    IBOutlet UIButton *Btn_Create;
    
    IBOutlet FloatEffect *Text_Team;
    IBOutlet FloatEffect *Text_Team_Name;
    IBOutlet FloatEffect *Text_Email;
}

@property(nonatomic,strong)NSString *Str_Email;
@property(nonatomic,strong)NSString *Str_Number;

-(IBAction)Btn_Create:(id)sender;

@end
