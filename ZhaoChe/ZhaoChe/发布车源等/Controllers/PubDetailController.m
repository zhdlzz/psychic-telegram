//
//  PubDetailController.m
//  ZhaoChe
//
//  Created by zdl on 16/7/12.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "PubDetailController.h"
#import "UIColor+ZhaoChe.h"
#import "ChooseWController.h"

#define height self.view.bounds.size.height
#define cellHeight height*0.0733
#define cellHeight7 height*0.1483
#define cellHeight8 height*0.19

@interface PubDetailController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,UIActionSheetDelegate>
@property(nonatomic,strong)UILabel *labelT;
@end

@implementation PubDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackNavBtn];
}

-(void)setBackNavBtn
{
    self.title= @"发布车源";
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 45, 40)];
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 15, 10, 15)];
    image.image = [UIImage imageNamed:@"导航返回"];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 2, 30, 40)];
    label.text = @"返回";
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor zc_BlueColor];
    label.font = [UIFont systemFontOfSize:15];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 40)];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:image];
    [view addSubview:label];
    [view addSubview:btn];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = item;
}

-(void)btnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    CGFloat width = self.view.bounds.size.width;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row <=6) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(width-25, 17, 8, 13);
        [btn setBackgroundImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(width*0.4, 12, width*0.5, 20)];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor zc_FontColor666];
        label.font = [UIFont systemFontOfSize:15];
        
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
        btn1.frame = CGRectMake(width-85, 7, 60, 29);
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceGray();
        CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){0,0.3,0.3,0.3});
        btn1.layer.borderColor = color;
        btn1.layer.borderWidth = 1;
        btn1.layer.cornerRadius = 15;
        btn1.layer.masksToBounds = YES;
        [btn1 setTitle:@"期货" forState:UIControlStateNormal];
        btn1.titleLabel.font = [UIFont systemFontOfSize:15];
        
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
        btn2.frame = CGRectMake(width-165, 7, 60, 29);
        CGColorSpaceRef colorSpaceRef1 = CGColorSpaceCreateDeviceRGB();
        CGColorRef color1 = CGColorCreate(colorSpaceRef1, (CGFloat[]){1,0.3,0.3,1});
        btn2.layer.borderColor = color1;
        btn2.layer.borderWidth = 1;
        btn2.layer.cornerRadius = 15;
        btn2.layer.masksToBounds = YES;
        [btn2 setTitle:@"现车" forState:UIControlStateNormal];
        btn2.titleLabel.font = [UIFont systemFontOfSize:15];
        
        UITextField *textF = [[UITextField alloc] initWithFrame:CGRectMake(width-65, 7, 45, 29)];
        textF.placeholder=@"10";
        CGColorSpaceRef colorSpaceRef2 = CGColorSpaceCreateDeviceGray();
        CGColorRef color2 = CGColorCreate(colorSpaceRef2, (CGFloat[]){0,0.3,0.3,0.3});
        textF.layer.borderColor = color2;
        textF.layer.borderWidth = 1;
        textF.layer.masksToBounds = YES;
        textF.textAlignment = NSTextAlignmentCenter;
        
        if (indexPath.row == 1||indexPath.row==0) {
            label.text= @"奥迪A6买买看看了看";
            [cell.contentView addSubview:label];
        }else if (indexPath.row == 2)
        {
            label.text= @"不限/不限";
            [cell.contentView addSubview:label];
            [cell.contentView addSubview:btn];
        }else if (indexPath.row == 3)
        {
            [cell.contentView addSubview:btn1];
            [cell.contentView addSubview:btn2];
        }else if (indexPath.row == 5)
        {
            [cell.contentView addSubview:textF];
        }else
        {
            [cell.contentView addSubview:btn];
        }
        
        
        NSArray *arr = @[@"车型",@"价格",@"外观/内饰",@"车辆状态",@"手续",@"数量",@"销售区域"];
        cell.textLabel.text = arr[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }else if(indexPath.row == 7)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 40, 20)];
        label.font = [UIFont systemFontOfSize:15];
        label.text= @"备注:";
        
        _labelT = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width-85, 60)];
        _labelT.text = @"填入详细的车源信息，如车辆配置、发货区域、提车时间等";
        _labelT.numberOfLines = 0;
        _labelT.font = [UIFont systemFontOfSize:15];
        _labelT.textColor = [UIColor grayColor];
        _labelT.alpha = 0.5;
        
        UITextView *textV = [[UITextView alloc] initWithFrame:CGRectMake(55, 0, width-85, cellHeight7)];
        textV.delegate =self;
        textV.font = [UIFont systemFontOfSize:15];
        [textV addSubview:_labelT];
        [cell.contentView addSubview:textV];
        [cell.contentView addSubview:label];
    }else
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 200, 20)];
        label.font = [UIFont systemFontOfSize:15];
        label.text= @"上传车辆图片（最多四张）";
        
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
        btn1.frame = CGRectMake(15, 50, cellHeight8-30-35, cellHeight8-30-35);
        [btn1 setBackgroundColor:[UIColor zc_BackgroundColor]];
        [btn1 setImage:[UIImage imageNamed:@"加深灰"] forState:UIControlStateNormal];
        [btn1 setTintColor:[UIColor grayColor]];
        [btn1 addTarget:self action:@selector(takePhotos) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat wid2 = 15+cellHeight8-30-35+10;
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
        btn2.frame = CGRectMake(wid2, 50, cellHeight8-30-35, cellHeight8-30-35);
        [btn2 setBackgroundColor:[UIColor zc_BackgroundColor]];
        [btn2 setImage:[UIImage imageNamed:@"加深灰"] forState:UIControlStateNormal];
        [btn2 setTintColor:[UIColor grayColor]];
        [btn2 addTarget:self action:@selector(takePhotos) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat wid3 = wid2+cellHeight8-30-35+10;
        UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
        btn3.frame = CGRectMake(wid3, 50, cellHeight8-30-35, cellHeight8-30-35);
        [btn3 setBackgroundColor:[UIColor zc_BackgroundColor]];
        [btn3 setImage:[UIImage imageNamed:@"加深灰"] forState:UIControlStateNormal];
        [btn3 setTintColor:[UIColor grayColor]];
        [btn3 addTarget:self action:@selector(takePhotos) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat wid4 = wid3+cellHeight8-30-35+10;
        UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeSystem];
        btn4.frame = CGRectMake(wid4, 50, cellHeight8-30-35, cellHeight8-30-35);
        [btn4 setBackgroundColor:[UIColor zc_BackgroundColor]];
        [btn4 setImage:[UIImage imageNamed:@"加深灰"] forState:UIControlStateNormal];
        [btn4 setTintColor:[UIColor grayColor]];
        [btn4 addTarget:self action:@selector(takePhotos) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.contentView addSubview:btn2];
        [cell.contentView addSubview:btn3];
        [cell.contentView addSubview:btn4];
        [cell.contentView addSubview:btn1];
        [cell.contentView addSubview:label];
    }
    return cell;
}

-(void)takePhotos
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择",nil];
    [actionSheet showInView:self.view];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        ChooseWController *chooseWC = [[ChooseWController alloc] init];
        [self.navigationController pushViewController:chooseWC animated:YES];
    }
}


#pragma textView 代理
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if(![text isEqualToString:@""])
    {
        _labelT.hidden = YES;
    }
    if([text isEqualToString:@""]){
        _labelT.hidden = NO;
    }
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row<=6) {
        return cellHeight;
    }else if(indexPath.row == 7)
    {
        return cellHeight7;
    }else
    {
       return cellHeight8;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 80;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    CGFloat width =[UIScreen mainScreen].bounds.size.width;
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 80)];
    footView.backgroundColor = [UIColor zc_BackgroundColor];
    UIButton *footBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    footBtn.frame = CGRectMake(20, 40,width-40, 40);
    footBtn.backgroundColor = [UIColor zc_BlueColor];
    [footBtn setTitle:@"确认发起" forState:UIControlStateNormal];
    [footBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    footBtn.layer.cornerRadius = 8;
    [footBtn addTarget:self action:@selector(sureGo) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:footBtn];
    return footView;
    
}
-(void)sureGo
{
    NSLog(@"确认发起");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
