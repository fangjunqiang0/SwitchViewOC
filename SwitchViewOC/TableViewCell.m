//
//  TableViewCell.m
//  SwitchViewOC
//
//  Created by 鹭源 on 2017/5/16.
//  Copyright © 2017年 luyuan. All rights reserved.
//

#import "TableViewCell.h"

#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define marginX 50

@implementation TableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView authCellType:(AuthCellType)authCellType

{
    static NSString *indentifier = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (nil == cell) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *views = cell.contentView.subviews;
    for (UIView *view in views) {
        [view removeFromSuperview];
    }
    
    switch (authCellType) {
        case AuthCellTypeEmpty:
            
            break;
        case AuthCellTypeSignupLabel:
        {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(marginX, 0, kScreenW - marginX * 2, 60)];
            label.text = @"Sign Up";
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont systemFontOfSize:40];
            label.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:label];
        }
            break;
        case AuthCellTypeheadline:
        {
            cell.headline = YES;
            CGFloat lineLength = (kScreenW-marginX*3)/2;
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW - marginX*2 - lineLength, 0, marginX, 20)];
            label.text = @"or";
            label.textColor = [UIColor whiteColor];
            //label.backgroundColor = [UIColor grayColor];
            label.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:label];
            
        }
            
            break;
        case AuthCellTypeEmailTextfield:
        {
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(marginX, 10, kScreenW-marginX*2, 40)];
            tf.placeholder = @"e-mail";
            tf.backgroundColor = [UIColor whiteColor];
            tf.layer.cornerRadius = 5.0;
            tf.layer.masksToBounds = YES;
            [cell.contentView addSubview:tf];
        }
            
            break;
        case AuthCellTypePasswordTextfield:
        {
            UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(marginX, 10, kScreenW-marginX*2, 40)];
            tf.placeholder = @"password";
            tf.backgroundColor = [UIColor whiteColor];
            tf.layer.cornerRadius = 5.0;
            tf.layer.masksToBounds = YES;
            [cell.contentView addSubview:tf];
        }
            
            break;
        case AuthCellTypeQQButton:
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(marginX, 10, kScreenW-marginX*2, 40)];
            [btn setTitle:@"QQ" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor blueColor]];
            btn.layer.cornerRadius = 5.0;
            btn.layer.masksToBounds = YES;
            [cell.contentView addSubview:btn];
            cell.qqButton = btn;
        }
            
            break;
        case AuthCellTypeEmailRegisterButton:
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(marginX, 10, kScreenW-marginX*2, 40)];
            [btn setTitle:@"e-mail" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor orangeColor]];
            btn.layer.cornerRadius = 5.0;
            btn.layer.masksToBounds = YES;
            [cell.contentView addSubview:btn];
            cell.emailRegisterButton = btn;
        }
            
            break;
        case AuthCellTypeLoginButton:
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(marginX, 10, kScreenW-marginX*2, 40)];
            [btn setTitle:@"log in" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor orangeColor]];
            btn.layer.cornerRadius = 5.0;
            btn.layer.masksToBounds = YES;
            [cell.contentView addSubview:btn];
            cell.loginButton = btn;
            
        }
            
            break;
        case AuthCellTypeSeparator:
        {
            cell.separator = YES;
        }
            
            break;
        case AuthCellTypeloginHere:
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(marginX, 10, kScreenW-marginX*2, 40)];
            [btn setTitle:@"log in here" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor clearColor]];
            [cell.contentView addSubview:btn];
            cell.loginHere = btn;
        }
            
            break;
        case AuthCellTypeForgotPassword:
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(marginX, 10, kScreenW-marginX*2, 40)];
            [btn setTitle:@"forgot password" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor clearColor]];
            [cell.contentView addSubview:btn];
            cell.forgotPassword = btn;
        }
            
            break;
        case AuthCellTypeSignUpNow:
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(marginX, 10, kScreenW-marginX*2, 40)];
            [btn setTitle:@"sign up now" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor clearColor]];
            [cell.contentView addSubview:btn];
            cell.signupNow = btn;
        }
            
            break;
        case AuthCellTypeSignUpButton:
        {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(marginX, 10, kScreenW-marginX*2, 40)];
            [btn setTitle:@"sign up" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor orangeColor]];
            btn.layer.cornerRadius = 5.0;
            btn.layer.masksToBounds = YES;
            [cell.contentView addSubview:btn];
            cell.signupButton = btn;
        }
            
            break;
            
        default:
            break;
    }
    return cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
void drawLine(CGFLOAT_TYPE x,CGFLOAT_TYPE y,CGFLOAT_TYPE width, CGFLOAT_TYPE length){
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, width);
    CGContextSetRGBStrokeColor(context, 0.83, 0.83, 0.83, 1.0);
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextMoveToPoint(context, x, y);
    CGContextAddLineToPoint(context, x+length, y);
    CGContextStrokePath(context);
}
/*
- (void)drawRect:(CGRect)rect
{
    if (_headline) {
        CGFloat lineLength = (kScreenW-marginX*3)/2;
        drawLine(marginX, 10, 1, lineLength);
       drawLine(kScreenW - lineLength - marginX, 10, 1, lineLength);
    }
    else if (_separator){
         drawLine(marginX, 10, 1, kScreenW - marginX *2);
    }
   
}
 */
@end
