//
//  AppDelegate.h
//  webViewJsHtml
//
//  Created by LDY on 17/3/19.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

