/*
Navicat MySQL Data Transfer

Source Server         : 司米生产区库
Source Server Version : 50628
Source Host           : 10.18.101.234:3306
Source Database       : sm_sogal

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2018-03-16 15:22:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wms_allocation
-- ----------------------------
DROP TABLE IF EXISTS `wms_allocation`;
CREATE TABLE `wms_allocation` (
  `ID` varchar(60) NOT NULL,
  `ALLOCATION_ID` varchar(60) DEFAULT NULL COMMENT '调拨单号',
  `OUT_WAREHOUSE_ID` varchar(60) DEFAULT NULL COMMENT '对应的出库单号',
  `IN_WAREHOUSE_ID` varchar(60) DEFAULT NULL COMMENT '对应的入库单号',
  `STATE` varchar(60) DEFAULT NULL COMMENT '调拨单的状态：待出库；已出待入；已入库',
  `FOUNDER` varchar(60) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` varchar(60) DEFAULT NULL COMMENT '创建时间',
  `DEALER_ORG` varchar(60) DEFAULT NULL COMMENT '经销商id',
  `IS_DELETE` varchar(5) DEFAULT NULL COMMENT '是否删除，1为是，0为否',
  `REMARKS` varchar(255) DEFAULT NULL,
  `OUT_DEPOT_NAME` varchar(60) DEFAULT NULL,
  `OUT_DEPOT` varchar(60) DEFAULT NULL COMMENT '出库仓',
  `IN_DEPOT_NAME` varchar(60) DEFAULT NULL,
  `IN_DEPOT` varchar(60) DEFAULT NULL,
  `REMARKS2` varchar(60) DEFAULT NULL,
  `REMARKS3` varchar(60) DEFAULT NULL,
  `REMARKS4` varchar(255) DEFAULT NULL,
  `REMARKS5` varchar(255) DEFAULT NULL,
  `REMARKS6` varchar(255) DEFAULT NULL,
  `FOUNDER_NAME` varchar(60) DEFAULT NULL COMMENT '创建者姓名',
  `BILL_TYPE` varchar(5) DEFAULT NULL COMMENT '单据类型（0、移仓单 1：移仓审批单）',
  `BILL_STATE` varchar(20) DEFAULT NULL COMMENT '编辑、提交审批、驳回、审批通过',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_allocation_goods
-- ----------------------------
DROP TABLE IF EXISTS `wms_allocation_goods`;
CREATE TABLE `wms_allocation_goods` (
  `ID` varchar(80) NOT NULL,
  `ALLOCATION_ID` varchar(80) DEFAULT NULL COMMENT '调拨单号',
  `GOODS_CODE` varchar(80) DEFAULT NULL COMMENT '商品编码',
  `GOODS_NAME` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `GOODS_CLASS_CODE` varchar(80) DEFAULT NULL COMMENT '商品分类编号',
  `GOODS_BARCODE` varchar(80) DEFAULT NULL COMMENT '商品条形码',
  `ALLOCATION_NUM` varchar(80) DEFAULT NULL COMMENT '调拨数量',
  `DEALER_ORG` varchar(60) DEFAULT NULL COMMENT '经销商id',
  `OCCUPANCYQUANTITY` double(20,2) DEFAULT '0.00' COMMENT '可销售仓调拨到不可销售仓未出库的时候占用数量',
  `REMARKS2` varchar(60) DEFAULT NULL,
  `REMARKS3` varchar(60) DEFAULT NULL,
  `REMARKS4` varchar(60) DEFAULT NULL,
  `REMARKS5` varchar(60) DEFAULT NULL,
  `REMARKS6` varchar(60) DEFAULT NULL,
  `IS_DELETE` varchar(60) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_contract
-- ----------------------------
DROP TABLE IF EXISTS `wms_contract`;
CREATE TABLE `wms_contract` (
  `ID` varchar(50) NOT NULL,
  `CONTRAC_ID` varchar(55) DEFAULT NULL COMMENT '合同ID',
  `CONTRACT_NAME` varchar(55) DEFAULT NULL COMMENT '合同名',
  `FILE_URL` varchar(200) DEFAULT NULL COMMENT '合同存放地址',
  `SUPPLIER_NAME` varchar(55) DEFAULT NULL COMMENT '供应商名',
  `SUPPLIER_ID` varchar(55) DEFAULT NULL COMMENT '供应商Id',
  `IS_DELETE` varchar(55) DEFAULT NULL COMMENT '是否删除',
  `REMARKS1` varchar(55) DEFAULT NULL COMMENT '备注',
  `REMARKS2` varchar(55) DEFAULT NULL COMMENT '备注',
  `REMARKS3` varchar(55) DEFAULT NULL COMMENT '备注',
  `UPLOAD_TIME` datetime DEFAULT NULL COMMENT '上传时间',
  `OPERATOR` varchar(55) DEFAULT NULL COMMENT '上传人',
  `FILE_NAME` varchar(200) DEFAULT NULL COMMENT '唯一文件名',
  `DELETE_PERSON` varchar(50) DEFAULT NULL,
  `DELETE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_cost_meter
-- ----------------------------
DROP TABLE IF EXISTS `wms_cost_meter`;
CREATE TABLE `wms_cost_meter` (
  `UUID` varchar(64) NOT NULL COMMENT '主键',
  `ODDNUMBER` varchar(100) DEFAULT NULL COMMENT '批次ID',
  `GOODS_CODE` varchar(255) DEFAULT NULL COMMENT '商品编号',
  `GOODS_NAME` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `DEPOT_ID` varchar(100) DEFAULT NULL COMMENT '仓库ID',
  `DEPOT_NAME` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `DEPARTMENT_NAME` varchar(50) DEFAULT NULL COMMENT '所属部门名称',
  `DEPARTMENT_ID` varchar(64) DEFAULT NULL COMMENT '所属部门ID',
  `ADVANCE_UNIT_PRICE` double(100,4) DEFAULT NULL COMMENT '计提前单价',
  `ACCRUED_NUMBER` double(100,2) DEFAULT NULL COMMENT '计提数量',
  `AFTER_COUNTING_UNIT_PRICE` double(100,4) DEFAULT NULL COMMENT '计提后单价',
  `AMOUNT_OF_MONEY` double(100,4) DEFAULT NULL COMMENT '计提金额（=计提前批次金额*计提比率）',
  `FINANCIAL_YEAR` varchar(4) DEFAULT NULL COMMENT '计提财务年',
  `FINANCIAL_MONTH` varchar(2) DEFAULT NULL COMMENT '计提财务月',
  `LAST_UPDATE_DATE` datetime DEFAULT NULL COMMENT '最后更新时间',
  `LAST_UPDATED_BY` varchar(50) DEFAULT NULL COMMENT '最后更新者',
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_depot
-- ----------------------------
DROP TABLE IF EXISTS `wms_depot`;
CREATE TABLE `wms_depot` (
  `UUID` varchar(50) NOT NULL COMMENT '默认主键',
  `DEPOT_ID` varchar(50) NOT NULL COMMENT '仓库编号',
  `DEPOT_NAME` varchar(50) NOT NULL COMMENT '仓库名称',
  `DEPOT_TYPE` varchar(50) DEFAULT NULL COMMENT '仓库类型',
  `DEPOT_AREA` varchar(20) DEFAULT NULL COMMENT '仓库面积',
  `DEPOT_ADDRESS` varchar(255) DEFAULT NULL COMMENT '仓库地址',
  `PERSON_IN_CHARGE` varchar(255) DEFAULT NULL,
  `CONTACT_NUMBER` varchar(255) DEFAULT NULL,
  `DEPOT_STATUS` varchar(2) NOT NULL DEFAULT '1' COMMENT '仓库状态默认为：1 启用',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '备注',
  `DEALER_ORG` varchar(64) DEFAULT NULL COMMENT '经销商id',
  `DEPARTMENT_NAME` varchar(50) DEFAULT NULL COMMENT '所属部门名称',
  `DEPARTMENT_ID` varchar(64) DEFAULT NULL COMMENT '所属部门ID',
  `SPARE1` varchar(255) DEFAULT NULL,
  `SPARE2` varchar(255) DEFAULT NULL,
  `SPARE3` varchar(255) DEFAULT NULL,
  `SPARE4` varchar(255) DEFAULT NULL,
  `SPARE5` varchar(255) DEFAULT NULL,
  `STOCK_STATE` varchar(2) DEFAULT '0' COMMENT '盘点状态：0未盘点',
  `TYPE_STATE` varchar(3) DEFAULT '0' COMMENT '仓库类型状态 默认0.正常（1.残次2.虚拟）',
  `WHETHER_ACCRUED` varchar(2) DEFAULT NULL COMMENT '是否计提(0:否,1是)',
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_depot_emp
-- ----------------------------
DROP TABLE IF EXISTS `wms_depot_emp`;
CREATE TABLE `wms_depot_emp` (
  `NO` int(11) NOT NULL COMMENT '主键',
  `DEPOT_ID` varchar(50) DEFAULT NULL COMMENT '仓库编号',
  `USER_ID` varchar(50) DEFAULT NULL COMMENT '负责人ID',
  `PERSON_IN_CHARGE` varchar(20) DEFAULT NULL COMMENT '负责人',
  `CONTACT_NUMBER` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `IS_DELETE` varchar(10) DEFAULT '0' COMMENT '是否删除',
  `ADRESS` varchar(60) DEFAULT NULL,
  `SPARE1` varchar(100) DEFAULT NULL,
  `SPARE2` varchar(100) DEFAULT NULL,
  `SPARE3` varchar(100) DEFAULT NULL,
  `SPARE4` varchar(100) DEFAULT NULL,
  `SPARE5` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_detailedoutstoreroom
-- ----------------------------
DROP TABLE IF EXISTS `wms_detailedoutstoreroom`;
CREATE TABLE `wms_detailedoutstoreroom` (
  `DETAILEDOUTSTOREROOMID` varchar(255) NOT NULL,
  `PRODUCTNUMBER` varchar(30) DEFAULT NULL COMMENT '货品编号',
  `PRODUCTNAME` varchar(100) DEFAULT NULL COMMENT '货品名称',
  `PRICE` varchar(10) DEFAULT NULL COMMENT '价格',
  `QUANTITY` int(10) DEFAULT NULL COMMENT '数量',
  `STORAGELOCATION` varchar(10) DEFAULT NULL COMMENT '库位',
  `OUTSTOREROOMID` varchar(255) DEFAULT NULL,
  `ISDELETE` int(1) unsigned zerofill DEFAULT '0',
  `TEMP1` varchar(50) DEFAULT NULL,
  `TEMP2` varchar(50) DEFAULT NULL,
  `TEMP3` varchar(50) DEFAULT NULL,
  `TEMP4` varchar(50) DEFAULT NULL,
  `TEMP5` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DETAILEDOUTSTOREROOMID`),
  KEY `outStoreroomID` (`OUTSTOREROOMID`),
  CONSTRAINT `WMS_DETAILEDOUTSTOREROOM_ibfk_1` FOREIGN KEY (`OUTSTOREROOMID`) REFERENCES `wms_outstoreroom` (`OUTSTOREROOMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_extract
-- ----------------------------
DROP TABLE IF EXISTS `wms_extract`;
CREATE TABLE `wms_extract` (
  `CWRECORDID` varchar(60) NOT NULL COMMENT '主键',
  `REPORTNUM` varchar(40) DEFAULT NULL COMMENT '月份关联流水号',
  `ODDNUMBER` varchar(50) DEFAULT NULL COMMENT '入库/出库单号',
  `CURRENTTIME` datetime NOT NULL COMMENT '操作时间',
  `GOODSCODE` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `GOODSNAME` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `QUANTITY` double(100,2) DEFAULT NULL COMMENT '数量',
  `INQUANTITY` double(50,2) DEFAULT NULL COMMENT '库存数量',
  `PRICE` double(20,2) DEFAULT NULL COMMENT '价格',
  `DEPOTCODE` varchar(50) DEFAULT NULL COMMENT '仓库编号',
  `DEPOTNAME` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `DEPOTLOCATION` varchar(20) DEFAULT NULL COMMENT '库位',
  `TYPE` varchar(28) DEFAULT NULL COMMENT '出库/入库类型',
  `PERSONNL` varchar(60) DEFAULT NULL COMMENT '操作人',
  `FLAG` double(1,0) DEFAULT NULL COMMENT '出库/入库标记（0出库,1入库）',
  `PROVIDERID` varchar(50) DEFAULT NULL COMMENT '供应商',
  `BATCHNUMBER` varchar(50) DEFAULT NULL COMMENT '批次单号（入库单号）',
  `ISDELETE` varchar(50) DEFAULT NULL COMMENT '0未删除，1已删除',
  `MONEY` double(100,2) DEFAULT '0.00' COMMENT '金额',
  `SPARE1` varchar(100) DEFAULT NULL COMMENT '备用字段1',
  `SPARE2` varchar(100) DEFAULT NULL COMMENT '备用字段2',
  `SPARE3` varchar(100) DEFAULT NULL COMMENT '备用字段3',
  `SPARE4` varchar(100) DEFAULT NULL COMMENT '备用字段4',
  `SPARE5` varchar(100) DEFAULT NULL COMMENT '备用字段5',
  `PROVIDERNAME` varchar(255) DEFAULT NULL COMMENT '供应商名字',
  `SOURCEODDNUMBER` varchar(50) DEFAULT NULL COMMENT '来源单号',
  `ENGINEERING_CLIENTS` varchar(60) DEFAULT NULL COMMENT '工程客户',
  `UPDATETIME` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`CWRECORDID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_getgoods_list
-- ----------------------------
DROP TABLE IF EXISTS `wms_getgoods_list`;
CREATE TABLE `wms_getgoods_list` (
  `SERIAL_ID` varchar(20) NOT NULL DEFAULT '' COMMENT '序号',
  `RECEIPT_NO` varchar(20) DEFAULT NULL COMMENT '收货单号',
  `MAIN_ID` varchar(20) DEFAULT NULL COMMENT '主单号',
  `SON_ID` varchar(20) DEFAULT NULL COMMENT '子单号',
  `QUANTITY_DELIVERED` varchar(20) DEFAULT NULL COMMENT '到货数量',
  `PARCEL_QUANTITY` varchar(20) DEFAULT NULL COMMENT '包裹数量',
  `PACKAGE_NUMBER` varchar(20) DEFAULT NULL COMMENT '包裹号',
  `CONSIGNEE` varchar(50) DEFAULT NULL COMMENT '收货人',
  `CONSIGNOR` varchar(20) DEFAULT NULL COMMENT '发货人',
  `RISE_TIME` datetime DEFAULT NULL COMMENT '生成时间',
  `SERVICE_TYPE` varchar(2) DEFAULT NULL COMMENT '业务类型',
  `ACTUAL_ARRIVAL` varchar(20) DEFAULT NULL COMMENT '实际到货数量',
  `IS_DELETE` varchar(20) DEFAULT '0' COMMENT '删除状态',
  `NOTE` varchar(20) DEFAULT NULL COMMENT '备注',
  `BACK1` varchar(128) DEFAULT NULL COMMENT '经销商ID',
  `BACK2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `BACK3` varchar(20) DEFAULT NULL COMMENT '备用3',
  `BACK4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `BACK5` varchar(20) DEFAULT NULL COMMENT '备用5',
  `CLIENT_CODE` varchar(50) DEFAULT NULL COMMENT '经销商编码',
  `IS_TYPE` varchar(10) DEFAULT NULL COMMENT '货单的类型，0.收货，1.发货,2.收不存在，3.发不存在',
  PRIMARY KEY (`SERIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_godown_details
-- ----------------------------
DROP TABLE IF EXISTS `wms_godown_details`;
CREATE TABLE `wms_godown_details` (
  `ID` varchar(255) NOT NULL,
  `NUMBER` varchar(50) DEFAULT NULL COMMENT '入库单号',
  `PURCHASECODE` varchar(50) DEFAULT NULL COMMENT '采购单号',
  `STORAGELOCATION` varchar(10) DEFAULT NULL COMMENT '库位',
  `GOODSCODE` varchar(255) DEFAULT NULL,
  `GOODSNAME` varchar(255) DEFAULT NULL,
  `GOODSTYPE` varchar(30) DEFAULT NULL COMMENT '商品类型',
  `GOODSNUMBER` varchar(30) DEFAULT NULL COMMENT '商品数量',
  `GOODSPRICE` varchar(20) NOT NULL DEFAULT '' COMMENT '商品价格',
  `REMARK` varchar(30) DEFAULT NULL COMMENT '备注',
  `ISDELETE` varchar(1) DEFAULT NULL COMMENT '删除状态',
  `SPARE` varchar(55) DEFAULT NULL COMMENT '备用',
  `SPARE2` varchar(55) DEFAULT NULL COMMENT '备用',
  `SPARE3` varchar(55) DEFAULT NULL COMMENT '备用',
  `SPARE4` varchar(55) DEFAULT NULL COMMENT '备用',
  `SPARE5` varchar(55) DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`ID`),
  KEY `NUMBER` (`NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_godownentry
-- ----------------------------
DROP TABLE IF EXISTS `wms_godownentry`;
CREATE TABLE `wms_godownentry` (
  `ID` varchar(255) NOT NULL,
  `NUMBER` varchar(50) NOT NULL COMMENT '入库单号',
  `DEALER_ORG` varchar(64) DEFAULT NULL COMMENT '经销商id',
  `BUSINESS_DOCUMENT_NO` varchar(50) DEFAULT NULL COMMENT '业务单号',
  `STORAGETIME` datetime DEFAULT NULL COMMENT '入库时间',
  `DEPOTNAME` varchar(50) DEFAULT NULL COMMENT '仓库',
  `WAREHOUSING_MODE` varchar(50) DEFAULT NULL COMMENT '入库方式',
  `OPERATOR` varchar(50) DEFAULT NULL COMMENT '操作人',
  `REMARKS` varchar(50) DEFAULT NULL COMMENT '备注',
  `IS_DELETE` varchar(10) DEFAULT NULL COMMENT '是否删除',
  `WAREHOUSE_LOCATION` varchar(50) DEFAULT NULL COMMENT '仓库地点',
  `BUSINESS_CLASS_TYPE` varchar(40) DEFAULT NULL COMMENT '业务单类型号',
  `GOODS_TYPE` varchar(15) DEFAULT NULL COMMENT '货品类型',
  `SPARE1` varchar(55) DEFAULT NULL COMMENT '备用字段',
  `SPARE2` varchar(55) DEFAULT NULL COMMENT '备用字段',
  `SPARE3` varchar(55) DEFAULT NULL COMMENT '备用字段',
  `SPARE4` varchar(55) DEFAULT NULL COMMENT '备用字段',
  `SPARE5` varchar(55) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_goods
-- ----------------------------
DROP TABLE IF EXISTS `wms_goods`;
CREATE TABLE `wms_goods` (
  `GOODS_ID` varchar(255) NOT NULL COMMENT '商品序号',
  `GOODS_CODE` varchar(255) DEFAULT NULL COMMENT '商品编码',
  `GOODS_NAME` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `GOODS_CLASS_CODE` varchar(255) DEFAULT NULL COMMENT '商品分类编号',
  `GOODS_BARCODE` varchar(255) DEFAULT NULL COMMENT '商品条形码',
  `DEALER_ORG` varchar(255) DEFAULT NULL COMMENT '经销商id',
  `UPDATE_TIME` datetime DEFAULT NULL,
  `ISDELETE` varchar(50) DEFAULT '0' COMMENT '是否删除',
  `REMARK` varchar(50) DEFAULT NULL COMMENT '备注',
  `OUT_STATUS` varchar(20) DEFAULT NULL COMMENT '外协/非外协',
  `STANDBY1` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `STANDBY2` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `STANDBY3` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `STANDBY4` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `STANDBY5` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `ERP_ID` varchar(255) DEFAULT NULL,
  `SELF_SUPPLIER` varchar(255) DEFAULT '0' COMMENT '是否自采供应商送货 （0为否（默认），1为是）',
  PRIMARY KEY (`GOODS_ID`),
  KEY `query_goods` (`GOODS_ID`,`GOODS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_goods_class_manage
-- ----------------------------
DROP TABLE IF EXISTS `wms_goods_class_manage`;
CREATE TABLE `wms_goods_class_manage` (
  `ID` varchar(50) NOT NULL COMMENT '主键',
  `DEALER_ORG` varchar(64) DEFAULT NULL COMMENT '经销商id',
  `CLASSCODE` varchar(20) DEFAULT NULL COMMENT '分类编号',
  `PARENTID` varchar(20) DEFAULT NULL COMMENT '分类父id',
  `CLASSNAME` varchar(50) DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_inventory
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory`;
CREATE TABLE `wms_inventory` (
  `INVENTORYID` varchar(20) NOT NULL COMMENT '主键',
  `GOODSCODE` varchar(28) DEFAULT NULL COMMENT '货品编号',
  `GOODSNAME` varchar(50) DEFAULT NULL COMMENT '货品名称',
  `BOOKQUANTITY` double(11,2) DEFAULT NULL COMMENT '账面库存数量',
  `ACTUALQUANTITY` double(11,2) DEFAULT NULL COMMENT '实际库存数量',
  `OVERAGE` double(11,2) DEFAULT NULL COMMENT '盘盈',
  `LOSS` double(11,2) DEFAULT NULL COMMENT '盘亏',
  `PRICE` double(50,2) DEFAULT '0.00' COMMENT '金额',
  `CURRENTTIME` datetime DEFAULT NULL COMMENT '操作时间',
  `DEPOTCODE` varchar(50) DEFAULT NULL COMMENT '仓库编号',
  `DEPOTNAME` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `DEPOTLOCATION` varchar(10) DEFAULT NULL COMMENT '库位',
  `SERIALNUMBER` varchar(50) DEFAULT NULL COMMENT '流水号',
  `HANDLE` varchar(1) DEFAULT NULL COMMENT '处理状态',
  `ISDELETE` varchar(1) DEFAULT NULL COMMENT '删除标记',
  `STANDBY1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `STANDBY2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  `STANDBY3` varchar(50) DEFAULT NULL COMMENT '备用字段3',
  `STANDBY4` varchar(50) DEFAULT NULL COMMENT '备用字段4',
  `STANDBY5` varchar(50) DEFAULT NULL COMMENT '备用字段5',
  `ACTUALAMOUNT` double(50,2) DEFAULT NULL,
  `ESTIMATEDAMOUNT` double(50,2) DEFAULT NULL,
  `STATE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`INVENTORYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_invoice_note
-- ----------------------------
DROP TABLE IF EXISTS `wms_invoice_note`;
CREATE TABLE `wms_invoice_note` (
  `SERIAL_ID` varchar(20) NOT NULL COMMENT '序号',
  `INVOICE_NO` varchar(20) DEFAULT NULL COMMENT '发货单号',
  `MAIN_ID` varchar(20) DEFAULT NULL COMMENT '主单号',
  `SON_ID` varchar(20) DEFAULT NULL COMMENT '子单号',
  `PACKAGE_NO` varchar(20) DEFAULT NULL COMMENT '包裹号',
  `NOTE` varchar(20) DEFAULT NULL COMMENT '备注',
  `RISE_TIME` datetime DEFAULT NULL COMMENT '生成时间',
  `DELETED_STATE` varchar(20) DEFAULT NULL COMMENT '删除状态',
  `PARCEL_QUANTITY` varchar(20) DEFAULT NULL COMMENT '包裹数量',
  `CONSIGNOR` varchar(20) DEFAULT NULL COMMENT '发货人',
  `PHONE` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `LOCATION` varchar(20) DEFAULT NULL COMMENT '地址',
  `BACK1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `BACK2` varchar(20) DEFAULT NULL COMMENT '备用2',
  `BACK3` varchar(20) DEFAULT NULL COMMENT '备用3',
  `BACK4` varchar(20) DEFAULT NULL COMMENT '备用4',
  `BACK5` varchar(20) DEFAULT NULL COMMENT '备用5',
  PRIMARY KEY (`SERIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_library
-- ----------------------------
DROP TABLE IF EXISTS `wms_library`;
CREATE TABLE `wms_library` (
  `UUID` varchar(50) NOT NULL COMMENT '默认主键',
  `ALIBRARY_ID` varchar(50) DEFAULT NULL COMMENT '库位编号',
  `ALIBRARY_NAME` varchar(50) DEFAULT NULL COMMENT '库位名称',
  `STORAGE_AREA` varchar(50) DEFAULT NULL COMMENT '库位面积',
  `ALIBRARY_STATUS` varchar(2) DEFAULT NULL COMMENT '库位状态',
  `DEPOT_ID` varchar(50) DEFAULT NULL COMMENT '仓库编号',
  `CLASS_THREE` varchar(50) DEFAULT NULL COMMENT '三级分类',
  `CLASS_TWO` varchar(50) DEFAULT NULL COMMENT '二级分类',
  `CLASS_ONE` varchar(50) DEFAULT NULL COMMENT '一级分类',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '备注',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `SPARE2` varchar(255) DEFAULT NULL,
  `SPARE3` varchar(255) DEFAULT NULL,
  `SPARE4` varchar(255) DEFAULT NULL,
  `SPARE5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_order_sheet
-- ----------------------------
DROP TABLE IF EXISTS `wms_order_sheet`;
CREATE TABLE `wms_order_sheet` (
  `UUID` varchar(50) NOT NULL COMMENT '默认主键',
  `OPP_ID` varchar(50) DEFAULT NULL COMMENT '商机ID',
  `OPP_CODE` varchar(50) DEFAULT NULL COMMENT '商机编号',
  `MAIN_ID` varchar(50) NOT NULL DEFAULT '' COMMENT '主单号',
  `SON_ID` varchar(50) NOT NULL COMMENT '子单号',
  `PACKAGE_NUMBER` varchar(50) NOT NULL COMMENT '工厂实发数量',
  `QUANTITY_DELIVERED` varchar(50) DEFAULT NULL COMMENT '到货数量',
  `CONSIGNEE_ID` varchar(50) DEFAULT NULL COMMENT '收货人ID',
  `CONSIGNEE_NAME` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `CONSIGNEE_PHONE` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `CONSIGNEE_ADDR` varchar(255) DEFAULT NULL COMMENT '收货人地址',
  `CONSIGNOR_ID` varchar(50) DEFAULT NULL COMMENT '发货人ID',
  `CONSIGNOR_NAME` varchar(50) DEFAULT NULL COMMENT '发货人姓名',
  `CONSIGNOR_PHONE` varchar(20) DEFAULT NULL COMMENT '发货人电话',
  `CONSIGNOR_ADDR` varchar(255) DEFAULT NULL COMMENT '发货人地址',
  `ORDER_STATUS` varchar(2) DEFAULT NULL COMMENT '订单状态：',
  `ARRIVAL_STATUS` varchar(2) DEFAULT '0' COMMENT '到货状态：0.未收货 1.部分收货 2.已收货 ',
  `IGT_ORDER_ID` varchar(50) DEFAULT NULL COMMENT 'IGT订单号',
  `CLIENT_CODE` varchar(50) DEFAULT NULL COMMENT '经销商编码',
  `DELIVERY_TIME` varchar(50) DEFAULT NULL COMMENT '到货时间',
  `ORG_ID` varchar(255) NOT NULL COMMENT '经销商ID',
  `ISDELETED` varchar(2) NOT NULL DEFAULT '0' COMMENT '删除状态：0.未删除 1.已删除',
  `OPERATING_TIME` varchar(50) DEFAULT NULL COMMENT '操作时间',
  `CREATION_DATE` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `SENDGOODS_QUANTITY` varchar(50) DEFAULT NULL COMMENT '发货的数量',
  `GOODSSDEL_STATUS` varchar(20) DEFAULT '0' COMMENT '发货状态 0 未发货（默认），1、部分发货  2、全部发货',
  `ORDER_TYPE` varchar(50) DEFAULT NULL COMMENT '订单类型：客户单，改补单，研发单，样品单，材料单',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `SPARE2` varchar(255) DEFAULT NULL,
  `SPARE3` varchar(255) DEFAULT NULL,
  `SPARE4` varchar(255) DEFAULT NULL,
  `SPARE5` varchar(255) DEFAULT NULL,
  `EXPECT_AMOUNT` varchar(50) NOT NULL COMMENT '预计发货数量',
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_order_sheet_copy
-- ----------------------------
DROP TABLE IF EXISTS `wms_order_sheet_copy`;
CREATE TABLE `wms_order_sheet_copy` (
  `UUID` varchar(50) NOT NULL COMMENT '默认主键',
  `OPP_ID` varchar(50) DEFAULT NULL COMMENT '商机ID',
  `OPP_CODE` varchar(50) DEFAULT NULL COMMENT '商机编号',
  `MAIN_ID` varchar(50) NOT NULL DEFAULT '' COMMENT '主单号',
  `SON_ID` varchar(50) NOT NULL COMMENT '子单号',
  `PACKAGE_NUMBER` varchar(50) NOT NULL COMMENT '工厂实发数量',
  `QUANTITY_DELIVERED` varchar(50) DEFAULT NULL COMMENT '到货数量',
  `CONSIGNEE_ID` varchar(50) DEFAULT NULL COMMENT '收货人ID',
  `CONSIGNEE_NAME` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `CONSIGNEE_PHONE` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `CONSIGNEE_ADDR` varchar(255) DEFAULT NULL COMMENT '收货人地址',
  `CONSIGNOR_ID` varchar(50) DEFAULT NULL COMMENT '发货人ID',
  `CONSIGNOR_NAME` varchar(50) DEFAULT NULL COMMENT '发货人姓名',
  `CONSIGNOR_PHONE` varchar(20) DEFAULT NULL COMMENT '发货人电话',
  `CONSIGNOR_ADDR` varchar(255) DEFAULT NULL COMMENT '发货人地址',
  `ORDER_STATUS` varchar(2) DEFAULT NULL COMMENT '订单状态：',
  `ARRIVAL_STATUS` varchar(2) DEFAULT '0' COMMENT '到货状态：0.未收货 1.部分收货 2.已收货 ',
  `IGT_ORDER_ID` varchar(50) DEFAULT NULL COMMENT 'IGT订单号',
  `CLIENT_CODE` varchar(50) DEFAULT NULL COMMENT '经销商编码',
  `DELIVERY_TIME` varchar(50) DEFAULT NULL COMMENT '到货时间',
  `ORG_ID` varchar(255) NOT NULL COMMENT '经销商ID',
  `ISDELETED` varchar(2) NOT NULL DEFAULT '0' COMMENT '删除状态：0.未删除 1.已删除',
  `OPERATING_TIME` varchar(50) DEFAULT NULL COMMENT '操作时间',
  `CREATION_DATE` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `SENDGOODS_QUANTITY` varchar(50) DEFAULT NULL COMMENT '发货的数量',
  `GOODSSDEL_STATUS` varchar(20) DEFAULT '0' COMMENT '发货状态 0 未发货（默认），1、部分发货  2、全部发货',
  `ORDER_TYPE` varchar(50) DEFAULT NULL COMMENT '订单类型：客户单，改补单，研发单，样品单，材料单',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `SPARE2` varchar(255) DEFAULT NULL,
  `SPARE3` varchar(255) DEFAULT NULL,
  `SPARE4` varchar(255) DEFAULT NULL,
  `SPARE5` varchar(255) DEFAULT NULL,
  `EXPECT_AMOUNT` varchar(50) NOT NULL COMMENT '预计发货数量',
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_order_sheet_sfy
-- ----------------------------
DROP TABLE IF EXISTS `wms_order_sheet_sfy`;
CREATE TABLE `wms_order_sheet_sfy` (
  `UUID` varchar(50) NOT NULL COMMENT '默认主键',
  `OPP_ID` varchar(50) DEFAULT NULL COMMENT '商机ID',
  `OPP_CODE` varchar(50) DEFAULT NULL COMMENT '商机编号',
  `MAIN_ID` varchar(50) NOT NULL DEFAULT '' COMMENT '主单号',
  `SON_ID` varchar(50) NOT NULL COMMENT '子单号',
  `PACKAGE_NUMBER` varchar(50) NOT NULL COMMENT '包裹数量',
  `QUANTITY_DELIVERED` varchar(50) NOT NULL DEFAULT '' COMMENT '到货数量',
  `CONSIGNEE_ID` varchar(50) DEFAULT NULL COMMENT '收货人ID',
  `CONSIGNEE_NAME` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `CONSIGNEE_PHONE` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `CONSIGNEE_ADDR` varchar(255) DEFAULT NULL COMMENT '收货人地址',
  `CONSIGNOR_ID` varchar(50) DEFAULT NULL COMMENT '发货人ID',
  `CONSIGNOR_NAME` varchar(50) DEFAULT NULL COMMENT '发货人姓名',
  `CONSIGNOR_PHONE` varchar(20) DEFAULT NULL COMMENT '发货人电话',
  `CONSIGNOR_ADDR` varchar(255) DEFAULT NULL COMMENT '发货人地址',
  `ORDER_STATUS` varchar(2) DEFAULT NULL COMMENT '订单状态：',
  `ARRIVAL_STATUS` varchar(2) DEFAULT NULL COMMENT '到货状态：0.未收货 1.部分收货 2.已收货 ',
  `IGT_ORDER_ID` varchar(50) DEFAULT NULL COMMENT 'IGT订单号',
  `CLIENT_CODE` varchar(50) DEFAULT NULL,
  `DELIVERY_TIME` varchar(50) DEFAULT NULL,
  `ORG_ID` varchar(255) NOT NULL,
  `ISDELETED` varchar(2) NOT NULL DEFAULT '0' COMMENT '删除状态：0.未删除 1.已删除',
  `OPERATING_TIME` varchar(50) DEFAULT NULL COMMENT '操作时间',
  `CREATION_DATE` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `SENDGOODS_QUANTITY` varchar(50) DEFAULT NULL COMMENT '发货的数量',
  `GOODSSDEL_STATUS` varchar(20) DEFAULT '0' COMMENT '发货状态 0 未发货（默认），1、部分发货  2、全部发货',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `SPARE2` varchar(255) DEFAULT NULL,
  `SPARE3` varchar(255) DEFAULT NULL,
  `SPARE4` varchar(255) DEFAULT NULL,
  `SPARE5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_outstoreroom
-- ----------------------------
DROP TABLE IF EXISTS `wms_outstoreroom`;
CREATE TABLE `wms_outstoreroom` (
  `OUTSTOREROOMID` varchar(255) NOT NULL,
  `NUMBER` varchar(30) DEFAULT NULL COMMENT '仓库编号',
  `VOCATIONALWORKNUMBER` varchar(100) DEFAULT NULL COMMENT '业务单号',
  `TIMEOUT` varchar(100) DEFAULT NULL COMMENT '出库时间',
  `PRODUCTTYPE` varchar(50) DEFAULT NULL COMMENT '商品类型',
  `OUTTYPE` varchar(50) DEFAULT NULL COMMENT '出库方式',
  `STOREHOUSENAME` varchar(100) DEFAULT NULL COMMENT '仓库名称',
  `OUTNUMBER` varchar(30) DEFAULT NULL COMMENT '出库单号',
  `OPERATEHUMAN` varchar(50) DEFAULT NULL COMMENT '操作人',
  `ISDELETE` int(1) unsigned zerofill DEFAULT '0' COMMENT '是否删除1:删除0:未删除',
  `VOCATIONALWORKTYPE` varchar(50) DEFAULT NULL COMMENT '业务类型',
  `TEMP1` varchar(50) DEFAULT NULL,
  `TEMP2` varchar(50) DEFAULT NULL,
  `TEMP3` varchar(50) DEFAULT NULL,
  `TEMP4` varchar(50) DEFAULT NULL,
  `TEMP5` varchar(50) DEFAULT NULL,
  `OUT_ATTACHMENT` varchar(64) DEFAULT NULL COMMENT '附件关联ID',
  PRIMARY KEY (`OUTSTOREROOMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_parcel_details
-- ----------------------------
DROP TABLE IF EXISTS `wms_parcel_details`;
CREATE TABLE `wms_parcel_details` (
  `UUID` varchar(50) NOT NULL COMMENT '默认主键',
  `MATERIAL_ID` varchar(50) NOT NULL COMMENT '物料编号',
  `PACKAGE_ID` varchar(50) DEFAULT NULL COMMENT '包裹编号',
  `MATERIAL_NAME` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `NUMBER` varchar(50) DEFAULT NULL COMMENT '物料数量',
  `INNER_COLOR` varchar(50) DEFAULT NULL COMMENT '内色',
  `OUTER_COLOR` varchar(50) DEFAULT NULL COMMENT '外色',
  `PRICE` varchar(20) DEFAULT NULL COMMENT '价格',
  `STATUS` varchar(2) DEFAULT NULL COMMENT '物料状态：0.已到 1.未到',
  `ISDELETED` varchar(2) DEFAULT '0' COMMENT '删除状态:0.未删除 1.已删除',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `SPARE2` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `SPARE3` varchar(255) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_parcel_details_sfy
-- ----------------------------
DROP TABLE IF EXISTS `wms_parcel_details_sfy`;
CREATE TABLE `wms_parcel_details_sfy` (
  `UUID` varchar(50) NOT NULL COMMENT '默认主键',
  `MATERIAL_ID` varchar(50) NOT NULL COMMENT '物料编号',
  `PACKAGE_ID` varchar(50) DEFAULT NULL COMMENT '包裹编号',
  `MATERIAL_NAME` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `NUMBER` varchar(50) DEFAULT NULL COMMENT '物料数量',
  `INNER_COLOR` varchar(50) DEFAULT NULL COMMENT '内色',
  `OUTER_COLOR` varchar(50) DEFAULT NULL COMMENT '外色',
  `PRICE` varchar(20) DEFAULT NULL COMMENT '价格',
  `STATUS` varchar(2) DEFAULT NULL COMMENT '物料状态：0.已到 1.未到',
  `ISDELETED` varchar(2) DEFAULT '0' COMMENT '删除状态:0.未删除 1.已删除',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `SPARE2` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `SPARE3` varchar(255) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_parcel_list
-- ----------------------------
DROP TABLE IF EXISTS `wms_parcel_list`;
CREATE TABLE `wms_parcel_list` (
  `UUID` varchar(50) NOT NULL COMMENT '默认主键',
  `PACKAGE_ID` varchar(50) NOT NULL COMMENT '包裹编号',
  `PACKAGE_NAME` varchar(50) DEFAULT NULL COMMENT '包裹名称',
  `SON_ID` varchar(50) NOT NULL COMMENT '子单号',
  `PACKAGE_STATUS` varchar(2) DEFAULT '0' COMMENT '仓库收货包裹状态标记0.为未到 1.为已到',
  `IGT_ORDER_ID` varchar(50) DEFAULT NULL,
  `GOODSSDEL_STATUS` varchar(20) DEFAULT '0' COMMENT '发货状态 0 未发货（默认），1、部分发货  2、全部发货',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `SPARE2` varchar(255) DEFAULT NULL,
  `SPARE3` varchar(255) DEFAULT NULL,
  `FACTORY_SEND_STATUS` varchar(2) DEFAULT NULL COMMENT '工厂包裹发货状态（0：未发，1：已发）',
  PRIMARY KEY (`UUID`),
  KEY `SONID` (`SON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_parcel_list_sfy
-- ----------------------------
DROP TABLE IF EXISTS `wms_parcel_list_sfy`;
CREATE TABLE `wms_parcel_list_sfy` (
  `UUID` varchar(50) NOT NULL COMMENT '默认主键',
  `PACKAGE_ID` varchar(50) NOT NULL COMMENT '包裹编号',
  `PACKAGE_NAME` varchar(50) DEFAULT NULL COMMENT '包裹名称',
  `SON_ID` varchar(50) NOT NULL COMMENT '子单号',
  `PACKAGE_STATUS` varchar(2) DEFAULT NULL COMMENT '包裹状态标记0.为未到 1.为已到',
  `IGT_ORDER_ID` varchar(50) DEFAULT NULL,
  `GOODSSDEL_STATUS` varchar(20) DEFAULT '0' COMMENT '发货状态 0 未发货（默认），1、部分发货  2、全部发货',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `SPARE2` varchar(255) DEFAULT NULL,
  `SPARE3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  KEY `SONID` (`SON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_provider
-- ----------------------------
DROP TABLE IF EXISTS `wms_provider`;
CREATE TABLE `wms_provider` (
  `PROVIDER_ID` varchar(255) NOT NULL COMMENT '序号',
  `PROVIDER_CODE` varchar(255) NOT NULL COMMENT '供应商编号',
  `PROVIDER_NAME` varchar(255) NOT NULL COMMENT '供应商名称',
  `DEALER_ORG` varchar(255) NOT NULL COMMENT '经销商编号',
  `PROVIDER_TYPE` varchar(255) NOT NULL COMMENT '供应商类型',
  `PROVIDER_CONTACT` varchar(255) NOT NULL COMMENT '供应商联系人',
  `PROVIDER_PHONE` varchar(255) NOT NULL COMMENT '供应商电话',
  `PROVIDER_ACCOUNT_NAME` varchar(255) NOT NULL COMMENT '供应商开户名',
  `PROVIDER_ACCOUNT_NUMBER` varchar(255) NOT NULL COMMENT '供应商账号',
  `PROVIDER_ACCOUNT_BANK` varchar(255) NOT NULL COMMENT '供应商开户行',
  `PROVIDER_START_TIME` datetime DEFAULT NULL COMMENT '服务(合同)开始时间',
  `PROVIDER_END_TIME` datetime DEFAULT NULL COMMENT '服务(合同)结束时间',
  `PROVIDER_ATTACH` varchar(1) NOT NULL DEFAULT '是' COMMENT '是否存在合同(是，否)',
  `ISDELETE` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否可用(供应商是否存在)(0:未删除,1:已删除)',
  `STANDBY1` varchar(255) DEFAULT NULL COMMENT '备用字段1',
  `STANDBY2` varchar(255) DEFAULT NULL COMMENT '备用字段2',
  `STANDBY3` varchar(255) DEFAULT NULL COMMENT '备用字段3',
  `STANDBY4` varchar(255) DEFAULT NULL COMMENT '备用字段4',
  `STANDBY5` varchar(255) DEFAULT NULL COMMENT '备用字段5',
  PRIMARY KEY (`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_provider_goods
-- ----------------------------
DROP TABLE IF EXISTS `wms_provider_goods`;
CREATE TABLE `wms_provider_goods` (
  `GOODS_ID` varchar(255) NOT NULL COMMENT '序号',
  `GOODS_CODE` varchar(255) NOT NULL COMMENT '商品编号',
  `GOODS_NAME` varchar(255) NOT NULL COMMENT '商品名称',
  `GOODS_PRICE` varchar(255) NOT NULL COMMENT '商品价格',
  `PROVIDER_CODE` varchar(255) NOT NULL COMMENT '供应商编号',
  `ISDELETE` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否删除(供应商商品是否存在)(0:未删除,1:已删除)',
  `STANDBY1` varchar(255) DEFAULT NULL COMMENT '备用字段1',
  `STANDBY2` varchar(255) DEFAULT NULL COMMENT '备用字段2',
  `STANDBY3` varchar(255) DEFAULT NULL COMMENT '备用字段3',
  `STANDBY4` varchar(255) DEFAULT NULL COMMENT '备用字段4',
  `STANDBY5` varchar(255) DEFAULT NULL COMMENT '备用字段5',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_purchase
-- ----------------------------
DROP TABLE IF EXISTS `wms_purchase`;
CREATE TABLE `wms_purchase` (
  `PURCHASEID` varchar(255) NOT NULL COMMENT '序号',
  `PURCHASECODE` varchar(255) NOT NULL COMMENT '采购单号',
  `PURCHASEENDTIME` datetime NOT NULL COMMENT '最后入库时间',
  `PURCHASESTATUS` varchar(2) NOT NULL DEFAULT '1' COMMENT '采购单状态(0:已取消,1:未执行,2:部分到货,3:已完成)',
  `DEALER_ORG` varchar(255) DEFAULT NULL COMMENT '经销商主键',
  `PURCHASEAPPROVESTATUS` varchar(1) NOT NULL DEFAULT '0' COMMENT '采购单审批状态',
  `PROVIDERID` varchar(255) NOT NULL COMMENT '供应商ID',
  `PURCHASEEXECUTOR` varchar(32) NOT NULL COMMENT '采购执行人',
  `PROVIDERNAME` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `ISDELETE` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否删除(0:未删除,1:已删除)',
  `DEPOTCODE` varchar(255) DEFAULT NULL COMMENT '仓库编号',
  `DEPOTNAME` varchar(255) DEFAULT NULL COMMENT '仓库名称',
  `REMARK` varchar(1000) DEFAULT NULL COMMENT '备注',
  `STANDBY01` varchar(255) DEFAULT NULL COMMENT '备注字段1',
  `STANDBY02` varchar(255) DEFAULT NULL COMMENT '备注字段2',
  `STANDBY03` varchar(255) DEFAULT NULL COMMENT '备注字段3',
  `STANDBY04` varchar(255) DEFAULT NULL COMMENT '备注字段4',
  `STANDBY05` varchar(255) DEFAULT NULL COMMENT '备注字段5',
  `SHOP_ID` varchar(250) DEFAULT NULL COMMENT '门店ID',
  `IS_ENGINEERING_ORDER` varchar(5) DEFAULT NULL COMMENT '是否工程订单',
  `ENGINEERING_CLIENTS` varchar(60) DEFAULT NULL COMMENT '工程客户',
  PRIMARY KEY (`PURCHASEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_purchasedetail
-- ----------------------------
DROP TABLE IF EXISTS `wms_purchasedetail`;
CREATE TABLE `wms_purchasedetail` (
  `PURCHASEDETAIL_ID` varchar(255) NOT NULL COMMENT '采购详情编号',
  `GOODS_CODE` varchar(255) DEFAULT NULL COMMENT '商品编码',
  `PURCHASE_CODE` varchar(255) DEFAULT NULL COMMENT '采购单号编码',
  `PURCHASE_PRICE` varchar(255) DEFAULT NULL COMMENT '采购价格',
  `PURCHASE_NUM` varchar(255) DEFAULT NULL COMMENT '采购数量',
  `RECEIVE_NUM` varchar(255) DEFAULT '0' COMMENT '已到数量',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '最新修改时间',
  `ISDELETE` varchar(4) DEFAULT '0' COMMENT '是否删除',
  `REMARK` varchar(255) DEFAULT NULL,
  `STANDBY1` varchar(255) DEFAULT NULL COMMENT '备注字段',
  `STANDBY2` varchar(255) DEFAULT NULL COMMENT '备注字段',
  `STANDBY3` varchar(255) DEFAULT NULL COMMENT '备注字段',
  `STANDBY4` varchar(255) DEFAULT NULL COMMENT '备注字段',
  `STANDBY5` varchar(255) DEFAULT NULL COMMENT '备注字段',
  PRIMARY KEY (`PURCHASEDETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_record
-- ----------------------------
DROP TABLE IF EXISTS `wms_record`;
CREATE TABLE `wms_record` (
  `RECORDID` varchar(60) NOT NULL COMMENT '主键',
  `ODDNUMBER` varchar(50) DEFAULT NULL COMMENT '入库/出库单号',
  `CURRENTTIME` datetime NOT NULL COMMENT '操作时间',
  `GOODSCODE` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `GOODSNAME` varchar(240) DEFAULT NULL,
  `QUANTITY` double(100,2) DEFAULT NULL COMMENT '数量',
  `INQUANTITY` double(50,2) DEFAULT NULL COMMENT '库存数量',
  `PRICE` double(20,2) DEFAULT NULL COMMENT '价格',
  `DEPOTCODE` varchar(50) DEFAULT NULL COMMENT '仓库编号',
  `DEPOTNAME` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `DEPOTLOCATION` varchar(20) DEFAULT NULL COMMENT '库位',
  `TYPE` varchar(28) DEFAULT NULL COMMENT '出库/入库类型',
  `PERSONNL` varchar(60) DEFAULT NULL COMMENT '操作人',
  `FLAG` double(1,0) DEFAULT NULL COMMENT '出库/入库标记（0出库,1入库）',
  `PROVIDERID` varchar(50) DEFAULT NULL COMMENT '供应商',
  `BATCHNUMBER` varchar(50) DEFAULT NULL COMMENT '批次单号（入库单号）',
  `ISDELETE` varchar(50) DEFAULT NULL COMMENT '0未删除，1已删除',
  `MONEY` double(100,2) DEFAULT '0.00' COMMENT '金额',
  `SPARE1` varchar(100) DEFAULT NULL COMMENT '备用字段1',
  `SPARE2` varchar(100) DEFAULT NULL COMMENT '备用字段2',
  `SPARE3` varchar(100) DEFAULT NULL COMMENT '备用字段3',
  `SPARE4` varchar(100) DEFAULT NULL COMMENT '备用字段4',
  `SPARE5` varchar(100) DEFAULT NULL COMMENT '备用字段5',
  `PROVIDERNAME` varchar(255) DEFAULT NULL COMMENT '供应商名字',
  `SOURCEODDNUMBER` varchar(50) DEFAULT NULL,
  `ENGINEERING_CLIENTS` varchar(60) DEFAULT NULL COMMENT '工程客户',
  `COUNTING_TIMES` int(20) DEFAULT '0' COMMENT '计提次数',
  `INITIAL_COST_PRICE` double(20,2) DEFAULT '0.00' COMMENT '初始成本价',
  PRIMARY KEY (`RECORDID`),
  KEY `I_SOURCEODDNUMBER` (`SOURCEODDNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_report_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_report_detail`;
CREATE TABLE `wms_report_detail` (
  `DETAILED_ID` varchar(20) NOT NULL COMMENT '主键',
  `RDETAILED_CODE` varchar(50) DEFAULT NULL COMMENT '详情编号',
  `REPORT_CODE` varchar(50) DEFAULT NULL COMMENT '月报表关联编号',
  `GOODSCODE` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `GOODSNAME` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `LASTAMOUNT` varchar(50) DEFAULT '0' COMMENT '期初库存数量',
  `LASTPRICE` varchar(100) DEFAULT '0.00' COMMENT '期初单价',
  `LASTSUMPRICE` varchar(100) DEFAULT '0.00' COMMENT '期初金额',
  `GETAMOUNT` int(50) DEFAULT '0' COMMENT '入库数量',
  `GETPRICE` varchar(100) DEFAULT '0.00' COMMENT '入库单价',
  `SUMPRICE` varchar(100) DEFAULT '0.00' COMMENT '入库金额',
  `OUTAMOUT` int(50) DEFAULT '0' COMMENT '出库数量',
  `OUTPRICE` varchar(100) DEFAULT '0.00' COMMENT '出库单价',
  `OUTSUMPRICE` varchar(100) DEFAULT '0.00' COMMENT '出库金额',
  `NOWPRICE` varchar(100) DEFAULT '0.00' COMMENT '结存单价',
  `NOWAMOUNT` int(20) DEFAULT '0' COMMENT '结存数量',
  `NOWSUMPRICE` varchar(100) DEFAULT '0.00' COMMENT '结存金额',
  `REMARK` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '备用字段',
  `SPARE2` varchar(255) DEFAULT NULL,
  `SPARE3` varchar(255) DEFAULT NULL,
  `SPARE4` varchar(255) DEFAULT NULL,
  `SPARE5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DETAILED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_report_terminal
-- ----------------------------
DROP TABLE IF EXISTS `wms_report_terminal`;
CREATE TABLE `wms_report_terminal` (
  `RET_ID` varchar(20) NOT NULL COMMENT '主键',
  `TERMINAL_CODE` varchar(50) DEFAULT NULL COMMENT '期末（初）的编号',
  `GOODSCODE` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `GOODSNAME` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `LASTAMOUNT` varchar(50) DEFAULT NULL COMMENT '期末（初）的数量',
  `LASTPRICE` varchar(100) DEFAULT NULL COMMENT '期末（初）的价格',
  `LASTSUMPRICE` varchar(100) DEFAULT NULL COMMENT '期末（初）的总金额',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '生成时间',
  `REMARK` varchar(255) DEFAULT NULL,
  `SPARE1` varchar(255) DEFAULT NULL,
  `SPARE2` varchar(255) DEFAULT NULL,
  `SPARE3` varchar(255) DEFAULT NULL,
  `SPARE4` varchar(255) DEFAULT NULL,
  `SPARE5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_salesreturn
-- ----------------------------
DROP TABLE IF EXISTS `wms_salesreturn`;
CREATE TABLE `wms_salesreturn` (
  `SALES_ID` varchar(50) NOT NULL COMMENT '主键',
  `SALES_CODE` varchar(50) DEFAULT NULL COMMENT '退货单号',
  `BUSINESS_NUMBER` varchar(50) DEFAULT NULL COMMENT '业务单号',
  `CREATOR_ID` varchar(50) DEFAULT NULL COMMENT '创建人ID',
  `CREATOR` varchar(255) DEFAULT NULL COMMENT '创建人',
  `CREATION_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `DEPOT_CODE` varchar(20) DEFAULT NULL COMMENT '仓库编号',
  `DEPOT_NAME` varchar(20) DEFAULT '0' COMMENT '仓库名称',
  `DEALER_ID` varchar(50) DEFAULT NULL COMMENT '经销商ID',
  `SHOP_ID` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `SHOP_NAME` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `CUSTOMER_NAME` varchar(50) DEFAULT NULL COMMENT '客户姓名',
  `CUSTOMER_PHONE` varchar(50) DEFAULT NULL COMMENT '客户电话',
  `CUSTOMER_ADDRESS` varchar(255) NOT NULL COMMENT '客户地址',
  `APPORVAL_STATE` varchar(1) DEFAULT NULL COMMENT '审核状态:0编辑,1已送审,2驳回,3审核通过,4否决,5已完成',
  `ISDELETE` varchar(1) DEFAULT '0' COMMENT '0正常1,删除',
  `ACTION_TYPE` varchar(1) DEFAULT '1' COMMENT '操作方式(1:退货入库)',
  `REMARKS` varchar(1000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`SALES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_salesreturn_details
-- ----------------------------
DROP TABLE IF EXISTS `wms_salesreturn_details`;
CREATE TABLE `wms_salesreturn_details` (
  `SALES_DETAILS_ID` varchar(255) NOT NULL COMMENT '主键',
  `GOODS_CODE` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `GOODS_NAME` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `GOODS_PRICE` double(100,2) DEFAULT '0.00' COMMENT '商品价格',
  `ORDER_QUANTITY` double(100,2) DEFAULT NULL COMMENT '订货数量',
  `OUTLIBRARY_QUANTITY` double(100,2) DEFAULT NULL COMMENT '已出库数量',
  `RETURN_QUANTITY` double(100,2) DEFAULT '0.00' COMMENT '退货数量',
  `ALIBRARY_ID` varchar(50) DEFAULT NULL COMMENT '库位编号',
  `ISDELETE` varchar(1) DEFAULT '0' COMMENT '0正常1,删除',
  `SALES_ID` varchar(255) DEFAULT NULL COMMENT '关联主表',
  `REMARKS` varchar(1000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`SALES_DETAILS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_sfy_corresponding_simi
-- ----------------------------
DROP TABLE IF EXISTS `wms_sfy_corresponding_simi`;
CREATE TABLE `wms_sfy_corresponding_simi` (
  `SFYORG_ID` varchar(50) DEFAULT NULL COMMENT '索菲亚经销商ID',
  `SIMIORG_ID` varchar(50) DEFAULT NULL COMMENT '司米经销商ID',
  `SPARE1` varchar(255) DEFAULT NULL,
  `SPARE2` varchar(255) DEFAULT NULL,
  `SPARE3` varchar(255) DEFAULT NULL,
  `SPARE4` varchar(255) DEFAULT NULL,
  `SPARE5` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_stock
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock`;
CREATE TABLE `wms_stock` (
  `STOCKID` varchar(20) NOT NULL COMMENT '主键',
  `GOODSCODE` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `GOODSNAME` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `DEPOTCODE` varchar(50) DEFAULT NULL COMMENT '仓库编号',
  `OCCUPANCYQUANTITY` double(20,2) DEFAULT '0.00' COMMENT '库存占用数量',
  `DEPOTNAME` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `INQUANTITY` double(50,2) DEFAULT '0.00' COMMENT '库存数量',
  `ISDELETE` varchar(1) DEFAULT NULL COMMENT '0未删除，1已删除',
  `SPARE1` varchar(100) DEFAULT NULL COMMENT '备用字段1',
  `SPARE2` varchar(100) DEFAULT NULL COMMENT '备用字段2',
  `SPARE3` varchar(100) DEFAULT NULL COMMENT '备用字段3',
  `SPARE4` varchar(100) DEFAULT NULL COMMENT '备用字段4',
  `SPARE5` varchar(100) DEFAULT NULL COMMENT '备用字段5',
  `ALIBRARY_ID` varchar(60) DEFAULT NULL COMMENT '库位ID',
  PRIMARY KEY (`STOCKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_stock_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_detail`;
CREATE TABLE `wms_stock_detail` (
  `STOCK_DETAILID` varchar(20) NOT NULL COMMENT '库存占用详情编号标识',
  `STOCKID` varchar(20) DEFAULT NULL COMMENT '仓库主表id',
  `GOODSCODE` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `GOODSNAME` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `TYPE` varchar(20) DEFAULT NULL COMMENT '出入库方式',
  `BUSINESSORDERNO` varchar(50) DEFAULT NULL COMMENT '业务单号',
  `STATE` varchar(1) DEFAULT '0' COMMENT '占用状态0代表以及出入库,1代表占用',
  `FLAG` varchar(1) DEFAULT NULL COMMENT '0,代表入库,1代表出库',
  `OCCUPANCYQUANTITY` double(44,2) DEFAULT NULL COMMENT '占用数量',
  `SPARE1` varchar(20) DEFAULT NULL COMMENT '备用字段1',
  `SPARE2` varchar(20) DEFAULT NULL COMMENT '备用字段2',
  `SPARE3` varchar(20) DEFAULT NULL COMMENT '备用字段3',
  `SPARE4` varchar(20) DEFAULT NULL COMMENT '备用字段4',
  `SPARE5` varchar(20) DEFAULT NULL COMMENT '备用字段5',
  PRIMARY KEY (`STOCK_DETAILID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_stock_report
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_report`;
CREATE TABLE `wms_stock_report` (
  `REPORT_ID` varchar(20) NOT NULL COMMENT '主键',
  `REPORT_CODE` varchar(50) DEFAULT NULL COMMENT '报表编号',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '生成时间',
  `SERIAL_NUMBER` varchar(50) DEFAULT NULL COMMENT '流水号',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `SPARE1` varchar(50) DEFAULT NULL,
  `SPARE2` varchar(50) DEFAULT NULL,
  `SPARE3` varchar(50) DEFAULT NULL,
  `SPARE4` varchar(50) DEFAULT NULL,
  `SPARE5` varchar(50) DEFAULT NULL,
  `DEALER_ORG` varchar(50) DEFAULT NULL COMMENT '经销商id',
  PRIMARY KEY (`REPORT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
