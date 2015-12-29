//
//  AlertView.swift
//  <>
//
//  Created by Naveen Shan.
//  Copyright © 2015. All rights reserved.
//

import UIKit

public class AlertView: NSObject {

    public typealias AlertCompletionHandler = (buttonIndex: NSInteger, alertController: UIAlertController)->Void
    
    //MARK:- Type methods
    
    private class func presentationContorller() -> UIViewController? {
        var topViewContorller = UIApplication.sharedApplication().keyWindow?.rootViewController
        if(topViewContorller == nil) {
            topViewContorller = UIApplication.sharedApplication().windows.first?.rootViewController
        }
        let presentationContorller = topViewContorller!;
        if presentationContorller.isKindOfClass(UIViewController) {
            if presentationContorller.isKindOfClass(UITabBarController) {
                let tabBarController = presentationContorller as? UITabBarController
                topViewContorller = tabBarController!.selectedViewController
            } else if presentationContorller.isKindOfClass(UINavigationController) {
                let navigationController = presentationContorller as? UINavigationController
                topViewContorller = navigationController!.topViewController
            }
        } else {
            if (presentationContorller.presentedViewController != nil) {
                topViewContorller = presentationContorller.presentedViewController;
            }
        }
    
        return topViewContorller;
    }
    
    //MARK:- Type methods
    
    public class func showAlert(alertMessage: String) {
        AlertView.showAlert("", message: alertMessage, completionHandler: nil)
    }
    
    public class func showError(error: NSError) {
        AlertView.showAlert(NSLocalizedString("Error", comment: ""), message: error.localizedDescription, completionHandler: nil)
    }
    
    public class func showAlert(alertTitle: String, message alertMessage: String) {
        AlertView.showAlert(alertTitle, message: alertMessage, completionHandler: nil)
    }
    
    public class func showAlert(alertTitle: String, message alertMessage: String, completionHandler: AlertCompletionHandler?) {
        AlertView.showAlert(alertTitle, message: alertMessage, okButtonTitle: NSLocalizedString("OK", comment: ""), cancelButtonTitle: nil, completionHandler: completionHandler)
    }
    
    public class func showAlert(alertTitle: String, message alertMessage: String, var okButtonTitle: (String)?, cancelButtonTitle: (String)?, completionHandler: AlertCompletionHandler?)  {
        let alertController = UIAlertController.init(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        if ((okButtonTitle != nil) && (cancelButtonTitle != nil)) {
            let okButton = UIAlertAction(title: okButtonTitle, style: UIAlertActionStyle.Default, handler:{ (actionSheetController) -> Void in
                if ((completionHandler) != nil) {
                    completionHandler!(buttonIndex: 0,alertController: alertController)
                }
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            
            let cancelButton = UIAlertAction(title: cancelButtonTitle, style: UIAlertActionStyle.Cancel, handler:{ (actionSheetController) -> Void in
                if ((completionHandler) != nil) {
                    completionHandler!(buttonIndex: 1,alertController: alertController)
                }
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            alertController.addAction(okButton)
            alertController.addAction(cancelButton)
        } else if (okButtonTitle != nil) {
            let okButton = UIAlertAction(title: okButtonTitle, style: UIAlertActionStyle.Default, handler:{ (actionSheetController) -> Void in
                if ((completionHandler) != nil) {
                    completionHandler!(buttonIndex: 0,alertController: alertController)
                }
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            alertController.addAction(okButton)
        } else if (cancelButtonTitle != nil) {
            let cancelButton = UIAlertAction(title: cancelButtonTitle, style: UIAlertActionStyle.Cancel, handler:{ (actionSheetController) -> Void in
                if ((completionHandler) != nil) {
                    completionHandler!(buttonIndex: 0,alertController: alertController)
                }
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            alertController.addAction(cancelButton)
        } else {
            okButtonTitle = NSLocalizedString("OK", comment: "")
            let okButton = UIAlertAction(title: okButtonTitle, style: UIAlertActionStyle.Default, handler:{ (actionSheetController) -> Void in
                if ((completionHandler) != nil) {
                    completionHandler!(buttonIndex: 0,alertController: alertController)
                }
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            alertController.addAction(okButton)
        }
        
        AlertView.presentationContorller()!.presentViewController(alertController, animated: true, completion: nil)
    }
    
    //MARK:- Alert methods
    
    public class func alert(alertMessage: String) -> UIAlertController {
        return AlertView.alert("", message: alertMessage, completionHandler: nil)
    }
    
    public class func errorAlert(error: NSError) -> UIAlertController {
        return AlertView.alert(NSLocalizedString("Error", comment: ""), message: error.localizedDescription, completionHandler: nil)
    }
    
    public class func alert(alertTitle: String, message alertMessage: String) -> UIAlertController {
        return AlertView.alert(alertTitle, message: alertMessage, completionHandler: nil)
    }
    
    public class func alert(alertTitle: String, message alertMessage: String, completionHandler: AlertCompletionHandler?) -> UIAlertController {
        return AlertView.alert(alertTitle, message: alertMessage, okButtonTitle: NSLocalizedString("OK", comment: ""), cancelButtonTitle: nil, completionHandler: completionHandler)
    }
    
    public class func alert(alertTitle: String, message alertMessage: String, var okButtonTitle: (String)?, cancelButtonTitle: (String)?, completionHandler: AlertCompletionHandler?) -> UIAlertController {
        let alertController = UIAlertController.init(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        if ((okButtonTitle != nil) && (cancelButtonTitle != nil)) {
            let okButton = UIAlertAction(title: okButtonTitle, style: UIAlertActionStyle.Default, handler:{ (actionSheetController) -> Void in
                if ((completionHandler) != nil) {
                    completionHandler!(buttonIndex: 0,alertController: alertController)
                }
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            
            let cancelButton = UIAlertAction(title: cancelButtonTitle, style: UIAlertActionStyle.Cancel, handler:{ (actionSheetController) -> Void in
                if ((completionHandler) != nil) {
                    completionHandler!(buttonIndex: 1,alertController: alertController)
                }
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            alertController.addAction(okButton)
            alertController.addAction(cancelButton)
        } else if (okButtonTitle != nil) {
            let okButton = UIAlertAction(title: okButtonTitle, style: UIAlertActionStyle.Default, handler:{ (actionSheetController) -> Void in
                if ((completionHandler) != nil) {
                    completionHandler!(buttonIndex: 0,alertController: alertController)
                }
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            alertController.addAction(okButton)
        } else if (cancelButtonTitle != nil) {
            let cancelButton = UIAlertAction(title: cancelButtonTitle, style: UIAlertActionStyle.Cancel, handler:{ (actionSheetController) -> Void in
                if ((completionHandler) != nil) {
                    completionHandler!(buttonIndex: 0,alertController: alertController)
                }
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            alertController.addAction(cancelButton)
        } else {
            okButtonTitle = NSLocalizedString("OK", comment: "")
            let okButton = UIAlertAction(title: okButtonTitle, style: UIAlertActionStyle.Default, handler:{ (actionSheetController) -> Void in
                if ((completionHandler) != nil) {
                    completionHandler!(buttonIndex: 0,alertController: alertController)
                }
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            alertController.addAction(okButton)
        }
        
        return alertController
    }
}

//MARK:- UIAlertController Extentions

public extension UIAlertController {
    
    public func showInController(controller: UIViewController) {
        controller.presentViewController(self, animated: true, completion: nil)
    }
}

