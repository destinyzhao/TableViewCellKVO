//
//  MessageController.m
//  TableViewCellKVO
//
//  Created by Destiny on 2020/1/15.
//  Copyright © 2020 Destiny. All rights reserved.
//

#import "MessageController.h"
#import "MessageCell.h"
#import "MessageModel.h"

@interface MessageController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *msgDataArr;

@end

@implementation MessageController

- (NSMutableArray *)msgDataArr{
    if (!_msgDataArr) {
        _msgDataArr = [NSMutableArray array];
    }
    return _msgDataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupTableViewCell];
    [self loadData];
}

- (void)setupTableViewCell{
    [self.tableView registerNib:[UINib nibWithNibName:@"MessageCell" bundle:nil] forCellReuseIdentifier:@"MessageCell"];
}

- (void)loadData{
    for (NSInteger i = 0; i < 30; i++) {
        MessageModel *msgModel = [MessageModel new];
        msgModel.msgTitle = [NSString stringWithFormat:@"消息标题-%zd",i];
        msgModel.isRead = @"0";
        [self.msgDataArr addObject:msgModel];
    }
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _msgDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageCell *msgCell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
    if (_msgDataArr.count > indexPath.row) {
        MessageModel *msgModel = _msgDataArr[indexPath.row];
        [msgCell setMsgModel:msgModel];
    }
    return msgCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageModel *msgModel = _msgDataArr[indexPath.row];
    if ([msgModel.isRead integerValue] != 1) {
        msgModel.isRead = @"1";
    }
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (_msgDataArr.count > indexPath.row) {
         MessageModel *msgModel = _msgDataArr[indexPath.row];
        [msgModel addObserver:cell forKeyPath:@"isRead" options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
     if (_msgDataArr.count > indexPath.row) {
          MessageModel *msgModel = _msgDataArr[indexPath.row];
         [msgModel removeObserver:cell forKeyPath:@"isRead"];
     }
 }


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.f;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
