//
//  TableViewCell.h
//  SwitchViewOC
//
//  Created by 鹭源 on 2017/5/16.
//  Copyright © 2017年 luyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,AuthCellType) {
    AuthCellTypeEmpty = 0,
    AuthCellTypeSignupLabel,
    AuthCellTypeheadline,
    AuthCellTypeEmailTextfield,
    AuthCellTypePasswordTextfield,
    AuthCellTypeQQButton,
    AuthCellTypeEmailRegisterButton,
    AuthCellTypeLoginButton,
    AuthCellTypeSeparator,
    AuthCellTypeloginHere,
    AuthCellTypeForgotPassword,
    AuthCellTypeSignUpNow,
    AuthCellTypeSignUpButton
    
};
@interface TableViewCell : UITableViewCell
@property (nonatomic, strong) UIButton *qqButton;
@property (nonatomic, strong) UIButton *emailRegisterButton;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *signupButton;
@property (nonatomic, strong) UIButton *loginHere;
@property (nonatomic, strong) UIButton *signupNow;
@property (nonatomic, strong) UIButton *forgotPassword;
@property (nonatomic) BOOL headline;
@property (nonatomic) BOOL separator;

+ (instancetype)cellWithTableView:(UITableView *)tableView authCellType:(AuthCellType)authCellType;
@end
