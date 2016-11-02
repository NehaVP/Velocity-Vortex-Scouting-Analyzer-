//
//  BlueLabelHeight.m
//
//
//  Created by Neha Parmar on 8/1/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "BlueLabelHeight.h"

@implementation BlueLabelHeight

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.textColor = BlueColor;
    }
    return self;
}

-(void)setChooseFont:(NSInteger)chooseFont
{
    _chooseFont = chooseFont;
    CGFloat fontIs = self.font.pointSize;
    fontIs += fontSizeForIncreaseLimit;
    switch (chooseFont)
    {
        case 0:
            self.font = [UIFont systemFontOfSize:fontIs];
            break;
        case 1:
            self.font = [UIFont boldSystemFontOfSize:fontIs];
            break;
        default:
            break;
    }
}


@end
