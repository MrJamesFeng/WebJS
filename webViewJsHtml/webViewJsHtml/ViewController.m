//
//  ViewController.m
//  webViewJsHtml
//
//  Created by LDY on 17/3/19.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:_webView];
    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
    [_webView loadHTMLString:[self htmlString:@"<p>内容</p>" title:@"baidu"] baseURL:url];
    
}
#pragma mark- interactive methold

/**
 把html封装成字符串

 @param body  html内容
 @param title html标题
 @return htmlString
 */
-(NSString *)htmlString:(NSString *)body title:(NSString *)title{
    NSString *htmlFormatter = @"<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"UTF-8\"><title>%@</title></head><body>%@</body></html>";
    NSString *content = [NSString stringWithFormat:htmlFormatter,title,body];
    return content;
}
#pragma mark- UIWebViewDelegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    return YES;
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}


#pragma mark- getter
-(UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _webView.delegate = self;
    }
    return _webView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
