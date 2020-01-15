//
//  MessageCell.m
//  TableViewCellKVO
//
//  Created by Destiny on 2020/1/15.
//  Copyright © 2020 Destiny. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    self.bradgeView.layer.masksToBounds = YES;
    self.bradgeView.layer.cornerRadius = 5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMsgModel:(MessageModel *)msgModel{
    _msgModel = msgModel;
    self.msgLbl.text = msgModel.msgTitle;
    if ([msgModel.isRead integerValue] == 1) {
        self.bradgeView.hidden = YES;
    }else{
         self.bradgeView.hidden = NO;
    }
    
    [msgModel addObserver:self forKeyPath:@"isRead" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"isRead"] && [object isKindOfClass:[MessageModel class]]) {
        
        if ([self.msgModel.isRead integerValue] == 1) {
            _bradgeView.hidden = YES;
        }
    }
}

@end
