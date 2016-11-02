//
//  BGAppRefreshAppDelegate.m
//  VelocityVortex
//
//  Created by Anant Prajapati on 22/10/16.
//  Copyright © 2016 Photon Games. All rights reserved.
//

#import "BGAppRefreshAppDelegate.h"

@implementation BGAppRefreshAppDelegate

-(void)               application:(UIApplication *)application
performFetchWithCompletionHandler:
(void (^)(UIBackgroundFetchResult))completionHandler {
    
    NSLog(@"Background fetch started...");
    
    //---do background fetch here---
    // You have up to 30 seconds to perform the fetch
    
    BOOL downloadSuccessful = YES;
    
    if (downloadSuccessful) {
        //---set the flag that data is successfully downloaded---
        completionHandler(UIBackgroundFetchResultNewData);
    } else {
        //---set the flag that download is not successful---
        completionHandler(UIBackgroundFetchResultFailed);
    }
    
    NSLog(@"Background fetch completed...");
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication]
     setMinimumBackgroundFetchInterval:
     UIApplicationBackgroundFetchIntervalMinimum];
    
    // Override point for customization after application launch.
    return YES;
}

@end
