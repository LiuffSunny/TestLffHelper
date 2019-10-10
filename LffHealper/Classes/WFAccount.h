//
//  WFAccount.h
//  WFBEST
//
//  Created by 刘芳芳 on 15/2/26.
//  Copyright (c) 2015年 51fanxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFAccount : NSObject<NSCoding>
/** 姓名*/
@property (nonatomic, copy) NSString *userName;
/** 用户ID*/
@property (nonatomic, copy) NSString *userId;
/// token
@property (nonatomic, copy) NSString *accessToken;
/** 手机号*/
@property (nonatomic, copy) NSString *phoneCode;
/** 性别*/
@property (nonatomic, copy) NSString *gender;
/** 身份证URL */
@property (nonatomic, copy) NSString *idcardImg;
/** 专业*/
@property (nonatomic, copy) NSString *birthday;
/** 驾驶证URL*/
@property (nonatomic, copy) NSString *drivingLicenceImg;

/** 挂靠物流公司ID*/
@property (nonatomic, copy) NSString *fleetId;
/// 审核状态
// 业务Status：待审核：0  正常/审核通过：1  审核拒绝：2  禁用/删除：3  未申请：4
@property (nonatomic, copy) NSString *status;
// 司机是否有挂靠成功的公司 0 没有 非0 就是有
@property (nonatomic, copy) NSString *hasCompany;
@property (nonatomic,strong) NSString *lastADtime;

//是否过期
@property (nonatomic,copy) NSString *isEffective;//是否过期

//司机状态 0：运营平台审核通过---------------30,"审核通过页面" ***********
//***** 4:司机未完善资料------------------10,"登记入驻页面" ******
//********** 5：运营平台待审核司机(审核中)-----20,"审核进度查看页面" *******
//********* 6：修改被拒绝(运营后台拒绝)-------110,"再次审核被拒绝页面" ******
//********** 7：运营平台拒绝司机(未通过)-------40,"审核拒绝页面" *******
//********* 9：修改资料待审核-----------------120,"再次待审核(司机特有)" ********
@property (nonatomic, copy) NSString *pageType;

/**
 审核拒绝原因((pageType=40时)
 */
@property (nonatomic, copy) NSString *rejectReason;

/**
 用户类型
 10:货主
 11:物流(承运商)
 12:司机
 13:仓储
 14:活动
 15:运营后台
 16:游客/未知身份
 */
@property (nonatomic, copy) NSString *userType;

/**
 是否管理员
 0:否(员工)
 1:是(管理)
 */
@property (nonatomic, copy) NSString *isAdmin;
/// 中台globalToken
@property (nonatomic, copy) NSString *globalToken;

/// 首页数据处理1代表打开(insurance服务控制3.3+版本)
@property (nonatomic, copy) NSString *insuranceFlag;
///用户权限版本
@property (nonatomic, copy) NSString *auth;
@end
