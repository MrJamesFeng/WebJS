//
//  ViewController.m
//  webViewJsHtml
//
//  Created by LDY on 17/3/19.
//  Copyright © 2017年 LDY. All rights reserved.
//
#import "ViewController.h"
#import <GRMustache.h>

@interface User: NSObject

@property(nonatomic,copy)NSString *name;

@end

@implementation User
#define M 3
#if M ==1
#define N 2
#elif M==2
#define N 2
#elif M == 3
#define N 3
#endif


@end
@interface ViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView *mywebView;

@end

@implementation ViewController
-(void)willMoveToParentViewController:(UIViewController *)parent{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"N=%d",N);
    [self.view addSubview:self.mywebView];
    User *user = [[User alloc]init];
    user.name = @"James";
//    NSString *rendering = [GRMustacheTemplate renderObject:@{ @"name": @"Arthur" } fromString:@"Hello {{name}}!" error:NULL];
//    NSString *rendering = [GRMustacheTemplate renderObject:user fromString:@"Hello {{name}}!" error:NULL];
   
    
//    NSString *rendering = [GRMustacheTemplate renderObject:user fromResource:@"text.html" bundle:nil error:NULL];
    
    
//    GRMustacheTemplate *template = [GRMustacheTemplate templateFromResource:@"Profile" bundle:nil error:nil];
//    rendering = [template renderObject:arthur error:NULL];
//    rendering = [template renderObject:barbara error:NULL];
  
//    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
//    [self.mywebView loadHTMLString:[self htmlString:@"<p>内容</p>" title:@"baidu"] baseURL:url];

    
    NSString *baseUrlString = [[NSBundle mainBundle]bundlePath];
    NSURL *baseUrl = [NSURL URLWithString:baseUrlString];
    [self.mywebView loadHTMLString:[self htmlString:nil name:nil] baseURL:baseUrl];
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

-(NSString *)htmlString:(NSString *)content name:(NSString *)title{
    //文件路径
    NSString *pathString = [[[NSBundle mainBundle]bundlePath]stringByAppendingPathComponent:@"test.html"];
    //文件转字符串
    NSError *error = nil;
    NSString *htmlOriginalString = [NSString stringWithContentsOfFile:pathString encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"error=%@",[error description]);
    }
    //渲染html
    NSDictionary *renderObject = @{@"name":@"<script>\
                                   alert(\"good !\")\
                                   </script>",
                                   @"content":@"Hello World ！"};
    NSError *error1 = nil;
    NSString *htlmString = [GRMustacheTemplate renderObject:renderObject fromString:htmlOriginalString error:&error1];//如何传递代码？
    if (error1) {
        NSLog(@"error1=%@",[error1 description]);

    }
    return htlmString;
    
}

#pragma mark- UIWebViewDelegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSURL *url = [request URL];
    if ([[url scheme] isEqualToString:@"file"]) {
        
//        [webView stringByEvaluatingJavaScriptFromString:@"<script>\
//         function\
//         loadUR(url) {\
//         var iFrame;\
//         iFrame = document.createComment(\"iFrame\");\
//         iFrame.setAttribute(\"src\",url);\
//         iFrame.setAttribute(\"style\",\"dispaly:none\");\
//         iFrame.setAttribute(\"height\",\"0px\");\
//         iFrame.setAttribute(\"width\",\"0px\");\
//         iFrame.setAttribute(\"frameborder\",\"0\");\
//         document.body.appendChild(iFrame);\
//         iFrame.parentNode.removeChild(iFrame);\
//         iFrame = null;\
//         }\
//         loadUR(http://www.jianshu.com/p/0f2e24604d94);\
//         </script>"];
        NSLog(@"%@",[webView stringByEvaluatingJavaScriptFromString:@"setTimeout(loadUR(http://www.jianshu.com/p/0f2e24604d94),0.2);"]);
//         [webView stringByEvaluatingJavaScriptFromString:@"loadUR(http://www.jianshu.com/p/0f2e24604d94);"];
        
    }
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
