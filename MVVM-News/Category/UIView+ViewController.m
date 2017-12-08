//
//  UIView+ViewController.m
//  MVVM-News
//
//  Created by 未思语 on 06/12/2017.
//  Copyright © 2017 wsy. All rights reserved.
//  

#import "UIView+ViewController.h"

@implementation UIView (ViewController)
- (UIViewController *)viewcontroller {
    //通过查找uiview的nextresponder
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    } while (responder != nil);
    return nil;
    
}
@end
