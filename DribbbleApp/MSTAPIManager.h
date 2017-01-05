//
//  MSTAPIManager.h
//  DribbbleApp
//
//  Created by MonsterSucker on 06/01/2017.
//  Copyright © 2017 MonsterTech Studio. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface MSTAPIManager : AFHTTPSessionManager

+ (id)sharedManager;

@end
