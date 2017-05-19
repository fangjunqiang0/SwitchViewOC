//
//  RootViewController.m
//  SwitchViewOC
//
//  Created by 鹭源 on 2017/5/2.
//  Copyright © 2017年 luyuan. All rights reserved.
//

#import "RootViewController.h"
#import "SkipViewController.h"
#import "UIImage+BlurImage.h"
#import "TableViewCell.h"
#import "TransViewsState.h"


@interface RootViewController ()

@property (nonatomic, strong) NSArray *emailRegisterState;
@property (nonatomic, strong) NSArray *loginState;
@property (nonatomic, strong) NSArray *registerState;
@property (nonatomic, strong) NSArray *cellArray;
@property (nonatomic, strong) UIButton *leftBtn;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
    [self createViewsState];
    
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)creatView
{
    //1、创建rightBarButtonItem
    UIButton *skipBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [skipBtn setTitle:@"skip" forState:UIControlStateNormal];
    [skipBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [skipBtn addTarget:self action:@selector(skipBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:skipBtn];
    self.navigationItem.rightBarButtonItem = item;
    //2、创建模糊背景
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.tableView.bounds];
    imageView.image = [UIImage imageNamed:@"backgroundImage.jpg"];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.tableView addSubview:imageView];
    [self.tableView sendSubviewToBack:imageView];
    
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    effectView.frame = self.tableView.bounds;
    [self.tableView insertSubview:effectView aboveSubview:imageView];
    
    //3、
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17.0]};
    self.title = @"Sign up";
    //4、创建leftBarButtonItem
    UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    [cancelBtn setTitle:@"cancel" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor colorWithRed:0 green:0 blue:1.0 alpha:0.8] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(signupNowClicked) forControlEvents:UIControlEventTouchUpInside];
    cancelBtn.hidden = YES;
    self.leftBtn = cancelBtn;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:cancelBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

- (void)createViewsState
{
    NSNumber *empty = [NSNumber numberWithInteger:AuthCellTypeEmpty];
    NSNumber *signupLabel = [NSNumber numberWithInteger:AuthCellTypeSignupLabel];
    NSNumber *headline = [NSNumber numberWithInteger:AuthCellTypeheadline];
    NSNumber *emailTextfield = [NSNumber numberWithInteger:AuthCellTypeEmailTextfield];
    NSNumber *passwordTextfield = [NSNumber numberWithInteger:AuthCellTypePasswordTextfield];
    NSNumber *qqregisterButton = [NSNumber numberWithInteger:AuthCellTypeQQButton];
    NSNumber *loginButton = [NSNumber numberWithInteger:AuthCellTypeLoginButton];
    NSNumber *separator = [NSNumber numberWithInteger:AuthCellTypeSeparator];
    NSNumber *emailRegister = [NSNumber numberWithInteger:AuthCellTypeEmailRegisterButton];
    NSNumber *loginHere = [NSNumber numberWithInteger:AuthCellTypeloginHere];
    NSNumber *forgotPassword = [NSNumber numberWithInteger:AuthCellTypeForgotPassword];
    NSNumber *signupNow = [NSNumber numberWithInteger:AuthCellTypeSignUpNow];
    NSNumber *signupButton = [NSNumber numberWithInteger:AuthCellTypeSignUpButton];
    
    
    self.registerState = @[empty,empty, signupLabel,empty,qqregisterButton,emailRegister,separator,loginHere];
    self.loginState = @[empty,empty,qqregisterButton,headline,emailTextfield,passwordTextfield,loginButton,forgotPassword,separator,signupNow];
    self.emailRegisterState = @[empty,empty,emailTextfield,passwordTextfield,passwordTextfield,signupButton];
    _cellArray = self.registerState;
    
}

#pragma mark - 私有方法
- (void)skipBtnClick
{
    NSLog(@"click skip btn");
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"SkipViewController"];
    
    //    [self.navigationController pushViewController:vc animated:YES];
    [self.navigationController showViewController:vc sender:nil];
}
- (void)qqBtnClicked
{
    NSLog(@"qqbtnclicked");
}

- (void)emailRegisterBtnClidked
{
    self.title = @"email Register";
    self.leftBtn.hidden = NO;
    [self transViewsStateWithNewState:self.emailRegisterState];
}
- (void)loginBtnClicked
{
    NSLog(@"loginBtnClicked");
}
- (void)loginHereClicked
{
    self.title = @"Log in";
    self.leftBtn.hidden = NO;
    [self transViewsStateWithNewState:self.loginState];
}
- (void)forgotPassWordClicked
{
    NSLog(@"forgotPassWordClicked");
}
- (void)signupNowClicked
{
    self.leftBtn.hidden = YES;
    self.title = @"Sign up";
    [self transViewsStateWithNewState:self.registerState];
}
- (void)signupBtnClicked
{
    NSLog(@"signupBtnClicked");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)transViewsStateWithNewState:(NSArray *)newState
{
    TransViewsState *transState = [TransViewsState transViewsStateWithNewState:newState oldState:self.cellArray];
    transState.cellSection = 0;
    self.cellArray = newState;
    
    [self.tableView beginUpdates];
   // self.cellArray = transState.deletedArray;
    [self.tableView deleteRowsAtIndexPaths:transState.deleteIndexArray withRowAnimation:UITableViewRowAnimationFade];
    //self.cellArray = transState.insertedArray;
    [self.tableView insertRowsAtIndexPaths:transState.insertIndexArray withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.cellArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger authCellTypeNum = [self.cellArray[indexPath.row] integerValue];
    TableViewCell *cell = [TableViewCell cellWithTableView:tableView authCellType:authCellTypeNum];
    
    switch (authCellTypeNum) {
       
        case AuthCellTypeQQButton:
        {
            [cell.qqButton addTarget:self action:@selector(qqBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        }
            
            break;
        case AuthCellTypeEmailRegisterButton:
        {
            [cell.emailRegisterButton addTarget:self action:@selector(emailRegisterBtnClidked) forControlEvents:UIControlEventTouchUpInside];
        }
            
            break;
        case AuthCellTypeLoginButton:
        {
            [cell.loginButton addTarget:self action:@selector(loginBtnClicked) forControlEvents:UIControlEventTouchUpInside];
            
        }
            
            break;
        case AuthCellTypeloginHere:
        {
            [cell.loginHere addTarget:self action:@selector(loginHereClicked) forControlEvents:UIControlEventTouchUpInside];
        }
            
            break;
        case AuthCellTypeForgotPassword:
        {
            [cell.forgotPassword addTarget:self action:@selector(forgotPassWordClicked) forControlEvents:UIControlEventTouchUpInside];;
        }
            
            break;
        case AuthCellTypeSignUpNow:
        {
            [cell.signupNow addTarget:self action:@selector(signupNowClicked) forControlEvents:UIControlEventTouchUpInside];
        }
            
            break;
        case AuthCellTypeSignUpButton:
        {
            [cell.signupButton addTarget:self action:@selector(signupBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        }
            
            break;
            
        default:
            break;
    }

    
    
    return cell;
}
#pragma mark - Table view delegate
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
    
@end
