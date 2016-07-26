//
//  CompIdentityController.m
//  ZhaoChe
//
//  Created by zdl on 16/6/29.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "CompIdentityController.h"
#import "UIColor+ZhaoChe.h"
#import "CompTypeController.h"
#import "MainSaleController.h"
@interface CompIdentityController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImagePickerController *imagePickerController1;
    UIImagePickerController *imagePickerController2;
}
@property (weak, nonatomic) IBOutlet UIButton *finishBtn;
@property (weak, nonatomic) IBOutlet UIButton *compNameBtn;
@property (weak, nonatomic) IBOutlet UIButton *cityName;
@property (weak, nonatomic) IBOutlet UIButton *addressBtn;
@property (weak, nonatomic) IBOutlet UIButton *typeCompBtn;
@property (weak, nonatomic) IBOutlet UIButton *mainSaleBtn;

@property (weak, nonatomic) IBOutlet UIButton *photoBtnZ;

@property (weak, nonatomic) IBOutlet UIButton *photoBtnF;

@end

@implementation CompIdentityController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackNavBtn];
    self.finishBtn.backgroundColor = [UIColor zc_BlueColor];
    self.finishBtn.layer.cornerRadius = 8;
}
-(void)setBackNavBtn
{
    self.title= @"企业信息认证";
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
- (IBAction)compNameAction:(id)sender {
}
- (IBAction)citySelect:(id)sender {
}
- (IBAction)addressAction:(id)sender {
}
- (IBAction)typeCompAction:(id)sender {
    CompTypeController *typeC =[[CompTypeController alloc] init];
    [self.navigationController pushViewController:typeC animated:YES];
}
- (IBAction)mainSaleAction:(id)sender {
    MainSaleController *mainC = [[MainSaleController alloc] init];
    [self.navigationController pushViewController:mainC animated:YES];
}

#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    /* 此处info 有六个
     * UIImagePickerControllerMediaType; // an NSString UTTypeImage)
     * UIImagePickerControllerOriginalImage;  // a UIImage 原始图片
     * UIImagePickerControllerEditedImage;    // a UIImage 裁剪后图片
     * UIImagePickerControllerCropRect;       // an NSValue (CGRect)
     * UIImagePickerControllerMediaURL;       // an NSURL
     * UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
     * UIImagePickerControllerMediaMetadata    // an NSDictionary containing metadata from a captured photo
     */
    // 保存图片至本地，方法见下文
    [self saveImage:image withName:@"currentImage.png"];
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    if (picker == imagePickerController1) {
        [self.photoBtnZ setImage:savedImage forState:UIControlStateNormal];
        }
    else
    {
        [self.photoBtnF setImage:savedImage forState:UIControlStateNormal];
    }
}

#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    // 将图片写入文件
    [imageData writeToFile:fullPath atomically:NO];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

//正面
- (IBAction)takephotos:(id)sender {
    imagePickerController1 = [[UIImagePickerController alloc] init];
    imagePickerController1.delegate = self;
    imagePickerController1.allowsEditing = YES;
    imagePickerController1.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagePickerController1 animated:YES completion:^{}];
}
//反面
- (IBAction)fanTakePhotos:(id)sender {
    imagePickerController2 = [[UIImagePickerController alloc] init];
    imagePickerController2.delegate = self;
    imagePickerController2.allowsEditing = YES;
    imagePickerController2.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagePickerController2 animated:YES completion:^{}];
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
