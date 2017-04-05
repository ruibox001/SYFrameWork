//
//  UdpSocket.h
//  SmartHome3.0
//
//  Created by 王声远 on 15/6/27.
//  Copyright (c) 2015年 anody. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TcpSocket : NSObject

+ (instancetype) shareTcpSocket;

- (void)connect:(NSString *)host port:(int)port;

- (void)disConnect;

- (BOOL)isConnected;

- (void)reConnect;

- (void)sendData:(NSData *)data;

@end
