//
//  BackgroundCleanupService.m
//  VelocityVortex
//
//  Created by Anant Prajapati on 22/10/16.
//  Copyright © 2016 Photon Games. All rights reserved.
//

#import "BackgroundCleanupService.h"

@interface BackgroundCleanupService ()
@end


@implementation BackgroundCleanupService

/*
 * The singleton instance. To get an instance, use
 * the getInstance function.
 */
static BackgroundCleanupService *instance = NULL;

/**
 * Singleton instance.
 */

+ (BackgroundCleanupService *)getInstance {
    
    NSLog(@"  ========= RUNNING BACKGROUND ========= @");
    @synchronized(self) {
        if (instance == NULL) {
            instance = [[self alloc] init];
        }
    }
    return instance;
}

- (void)run {
    
   
}

@end
