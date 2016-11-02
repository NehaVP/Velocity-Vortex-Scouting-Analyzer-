//
//  AppDelegate.m
//
//
//  Created by Neha Parmar on 7/27/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize Main_URL;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //http://scoutinganalyzer.com/VelocityVortex/mobileapp/index.php
    
    Main_URL = @"http://scoutinganalyzer.com/VelocityVortex/mobileapp/index.php";

    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithRed:21.0/255.0 green:49.0/255.0 blue:78.0/255.0 alpha:1.000]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:21.0/255.0 green:49.0/255.0 blue:78.0/255.0 alpha:1.000]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
//    [[UINavigationBar appearance]setTranslucent:YES];
    
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"UserLogin"])
    {
        LeftSideViewController *leftMenuViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LeftSideViewController"];
        DashBoardViewController *contentIn = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DashBoardViewController"];
        MFSideMenuContainerViewController *container = [MFSideMenuContainerViewController
                                                        containerWithCenterViewController:[[UINavigationController alloc] initWithRootViewController:contentIn]
                                                        leftMenuViewController:leftMenuViewController
                                                        rightMenuViewController:nil];
        container.shadow.enabled = NO;
        self.window.rootViewController=container;
    }
    else if ([[NSUserDefaults standardUserDefaults]objectForKey:@"Pending"])
    {
        WelcomeViewController *leftMenuViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WelcomeViewController"];
        ApplicationDelegate.window.rootViewController=[[UINavigationController alloc]initWithRootViewController:leftMenuViewController];
    }
    
    return YES;
}

-(void)WebServiceName:(NSString *)serviceName params:(NSDictionary *)parameters completedOn:(myCompletion)block
{
    [ApplicationDelegate ShowProgressView];
    
    [ApplicationDelegate CheckReachability:^(BOOL internet)
     {
         if (internet)
         {
             AFHTTPClient *client= [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:@"http://------"]];
             
             NSMutableURLRequest *request = [client multipartFormRequestWithMethod:@"POST" path:[NSString stringWithFormat:@"%@",serviceName] parameters:parameters constructingBodyWithBlock: ^(id <AFMultipartFormData>formData)
                                             {
                                                 
                                             }];
             //HTTP Basic Authentication
             
             AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
             
             [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
              {
                  NSDictionary *jsons = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
                  block(true,jsons);
              }
                                              failure:^(AFHTTPRequestOperation *operation, NSError *error)
              {
                  [self HideProgressView];
                  
                  if([operation.response statusCode] == 403)
                  {
                      NSLog(@"Error While calling Webservice for %@",serviceName);
                  }
                  
                  if ([operation.response statusCode] == 500)
                  {
           //           NSLog(@" %@",error);
                      [self ShowAlertWithNoAction:@"Internal server error please try again"];
                  }
                  
                  if ([operation.response statusCode] == 1011)
                  {
           //           NSLog(@" %@",error);
                  }
              }];
             
             [operation start];
         }
         else
         {
             NSDictionary *Offline_Dict = [NSDictionary dictionaryWithObject: @"OfflineApp" forKey: @"OfflineApp"];
             block(false,Offline_Dict);
         }
     }];
}

-(void)ShowAlertWithNoAction:(NSString *)Message
{
    UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:nil  message:Message  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"ok"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   
                               }];
    
    [alertController addAction:okAction];
    [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
}

- (void)CheckReachability:(connection)block
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSURL *url = [NSURL URLWithString:@"http://www.google.com/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"HEAD";
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    request.timeoutInterval = 60.0;
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:
     ^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
         block([(NSHTTPURLResponse *)response statusCode] == 200);
     }];
}

-(void)ShowProgressView
{
    [ProgressHUD show:nil Interaction:NO];
}

-(void)HideProgressView
{
    [ProgressHUD dismiss];
}

-(BOOL)NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
