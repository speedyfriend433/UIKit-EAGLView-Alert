#import <UIKit/UIKit.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/EAGLDrawable.h>

%hook EAGLView

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    %orig;

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                             message:@"EAGLView Is Touched!"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alertController addAction:okAction];

    UIViewController *topViewController = [UIApplication sharedApplication].keyWindow.rootViewController;

    if (topViewController.presentedViewController == nil) {
        [topViewController presentViewController:alertController animated:YES completion:nil];
    }
}

%end
