//
//  NewMatchScout.h
//
//
//  Created by Neha Parmar on 7/27/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewMatchScout : UIViewController
{
    IBOutlet UISegmentedControl *Main_Segment;
    
    //IBOutlet FloatEffect *Text_Match_Scout_Match;
    IBOutlet UITextField *Text_Match_Scout_Match;
    IBOutlet RedTextField *Text_Red_Alliance_Score;
    IBOutlet BlueTextField *Text_Blue_Alliance_Score;
}

@property (nonatomic, assign) BOOL Bool_Update;
@property(nonatomic,strong)NSDictionary *Dict_NewMatScoutt;


-(IBAction)Btn_Submit:(id)sender;


@end
