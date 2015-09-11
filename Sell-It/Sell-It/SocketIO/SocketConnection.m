//
//  SocketConnection.m
//  Locus
//
//  Created by Shubhakeerti Alagundagi on 28/06/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import "SocketConnection.h"
//#define hostURL @"ec2-52-74-133-64.ap-southeast-1.compute.amazonaws.com/"
#define hostURL @"52.74.242.7"
@implementation SocketConnection

static SocketConnection *socketConnection;


+(SocketConnection*)sharedSocketConnection{
    @synchronized([SocketConnection class])
    {
        if (socketConnection==nil)
            socketConnection=[[SocketConnection alloc] init];
        return socketConnection;
    }
    return nil;
}

-(void)setUpSocketConnection
{
    if (self.socketIO == nil)
    {
        self.socketIO = [[SocketIO alloc] initWithDelegate:self];
    }
    
    // connect to the socket.io server that is running locally at port 3000
    [self.socketIO connectToHost:hostURL onPort:8080];

}

# pragma mark - socket.IO-objc delegate methods

- (void) socketIODidConnect:(SocketIO *)socket
{
    NSLog(@"socket.io connected.");
}

- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet
{
    NSLog(@"didReceiveEvent()");
    
    // test acknowledge
    SocketIOCallback cb = ^(id argsData) {
        NSDictionary *response = argsData;
        // do something with response
        NSLog(@"ack arrived: %@", response);
        
        // test forced disconnect
//        [self.socketIO disconnectForced];
    };
    [self.socketIO sendMessage:@"hello back!" withAcknowledge:cb];
    
    // test different event data types
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    [dict setObject:@"test1" forKey:@"key1"];
//    [dict setObject:@"test2" forKey:@"key2"];
//    [self.socketIO sendEvent:@"welcome" withData:dict];
    
    [self.socketIO sendEvent:@"message" withData:@"testWithString"];
    
//    NSArray *arr = [NSArray arrayWithObjects:@"test1", @"test2", nil];
//    [self.socketIO sendEvent:@"welcome" withData:arr];
}

- (void) socketIO:(SocketIO *)socket onError:(NSError *)error
{
    if ([error code] == SocketIOUnauthorized) {
        NSLog(@"not authorized");
    } else {
        NSLog(@"onError() %@", error);
    }
}


- (void) socketIODidDisconnect:(SocketIO *)socket disconnectedWithError:(NSError *)error
{
    NSLog(@"socket.io disconnected. did error occur? %@", error);
}


@end
