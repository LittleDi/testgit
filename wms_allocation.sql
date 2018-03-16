/*
Navicat MySQL Data Transfer

Source Server         : ˾����������
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
  `ALLOCATION_ID` varchar(60) DEFAULT NULL COMMENT '��������',
  `OUT_WAREHOUSE_ID` varchar(60) DEFAULT NULL COMMENT '��Ӧ�ĳ��ⵥ��',
  `IN_WAREHOUSE_ID` varchar(60) DEFAULT NULL COMMENT '��Ӧ����ⵥ��',
  `STATE` varchar(60) DEFAULT NULL COMMENT '��������״̬�������⣻�ѳ����룻�����',
  `FOUNDER` varchar(60) DEFAULT NULL COMMENT '������',
  `CREATE_TIME` varchar(60) DEFAULT NULL COMMENT '����ʱ��',
  `DEALER_ORG` varchar(60) DEFAULT NULL COMMENT '������id',
  `IS_DELETE` varchar(5) DEFAULT NULL COMMENT '�Ƿ�ɾ����1Ϊ�ǣ�0Ϊ��',
  `REMARKS` varchar(255) DEFAULT NULL,
  `OUT_DEPOT_NAME` varchar(60) DEFAULT NULL,
  `OUT_DEPOT` varchar(60) DEFAULT NULL COMMENT '�����',
  `IN_DEPOT_NAME` varchar(60) DEFAULT NULL,
  `IN_DEPOT` varchar(60) DEFAULT NULL,
  `REMARKS2` varchar(60) DEFAULT NULL,
  `REMARKS3` varchar(60) DEFAULT NULL,
  `REMARKS4` varchar(255) DEFAULT NULL,
  `REMARKS5` varchar(255) DEFAULT NULL,
  `REMARKS6` varchar(255) DEFAULT NULL,
  `FOUNDER_NAME` varchar(60) DEFAULT NULL COMMENT '����������',
  `BILL_TYPE` varchar(5) DEFAULT NULL COMMENT '�������ͣ�0���Ʋֵ� 1���Ʋ���������',
  `BILL_STATE` varchar(20) DEFAULT NULL COMMENT '�༭���ύ���������ء�����ͨ��',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_allocation_goods
-- ----------------------------
DROP TABLE IF EXISTS `wms_allocation_goods`;
CREATE TABLE `wms_allocation_goods` (
  `ID` varchar(80) NOT NULL,
  `ALLOCATION_ID` varchar(80) DEFAULT NULL COMMENT '��������',
  `GOODS_CODE` varchar(80) DEFAULT NULL COMMENT '��Ʒ����',
  `GOODS_NAME` varchar(50) DEFAULT NULL COMMENT '��Ʒ����',
  `GOODS_CLASS_CODE` varchar(80) DEFAULT NULL COMMENT '��Ʒ������',
  `GOODS_BARCODE` varchar(80) DEFAULT NULL COMMENT '��Ʒ������',
  `ALLOCATION_NUM` varchar(80) DEFAULT NULL COMMENT '��������',
  `DEALER_ORG` varchar(60) DEFAULT NULL COMMENT '������id',
  `OCCUPANCYQUANTITY` double(20,2) DEFAULT '0.00' COMMENT '�����۲ֵ������������۲�δ�����ʱ��ռ������',
  `REMARKS2` varchar(60) DEFAULT NULL,
  `REMARKS3` varchar(60) DEFAULT NULL,
  `REMARKS4` varchar(60) DEFAULT NULL,
  `REMARKS5` varchar(60) DEFAULT NULL,
  `REMARKS6` varchar(60) DEFAULT NULL,
  `IS_DELETE` varchar(60) DEFAULT NULL COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_contract
-- ----------------------------
DROP TABLE IF EXISTS `wms_contract`;
CREATE TABLE `wms_contract` (
  `ID` varchar(50) NOT NULL,
  `CONTRAC_ID` varchar(55) DEFAULT NULL COMMENT '��ͬID',
  `CONTRACT_NAME` varchar(55) DEFAULT NULL COMMENT '��ͬ��',
  `FILE_URL` varchar(200) DEFAULT NULL COMMENT '��ͬ��ŵ�ַ',
  `SUPPLIER_NAME` varchar(55) DEFAULT NULL COMMENT '��Ӧ����',
  `SUPPLIER_ID` varchar(55) DEFAULT NULL COMMENT '��Ӧ��Id',
  `IS_DELETE` varchar(55) DEFAULT NULL COMMENT '�Ƿ�ɾ��',
  `REMARKS1` varchar(55) DEFAULT NULL COMMENT '��ע',
  `REMARKS2` varchar(55) DEFAULT NULL COMMENT '��ע',
  `REMARKS3` varchar(55) DEFAULT NULL COMMENT '��ע',
  `UPLOAD_TIME` datetime DEFAULT NULL COMMENT '�ϴ�ʱ��',
  `OPERATOR` varchar(55) DEFAULT NULL COMMENT '�ϴ���',
  `FILE_NAME` varchar(200) DEFAULT NULL COMMENT 'Ψһ�ļ���',
  `DELETE_PERSON` varchar(50) DEFAULT NULL,
  `DELETE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_cost_meter
-- ----------------------------
DROP TABLE IF EXISTS `wms_cost_meter`;
CREATE TABLE `wms_cost_meter` (
  `UUID` varchar(64) NOT NULL COMMENT '����',
  `ODDNUMBER` varchar(100) DEFAULT NULL COMMENT '����ID',
  `GOODS_CODE` varchar(255) DEFAULT NULL COMMENT '��Ʒ���',
  `GOODS_NAME` varchar(255) DEFAULT NULL COMMENT '��Ʒ����',
  `DEPOT_ID` varchar(100) DEFAULT NULL COMMENT '�ֿ�ID',
  `DEPOT_NAME` varchar(50) DEFAULT NULL COMMENT '�ֿ�����',
  `DEPARTMENT_NAME` varchar(50) DEFAULT NULL COMMENT '������������',
  `DEPARTMENT_ID` varchar(64) DEFAULT NULL COMMENT '��������ID',
  `ADVANCE_UNIT_PRICE` double(100,4) DEFAULT NULL COMMENT '����ǰ����',
  `ACCRUED_NUMBER` double(100,2) DEFAULT NULL COMMENT '��������',
  `AFTER_COUNTING_UNIT_PRICE` double(100,4) DEFAULT NULL COMMENT '����󵥼�',
  `AMOUNT_OF_MONEY` double(100,4) DEFAULT NULL COMMENT '�����=����ǰ���ν��*������ʣ�',
  `FINANCIAL_YEAR` varchar(4) DEFAULT NULL COMMENT '���������',
  `FINANCIAL_MONTH` varchar(2) DEFAULT NULL COMMENT '���������',
  `LAST_UPDATE_DATE` datetime DEFAULT NULL COMMENT '������ʱ��',
  `LAST_UPDATED_BY` varchar(50) DEFAULT NULL COMMENT '��������',
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_depot
-- ----------------------------
DROP TABLE IF EXISTS `wms_depot`;
CREATE TABLE `wms_depot` (
  `UUID` varchar(50) NOT NULL COMMENT 'Ĭ������',
  `DEPOT_ID` varchar(50) NOT NULL COMMENT '�ֿ���',
  `DEPOT_NAME` varchar(50) NOT NULL COMMENT '�ֿ�����',
  `DEPOT_TYPE` varchar(50) DEFAULT NULL COMMENT '�ֿ�����',
  `DEPOT_AREA` varchar(20) DEFAULT NULL COMMENT '�ֿ����',
  `DEPOT_ADDRESS` varchar(255) DEFAULT NULL COMMENT '�ֿ��ַ',
  `PERSON_IN_CHARGE` varchar(255) DEFAULT NULL,
  `CONTACT_NUMBER` varchar(255) DEFAULT NULL,
  `DEPOT_STATUS` varchar(2) NOT NULL DEFAULT '1' COMMENT '�ֿ�״̬Ĭ��Ϊ��1 ����',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '��ע',
  `DEALER_ORG` varchar(64) DEFAULT NULL COMMENT '������id',
  `DEPARTMENT_NAME` varchar(50) DEFAULT NULL COMMENT '������������',
  `DEPARTMENT_ID` varchar(64) DEFAULT NULL COMMENT '��������ID',
  `SPARE1` varchar(255) DEFAULT NULL,
  `SPARE2` varchar(255) DEFAULT NULL,
  `SPARE3` varchar(255) DEFAULT NULL,
  `SPARE4` varchar(255) DEFAULT NULL,
  `SPARE5` varchar(255) DEFAULT NULL,
  `STOCK_STATE` varchar(2) DEFAULT '0' COMMENT '�̵�״̬��0δ�̵�',
  `TYPE_STATE` varchar(3) DEFAULT '0' COMMENT '�ֿ�����״̬ Ĭ��0.������1.�д�2.���⣩',
  `WHETHER_ACCRUED` varchar(2) DEFAULT NULL COMMENT '�Ƿ����(0:��,1��)',
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_depot_emp
-- ----------------------------
DROP TABLE IF EXISTS `wms_depot_emp`;
CREATE TABLE `wms_depot_emp` (
  `NO` int(11) NOT NULL COMMENT '����',
  `DEPOT_ID` varchar(50) DEFAULT NULL COMMENT '�ֿ���',
  `USER_ID` varchar(50) DEFAULT NULL COMMENT '������ID',
  `PERSON_IN_CHARGE` varchar(20) DEFAULT NULL COMMENT '������',
  `CONTACT_NUMBER` varchar(255) DEFAULT NULL COMMENT '�绰����',
  `IS_DELETE` varchar(10) DEFAULT '0' COMMENT '�Ƿ�ɾ��',
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
  `PRODUCTNUMBER` varchar(30) DEFAULT NULL COMMENT '��Ʒ���',
  `PRODUCTNAME` varchar(100) DEFAULT NULL COMMENT '��Ʒ����',
  `PRICE` varchar(10) DEFAULT NULL COMMENT '�۸�',
  `QUANTITY` int(10) DEFAULT NULL COMMENT '����',
  `STORAGELOCATION` varchar(10) DEFAULT NULL COMMENT '��λ',
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
  `CWRECORDID` varchar(60) NOT NULL COMMENT '����',
  `REPORTNUM` varchar(40) DEFAULT NULL COMMENT '�·ݹ�����ˮ��',
  `ODDNUMBER` varchar(50) DEFAULT NULL COMMENT '���/���ⵥ��',
  `CURRENTTIME` datetime NOT NULL COMMENT '����ʱ��',
  `GOODSCODE` varchar(50) DEFAULT NULL COMMENT '��Ʒ���',
  `GOODSNAME` varchar(50) DEFAULT NULL COMMENT '��Ʒ����',
  `QUANTITY` double(100,2) DEFAULT NULL COMMENT '����',
  `INQUANTITY` double(50,2) DEFAULT NULL COMMENT '�������',
  `PRICE` double(20,2) DEFAULT NULL COMMENT '�۸�',
  `DEPOTCODE` varchar(50) DEFAULT NULL COMMENT '�ֿ���',
  `DEPOTNAME` varchar(50) DEFAULT NULL COMMENT '�ֿ�����',
  `DEPOTLOCATION` varchar(20) DEFAULT NULL COMMENT '��λ',
  `TYPE` varchar(28) DEFAULT NULL COMMENT '����/�������',
  `PERSONNL` varchar(60) DEFAULT NULL COMMENT '������',
  `FLAG` double(1,0) DEFAULT NULL COMMENT '����/����ǣ�0����,1��⣩',
  `PROVIDERID` varchar(50) DEFAULT NULL COMMENT '��Ӧ��',
  `BATCHNUMBER` varchar(50) DEFAULT NULL COMMENT '���ε��ţ���ⵥ�ţ�',
  `ISDELETE` varchar(50) DEFAULT NULL COMMENT '0δɾ����1��ɾ��',
  `MONEY` double(100,2) DEFAULT '0.00' COMMENT '���',
  `SPARE1` varchar(100) DEFAULT NULL COMMENT '�����ֶ�1',
  `SPARE2` varchar(100) DEFAULT NULL COMMENT '�����ֶ�2',
  `SPARE3` varchar(100) DEFAULT NULL COMMENT '�����ֶ�3',
  `SPARE4` varchar(100) DEFAULT NULL COMMENT '�����ֶ�4',
  `SPARE5` varchar(100) DEFAULT NULL COMMENT '�����ֶ�5',
  `PROVIDERNAME` varchar(255) DEFAULT NULL COMMENT '��Ӧ������',
  `SOURCEODDNUMBER` varchar(50) DEFAULT NULL COMMENT '��Դ����',
  `ENGINEERING_CLIENTS` varchar(60) DEFAULT NULL COMMENT '���̿ͻ�',
  `UPDATETIME` datetime NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`CWRECORDID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_getgoods_list
-- ----------------------------
DROP TABLE IF EXISTS `wms_getgoods_list`;
CREATE TABLE `wms_getgoods_list` (
  `SERIAL_ID` varchar(20) NOT NULL DEFAULT '' COMMENT '���',
  `RECEIPT_NO` varchar(20) DEFAULT NULL COMMENT '�ջ�����',
  `MAIN_ID` varchar(20) DEFAULT NULL COMMENT '������',
  `SON_ID` varchar(20) DEFAULT NULL COMMENT '�ӵ���',
  `QUANTITY_DELIVERED` varchar(20) DEFAULT NULL COMMENT '��������',
  `PARCEL_QUANTITY` varchar(20) DEFAULT NULL COMMENT '��������',
  `PACKAGE_NUMBER` varchar(20) DEFAULT NULL COMMENT '������',
  `CONSIGNEE` varchar(50) DEFAULT NULL COMMENT '�ջ���',
  `CONSIGNOR` varchar(20) DEFAULT NULL COMMENT '������',
  `RISE_TIME` datetime DEFAULT NULL COMMENT '����ʱ��',
  `SERVICE_TYPE` varchar(2) DEFAULT NULL COMMENT 'ҵ������',
  `ACTUAL_ARRIVAL` varchar(20) DEFAULT NULL COMMENT 'ʵ�ʵ�������',
  `IS_DELETE` varchar(20) DEFAULT '0' COMMENT 'ɾ��״̬',
  `NOTE` varchar(20) DEFAULT NULL COMMENT '��ע',
  `BACK1` varchar(128) DEFAULT NULL COMMENT '������ID',
  `BACK2` varchar(20) DEFAULT NULL COMMENT '����2',
  `BACK3` varchar(20) DEFAULT NULL COMMENT '����3',
  `BACK4` varchar(20) DEFAULT NULL COMMENT '����4',
  `BACK5` varchar(20) DEFAULT NULL COMMENT '����5',
  `CLIENT_CODE` varchar(50) DEFAULT NULL COMMENT '�����̱���',
  `IS_TYPE` varchar(10) DEFAULT NULL COMMENT '���������ͣ�0.�ջ���1.����,2.�ղ����ڣ�3.��������',
  PRIMARY KEY (`SERIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_godown_details
-- ----------------------------
DROP TABLE IF EXISTS `wms_godown_details`;
CREATE TABLE `wms_godown_details` (
  `ID` varchar(255) NOT NULL,
  `NUMBER` varchar(50) DEFAULT NULL COMMENT '��ⵥ��',
  `PURCHASECODE` varchar(50) DEFAULT NULL COMMENT '�ɹ�����',
  `STORAGELOCATION` varchar(10) DEFAULT NULL COMMENT '��λ',
  `GOODSCODE` varchar(255) DEFAULT NULL,
  `GOODSNAME` varchar(255) DEFAULT NULL,
  `GOODSTYPE` varchar(30) DEFAULT NULL COMMENT '��Ʒ����',
  `GOODSNUMBER` varchar(30) DEFAULT NULL COMMENT '��Ʒ����',
  `GOODSPRICE` varchar(20) NOT NULL DEFAULT '' COMMENT '��Ʒ�۸�',
  `REMARK` varchar(30) DEFAULT NULL COMMENT '��ע',
  `ISDELETE` varchar(1) DEFAULT NULL COMMENT 'ɾ��״̬',
  `SPARE` varchar(55) DEFAULT NULL COMMENT '����',
  `SPARE2` varchar(55) DEFAULT NULL COMMENT '����',
  `SPARE3` varchar(55) DEFAULT NULL COMMENT '����',
  `SPARE4` varchar(55) DEFAULT NULL COMMENT '����',
  `SPARE5` varchar(55) DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`ID`),
  KEY `NUMBER` (`NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_godownentry
-- ----------------------------
DROP TABLE IF EXISTS `wms_godownentry`;
CREATE TABLE `wms_godownentry` (
  `ID` varchar(255) NOT NULL,
  `NUMBER` varchar(50) NOT NULL COMMENT '��ⵥ��',
  `DEALER_ORG` varchar(64) DEFAULT NULL COMMENT '������id',
  `BUSINESS_DOCUMENT_NO` varchar(50) DEFAULT NULL COMMENT 'ҵ�񵥺�',
  `STORAGETIME` datetime DEFAULT NULL COMMENT '���ʱ��',
  `DEPOTNAME` varchar(50) DEFAULT NULL COMMENT '�ֿ�',
  `WAREHOUSING_MODE` varchar(50) DEFAULT NULL COMMENT '��ⷽʽ',
  `OPERATOR` varchar(50) DEFAULT NULL COMMENT '������',
  `REMARKS` varchar(50) DEFAULT NULL COMMENT '��ע',
  `IS_DELETE` varchar(10) DEFAULT NULL COMMENT '�Ƿ�ɾ��',
  `WAREHOUSE_LOCATION` varchar(50) DEFAULT NULL COMMENT '�ֿ�ص�',
  `BUSINESS_CLASS_TYPE` varchar(40) DEFAULT NULL COMMENT 'ҵ�����ͺ�',
  `GOODS_TYPE` varchar(15) DEFAULT NULL COMMENT '��Ʒ����',
  `SPARE1` varchar(55) DEFAULT NULL COMMENT '�����ֶ�',
  `SPARE2` varchar(55) DEFAULT NULL COMMENT '�����ֶ�',
  `SPARE3` varchar(55) DEFAULT NULL COMMENT '�����ֶ�',
  `SPARE4` varchar(55) DEFAULT NULL COMMENT '�����ֶ�',
  `SPARE5` varchar(55) DEFAULT NULL COMMENT '�����ֶ�',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_goods
-- ----------------------------
DROP TABLE IF EXISTS `wms_goods`;
CREATE TABLE `wms_goods` (
  `GOODS_ID` varchar(255) NOT NULL COMMENT '��Ʒ���',
  `GOODS_CODE` varchar(255) DEFAULT NULL COMMENT '��Ʒ����',
  `GOODS_NAME` varchar(255) DEFAULT NULL COMMENT '��Ʒ����',
  `GOODS_CLASS_CODE` varchar(255) DEFAULT NULL COMMENT '��Ʒ������',
  `GOODS_BARCODE` varchar(255) DEFAULT NULL COMMENT '��Ʒ������',
  `DEALER_ORG` varchar(255) DEFAULT NULL COMMENT '������id',
  `UPDATE_TIME` datetime DEFAULT NULL,
  `ISDELETE` varchar(50) DEFAULT '0' COMMENT '�Ƿ�ɾ��',
  `REMARK` varchar(50) DEFAULT NULL COMMENT '��ע',
  `OUT_STATUS` varchar(20) DEFAULT NULL COMMENT '��Э/����Э',
  `STANDBY1` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  `STANDBY2` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  `STANDBY3` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  `STANDBY4` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  `STANDBY5` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  `ERP_ID` varchar(255) DEFAULT NULL,
  `SELF_SUPPLIER` varchar(255) DEFAULT '0' COMMENT '�Ƿ��Բɹ�Ӧ���ͻ� ��0Ϊ��Ĭ�ϣ���1Ϊ�ǣ�',
  PRIMARY KEY (`GOODS_ID`),
  KEY `query_goods` (`GOODS_ID`,`GOODS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_goods_class_manage
-- ----------------------------
DROP TABLE IF EXISTS `wms_goods_class_manage`;
CREATE TABLE `wms_goods_class_manage` (
  `ID` varchar(50) NOT NULL COMMENT '����',
  `DEALER_ORG` varchar(64) DEFAULT NULL COMMENT '������id',
  `CLASSCODE` varchar(20) DEFAULT NULL COMMENT '������',
  `PARENTID` varchar(20) DEFAULT NULL COMMENT '���ุid',
  `CLASSNAME` varchar(50) DEFAULT NULL COMMENT '��������',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_inventory
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory`;
CREATE TABLE `wms_inventory` (
  `INVENTORYID` varchar(20) NOT NULL COMMENT '����',
  `GOODSCODE` varchar(28) DEFAULT NULL COMMENT '��Ʒ���',
  `GOODSNAME` varchar(50) DEFAULT NULL COMMENT '��Ʒ����',
  `BOOKQUANTITY` double(11,2) DEFAULT NULL COMMENT '����������',
  `ACTUALQUANTITY` double(11,2) DEFAULT NULL COMMENT 'ʵ�ʿ������',
  `OVERAGE` double(11,2) DEFAULT NULL COMMENT '��ӯ',
  `LOSS` double(11,2) DEFAULT NULL COMMENT '�̿�',
  `PRICE` double(50,2) DEFAULT '0.00' COMMENT '���',
  `CURRENTTIME` datetime DEFAULT NULL COMMENT '����ʱ��',
  `DEPOTCODE` varchar(50) DEFAULT NULL COMMENT '�ֿ���',
  `DEPOTNAME` varchar(50) DEFAULT NULL COMMENT '�ֿ�����',
  `DEPOTLOCATION` varchar(10) DEFAULT NULL COMMENT '��λ',
  `SERIALNUMBER` varchar(50) DEFAULT NULL COMMENT '��ˮ��',
  `HANDLE` varchar(1) DEFAULT NULL COMMENT '����״̬',
  `ISDELETE` varchar(1) DEFAULT NULL COMMENT 'ɾ�����',
  `STANDBY1` varchar(50) DEFAULT NULL COMMENT '�����ֶ�1',
  `STANDBY2` varchar(50) DEFAULT NULL COMMENT '�����ֶ�2',
  `STANDBY3` varchar(50) DEFAULT NULL COMMENT '�����ֶ�3',
  `STANDBY4` varchar(50) DEFAULT NULL COMMENT '�����ֶ�4',
  `STANDBY5` varchar(50) DEFAULT NULL COMMENT '�����ֶ�5',
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
  `SERIAL_ID` varchar(20) NOT NULL COMMENT '���',
  `INVOICE_NO` varchar(20) DEFAULT NULL COMMENT '��������',
  `MAIN_ID` varchar(20) DEFAULT NULL COMMENT '������',
  `SON_ID` varchar(20) DEFAULT NULL COMMENT '�ӵ���',
  `PACKAGE_NO` varchar(20) DEFAULT NULL COMMENT '������',
  `NOTE` varchar(20) DEFAULT NULL COMMENT '��ע',
  `RISE_TIME` datetime DEFAULT NULL COMMENT '����ʱ��',
  `DELETED_STATE` varchar(20) DEFAULT NULL COMMENT 'ɾ��״̬',
  `PARCEL_QUANTITY` varchar(20) DEFAULT NULL COMMENT '��������',
  `CONSIGNOR` varchar(20) DEFAULT NULL COMMENT '������',
  `PHONE` varchar(20) DEFAULT NULL COMMENT '��ϵ�绰',
  `LOCATION` varchar(20) DEFAULT NULL COMMENT '��ַ',
  `BACK1` varchar(20) DEFAULT NULL COMMENT '����1',
  `BACK2` varchar(20) DEFAULT NULL COMMENT '����2',
  `BACK3` varchar(20) DEFAULT NULL COMMENT '����3',
  `BACK4` varchar(20) DEFAULT NULL COMMENT '����4',
  `BACK5` varchar(20) DEFAULT NULL COMMENT '����5',
  PRIMARY KEY (`SERIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_library
-- ----------------------------
DROP TABLE IF EXISTS `wms_library`;
CREATE TABLE `wms_library` (
  `UUID` varchar(50) NOT NULL COMMENT 'Ĭ������',
  `ALIBRARY_ID` varchar(50) DEFAULT NULL COMMENT '��λ���',
  `ALIBRARY_NAME` varchar(50) DEFAULT NULL COMMENT '��λ����',
  `STORAGE_AREA` varchar(50) DEFAULT NULL COMMENT '��λ���',
  `ALIBRARY_STATUS` varchar(2) DEFAULT NULL COMMENT '��λ״̬',
  `DEPOT_ID` varchar(50) DEFAULT NULL COMMENT '�ֿ���',
  `CLASS_THREE` varchar(50) DEFAULT NULL COMMENT '��������',
  `CLASS_TWO` varchar(50) DEFAULT NULL COMMENT '��������',
  `CLASS_ONE` varchar(50) DEFAULT NULL COMMENT 'һ������',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '��ע',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
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
  `UUID` varchar(50) NOT NULL COMMENT 'Ĭ������',
  `OPP_ID` varchar(50) DEFAULT NULL COMMENT '�̻�ID',
  `OPP_CODE` varchar(50) DEFAULT NULL COMMENT '�̻����',
  `MAIN_ID` varchar(50) NOT NULL DEFAULT '' COMMENT '������',
  `SON_ID` varchar(50) NOT NULL COMMENT '�ӵ���',
  `PACKAGE_NUMBER` varchar(50) NOT NULL COMMENT '����ʵ������',
  `QUANTITY_DELIVERED` varchar(50) DEFAULT NULL COMMENT '��������',
  `CONSIGNEE_ID` varchar(50) DEFAULT NULL COMMENT '�ջ���ID',
  `CONSIGNEE_NAME` varchar(50) DEFAULT NULL COMMENT '�ջ�������',
  `CONSIGNEE_PHONE` varchar(20) DEFAULT NULL COMMENT '�ջ��˵绰',
  `CONSIGNEE_ADDR` varchar(255) DEFAULT NULL COMMENT '�ջ��˵�ַ',
  `CONSIGNOR_ID` varchar(50) DEFAULT NULL COMMENT '������ID',
  `CONSIGNOR_NAME` varchar(50) DEFAULT NULL COMMENT '����������',
  `CONSIGNOR_PHONE` varchar(20) DEFAULT NULL COMMENT '�����˵绰',
  `CONSIGNOR_ADDR` varchar(255) DEFAULT NULL COMMENT '�����˵�ַ',
  `ORDER_STATUS` varchar(2) DEFAULT NULL COMMENT '����״̬��',
  `ARRIVAL_STATUS` varchar(2) DEFAULT '0' COMMENT '����״̬��0.δ�ջ� 1.�����ջ� 2.���ջ� ',
  `IGT_ORDER_ID` varchar(50) DEFAULT NULL COMMENT 'IGT������',
  `CLIENT_CODE` varchar(50) DEFAULT NULL COMMENT '�����̱���',
  `DELIVERY_TIME` varchar(50) DEFAULT NULL COMMENT '����ʱ��',
  `ORG_ID` varchar(255) NOT NULL COMMENT '������ID',
  `ISDELETED` varchar(2) NOT NULL DEFAULT '0' COMMENT 'ɾ��״̬��0.δɾ�� 1.��ɾ��',
  `OPERATING_TIME` varchar(50) DEFAULT NULL COMMENT '����ʱ��',
  `CREATION_DATE` varchar(50) DEFAULT NULL COMMENT '����ʱ��',
  `SENDGOODS_QUANTITY` varchar(50) DEFAULT NULL COMMENT '����������',
  `GOODSSDEL_STATUS` varchar(20) DEFAULT '0' COMMENT '����״̬ 0 δ������Ĭ�ϣ���1�����ַ���  2��ȫ������',
  `ORDER_TYPE` varchar(50) DEFAULT NULL COMMENT '�������ͣ��ͻ������Ĳ������з�������Ʒ�������ϵ�',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  `SPARE2` varchar(255) DEFAULT NULL,
  `SPARE3` varchar(255) DEFAULT NULL,
  `SPARE4` varchar(255) DEFAULT NULL,
  `SPARE5` varchar(255) DEFAULT NULL,
  `EXPECT_AMOUNT` varchar(50) NOT NULL COMMENT 'Ԥ�Ʒ�������',
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_order_sheet_copy
-- ----------------------------
DROP TABLE IF EXISTS `wms_order_sheet_copy`;
CREATE TABLE `wms_order_sheet_copy` (
  `UUID` varchar(50) NOT NULL COMMENT 'Ĭ������',
  `OPP_ID` varchar(50) DEFAULT NULL COMMENT '�̻�ID',
  `OPP_CODE` varchar(50) DEFAULT NULL COMMENT '�̻����',
  `MAIN_ID` varchar(50) NOT NULL DEFAULT '' COMMENT '������',
  `SON_ID` varchar(50) NOT NULL COMMENT '�ӵ���',
  `PACKAGE_NUMBER` varchar(50) NOT NULL COMMENT '����ʵ������',
  `QUANTITY_DELIVERED` varchar(50) DEFAULT NULL COMMENT '��������',
  `CONSIGNEE_ID` varchar(50) DEFAULT NULL COMMENT '�ջ���ID',
  `CONSIGNEE_NAME` varchar(50) DEFAULT NULL COMMENT '�ջ�������',
  `CONSIGNEE_PHONE` varchar(20) DEFAULT NULL COMMENT '�ջ��˵绰',
  `CONSIGNEE_ADDR` varchar(255) DEFAULT NULL COMMENT '�ջ��˵�ַ',
  `CONSIGNOR_ID` varchar(50) DEFAULT NULL COMMENT '������ID',
  `CONSIGNOR_NAME` varchar(50) DEFAULT NULL COMMENT '����������',
  `CONSIGNOR_PHONE` varchar(20) DEFAULT NULL COMMENT '�����˵绰',
  `CONSIGNOR_ADDR` varchar(255) DEFAULT NULL COMMENT '�����˵�ַ',
  `ORDER_STATUS` varchar(2) DEFAULT NULL COMMENT '����״̬��',
  `ARRIVAL_STATUS` varchar(2) DEFAULT '0' COMMENT '����״̬��0.δ�ջ� 1.�����ջ� 2.���ջ� ',
  `IGT_ORDER_ID` varchar(50) DEFAULT NULL COMMENT 'IGT������',
  `CLIENT_CODE` varchar(50) DEFAULT NULL COMMENT '�����̱���',
  `DELIVERY_TIME` varchar(50) DEFAULT NULL COMMENT '����ʱ��',
  `ORG_ID` varchar(255) NOT NULL COMMENT '������ID',
  `ISDELETED` varchar(2) NOT NULL DEFAULT '0' COMMENT 'ɾ��״̬��0.δɾ�� 1.��ɾ��',
  `OPERATING_TIME` varchar(50) DEFAULT NULL COMMENT '����ʱ��',
  `CREATION_DATE` varchar(50) DEFAULT NULL COMMENT '����ʱ��',
  `SENDGOODS_QUANTITY` varchar(50) DEFAULT NULL COMMENT '����������',
  `GOODSSDEL_STATUS` varchar(20) DEFAULT '0' COMMENT '����״̬ 0 δ������Ĭ�ϣ���1�����ַ���  2��ȫ������',
  `ORDER_TYPE` varchar(50) DEFAULT NULL COMMENT '�������ͣ��ͻ������Ĳ������з�������Ʒ�������ϵ�',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  `SPARE2` varchar(255) DEFAULT NULL,
  `SPARE3` varchar(255) DEFAULT NULL,
  `SPARE4` varchar(255) DEFAULT NULL,
  `SPARE5` varchar(255) DEFAULT NULL,
  `EXPECT_AMOUNT` varchar(50) NOT NULL COMMENT 'Ԥ�Ʒ�������',
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_order_sheet_sfy
-- ----------------------------
DROP TABLE IF EXISTS `wms_order_sheet_sfy`;
CREATE TABLE `wms_order_sheet_sfy` (
  `UUID` varchar(50) NOT NULL COMMENT 'Ĭ������',
  `OPP_ID` varchar(50) DEFAULT NULL COMMENT '�̻�ID',
  `OPP_CODE` varchar(50) DEFAULT NULL COMMENT '�̻����',
  `MAIN_ID` varchar(50) NOT NULL DEFAULT '' COMMENT '������',
  `SON_ID` varchar(50) NOT NULL COMMENT '�ӵ���',
  `PACKAGE_NUMBER` varchar(50) NOT NULL COMMENT '��������',
  `QUANTITY_DELIVERED` varchar(50) NOT NULL DEFAULT '' COMMENT '��������',
  `CONSIGNEE_ID` varchar(50) DEFAULT NULL COMMENT '�ջ���ID',
  `CONSIGNEE_NAME` varchar(50) DEFAULT NULL COMMENT '�ջ�������',
  `CONSIGNEE_PHONE` varchar(20) DEFAULT NULL COMMENT '�ջ��˵绰',
  `CONSIGNEE_ADDR` varchar(255) DEFAULT NULL COMMENT '�ջ��˵�ַ',
  `CONSIGNOR_ID` varchar(50) DEFAULT NULL COMMENT '������ID',
  `CONSIGNOR_NAME` varchar(50) DEFAULT NULL COMMENT '����������',
  `CONSIGNOR_PHONE` varchar(20) DEFAULT NULL COMMENT '�����˵绰',
  `CONSIGNOR_ADDR` varchar(255) DEFAULT NULL COMMENT '�����˵�ַ',
  `ORDER_STATUS` varchar(2) DEFAULT NULL COMMENT '����״̬��',
  `ARRIVAL_STATUS` varchar(2) DEFAULT NULL COMMENT '����״̬��0.δ�ջ� 1.�����ջ� 2.���ջ� ',
  `IGT_ORDER_ID` varchar(50) DEFAULT NULL COMMENT 'IGT������',
  `CLIENT_CODE` varchar(50) DEFAULT NULL,
  `DELIVERY_TIME` varchar(50) DEFAULT NULL,
  `ORG_ID` varchar(255) NOT NULL,
  `ISDELETED` varchar(2) NOT NULL DEFAULT '0' COMMENT 'ɾ��״̬��0.δɾ�� 1.��ɾ��',
  `OPERATING_TIME` varchar(50) DEFAULT NULL COMMENT '����ʱ��',
  `CREATION_DATE` varchar(50) DEFAULT NULL COMMENT '����ʱ��',
  `SENDGOODS_QUANTITY` varchar(50) DEFAULT NULL COMMENT '����������',
  `GOODSSDEL_STATUS` varchar(20) DEFAULT '0' COMMENT '����״̬ 0 δ������Ĭ�ϣ���1�����ַ���  2��ȫ������',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
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
  `NUMBER` varchar(30) DEFAULT NULL COMMENT '�ֿ���',
  `VOCATIONALWORKNUMBER` varchar(100) DEFAULT NULL COMMENT 'ҵ�񵥺�',
  `TIMEOUT` varchar(100) DEFAULT NULL COMMENT '����ʱ��',
  `PRODUCTTYPE` varchar(50) DEFAULT NULL COMMENT '��Ʒ����',
  `OUTTYPE` varchar(50) DEFAULT NULL COMMENT '���ⷽʽ',
  `STOREHOUSENAME` varchar(100) DEFAULT NULL COMMENT '�ֿ�����',
  `OUTNUMBER` varchar(30) DEFAULT NULL COMMENT '���ⵥ��',
  `OPERATEHUMAN` varchar(50) DEFAULT NULL COMMENT '������',
  `ISDELETE` int(1) unsigned zerofill DEFAULT '0' COMMENT '�Ƿ�ɾ��1:ɾ��0:δɾ��',
  `VOCATIONALWORKTYPE` varchar(50) DEFAULT NULL COMMENT 'ҵ������',
  `TEMP1` varchar(50) DEFAULT NULL,
  `TEMP2` varchar(50) DEFAULT NULL,
  `TEMP3` varchar(50) DEFAULT NULL,
  `TEMP4` varchar(50) DEFAULT NULL,
  `TEMP5` varchar(50) DEFAULT NULL,
  `OUT_ATTACHMENT` varchar(64) DEFAULT NULL COMMENT '��������ID',
  PRIMARY KEY (`OUTSTOREROOMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_parcel_details
-- ----------------------------
DROP TABLE IF EXISTS `wms_parcel_details`;
CREATE TABLE `wms_parcel_details` (
  `UUID` varchar(50) NOT NULL COMMENT 'Ĭ������',
  `MATERIAL_ID` varchar(50) NOT NULL COMMENT '���ϱ��',
  `PACKAGE_ID` varchar(50) DEFAULT NULL COMMENT '�������',
  `MATERIAL_NAME` varchar(50) DEFAULT NULL COMMENT '��������',
  `NUMBER` varchar(50) DEFAULT NULL COMMENT '��������',
  `INNER_COLOR` varchar(50) DEFAULT NULL COMMENT '��ɫ',
  `OUTER_COLOR` varchar(50) DEFAULT NULL COMMENT '��ɫ',
  `PRICE` varchar(20) DEFAULT NULL COMMENT '�۸�',
  `STATUS` varchar(2) DEFAULT NULL COMMENT '����״̬��0.�ѵ� 1.δ��',
  `ISDELETED` varchar(2) DEFAULT '0' COMMENT 'ɾ��״̬:0.δɾ�� 1.��ɾ��',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '��ע',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  `SPARE2` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  `SPARE3` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_parcel_details_sfy
-- ----------------------------
DROP TABLE IF EXISTS `wms_parcel_details_sfy`;
CREATE TABLE `wms_parcel_details_sfy` (
  `UUID` varchar(50) NOT NULL COMMENT 'Ĭ������',
  `MATERIAL_ID` varchar(50) NOT NULL COMMENT '���ϱ��',
  `PACKAGE_ID` varchar(50) DEFAULT NULL COMMENT '�������',
  `MATERIAL_NAME` varchar(50) DEFAULT NULL COMMENT '��������',
  `NUMBER` varchar(50) DEFAULT NULL COMMENT '��������',
  `INNER_COLOR` varchar(50) DEFAULT NULL COMMENT '��ɫ',
  `OUTER_COLOR` varchar(50) DEFAULT NULL COMMENT '��ɫ',
  `PRICE` varchar(20) DEFAULT NULL COMMENT '�۸�',
  `STATUS` varchar(2) DEFAULT NULL COMMENT '����״̬��0.�ѵ� 1.δ��',
  `ISDELETED` varchar(2) DEFAULT '0' COMMENT 'ɾ��״̬:0.δɾ�� 1.��ɾ��',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '��ע',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  `SPARE2` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  `SPARE3` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_parcel_list
-- ----------------------------
DROP TABLE IF EXISTS `wms_parcel_list`;
CREATE TABLE `wms_parcel_list` (
  `UUID` varchar(50) NOT NULL COMMENT 'Ĭ������',
  `PACKAGE_ID` varchar(50) NOT NULL COMMENT '�������',
  `PACKAGE_NAME` varchar(50) DEFAULT NULL COMMENT '��������',
  `SON_ID` varchar(50) NOT NULL COMMENT '�ӵ���',
  `PACKAGE_STATUS` varchar(2) DEFAULT '0' COMMENT '�ֿ��ջ�����״̬���0.Ϊδ�� 1.Ϊ�ѵ�',
  `IGT_ORDER_ID` varchar(50) DEFAULT NULL,
  `GOODSSDEL_STATUS` varchar(20) DEFAULT '0' COMMENT '����״̬ 0 δ������Ĭ�ϣ���1�����ַ���  2��ȫ������',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
  `SPARE2` varchar(255) DEFAULT NULL,
  `SPARE3` varchar(255) DEFAULT NULL,
  `FACTORY_SEND_STATUS` varchar(2) DEFAULT NULL COMMENT '������������״̬��0��δ����1���ѷ���',
  PRIMARY KEY (`UUID`),
  KEY `SONID` (`SON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_parcel_list_sfy
-- ----------------------------
DROP TABLE IF EXISTS `wms_parcel_list_sfy`;
CREATE TABLE `wms_parcel_list_sfy` (
  `UUID` varchar(50) NOT NULL COMMENT 'Ĭ������',
  `PACKAGE_ID` varchar(50) NOT NULL COMMENT '�������',
  `PACKAGE_NAME` varchar(50) DEFAULT NULL COMMENT '��������',
  `SON_ID` varchar(50) NOT NULL COMMENT '�ӵ���',
  `PACKAGE_STATUS` varchar(2) DEFAULT NULL COMMENT '����״̬���0.Ϊδ�� 1.Ϊ�ѵ�',
  `IGT_ORDER_ID` varchar(50) DEFAULT NULL,
  `GOODSSDEL_STATUS` varchar(20) DEFAULT '0' COMMENT '����״̬ 0 δ������Ĭ�ϣ���1�����ַ���  2��ȫ������',
  `SPARE1` varchar(255) DEFAULT NULL COMMENT '�����ֶ�',
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
  `PROVIDER_ID` varchar(255) NOT NULL COMMENT '���',
  `PROVIDER_CODE` varchar(255) NOT NULL COMMENT '��Ӧ�̱��',
  `PROVIDER_NAME` varchar(255) NOT NULL COMMENT '��Ӧ������',
  `DEALER_ORG` varchar(255) NOT NULL COMMENT '�����̱��',
  `PROVIDER_TYPE` varchar(255) NOT NULL COMMENT '��Ӧ������',
  `PROVIDER_CONTACT` varchar(255) NOT NULL COMMENT '��Ӧ����ϵ��',
  `PROVIDER_PHONE` varchar(255) NOT NULL COMMENT '��Ӧ�̵绰',
  `PROVIDER_ACCOUNT_NAME` varchar(255) NOT NULL COMMENT '��Ӧ�̿�����',
  `PROVIDER_ACCOUNT_NUMBER` varchar(255) NOT NULL COMMENT '��Ӧ���˺�',
  `PROVIDER_ACCOUNT_BANK` varchar(255) NOT NULL COMMENT '��Ӧ�̿�����',
  `PROVIDER_START_TIME` datetime DEFAULT NULL COMMENT '����(��ͬ)��ʼʱ��',
  `PROVIDER_END_TIME` datetime DEFAULT NULL COMMENT '����(��ͬ)����ʱ��',
  `PROVIDER_ATTACH` varchar(1) NOT NULL DEFAULT '��' COMMENT '�Ƿ���ں�ͬ(�ǣ���)',
  `ISDELETE` varchar(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ����(��Ӧ���Ƿ����)(0:δɾ��,1:��ɾ��)',
  `STANDBY1` varchar(255) DEFAULT NULL COMMENT '�����ֶ�1',
  `STANDBY2` varchar(255) DEFAULT NULL COMMENT '�����ֶ�2',
  `STANDBY3` varchar(255) DEFAULT NULL COMMENT '�����ֶ�3',
  `STANDBY4` varchar(255) DEFAULT NULL COMMENT '�����ֶ�4',
  `STANDBY5` varchar(255) DEFAULT NULL COMMENT '�����ֶ�5',
  PRIMARY KEY (`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_provider_goods
-- ----------------------------
DROP TABLE IF EXISTS `wms_provider_goods`;
CREATE TABLE `wms_provider_goods` (
  `GOODS_ID` varchar(255) NOT NULL COMMENT '���',
  `GOODS_CODE` varchar(255) NOT NULL COMMENT '��Ʒ���',
  `GOODS_NAME` varchar(255) NOT NULL COMMENT '��Ʒ����',
  `GOODS_PRICE` varchar(255) NOT NULL COMMENT '��Ʒ�۸�',
  `PROVIDER_CODE` varchar(255) NOT NULL COMMENT '��Ӧ�̱��',
  `ISDELETE` varchar(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�ɾ��(��Ӧ����Ʒ�Ƿ����)(0:δɾ��,1:��ɾ��)',
  `STANDBY1` varchar(255) DEFAULT NULL COMMENT '�����ֶ�1',
  `STANDBY2` varchar(255) DEFAULT NULL COMMENT '�����ֶ�2',
  `STANDBY3` varchar(255) DEFAULT NULL COMMENT '�����ֶ�3',
  `STANDBY4` varchar(255) DEFAULT NULL COMMENT '�����ֶ�4',
  `STANDBY5` varchar(255) DEFAULT NULL COMMENT '�����ֶ�5',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_purchase
-- ----------------------------
DROP TABLE IF EXISTS `wms_purchase`;
CREATE TABLE `wms_purchase` (
  `PURCHASEID` varchar(255) NOT NULL COMMENT '���',
  `PURCHASECODE` varchar(255) NOT NULL COMMENT '�ɹ�����',
  `PURCHASEENDTIME` datetime NOT NULL COMMENT '������ʱ��',
  `PURCHASESTATUS` varchar(2) NOT NULL DEFAULT '1' COMMENT '�ɹ���״̬(0:��ȡ��,1:δִ��,2:���ֵ���,3:�����)',
  `DEALER_ORG` varchar(255) DEFAULT NULL COMMENT '����������',
  `PURCHASEAPPROVESTATUS` varchar(1) NOT NULL DEFAULT '0' COMMENT '�ɹ�������״̬',
  `PROVIDERID` varchar(255) NOT NULL COMMENT '��Ӧ��ID',
  `PURCHASEEXECUTOR` varchar(32) NOT NULL COMMENT '�ɹ�ִ����',
  `PROVIDERNAME` varchar(255) DEFAULT NULL COMMENT '��Ӧ������',
  `ISDELETE` varchar(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�ɾ��(0:δɾ��,1:��ɾ��)',
  `DEPOTCODE` varchar(255) DEFAULT NULL COMMENT '�ֿ���',
  `DEPOTNAME` varchar(255) DEFAULT NULL COMMENT '�ֿ�����',
  `REMARK` varchar(1000) DEFAULT NULL COMMENT '��ע',
  `STANDBY01` varchar(255) DEFAULT NULL COMMENT '��ע�ֶ�1',
  `STANDBY02` varchar(255) DEFAULT NULL COMMENT '��ע�ֶ�2',
  `STANDBY03` varchar(255) DEFAULT NULL COMMENT '��ע�ֶ�3',
  `STANDBY04` varchar(255) DEFAULT NULL COMMENT '��ע�ֶ�4',
  `STANDBY05` varchar(255) DEFAULT NULL COMMENT '��ע�ֶ�5',
  `SHOP_ID` varchar(250) DEFAULT NULL COMMENT '�ŵ�ID',
  `IS_ENGINEERING_ORDER` varchar(5) DEFAULT NULL COMMENT '�Ƿ񹤳̶���',
  `ENGINEERING_CLIENTS` varchar(60) DEFAULT NULL COMMENT '���̿ͻ�',
  PRIMARY KEY (`PURCHASEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_purchasedetail
-- ----------------------------
DROP TABLE IF EXISTS `wms_purchasedetail`;
CREATE TABLE `wms_purchasedetail` (
  `PURCHASEDETAIL_ID` varchar(255) NOT NULL COMMENT '�ɹ�������',
  `GOODS_CODE` varchar(255) DEFAULT NULL COMMENT '��Ʒ����',
  `PURCHASE_CODE` varchar(255) DEFAULT NULL COMMENT '�ɹ����ű���',
  `PURCHASE_PRICE` varchar(255) DEFAULT NULL COMMENT '�ɹ��۸�',
  `PURCHASE_NUM` varchar(255) DEFAULT NULL COMMENT '�ɹ�����',
  `RECEIVE_NUM` varchar(255) DEFAULT '0' COMMENT '�ѵ�����',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '�����޸�ʱ��',
  `ISDELETE` varchar(4) DEFAULT '0' COMMENT '�Ƿ�ɾ��',
  `REMARK` varchar(255) DEFAULT NULL,
  `STANDBY1` varchar(255) DEFAULT NULL COMMENT '��ע�ֶ�',
  `STANDBY2` varchar(255) DEFAULT NULL COMMENT '��ע�ֶ�',
  `STANDBY3` varchar(255) DEFAULT NULL COMMENT '��ע�ֶ�',
  `STANDBY4` varchar(255) DEFAULT NULL COMMENT '��ע�ֶ�',
  `STANDBY5` varchar(255) DEFAULT NULL COMMENT '��ע�ֶ�',
  PRIMARY KEY (`PURCHASEDETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_record
-- ----------------------------
DROP TABLE IF EXISTS `wms_record`;
CREATE TABLE `wms_record` (
  `RECORDID` varchar(60) NOT NULL COMMENT '����',
  `ODDNUMBER` varchar(50) DEFAULT NULL COMMENT '���/���ⵥ��',
  `CURRENTTIME` datetime NOT NULL COMMENT '����ʱ��',
  `GOODSCODE` varchar(50) DEFAULT NULL COMMENT '��Ʒ���',
  `GOODSNAME` varchar(240) DEFAULT NULL,
  `QUANTITY` double(100,2) DEFAULT NULL COMMENT '����',
  `INQUANTITY` double(50,2) DEFAULT NULL COMMENT '�������',
  `PRICE` double(20,2) DEFAULT NULL COMMENT '�۸�',
  `DEPOTCODE` varchar(50) DEFAULT NULL COMMENT '�ֿ���',
  `DEPOTNAME` varchar(50) DEFAULT NULL COMMENT '�ֿ�����',
  `DEPOTLOCATION` varchar(20) DEFAULT NULL COMMENT '��λ',
  `TYPE` varchar(28) DEFAULT NULL COMMENT '����/�������',
  `PERSONNL` varchar(60) DEFAULT NULL COMMENT '������',
  `FLAG` double(1,0) DEFAULT NULL COMMENT '����/����ǣ�0����,1��⣩',
  `PROVIDERID` varchar(50) DEFAULT NULL COMMENT '��Ӧ��',
  `BATCHNUMBER` varchar(50) DEFAULT NULL COMMENT '���ε��ţ���ⵥ�ţ�',
  `ISDELETE` varchar(50) DEFAULT NULL COMMENT '0δɾ����1��ɾ��',
  `MONEY` double(100,2) DEFAULT '0.00' COMMENT '���',
  `SPARE1` varchar(100) DEFAULT NULL COMMENT '�����ֶ�1',
  `SPARE2` varchar(100) DEFAULT NULL COMMENT '�����ֶ�2',
  `SPARE3` varchar(100) DEFAULT NULL COMMENT '�����ֶ�3',
  `SPARE4` varchar(100) DEFAULT NULL COMMENT '�����ֶ�4',
  `SPARE5` varchar(100) DEFAULT NULL COMMENT '�����ֶ�5',
  `PROVIDERNAME` varchar(255) DEFAULT NULL COMMENT '��Ӧ������',
  `SOURCEODDNUMBER` varchar(50) DEFAULT NULL,
  `ENGINEERING_CLIENTS` varchar(60) DEFAULT NULL COMMENT '���̿ͻ�',
  `COUNTING_TIMES` int(20) DEFAULT '0' COMMENT '�������',
  `INITIAL_COST_PRICE` double(20,2) DEFAULT '0.00' COMMENT '��ʼ�ɱ���',
  PRIMARY KEY (`RECORDID`),
  KEY `I_SOURCEODDNUMBER` (`SOURCEODDNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_report_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_report_detail`;
CREATE TABLE `wms_report_detail` (
  `DETAILED_ID` varchar(20) NOT NULL COMMENT '����',
  `RDETAILED_CODE` varchar(50) DEFAULT NULL COMMENT '������',
  `REPORT_CODE` varchar(50) DEFAULT NULL COMMENT '�±���������',
  `GOODSCODE` varchar(50) DEFAULT NULL COMMENT '��Ʒ���',
  `GOODSNAME` varchar(50) DEFAULT NULL COMMENT '��Ʒ����',
  `LASTAMOUNT` varchar(50) DEFAULT '0' COMMENT '�ڳ��������',
  `LASTPRICE` varchar(100) DEFAULT '0.00' COMMENT '�ڳ�����',
  `LASTSUMPRICE` varchar(100) DEFAULT '0.00' COMMENT '�ڳ����',
  `GETAMOUNT` int(50) DEFAULT '0' COMMENT '�������',
  `GETPRICE` varchar(100) DEFAULT '0.00' COMMENT '��ⵥ��',
  `SUMPRICE` varchar(100) DEFAULT '0.00' COMMENT '�����',
  `OUTAMOUT` int(50) DEFAULT '0' COMMENT '��������',
  `OUTPRICE` varchar(100) DEFAULT '0.00' COMMENT '���ⵥ��',
  `OUTSUMPRICE` varchar(100) DEFAULT '0.00' COMMENT '������',
  `NOWPRICE` varchar(100) DEFAULT '0.00' COMMENT '��浥��',
  `NOWAMOUNT` int(20) DEFAULT '0' COMMENT '�������',
  `NOWSUMPRICE` varchar(100) DEFAULT '0.00' COMMENT '�����',
  `REMARK` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '�����ֶ�',
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
  `RET_ID` varchar(20) NOT NULL COMMENT '����',
  `TERMINAL_CODE` varchar(50) DEFAULT NULL COMMENT '��ĩ�������ı��',
  `GOODSCODE` varchar(50) DEFAULT NULL COMMENT '��Ʒ���',
  `GOODSNAME` varchar(50) DEFAULT NULL COMMENT '��Ʒ����',
  `LASTAMOUNT` varchar(50) DEFAULT NULL COMMENT '��ĩ������������',
  `LASTPRICE` varchar(100) DEFAULT NULL COMMENT '��ĩ�������ļ۸�',
  `LASTSUMPRICE` varchar(100) DEFAULT NULL COMMENT '��ĩ���������ܽ��',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '����ʱ��',
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
  `SALES_ID` varchar(50) NOT NULL COMMENT '����',
  `SALES_CODE` varchar(50) DEFAULT NULL COMMENT '�˻�����',
  `BUSINESS_NUMBER` varchar(50) DEFAULT NULL COMMENT 'ҵ�񵥺�',
  `CREATOR_ID` varchar(50) DEFAULT NULL COMMENT '������ID',
  `CREATOR` varchar(255) DEFAULT NULL COMMENT '������',
  `CREATION_TIME` datetime DEFAULT NULL COMMENT '����ʱ��',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '����ʱ��',
  `DEPOT_CODE` varchar(20) DEFAULT NULL COMMENT '�ֿ���',
  `DEPOT_NAME` varchar(20) DEFAULT '0' COMMENT '�ֿ�����',
  `DEALER_ID` varchar(50) DEFAULT NULL COMMENT '������ID',
  `SHOP_ID` varchar(50) DEFAULT NULL COMMENT '�ŵ�ID',
  `SHOP_NAME` varchar(50) DEFAULT NULL COMMENT '�ŵ�����',
  `CUSTOMER_NAME` varchar(50) DEFAULT NULL COMMENT '�ͻ�����',
  `CUSTOMER_PHONE` varchar(50) DEFAULT NULL COMMENT '�ͻ��绰',
  `CUSTOMER_ADDRESS` varchar(255) NOT NULL COMMENT '�ͻ���ַ',
  `APPORVAL_STATE` varchar(1) DEFAULT NULL COMMENT '���״̬:0�༭,1������,2����,3���ͨ��,4���,5�����',
  `ISDELETE` varchar(1) DEFAULT '0' COMMENT '0����1,ɾ��',
  `ACTION_TYPE` varchar(1) DEFAULT '1' COMMENT '������ʽ(1:�˻����)',
  `REMARKS` varchar(1000) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`SALES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_salesreturn_details
-- ----------------------------
DROP TABLE IF EXISTS `wms_salesreturn_details`;
CREATE TABLE `wms_salesreturn_details` (
  `SALES_DETAILS_ID` varchar(255) NOT NULL COMMENT '����',
  `GOODS_CODE` varchar(50) DEFAULT NULL COMMENT '��Ʒ���',
  `GOODS_NAME` varchar(255) DEFAULT NULL COMMENT '��Ʒ����',
  `GOODS_PRICE` double(100,2) DEFAULT '0.00' COMMENT '��Ʒ�۸�',
  `ORDER_QUANTITY` double(100,2) DEFAULT NULL COMMENT '��������',
  `OUTLIBRARY_QUANTITY` double(100,2) DEFAULT NULL COMMENT '�ѳ�������',
  `RETURN_QUANTITY` double(100,2) DEFAULT '0.00' COMMENT '�˻�����',
  `ALIBRARY_ID` varchar(50) DEFAULT NULL COMMENT '��λ���',
  `ISDELETE` varchar(1) DEFAULT '0' COMMENT '0����1,ɾ��',
  `SALES_ID` varchar(255) DEFAULT NULL COMMENT '��������',
  `REMARKS` varchar(1000) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`SALES_DETAILS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_sfy_corresponding_simi
-- ----------------------------
DROP TABLE IF EXISTS `wms_sfy_corresponding_simi`;
CREATE TABLE `wms_sfy_corresponding_simi` (
  `SFYORG_ID` varchar(50) DEFAULT NULL COMMENT '�����Ǿ�����ID',
  `SIMIORG_ID` varchar(50) DEFAULT NULL COMMENT '˾�׾�����ID',
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
  `STOCKID` varchar(20) NOT NULL COMMENT '����',
  `GOODSCODE` varchar(50) DEFAULT NULL COMMENT '��Ʒ���',
  `GOODSNAME` varchar(50) DEFAULT NULL COMMENT '��Ʒ����',
  `DEPOTCODE` varchar(50) DEFAULT NULL COMMENT '�ֿ���',
  `OCCUPANCYQUANTITY` double(20,2) DEFAULT '0.00' COMMENT '���ռ������',
  `DEPOTNAME` varchar(50) DEFAULT NULL COMMENT '�ֿ�����',
  `INQUANTITY` double(50,2) DEFAULT '0.00' COMMENT '�������',
  `ISDELETE` varchar(1) DEFAULT NULL COMMENT '0δɾ����1��ɾ��',
  `SPARE1` varchar(100) DEFAULT NULL COMMENT '�����ֶ�1',
  `SPARE2` varchar(100) DEFAULT NULL COMMENT '�����ֶ�2',
  `SPARE3` varchar(100) DEFAULT NULL COMMENT '�����ֶ�3',
  `SPARE4` varchar(100) DEFAULT NULL COMMENT '�����ֶ�4',
  `SPARE5` varchar(100) DEFAULT NULL COMMENT '�����ֶ�5',
  `ALIBRARY_ID` varchar(60) DEFAULT NULL COMMENT '��λID',
  PRIMARY KEY (`STOCKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_stock_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_detail`;
CREATE TABLE `wms_stock_detail` (
  `STOCK_DETAILID` varchar(20) NOT NULL COMMENT '���ռ�������ű�ʶ',
  `STOCKID` varchar(20) DEFAULT NULL COMMENT '�ֿ�����id',
  `GOODSCODE` varchar(50) DEFAULT NULL COMMENT '��Ʒ���',
  `GOODSNAME` varchar(50) DEFAULT NULL COMMENT '��Ʒ����',
  `TYPE` varchar(20) DEFAULT NULL COMMENT '����ⷽʽ',
  `BUSINESSORDERNO` varchar(50) DEFAULT NULL COMMENT 'ҵ�񵥺�',
  `STATE` varchar(1) DEFAULT '0' COMMENT 'ռ��״̬0�����Լ������,1����ռ��',
  `FLAG` varchar(1) DEFAULT NULL COMMENT '0,�������,1�������',
  `OCCUPANCYQUANTITY` double(44,2) DEFAULT NULL COMMENT 'ռ������',
  `SPARE1` varchar(20) DEFAULT NULL COMMENT '�����ֶ�1',
  `SPARE2` varchar(20) DEFAULT NULL COMMENT '�����ֶ�2',
  `SPARE3` varchar(20) DEFAULT NULL COMMENT '�����ֶ�3',
  `SPARE4` varchar(20) DEFAULT NULL COMMENT '�����ֶ�4',
  `SPARE5` varchar(20) DEFAULT NULL COMMENT '�����ֶ�5',
  PRIMARY KEY (`STOCK_DETAILID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_stock_report
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_report`;
CREATE TABLE `wms_stock_report` (
  `REPORT_ID` varchar(20) NOT NULL COMMENT '����',
  `REPORT_CODE` varchar(50) DEFAULT NULL COMMENT '������',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '����ʱ��',
  `SERIAL_NUMBER` varchar(50) DEFAULT NULL COMMENT '��ˮ��',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '��ע',
  `SPARE1` varchar(50) DEFAULT NULL,
  `SPARE2` varchar(50) DEFAULT NULL,
  `SPARE3` varchar(50) DEFAULT NULL,
  `SPARE4` varchar(50) DEFAULT NULL,
  `SPARE5` varchar(50) DEFAULT NULL,
  `DEALER_ORG` varchar(50) DEFAULT NULL COMMENT '������id',
  PRIMARY KEY (`REPORT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
