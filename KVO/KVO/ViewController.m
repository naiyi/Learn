//
//  ViewController.m
//  KVO
//
//  Created by yosemite on 16/9/14.
//
//

/*
typedef NS_ENUM(NSInteger, UIKeyboardType) {
    UIKeyboardTypeDefault,                // Default type for the current input method.
    UIKeyboardTypeASCIICapable,           // Displays a keyboard which can enter ASCII characters
    UIKeyboardTypeNumbersAndPunctuation,  // Numbers and assorted punctuation.
    UIKeyboardTypeURL,                    // A type optimized for URL entry (shows . / .com prominently).
    UIKeyboardTypeNumberPad,              // A number pad with locale-appropriate digits (0-9, ۰-۹, ०-९, etc.). Suitable for PIN entry.
    UIKeyboardTypePhonePad,               // A phone pad (1-9, *, 0, #, with letters under the numbers).
    UIKeyboardTypeNamePhonePad,           // A type optimized for entering a person's name or phone number.
    UIKeyboardTypeEmailAddress,           // A type optimized for multiple email address entry (shows space @ . prominently).
    UIKeyboardTypeDecimalPad NS_ENUM_AVAILABLE_IOS(4_1),   // A number pad with a decimal point.
    UIKeyboardTypeTwitter NS_ENUM_AVAILABLE_IOS(5_0),      // A type optimized for twitter text entry (easy access to @ #)
    UIKeyboardTypeWebSearch NS_ENUM_AVAILABLE_IOS(7_0),    // A default keyboard type with URL-oriented addition (shows space . prominently).
    UIKeyboardTypeASCIICapableNumberPad NS_ENUM_AVAILABLE_IOS(10_0), // A number pad (0-9) that will always be ASCII digits.
    
    UIKeyboardTypeAlphabet = UIKeyboardTypeASCIICapable, // Deprecated
    
};
*/
#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

{
    UITextField *_textField;
    UILabel *_label;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    _textField=[[UITextField alloc]initWithFrame:CGRectMake(100, 100, self.view.frame.size.width-200, 40)];
    _textField.backgroundColor=[UIColor cyanColor];
//    _textField.secureTextEntry=YES;
//    _textField.clearsOnBeginEditing=YES;
    _textField.text=@"1";
    _textField.delegate=self;
//    _textField.placeholder=@"请输入文字";
//    _textField.clearButtonMode=UITextFieldViewModeWhileEditing;
//    _textField.keyboardType=UIKeyboardTypeNumberPad;
    _textField.textAlignment=NSTextAlignmentCenter;
//    _textField.returnKeyType=UIReturnKeyNext;
    [self.view addSubview:_textField];
    
    _label=[[UILabel alloc]initWithFrame:CGRectMake(100, 200, self.view.frame.size.width-200, 30)];
    _label.textAlignment=NSTextAlignmentCenter;
    _label.textColor=[UIColor redColor];
    _label.backgroundColor=[UIColor yellowColor];
    _label.text=_textField.text;
    [self.view addSubview:_label];
//    观察_textField的text属性新旧值变化
    [_textField addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
}

//      接受变化通知
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    _label.text=[change objectForKey:@"new"];
    NSLog(@"%@",[change objectForKey:@"old"]);
    NSLog(@"%@",[change objectForKey:@"new"]);
}

-(void)dealloc
{
//    移除观察者
    [self removeObserver:self forKeyPath:@"text"];
 }
//    点击return注销第一响应者身份
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_textField resignFirstResponder];
}

@end
