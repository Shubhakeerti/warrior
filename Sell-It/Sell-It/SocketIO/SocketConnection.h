//
//  SocketConnection.h
//  Locus
//
//  Created by Shubhakeerti Alagundagi on 28/06/15.
//  Copyright (c) 2015 Shubhakeerti Alagundagi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocketIO.h"

@interface SocketConnection : NSObject <SocketIODelegate>

+(SocketConnection*)sharedSocketConnection;
-(void)setUpSocketConnection;
@property (nonatomic, strong)SocketIO *socketIO;

@property (nonatomic, strong)NSString *message;

@end
