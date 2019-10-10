//
//  GYLBaseAlertView.h
//  TruckDispatcher
//
//  Created by 连李军 on 2019/6/14.
//  Copyright © 2019 zhonghua. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum AlertStyle{
    GYLAlertStyleNormal,
    GYLAlertStyleInput,///非必填时候用这个
   GYLAlertStyleMustInput,///必填用这个，会不消失
    
}GYLAlertStyle;

@interface GYLBaseAlertView : UIView
@property (nonatomic,copy)void(^takeInputContentBlock)(NSString * string);
@property (nonatomic,assign) GYLAlertStyle alertStyle;
@property (nonatomic,assign) NSInteger maxLength;
@property (nonatomic,strong) UIView *alertBackView;
@property (nonatomic,strong) UILabel *placeHolderLabel;


- (id)initWithTittle:(NSString *)tittle message:(NSString *)message cancelTittle:(NSString *)cancelTittle confirmTittle:(NSString *)confirmTittle style:(GYLAlertStyle)style;
@end

NS_ASSUME_NONNULL_END
