//
//  BlueTextField.m
//
//
//  Created by Neha Parmar on 8/1/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import "BlueTextField.h"

@implementation BlueTextField

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.layer.cornerRadius = 8.0f;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = [[UIColor colorWithRed:64.0/255.0 green:143.0/255.0 blue:247.0/255.0 alpha:1.0]CGColor];
        self.layer.borderWidth = 1.0f;
        self.textColor = BlueColor;
        
        UIView *View_FirstName = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
        self.leftView = View_FirstName;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    if ([self respondsToSelector:@selector(setAttributedPlaceholder:)])
    {
        UIColor *color = BlueColor;
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    }
    else
    {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
        // TODO: Add fall-back code to set placeholder color.
    }
}

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = 8.0f;
    self.layer.masksToBounds = YES;
    
    self.layer.backgroundColor =[[UIColor colorWithRed:105.0/255.0
                                                 green:220.0/255.0
                                                  blue:162.0/255.0
                                                 alpha:1.0] CGColor];
    self.layer.borderWidth= 1.0f;
    
    UIView *View_FirstName = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    self.leftView = View_FirstName;
    self.leftViewMode = UITextFieldViewModeAlways;
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
        default:
            break;
    }
}

-(void)setLeftImage:(UIImage *)leftImage
{
    _leftImage = leftImage;
    [self setLeftViewMode:UITextFieldViewModeAlways];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 17, self.frame.size.height)];
    UIImageView *imgvw = [[UIImageView alloc]initWithFrame:CGRectMake(0, 8, 13, 13)];
    imgvw.image = leftImage;
    [paddingView addSubview:imgvw];
    self.leftView = paddingView;
    
   /* self.placeHolderPad = self.leftView.frame.origin.x+self.leftView.frame.size.width;
    CGRect changeframe = self.placeholderLabel.frame;
    changeframe.origin.x = self.placeHolderPad;
    self.placeholderLabel.frame = changeframe;*/
}

-(CGRect)rectForBorder:(CGFloat)thickness isFill:( BOOL)isFill
{
    return CGRectMake(0, CGRectGetHeight(self.frame)-thickness, CGRectGetWidth(self.frame), thickness);
}



@end
