//
//  RootViewController.m
//  UPLOADIMG
//
//  Created by 王德怀 on 15/10/13.
//  Copyright © 2015年 王德怀. All rights reserved.
//

#import "RootViewController.h"
#import <AFNetworking.h>

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"上传" style:UIBarButtonItemStyleDone target:self action:@selector(actionClick)];
    [self.navigationItem setRightBarButtonItem:rightItem];
}

#pragma mark - 拍照
-(void)actionClick{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *backAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self loadCamera];
    }];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self loadPhoto];
    }];
    UIAlertAction *moreAction = [UIAlertAction actionWithTitle:@"多图上传" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:@"guide1.png"]);
        [self uploadDataWithImgData:imageData imgType:@"png" imgTitle:@"png_pic"];
    }];
    [alertVC addAction:moreAction];
    [alertVC addAction:backAction];
    [alertVC addAction:cameraAction];
    [alertVC addAction:photoAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

#pragma mark - 完成提示
-(void)overUpLoad{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"上传成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *backAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertVC addAction:backAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

#pragma mark - 拍照
-(void)loadCamera{
    //资源类型为照相机
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //判断是否有相机
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate =(id)self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        //资源类型为照相机
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:nil];
    }else {
        NSLog(@"该设备无摄像头");
    }
}
#pragma mark - 相册
-(void)loadPhoto{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //资源类型为图片库
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = (id)self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePickerController代理
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    NSData *imageData = UIImageJPEGRepresentation(image, 1);        //UIImagePNGRepresentation png
    [self uploadDataWithImgData:imageData imgType:@"jpg" imgTitle:@"jpg_pic"];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)uploadDataWithImgData:(NSData *)imgData imgType:(NSString *)imgType imgTitle:(NSString *)imgTitle{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [ AFHTTPRequestSerializer serializer ];
    manager.responseSerializer = [ AFHTTPResponseSerializer serializer ];
    manager.responseSerializer.acceptableContentTypes = nil;
    manager.requestSerializer.timeoutInterval = 120.f;
    [manager POST:@"http://192.168.1.10/wl/servlet/Upload" parameters:@{@"imgStr":imgData,@"imgType":@"jpg",@"imgTitle":imgTitle} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self overUpLoad];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败%@",error);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
