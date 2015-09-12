//
//  HTTPConnectoin.h
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 12/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "Reachability.h"
#import <UIKit/UIKit.h>


typedef enum {
    GET,//0
    POST,//1
    PATCH,//2
    DELETE//3
} MethodType;

@protocol HttpDelegate
@required
-(void)getResponseCode:(NSInteger)responseCode withResponse:(NSDictionary*)response;
@end

@interface HTTPConnectoin : NSObject
+(HTTPConnectoin*)getSharedInstance;
@property(nonatomic,strong) id<HttpDelegate> delegate;
@property (nonatomic, strong) AFHTTPRequestOperationManager *operationManager;
@property(nonatomic,strong) NSString *authToken;
@property(nonatomic,strong)NSString *url;
-(void)initializeHttpConnection:(NSString *)method withParams:(NSDictionary *)param withUrl:(NSString *)url withMethodType:(MethodType)requestType withAuth:(NSString *)auth;

@end
