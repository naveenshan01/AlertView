//
//  AlertView.h
//  <>
//
//  Created by Naveen Shan.
//  Copyright © 2015. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertCompletionHandler)(NSInteger buttonIndex, UIAlertController *alertController);

@interface AlertView : NSObject

+ (void)showError:(NSError *)error;

+ (void)showAlert:(NSString *)alertMessage;
+ (void)showAlert:(NSString *)alertTitle message:(NSString *)alertMessage;
+ (void)showAlert:(NSString *)alertTitle message:(NSString *)alertMessage completionHandler:(AlertCompletionHandler)handler;
+ (void)showAlert:(NSString *)alertTitle message:(NSString *)alertMessage okButtonTitle:(NSString *)okButtontitle cancelButtonTitle:(NSString *)cancelButtontitle completionHandler:(AlertCompletionHandler)handler;

@end
