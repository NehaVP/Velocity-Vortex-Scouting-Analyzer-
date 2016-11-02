//
//  BackgroundCleanupService.h  .h
//  VelocityVortex
//
//  Created by Anant Prajapati on 22/10/16.
//  Copyright © 2016 Photon Games. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface BackgroundCleanupService : NSObject

+ (BackgroundCleanupService *)getInstance;

- (void)run;

@end
