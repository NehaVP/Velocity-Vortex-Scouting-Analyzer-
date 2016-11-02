//
//  LabelHeight.m
//  AlphaScore
//
//  Created by Neha Parmar on 7/26/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "LabelHeight.h"

@implementation LabelHeight

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 
- (void)drawRect:(CGRect)rect
 {
    // Drawing code
}
*/

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
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
