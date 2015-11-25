# AlertView

Easy to integrate AlertView class using UIAlertController in Swift and objC.

To Integrate,
Add the objC / Swift source to your project.

To Use,

1.To show an Error.

_+ (void)showError:(NSError *)error;_

2.To show a simple message with OK button.

_+ (void)showAlert:(NSString *)alertMessage;_

3.To show an alert with Title, Message and OK button.

_+ (void)showAlert:(NSString *)alertTitle message:(NSString *)alertMessage;_

4.To show an alert with Title, Message and OK button and handle the dismiss.

_+ (void)showAlert:(NSString *)alertTitle message:(NSString *)alertMessage completionHandler:(AlertCompletionHandler)handler;_

5.To show an alert with Title, Message and OK button, Cancel button and handle the dismiss.

_+ (void)showAlert:(NSString *)alertTitle message:(NSString *)alertMessage okButtonTitle:(NSString *)okButtontitle cancelButtonTitle:(NSString *)cancelButtontitle completionHandler:(AlertCompletionHandler)handler;_


For more details : https://naveenios.wordpress.com/2015/11/25/alertview-using-uialertcontroller/
