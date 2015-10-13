//
//  UPViewController.m
//  UPLOADIMG
//
//  Created by 王德怀 on 15/10/13.
//  Copyright © 2015年 王德怀. All rights reserved.
//

#import "UPViewController.h"
#import <AFNetworking.h>

@interface UPViewController ()

@end

@implementation UPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    AFHTTPRequestOperation *operation = [manager POST:mutPath parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        if (mediaDatas.count > 0) {
//            NSObject *firstObj = [mediaDatas objectAtIndexSafe:0];
//            if ([firstObj isKindOfClass:[UIImage class]]) {     // 图片
//                for(NSInteger i=0; i<mediaDatas.count; i++) {
//                    UIImage *eachImg = [mediaDatas objectAtIndexSafe:i];
//                    //NSData *eachImgData = UIImagePNGRepresentation(eachImg);
//                    NSData *eachImgData = UIImageJPEGRepresentation(eachImg, 0.5);
//                    [formData appendPartWithFileData:eachImgData name:[NSString stringWithFormat:@"img%d", i+1] fileName:[NSString stringWithFormat:@"img%d.jpg", i+1] mimeType:@"image/jpeg"];
//                }
//            }else {
//                // 视频
//                ALAsset *asset = [mediaDatas objectAtIndexSafe:0];
//                NBLog(@"asset=%@, representation=%@, url=%@", asset, [asset defaultRepresentation], [asset defaultRepresentation].url);
//                if (asset != nil) {
//                    NSString *videoPath = [NSDocumentsPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%d.mov", 0]];    // 这里直接强制写一个即可，之前计划是用i++来区分不明视频
//                    NSURL *url = [NSURL fileURLWithPath:videoPath];
//                    NSError *theErro = nil;
//                    BOOL exportResult = [asset exportDataToURL:url error:&theErro];
//                    NBLog(@"exportResult=%@", exportResult?@"YES":@"NO");
//                    
//                    NSData *videoData = [NSData dataWithContentsOfURL:url];
//                    [formData appendPartWithFileData:videoData name:@"video1" fileName:@"video1.mov" mimeType:@"video/quicktime"];
//                    NBLog(@"method 2");
//                }
//            }
//        }
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *returnedDic = [XXBaseViewController parseResponseObj:responseObject];
//        
//        NBLog(@"post Big success returnedDic=%@", returnedDic);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NBLog(@"post big file fail error=%@", error);
//        if (errorBlock) {
//            errorBlock(@{@"errorcode":@(error.code), @"errordomain":error.domain});
//        }
//    }];
//    
//    [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
//        NSLog(@"bytesWritten=%d, totalBytesWritten=%lld, totalBytesExpectedToWrite=%lld", bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
//        if (xxProgressView != nil) {
//            [xxProgressView setProgressViewTo:totalBytesWritten*1.0/totalBytesExpectedToWrite];
//        }
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
