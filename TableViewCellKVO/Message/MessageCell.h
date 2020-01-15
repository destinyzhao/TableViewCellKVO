//
//  MessageCell.h
//  TableViewCellKVO
//
//  Created by Destiny on 2020/1/15.
//  Copyright © 2020 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *msgLbl;
@property (weak, nonatomic) IBOutlet UIView *bradgeView;
@property (strong, nonatomic) MessageModel *msgModel;

@end

NS_ASSUME_NONNULL_END
