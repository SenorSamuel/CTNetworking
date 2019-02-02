//
//  DemoAPIManager.m
//  CTNetworking
//
//  Created by casa on 2018/2/27.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "DemoAPIManager.h"
#import "Target_DemoService.h"

@interface DemoAPIManager () <CTAPIManagerValidator, CTAPIManagerParamSource>
@end

@implementation DemoAPIManager

#pragma mark - life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.paramSource = self;
        self.validator = self;
    }
    return self;
}

#pragma mark - override
-(NSInteger)loadData{
    
    //策略1:当正在请求的时候,忽略后续连续发的请求
    if (!self.isLoading) {
        return [super loadData];
    }else{
        NSLog(@"忽略后续连续发的请求");
        return 0;
    }
    
//    //策略2:当正在请求的时候,需要取消之前的请求,发送后续的请求
//    if (self.isLoading) {
//        [self cancelAllRequests];
//        return [super loadData];
//    }else{
//        return [super loadData];
//    }
}

#pragma mark - CTAPIManager
- (NSString *_Nonnull)methodName
{
    return @"public/characters";
}

- (NSString *_Nonnull)serviceIdentifier
{
    return CTNetworkingDemoServiceIdentifier;
}

- (CTAPIManagerRequestType)requestType
{
    return CTAPIManagerRequestTypeGet;
}

#pragma mark - @protocol CTAPIManagerParamSource
- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager
{
    return nil;
}

#pragma mark - CTAPIManagerValidator
- (CTAPIManagerErrorType)manager:(CTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data
{
    return CTAPIManagerErrorTypeNoError;
}

- (CTAPIManagerErrorType)manager:(CTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data
{
    return CTAPIManagerErrorTypeNoError;
}

@end
