//
//  GYLBaseAlertView.m
//  TruckDispatcher
//
//  Created by 连李军 on 2019/6/14.
//  Copyright © 2019 zhonghua. All rights reserved.
//

#import "GYLBaseAlertView.h"
@interface GYLBaseAlertView ()<UITextViewDelegate>
@property (nonatomic,strong) UILabel *tittleLabel;
@property (nonatomic,strong) UILabel *messageLabel;
@property (nonatomic,strong) UIButton *confirmBtn;
@property (nonatomic,strong) UIButton *cancleBtn;
@property (nonatomic,strong) UITextView *inputTextView;
@property (nonatomic,strong) UIView *bottomLine;
@property (nonatomic,strong) UIView *bottomMidLine;
@property (nonatomic,copy) NSString *tittle;
@property (nonatomic,copy) NSString *message;
@property (nonatomic,copy) NSString *alertContent;
@end


@implementation GYLBaseAlertView

- (id)initWithTittle:(NSString *)tittle message:(NSString *)message cancelTittle:(NSString *)cancelTittle confirmTittle:(NSString *)confirmTittle style:(GYLAlertStyle)style{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0.0, 0.0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.backgroundColor = [UIColor colorWithHex:0x999999 alpha:0.7];
        [self createUi];
        self.tittle = tittle;
        self.message = message;
        self.alertStyle = style;
        [self.cancleBtn setTitle:cancelTittle forState:0];
        [self.confirmBtn setTitle:confirmTittle forState:0];
        [self caltureTheBackViewHeight];
    }
    return self;
}
- (void)createUi{
    [self addSubview:self.alertBackView];
    [self.alertBackView addSubview:self.tittleLabel];
    [self.alertBackView addSubview:self.messageLabel];
    [self.alertBackView addSubview:self.cancleBtn];
    [self.alertBackView addSubview:self.confirmBtn];
    [self.alertBackView addSubview:self.bottomLine];
    [self.alertBackView addSubview:self.bottomMidLine];
    [self.alertBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@32.5);
        make.right.equalTo(@-32.5);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(@170);
    }];
    [self.tittleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.top.equalTo(@20);
        make.height.equalTo(@25);
    }];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.top.equalTo(self.tittleLabel.mas_bottom).offset(20);
        make.height.equalTo(@21);
    }];
    [self.cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.height.equalTo(@50);
        make.right.mas_equalTo(self.mas_centerX);
        make.bottom.equalTo(@-6);
    }];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@0);
        make.height.equalTo(@50);
        make.left.mas_equalTo(self.mas_centerX);
        make.bottom.equalTo(@-6);
    }];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-56);
        make.height.equalTo(@0.5);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
    }];
    [self.bottomMidLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.width.equalTo(@0.5);
        make.height.equalTo(@56);
        make.left.mas_equalTo((SCREEN_WIDTH-65)/2-0.25);
    }];
    
}
- (void)cancleTheAlert{
    [self removeFromSuperview];
    
}
- (void)confirmTheAlert{
    [self.inputTextView endEditing:YES];
    if (self.takeInputContentBlock) {
        self.takeInputContentBlock(self.inputTextView.text);
    }
    if (self.alertStyle!=GYLAlertStyleMustInput) {
        [self removeFromSuperview];
    }else{
        ///如果是输入框有文字可以消失，不然就不消失
        if (self.inputTextView.text.length>0) {
             [self removeFromSuperview];
        }
    }
}
- (CGFloat)caltureStringSize:(NSString *)string font:(UIFont *)font{
    CGSize stringSize = [string sizeWithFont:font maxSize:CGSizeMake(SCREEN_WIDTH-65-40, MAXFLOAT)];
    return stringSize.height;
}
#pragma mark --textviewdelegate--
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if (textView.text.length>0) {
        self.placeHolderLabel.hidden = YES;
    }else{
        self.placeHolderLabel.hidden = NO;
    }
    
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length>0) {
        self.placeHolderLabel.hidden = YES;
    }else{
        self.placeHolderLabel.hidden = NO;
    }
    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
    NSInteger textMaxLength = 100;
    if (self.maxLength > 0) {
        textMaxLength = self.maxLength;
    }
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textView markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (textView.text.length > textMaxLength) {
                textView.text = [textView.text substringToIndex:textMaxLength];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
        }
        
        
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (textView.text.length > textMaxLength) {
            textView.text = [textView.text substringToIndex:textMaxLength];
        }
    }
}
- (void)setTittle:(NSString *)tittle{
    _tittle = tittle;
    if (![NSString isNull:tittle]) {
        self.tittleLabel.text = tittle;
        CGFloat tittleHeight = [self caltureStringSize:tittle font:[UIFont pingFangSCWithWeight:FontWeightStyleMedium size:18]];
        [self.tittleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@20);
            make.height.mas_equalTo(tittleHeight);
        }];
    }else{
        [self.tittleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
            make.height.mas_equalTo(@0.01);
        }];
    }
}
- (void)setMessage:(NSString *)message{
       _message = message;
    if (![NSString isNull:message]) {
        self.messageLabel.text = message;
        CGFloat messageheight = [self caltureStringSize:message font:[UIFont pingFangSCWithWeight:FontWeightStyleRegular size:14]];
        [self.messageLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(messageheight+2);
        }];
    }else{
        [self.messageLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0.01);
        }];
    }
}
- (void)setAlertStyle:(GYLAlertStyle)alertStyle{
    _alertStyle = alertStyle;
    if (alertStyle==GYLAlertStyleNormal) {
        [self.inputTextView removeFromSuperview];
        [self.placeHolderLabel removeFromSuperview];
    }else{
        [self.alertBackView addSubview:self.inputTextView];
        [self.inputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.bottomLine.mas_top).offset(-20);
            make.height.equalTo(@100);
            make.left.equalTo(@20);
            make.right.equalTo(@-20);
        }];
        [self.inputTextView addSubview:self.placeHolderLabel];
        [self.placeHolderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@10);
            make.top.equalTo(@10);
            make.height.equalTo(@20);
            make.width.equalTo(@100);
        }];
    }
}
- (void)caltureTheBackViewHeight{
    CGFloat height = 170;
    if (![NSString isNull:self.tittle]) {
        CGFloat tittleHeight = [self caltureStringSize:self.tittle font:[UIFont pingFangSCWithWeight:FontWeightStyleMedium size:18]];
        if (tittleHeight>25) {
            height+=tittleHeight-25;
        }
    }else{
        height-=25;
    }
    if (![NSString isNull:self.message]) {
        CGFloat messageheight = [self caltureStringSize:self.message font:[UIFont pingFangSCWithWeight:FontWeightStyleRegular size:14]];
        if (messageheight>20) {
            height+=messageheight-20;
        }
    }else{
        height-=20;
    }
    if (self.alertStyle==GYLAlertStyleInput||self.alertStyle==GYLAlertStyleMustInput) {
        height+=100;
    }
    [self.alertBackView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
}
- (UIView *)alertBackView{
    if (!_alertBackView) {
        _alertBackView = [[UIView alloc] init];
        _alertBackView.backgroundColor = [UIColor colorWithHex:0xffffff alpha:1];
        _alertBackView.layer.cornerRadius = 8.0f;
    }
    return _alertBackView;
}
- (UILabel *)tittleLabel{
    if (!_tittleLabel) {
        _tittleLabel = [[UILabel alloc] init];
        _tittleLabel.textAlignment = NSTextAlignmentCenter;
        _tittleLabel.font = [UIFont pingFangSCWithWeight:FontWeightStyleMedium size:18];
        _tittleLabel.textColor = [UIColor colorWithHex:0x333333 alpha:1];
        _tittleLabel.numberOfLines = 0;
    }
    return _tittleLabel;
}
- (UILabel *)messageLabel{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.textAlignment = NSTextAlignmentLeft;
        _messageLabel.font = [UIFont pingFangSCWithWeight:FontWeightStyleRegular size:14];
        _messageLabel.textColor = [UIColor colorWithHex:0x333333 alpha:1];
        _messageLabel.numberOfLines = 0;
    }
    return _messageLabel;
}
- (UITextView *)inputTextView{
    if (!_inputTextView) {
        _inputTextView = [[UITextView alloc] init];
        _inputTextView.textColor = [UIColor colorWithHex:0x333333 alpha:1];
        _inputTextView.font = [UIFont pingFangSCWithWeight:FontWeightStyleRegular size:14];
        _inputTextView.textAlignment = NSTextAlignmentLeft;
        _inputTextView.delegate = self;
        _inputTextView.layer.cornerRadius=8.0f;
        _inputTextView.layer.borderWidth = 0.5f;
        _inputTextView.layer.borderColor = [UIColor colorWithHex:0xdddddd alpha:1].CGColor;
        
    }
    return _inputTextView;
}
- (UILabel *)placeHolderLabel{
    if (!_placeHolderLabel) {
        _placeHolderLabel =[[UILabel alloc] init];
        _placeHolderLabel.textColor = [UIColor colorWithHex:0x999999 alpha:1];
        _placeHolderLabel.font = [UIFont pingFangSCWithWeight:FontWeightStyleRegular size:14];
        _placeHolderLabel.textAlignment = NSTextAlignmentLeft;
        _placeHolderLabel.text = @"请输入拒绝原因";
    }
    return _placeHolderLabel;
}
- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine. backgroundColor = [UIColor colorWithHex:0xD8D8D8 alpha:1];
    }
    return _bottomLine;
}
- (UIView *)bottomMidLine{
    if (!_bottomMidLine) {
        _bottomMidLine = [[UIView alloc] init];
        _bottomMidLine.backgroundColor = [UIColor colorWithHex:0xD8D8D8 alpha:1];
    }
    return _bottomMidLine;
}
- (UIButton *)cancleBtn{
    if (!_cancleBtn) {
        _cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancleBtn setTitleColor:[UIColor colorWithHex:0x99948D alpha:1] forState:0];
        [_cancleBtn setBackgroundColor:[UIColor colorWithHex:0xffffff alpha:1]];
        _cancleBtn.titleLabel.font = [UIFont pingFangSCWithWeight:FontWeightStyleRegular size:18];
        [_cancleBtn addTarget:self action:@selector(cancleTheAlert) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleBtn;
}
- (UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmBtn setBackgroundColor:[UIColor colorWithHex:0xffffff alpha:1]];
        [_confirmBtn setTitleColor:[UIColor colorWithHex:0x333333 alpha:1] forState:0];
        _confirmBtn.titleLabel.font = [UIFont pingFangSCWithWeight:FontWeightStyleRegular size:18];
        [_confirmBtn addTarget:self action:@selector(confirmTheAlert) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
