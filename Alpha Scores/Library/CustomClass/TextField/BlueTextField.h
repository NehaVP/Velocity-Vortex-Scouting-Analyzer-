//
//  BlueTextField.h
//
//
//  Created by Neha Parmar on 8/1/16.
//  Copyright © 2016 Neha Parmar. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface BlueTextField : UITextField <UITextFieldDelegate>

@property(strong,nonatomic)UILabel *placeholderLabel;
@property(strong,nonatomic)CALayer *inactiveBorderLayer;
@property(strong,nonatomic)UIImage *leftImage;
@property(nonatomic)CGFloat placeHolderPad;

@property(nonatomic)BOOL activeT;
@property (nonatomic) IBInspectable NSInteger chooseFont;


@end
