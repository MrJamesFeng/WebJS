//
//  ViewController.m
//  webViewJsHtml
//
//  Created by LDY on 17/3/19.
//  Copyright © 2017年 LDY. All rights reserved.
//
#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView *mywebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mywebView];
//    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
//    [self.mywebView loadHTMLString:[self htmlString:@"<p>内容</p>" title:@"baidu"] baseURL:url];
    
}
/*
-(void)setupMGTemplateEngine{
    MGTemplateEngine *templateEngine = [MGTemplateEngine templateEngine];
    ICUTemplateMatcher *templateMatcher = [ICUTemplateMatcher matcherWithTemplateEngine:templateEngine];
    [templateEngine setMatcher:templateMatcher];
    
    [templateEngine setObject:@"content" forKey:@"title"];
    [templateEngine setObject:@"title" forKey:@"title"];
    
    NSString *htmlPath = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"html"];
    NSString *htmlString = [templateEngine processTemplateInFileAtPath:htmlPath withVariables:nil];
    
    NSString *baseUrl = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"test"];
    [_mywebView loadHTMLString:htmlString baseURL:[NSURL URLWithString:baseUrl]];
    
}
 */
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
    NSLog(@"StartLoad");
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"FinishLoad");
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"%@\n",[error description]);
}


#pragma mark- getter
-(UIWebView *)mywebView{
    if (!_mywebView) {
        _mywebView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _mywebView.backgroundColor = [UIColor lightGrayColor];
        _mywebView.delegate = self;
    }
    return _mywebView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
