//
//  HTTPConnectoin.m
//  Sell-It
//
//  Created by Shubhakeerti Alagundagi on 12/09/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import "HTTPConnectoin.h"

static HTTPConnectoin *sharedInstance = nil;
@implementation HTTPConnectoin

+(HTTPConnectoin*)getSharedInstance
{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
    }
    return sharedInstance;
}

-(void)initializeHttpConnection:(NSString *)method withParams:(NSDictionary *)param withUrl:(NSString *)url withMethodType:(MethodType)requestType withAuth:(NSString *)auth
{
    self.authToken = auth;
    self.url = url;
    if (_operationManager == nil)
    {
        _operationManager = [AFHTTPRequestOperationManager manager];
        [_operationManager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
        _operationManager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    }

    switch (requestType)
    {
        case GET:
            [self getAPIRequest];
            break;
//        case POST:
//            [self postAPIRequest];
//            break;
//        case PATCH:
//            [self patchAPIRequest];
//            break;
//        case DELETE:
//            [self deleteAPIRequest];
//            break;
            
        default:
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Something went wrong." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
            break;
    }
}

-(void)settingRequestHeader{
    
    [_operationManager.requestSerializer setValue:self.authToken forHTTPHeaderField:@"X-Epicenter-Api-Token"];
    [_operationManager.requestSerializer setValue:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] forHTTPHeaderField:@"x-ios-version"];
    [_operationManager.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    [_operationManager.requestSerializer setTimeoutInterval:30.00];
}


//for get request
-(void)getAPIRequest
{
    [self settingRequestHeader];
    [_operationManager GET:self.url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [self.delegate getResponseCode:operation.response.statusCode withResponse:responseObject];
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
}



@end
