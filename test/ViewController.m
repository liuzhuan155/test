//
//  ViewController.m
//  test
//
//  Created by 刘转 on 2018/1/26.
//  Copyright © 2018年 刘转. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()
@property(nonatomic,strong)WKWebView * webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://test.xmeiz.cn/test/formtest.html"]]];
}

-(WKWebView *)webView{
    if (!_webView) {
        NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
        
        WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        WKUserContentController *wkUController = [[WKUserContentController alloc] init];
        [wkUController addUserScript:wkUScript];
        
        WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
        wkWebConfig.userContentController = wkUController;
        
        
         _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0,40, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-40) configuration:wkWebConfig ];
//        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width - 40, [UIScreen mainScreen].bounds.size.height) ];
        
    }
    return _webView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
