//
//  MessageModel.h
//  TableViewCellKVO
//
//  Created by Destiny on 2020/1/15.
//  Copyright © 2020 Destiny. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageModel : NSObject

@property (copy, nonatomic) NSString *msgTitle;
@property (copy, nonatomic) NSString *isRead;

@end

NS_ASSUME_NONNULL_END
