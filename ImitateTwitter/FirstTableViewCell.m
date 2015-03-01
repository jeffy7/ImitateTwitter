//
//  FirstTableViewCell.m
//  ImitateTwitter
//
//  Created by je_ffy on 15/2/10.
//  Copyright (c) 2015年 je_ffy. All rights reserved.
//

#import "FirstTableViewCell.h"

@interface FirstTableViewCell ()

@end

@implementation FirstTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIView *halfBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, self.frame.size.width, 50)];
        halfBackView.backgroundColor = [UIColor whiteColor];
        [self addSubview:halfBackView];
        self.backgroundColor = [UIColor cyanColor];
        self.showImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
        self.showImageView.image = [UIImage imageNamed:@"1"];
        [self addSubview:self.showImageView];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
