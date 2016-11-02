//
//  CompetitionListViewController.m
//  VelocityVortex
//
//  Created by Sunny Nareshkumar Bamaniya on 10/1/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "CompetitionListViewController.h"

@interface CompetitionListViewController ()

@end

@implementation CompetitionListViewController
@synthesize Bool_Update;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationController.navigationBar.translucent = NO;

    
    self.title = @"Competition List";
    
    List_Table_View.dataSource = nil;
    List_Table_View.delegate = nil;
    
 //   NSLog(@"==========viewDidLoad@");
    
    [self FetchList];
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
	//	NSLog(@"==========viewDidAppear@");
     [self FetchList];
}

-(void)viewWillAppear:(BOOL)animated{
	//	NSLog(@"==========viewWillAppear@");
}

-(void)FetchList
{
    //http://scoutinganalyzer.com/VelocityVortex/mobileapp/index.php?task=getCompetitionList&email=testmagento111@gmail.com
    
    // http://scoutinganalyzer.com/VelocityVortex/mobileapp/index.php?task=getCompetitionData&entered_by_team_number=1012
    
    NSDictionary *parameters = @{@"task": @"getCompetitionData", @"entered_by_team_number":[[NSUserDefaults standardUserDefaults]objectForKey:@"TeamNumber"] };
    
    [ApplicationDelegate WebServiceName:[NSString stringWithFormat:@"%@",ApplicationDelegate.Main_URL] params:parameters completedOn:^(BOOL isSuccess, NSDictionary *responce)
     {
         if (isSuccess)
         {
             [ApplicationDelegate HideProgressView];
             
             if (responce == nil)
             {
                 [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
             }
             else
             {
                 Comp_List = [responce objectForKey:@"competition_name"];
                 
                 List_Table_View.dataSource = self;
                 List_Table_View.delegate = self;
                 [List_Table_View reloadData];
             }
         }
         else
         {
             [ApplicationDelegate ShowAlertWithNoAction:@"Something went wrong, please try again"];
             [ApplicationDelegate HideProgressView];
         }
     }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Comp_List.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"CompetitionListCell";
    CompetitionListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    cell.Comp_Status.text = [[Comp_List valueForKey:@"status"]objectAtIndex:indexPath.row];
    if ( [cell.Comp_Status.text isEqualToString:@"Not Active"])
    {
        
        [cell.Comp_Status setTextColor:[UIColor redColor]];
        [cell.Comp_Status setText:@"D"];
        
        
    }
    else
    {
        
        [cell.Comp_Status setTextColor:[UIColor greenColor]];
        [cell.Comp_Status setText:@"A"];
        
        
    }
    
    cell.Comp_Name.text= [[Comp_List valueForKey:@"competition_name"]objectAtIndex:indexPath.row];
 //   cell.Comp_Team_no.text = [[Comp_List valueForKey:@"entered_by_team_number"]objectAtIndex:indexPath.row];
 //   cell.Comp_no.text = [[Comp_List valueForKey:@"comp_id"]objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setLayoutMargins:UIEdgeInsetsZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Btn_Create_Competition:(id)sender{
    Bool_Update = NO;
 	//NSLog(@"The Btn_Create_Competition result is - %@",Bool_Update ? @"YES":@"NO");
}

- (IBAction)Btn_Edit:(id)sender{
    
    CGPoint location = [sender convertPoint:CGPointZero toView:List_Table_View];
    
    NSIndexPath *indexPath = [List_Table_View indexPathForRowAtPoint:location];
    Array_Data_Pass = [Comp_List objectAtIndex:indexPath.row];
    Bool_Update = YES;
    
    [self performSegueWithIdentifier:@"CreateCompetitiors" sender:nil];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   
   // NSLog(@"prepareForSegue%@___",Bool_Update ? @"Yes" : @"No");
    if ([[segue identifier] isEqualToString:@"CreateCompetitiors"])
    {
        if(Bool_Update){
        	CreateCompetitiors *Obj_comp = [segue destinationViewController];
        	Obj_comp.Comp_List = Array_Data_Pass ;
        	Obj_comp.Bool_Update = YES;
     //   	NSLog(@"dataARAY%@",Array_Data_Pass);
        }
        
        
    }
}

@end
