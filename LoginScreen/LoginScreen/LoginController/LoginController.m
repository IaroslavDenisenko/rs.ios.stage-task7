//
//  ViewController.m
//  LoginScreen
//
//  Created by Iaroslav Denisenko on 02.07.2021.
//  Copyright © 2021 Iaroslav Denisenko. All rights reserved.
//

#import "LoginController.h"
#import "UIColor+Hex.h"
#import "CredentialsInsetTextField.h"
#import "TextFieldHandler.h"
#import "AuthorizeButton.h"
#import "CircleButton.h"
#import "SecureField.h"
#import "ButtonStateProtocol.h"

@interface LoginController ()

@property (strong, nonatomic) UILabel *logoLabel;
@property (strong, nonatomic) CredentialsInsetTextField *loginTextField;
@property (strong, nonatomic) CredentialsInsetTextField *passwordTextField;
@property (strong, nonatomic) UIStackView *stackView;
@property (strong, nonatomic) TextFieldHandler *textFieldsHandler;
@property (strong, nonatomic) AuthorizeButton *authorizeButton;
@property (strong, nonatomic) SecureField *secureField;
@property (strong, nonatomic) UIStackView *buttonsStack;
@property (strong, nonatomic) UILabel *resultLabel;
@property (strong, nonatomic) CircleButton *button;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupLogo];
    [self setupTextFields];
    [self configureEndEditingRecognizer];
    [self setupAuthorizeButton];
    [self setupSecureField];
    [self setupResultLabel];
    [self setupButtonsStack];
}

#pragma mark - Configure UI Elements

- (void)setupLogo {
    UILabel *logo = [UILabel new];
    [logo setFont: [UIFont boldSystemFontOfSize:36.0]];
    logo.textColor = UIColor.blackColor;
    logo.textAlignment = NSTextAlignmentCenter;
    [logo setText:@"RSSchool"];
    [self.view addSubview:logo];
    
    logo.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *top = [logo.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant:80.0];
    NSLayoutConstraint *centerX = [logo.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
    [NSLayoutConstraint activateConstraints:@[top, centerX]];
    
    self.logoLabel = logo;
}

- (void)setupTextFields {
    
    TextFieldHandler *delegate = [TextFieldHandler new];
    self.textFieldsHandler = delegate;
    
    self.loginTextField = [[CredentialsInsetTextField alloc] initWithText:@"Login" insetX: 10.0 insetY: 10.0];
    self.loginTextField.delegate = delegate;
    
    self.passwordTextField = [[CredentialsInsetTextField alloc] initWithText:@"Password" insetX: 10.0 insetY: 10.0];
    self.passwordTextField.delegate = delegate;
    self.passwordTextField.secureTextEntry = YES;
    
    UIStackView *stack = [[UIStackView alloc] initWithArrangedSubviews:@[
        self.loginTextField,
        self.passwordTextField
    ]];
    
    stack.axis = UILayoutConstraintAxisVertical;
    stack.spacing = 30.0;
    
    [self.view addSubview:stack];
    stack.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *top = [stack.topAnchor constraintEqualToAnchor: self.logoLabel.bottomAnchor constant:80.0];
    NSLayoutConstraint *leading = [stack.leadingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.leadingAnchor constant: 36.0];
    NSLayoutConstraint *trailing = [stack.trailingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.trailingAnchor constant: -36.0];
    [NSLayoutConstraint activateConstraints:@[top, leading, trailing]];
    
    self.stackView = stack;
}

- (void)setupAuthorizeButton {
    AuthorizeButton *button = [[AuthorizeButton alloc] initWithColor:[UIColor littleBoyBlue]];
    self.authorizeButton = button;
    [button addTarget:self action:@selector(highlightButton:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(authorizeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: button];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *top = [button.topAnchor constraintEqualToAnchor:self.stackView.bottomAnchor constant:60.0];
    NSLayoutConstraint *width = [button.widthAnchor constraintEqualToConstant:156.0];
    NSLayoutConstraint *height = [button.heightAnchor constraintEqualToConstant:42.0];
    NSLayoutConstraint *centerX = [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
    
    [NSLayoutConstraint activateConstraints:@[top, width, height, centerX]];
    
}

- (void)setupSecureField {
    
    SecureField *secureField = [[SecureField alloc] init];
    [secureField setHidden:YES];
    self.secureField = secureField;
    [self.view addSubview:secureField];
    secureField.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *top = [secureField.topAnchor constraintEqualToAnchor:self.authorizeButton.bottomAnchor constant:67.0];
    NSLayoutConstraint *centerX = [secureField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
    NSLayoutConstraint *width = [secureField.widthAnchor constraintEqualToConstant:236.0];
    NSLayoutConstraint *height = [secureField.heightAnchor constraintEqualToConstant:110.0];
    
    [NSLayoutConstraint activateConstraints:@[top, centerX, width, height]];
    
}

- (void)setupResultLabel {
    UILabel *resultLabel = [[UILabel alloc] init];
    self.resultLabel = resultLabel;
    [resultLabel setFont:[UIFont systemFontOfSize:18.0 weight:UIFontWeightSemibold]];
    [resultLabel setText:@"-"];
    [self.secureField addSubview: resultLabel];
    resultLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [resultLabel.topAnchor constraintEqualToAnchor:self.secureField.topAnchor constant:15.0],
        [resultLabel.centerXAnchor constraintEqualToAnchor:self.secureField.centerXAnchor]
    ]];
}

- (void)setupButtonsStack {
    NSArray *buttons = [self createCircleButtons];
    UIStackView* buttonsStack = [[UIStackView alloc] initWithArrangedSubviews:buttons];
    buttonsStack.axis = UILayoutConstraintAxisHorizontal;
    buttonsStack.spacing = 20.0;
    buttonsStack.distribution = UIStackViewDistributionFillEqually;
    buttonsStack.alignment = UIStackViewAlignmentFill;
    
    self.buttonsStack = buttonsStack;
    [self.secureField addSubview: buttonsStack];
    buttonsStack.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *top = [buttonsStack.topAnchor constraintEqualToAnchor:self.secureField.topAnchor constant:45.0];
    NSLayoutConstraint *centerX = [buttonsStack.centerXAnchor constraintEqualToAnchor:self.secureField.centerXAnchor];
    NSLayoutConstraint *width = [buttonsStack.widthAnchor constraintEqualToConstant:190];
    NSLayoutConstraint *height = [buttonsStack.heightAnchor constraintEqualToConstant:50];
    
    [NSLayoutConstraint activateConstraints:@[top, centerX, width, height]];
    
}

- (NSArray *)createCircleButtons {
    CGFloat side = 50.0;
    NSMutableArray *buttons = [NSMutableArray new];
    for (int i = 1; i < 4; i++) {
        NSString *title = [NSString stringWithFormat:@"%d", i];
        CircleButton *button = [[CircleButton alloc] initWithFrame:CGRectMake(0, 0, side, side)];
        [button setTitle:title forState:UIControlStateNormal];
        [button addTarget:self action:@selector(highlightButton:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(validatePinCode:) forControlEvents:UIControlEventTouchUpInside];
        [buttons addObject:button];
    }
    return [NSArray arrayWithArray:buttons];
}


#pragma mark - Action methods

- (void)configureEndEditingRecognizer {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self.view action: @selector(endEditing:)];
    [self.view addGestureRecognizer:recognizer];
}

- (void)authorizeButtonTapped: (UIButton *)button {
    if ([button.class conformsToProtocol:@protocol(ButtonStateProtocol)]) {
        id conformingButton = (id <ButtonStateProtocol>)button;
        [conformingButton toggleButtonStateTo:defalt];
        typeof(self) __weak weakSelf = self;
        [self.textFieldsHandler handleAuthenticationFields:@[self.loginTextField, self.passwordTextField] completion:^{
            [conformingButton toggleButtonStateTo:disabled];
            [weakSelf.secureField setHidden:NO];
            [self.view endEditing:YES];
        }];
    }
}

- (void)highlightButton: (UIButton *)button {
    if ([button.class conformsToProtocol:@protocol(ButtonStateProtocol)]) {
        [(id <ButtonStateProtocol>)button toggleButtonStateTo:highlighted];
    }
}

- (void)validatePinCode: (UIButton *)button {
    
    if ([button.class conformsToProtocol:@protocol(ButtonStateProtocol)]) {
        [(id <ButtonStateProtocol>)button toggleButtonStateTo:defalt];
    }
    
    NSString *result = self.resultLabel.text;
    if ([result isEqualToString:@"-"]) {
        result = @"";
    }
    
    if (self.secureField.secureState == error) {
        [self.secureField toggleSecureStateTo:defult];
    }
    
    result = [result stringByAppendingString:button.titleLabel.text];
    
    if (result.length == 3) {
        if ([result isEqualToString:@"132"]) {
            self.resultLabel.text = result;
            [self.secureField toggleSecureStateTo:sucess];
            [self showAlert];
        } else {
            [self.secureField toggleSecureStateTo:eror];
            self.resultLabel.text = @"-";
        }
    } else {
        self.resultLabel.text = result;
    }
}

- (void)showAlert {
    typeof(self) __weak weakSelf = self;
    UIAlertController *ac = [UIAlertController alertControllerWithTitle: @"Welcome" message:@"You are successfuly authorized!" preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        [weakSelf refreshScreen];
    }]];
    [self showViewController:ac sender:nil];
}

- (void)refreshScreen {
    [self.resultLabel setText:@"-"];
    [self.secureField setHidden:YES];
    [self.secureField toggleSecureStateTo:defult];
    [self.authorizeButton toggleButtonStateTo:defalt];
    [self.passwordTextField toggleValidationStateTo:ready];
    [self.loginTextField toggleValidationStateTo:ready];
    [self.view endEditing:YES];
}

@end
