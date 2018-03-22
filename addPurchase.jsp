<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@include file="/common/common.jsp"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanghaihao
  - Date: 2017-07-24 16:46:05
  - Description:
-->
<head>
<%
    HttpSession hs = request.getSession();
    UserObject user = (UserObject)hs.getAttribute("userObject");
    String userName = user.getUserRealName();//用户
 %>
<!--  <style type="text/css">
 .tdTags{
 	visibility: hidden;
 }
 
 </style> -->
 
 
 
<title>新增商品</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
	<div id="purchaseForm">
		<input class="nui-hidden" name="token" id="token">
		<table id="tableInfo" class="nui-form normTable">
			<tr>					
				<td width="8%" style="text-align:right;">采购单号：</td>
				<td width="10%">
					<input  width="100%" id="purchasecode" value="<%=request.getParameter("purchasecode") %>" name="purchasecode" required="true" class="nui-textbox" requiredErrorText="不能为空" allowInput="false"/>
				</td>
				<td width="8%" style="text-align:right;">采购执行人：</td>
				<td width="15%">
					<input  width="100%"   name="purchaseexecutor" value="<%=userName %>" class="nui-textbox"  required="true" requiredErrorText="不能为空"  allowInput="false"  />
					<!-- &nbsp;&nbsp;&nbsp;&nbsp;是否设计部下单<span style="color: red">*</span>:&nbsp;<input class="nui-combobox" showNullItem="true" width="20%"  name="standby04" data="[{id:'0',text:'否'},{id:'1',text:'是'}]"  required="true" requiredErrorText="不能为空"  allowInput="false"  onvaluechanged="designEvent" /> -->
				</td>
				<td width="8%" style="text-align:right;">是否设计部下单<span style="color: red">*</span>：</td>
				<td width="15%">
					<input class="nui-combobox" showNullItem="true" width="100%"  name="standby04" data="[{id:'0',text:'否'},{id:'1',text:'是'}]"  required="true" requiredErrorText="不能为空"  allowInput="false"  onvaluechanged="designEvent" />
				</td>
				<td width="5%" style="text-align:right;">仓库<span style="color: red">*</span>:</td>
				<td width="15%">
					<input id="depotbtn" class="nui-buttonedit" onbuttonclick="ondepotEdit" width="100%"
					 name="depotname" required="true"/>
     				<!-- <input name="depotcode" class="nui-combobox" style="width:200px;" 
               		allowInput="true"  showNullItem="true" required="true"
               		textField="depotName" valueField="depotId" dataField="depotData" id="depotcode"
               		emptyText="请选择仓库..."  nullItemText="" onvaluechanged="depotChanged()" /> -->
               		<input name="depotcode" class="nui-hidden"  id="depotcode" />
                </td>
			</tr>			
			<tr>
				<td width="5%" style="text-align:right;">供应商<span style="color: red">*</span>：</td>
				<td width="15%">
					<input id="providerbtn" class="nui-buttonedit" onbuttonclick="onButtonEdit"  width="100%"
					 name="providername" required="true" />
					<input name="providerid" class="nui-hidden" id="providercode" >
					<!-- <input  width="100%" id="providerid" name="providerid" class="nui-textbox"  required="true" requiredErrorText="不能为空"   /> -->
				</td>
			     <td width="5%" style="text-align:right;">采购类型<span style="color: red">*</span>：</td>
				<td width="15%">
					<input class="nui-combobox" name="purchasetype" width="100%"  showNullItem="true"  data="[{id:'0',text:'非饰品采购'},{id:'2',text:'饰品采购'}]"  emptyText="请选择"  onvaluechanged="onvaluechanged" />
				</td>			
				<td width="7%" style="text-align:right;">是否工程订单<span style="color: red">*</span>:&nbsp;</td>
				<td width="15%">
					<input class="nui-combobox" showNullItem="false" width="100%"  name="isEngineeringOrder" data="[{id:'0',text:'否'},{id:'1',text:'是'}]"  required="true" requiredErrorText="不能为空"  allowInput="false"  onvaluechanged="onvaluechanged"/>
				</td>
				<td  class='tdTags'  width="5%" style="text-align:right;">工程客户<span style="color: red">*</span>:&nbsp;</td>
				<td class='tdTags' width="15%">
					<input id="engineeringClients" name="engineeringClients" class="nui-lookup" style="width:200px;" textField="cooperatorName" onvaluechanged=""  onbeforeshowpopup="onbeforeshowpopup"valueField="unitId" popupWidth="auto" popup="#gridPanel2" grid="#datagrid" multiSelect="false" required="true"/>
				</td>
				
			</tr>
		</table>
	</div>
	<div style="height:50px;">
		<table id="purchaseInfo" class="nui-form normTable">
			<tr>
				<td width="5%" style="text-align:right;">商品名称<span style="color: red">*</span>:</td>
				<td width="15%">
					<input id="goodsName" name="goodsCode" class="nui-lookup" textField="goodsName"
				 	valueField="goodsCode" popupWidth="auto"  popup="#gridPanel" grid="goodsGrid" multiSelect="false"  onclick="onproviderChanged()"
				 	required="true" requiredErrorText="不能为空"   width="100%"  onvaluechanged="onNameChanged()" />
				</td>
				<td width="5%" style="text-align:right;">商品编号<span style="color: red">*</span>:</td>
				<td width="15%">
					<input id="goodsCode" width="100%"  name="goodsName" class="nui-textbox"  required="true" requiredErrorText="不能为空"  allowInput="false"  />
				</td>
				<td width="5%" style="text-align:right;">价格(RMB)<span style="color: red">*</span>:</td>
				<td width="15%">
					<input  width="100%" id="goodsPrice" name="purchasePrice" class="nui-textbox"  required="true" requiredErrorText="不能为空"   />
				</td>
				<td width="5%" style="text-align:right;">采购数量<span style="color: red">*</span>：</td>
				<td width="15%">
					<input  width="100%" id="purchaseNum" name="purchaseNum" class="nui-textbox" onvalidation="onNumValidation"/>
					<!-- 库存数量 -->
					<!-- <input id="inquantity" name="inquantity" class="nui-hidden"/> -->
					<!-- 库存占用数量(已售未出数量) -->
					<!-- <input id="occupancyquantity" name="occupancyquantity" class="nui-hidden"/> -->
					<!-- 可用数量 -->
					<!-- <input id="number" name="number" class="nui-hidden"/> -->
				</td>
			</tr>
		</table>
	</div>
	<div style="text-align: center; padding:0px;height:5%;">
		<a class="nui-button" iconCls="icon-save" style="margin-right: 20px;"onclick="save()">确定</a> 
		<a class="nui-button" iconCls="icon-save" style="margin-right: 20px;"onclick="createPurchase()">生成采购单</a>
		<a class="nui-button" iconCls="icon-undo" style="margin-right: 20px;" onclick="onCancel()">返回</a>
		<!-- <a class="nui-button" iconCls="icon-undo" style="margin-left: 20px;" onclick="">返回</a>  -->
	</div>
	<div>
		<span style="color: red;">请注意：一、仓储申购进行的物品：家居家品、家电、五金、工具、销售赠品、饰品、工程物料 二、行政申购进行的物品：固定资产、办公用品、易耗物料（销售物一次性易耗料金蛋等）、资产维修件（电脑维修件等）如果不确定，请联系信息部指导。</span>
	</div>
	<div id="gridPanel" class="nui-panel" title="header" iconCls="icon-add" style="width:450px;" 
        showToolbar="true" showCloseButton="true" showHeader="false" bodyStyle="padding:0" borderStyle="border:0" 
    >
        <div property="toolbar" style="padding:5px;padding-left:8px;text-align:center;">   
            <div style="float:left;padding-bottom:2px;">
            	<span>商品编号：</span>                
                <input id="searchgoodsCode" class="nui-textbox" />
                <span>商品名称：</span>                
                <input id="searchgoodsName" class="nui-textbox" />
            </div>
            <div align="center">
            	<a class="nui-button" iconCls="icon-search"  onclick="onSearchClick()">查询</a>
                <a class="nui-button" iconCls="icon-reset"  onclick="onClearClick()">清除</a>
                <a class="nui-button" iconCls="icon-close" onclick="onCloseClick">关闭</a>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div id="goodsGrid" class="nui-datagrid" style="width:100%;height:50%;" 
            borderStyle="border:0" showPageSize="false" showPageIndex="false" dataField="providerGoods"
            url="com.sfy.dms.wms.gys.providerGoods.queryProviderGoods.biz.ext">
            <div property="columns">
                <div type="checkcolumn" ></div>
                <div field="goodsCode" width="120" headerAlign="center" allowSort="true">商品编号</div>    
                <div field="goodsName" width="120" headerAlign="center" allowSort="true">商品名称</div>
                <div field="goodsPrice" width="120" headerAlign="center" allowSort="true">商品价格</div>
            </div>
        </div>  
    </div>
    <div id="detailGrid" style="width: 100%; height:400px;" class="nui-datagrid" allowCellEdit="true" pageSize="100" sizeList="[100,120,150]"
    	allowCellSelect="true"  editNextOnEnterKey="true"  editNextRowCell="true" ondrawcell="onDrawCell"
		 multiSelect="fasle"  allowAlternating="true" showPager="true"  oncellvalidation="onCellValidation" >
			<div property="columns">
				<div type="indexcolumn" headerAlign="center" align="center">序号
				</div>
				<div field="goodsCode" headerAlign="center" align="center">商品编号</div>
				<div field="goodsName" headerAlign="center" align="center">商品名称</div>
				<div field="purchasePrice" headerAlign="center" align="center">价格</div>
				<div field="purchaseNum" headerAlign="center" align="center">采购数量
				 <input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
				</div>
				<div field="standby1" headerAlign="center" align="center">库存数量</div>
				<div field="standby2" headerAlign="center" align="center">已售未出数量</div>
				<div field="standby3" headerAlign="center" align="center">可用数量</div>
				<div field="remark" headerAlign="center" align="center">备注
				 <input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
				</div>
				<div field="action" headerAlign="center" align="center">操作
				</div>
			</div>
	</div>
	
	
	
	<!-- 附件上传 -->
	<div style="height:300px;">
	    <iframe id="iframe1" src="<%=request.getContextPath()%>/cgd/upload.jsp" width="100%" height="300" scrolling="no" frameborder="0"></iframe>
	</div>	
		
		

	
	
	
	
	<!-- 下拉窗口1 -->
	<div id="gridPanel2" class="nui-panel" title="header" iconCls="icon-add" style="width:450px;height:450px;" 
 showToolbar="true" showCloseButton="true" showHeader="false" bodyStyle="padding:0" borderStyle="border:0" >
    <div property="toolbar" style="padding:5px;padding-left:8px;text-align:center;">   
        <div style="float:left;padding-bottom:2px;">
            <!-- <span>商品名称:</span>                
            <input class="nui-textbox" style="width:140px;" id="key"/> -->
            <span>单元名称:</span>                
            <input class="nui-textbox" style="width:160px;" id="cooperatorName"/>
            <span>联系电话:</span>                
            <input class="nui-textbox" style="width:160px;" id="tel"/>
            </br>
            <a class="nui-button" iconCls="icon-search" onclick="onSearch()">查询</a>
            <a class="nui-button" iconCls="icon-reset" onclick="onOppClear()">清除</a>
            <a class="nui-button" iconCls="icon-close" onclick="onOppClose()">关闭</a>
        </div>
        <!-- <div style="float:right;padding-bottom:2px;">
        </div> -->
        <div style="clear:both;"></div>
    </div><!-- onselect="onSelect" -->
    <div id="datagrid" class="nui-datagrid" style="width:100%;height:100%;" borderStyle="border:0"
    	 dataField="datas"  pageSize="10" showPageInfo="true" multiSelect="true" allowSortColumn="false" multiSelect="true"
         url="com.sfy.dms.wms.cgd.purchase.queryCooperative.biz.ext" ><!-- onselect="onSelect" -->
         <div property="columns">
             <div type="checkcolumn" ></div>
             <div field="cooperatorName" width="80" headerAlign="center" allowSort="true">单元名称</div>
             <div field="tel" width="120" headerAlign="center" allowSort="true">联系电话</div>
             <div field="address" width="120" headerAlign="center" allowSort="true">联系地址</div>    
         </div>
    </div>  
</div>
    
	<script type="text/javascript">
    	nui.parse();
    	nui.getbyName("purchasetype").setValue("0");
    	$(".tdTags").hide();
    	//页面加载前获取token
		nui.ajax({
	      	async:false,
	        url:"com.sfy.dms.wms.cgd.validata.createtoken.biz.ext",
	        type:'POST',
	        cache:true,
	        contentType:'text/json',
	        success:function(text){
	  			nui.get("token").setValue(text.token);
	        }
		});
		var lookupGrid = nui.get("datagrid");
		var goodsGrid=nui.get("goodsGrid");
		var detailGrid=nui.get("detailGrid");
    	var purchaseInfo=new nui.Form("#purchaseInfo");
    	if(detailGrid.getData().length>0){
   			var providerid=nui.get("providerid");
   			providerid.setReadOnly("true");
	   	}
	   //查询使用次数最多的供应商
      useMostProvider();
      function useMostProvider(){
            var btnEdit = nui.get("providerbtn");
      		nui.ajax({	        
	            url:"com.sfy.dms.wms.gys.provider.usingMostProvider.biz.ext",
	            type:'POST',
	            cache:true,
	            contentType:'text/json',
	            success:function(text){	  
	                var provider = text.proviers[0];
	                btnEdit.setValue(provider.providerName);
                    btnEdit.setText(provider.providerName);
                    nui.get("providercode").setValue(provider.providerCode);
	            }
	      	});
      }
	   	//供应商弹出页面
	   	function onButtonEdit(e) {
            var btnEdit = this;
            nui.open({
                url:"<%=request.getContextPath() %>/cgd/privoder.jsp",
                title: "选择列表",
                width: 850,
                height: 580,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.providerName);
                            btnEdit.setText(data.providerName);
                            nui.get("providercode").setValue(data.providerCode);
                            purchaseInfo.reset();
                        }
                    }
                }
            });
        }
        function ondepotEdit(e){
        	var btnEdit = this;
            nui.open({
                url:"<%=request.getContextPath() %>/cgd/purchasedepot.jsp",
                title: "选择列表",
                width: 850,
                height: 480,
                ondestroy: function (action) {
                    if (action == "ok"){
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.depotName);
                            btnEdit.setText(data.depotName);
                            nui.get("depotcode").setValue(data.depotId);
                            
                        }
                    }
                }
            });
        }
        //加载仓库下拉列表
        /* nui.get("depotcode").load(depotData); */
        /* function depotChanged(){
        	nui.get("depotname").setValue(nui.get("depotcode").getText());
        } */
        //获取仓库
    	var depotData;
    	nui.ajax({
    			async:false,
                url:"com.sfy.dms.wms.warehouse.depotisokcomponent.queryUsableDepot.biz.ext",
                type:'POST',
                cache:false,
                contentType:'text/json',
                success:function(text){
					depotData=text.depot;
                }
         });
         
         //获取库存数量
         function queryGoodsNumber(goodsCode){
	         var inventoryNumbers = null;
	         var data = {code : goodsCode};
			 var json = nui.encode(data);
	         nui.ajax({
				url:"<%= request.getContextPath() %>/com.sfy.dms.wms.cgd.purchase.queryInventoryNumber.biz.ext",
				type:"post",
				contentType:'text/json',
				data:json,
				async:false,
				cache:false,
				success:function(text){
					inventoryNumbers = nui.decode(text);
				}
			});
			return inventoryNumbers;
         }
         
		//保存数据
	   	function save(){
	   		//var purchaseInfo=new nui.Form("#purchaseInfo");
	   		//验证表单信息
	   		if(!(new nui.Form("#purchaseForm").validate()))return;
	   		purchaseInfo.validate();
            if (purchaseInfo.isValid() == false) return;
			var purchasedetail=purchaseInfo.getData();
			purchasedetail.goodsName=nui.get("goodsName").getText();
			var data =purchasedetail;
			
			if(data.goodsCode){
				//设置查找行的条件
				/* var row = detailGrid.findRow(function(row){
				    if(row.goodsCode==data.goodsCode) return true;
				}); */
				/* if(row){
					var num=parseFloat(row.purchaseNum)+parseFloat(data.purchaseNum);
					//设置一行中purchaseNum列的数据
					var rowData={"purchaseNum":num};
					//更新列值
					detailGrid.updateRow(row,rowData);
					new nui.Form("#purchaseInfo").reset();
					return;
				} */
				new nui.Form("#purchaseInfo").reset();
				//新增数据(添加库存数量/可用库存/已售未出数量)
				var goodsNumber = queryGoodsNumber(data.goodsCode);
				data.standby1 = goodsNumber.result.standby1; //库存数量
				data.standby2 = goodsNumber.result.standby2; //已售未出数量
				data.standby3 = goodsNumber.result.standby3; //可用数量
				addRow(data);
				//如果新增成功修改供应商状态为只读
				if(detailGrid.getData().length>0){
		   			var providerid=nui.get("providerbtn");
		   			providerid.setReadOnly("true");
		   			nui.getbyName("standby04").setEnabled(false);
		   			nui.get("depotbtn").setReadOnly("true");
			   	}
			   
			}
		}
		//取消操作
		function onCancel(e) {
			
			//点击返回的时候，如果将附件全部删除
			var rows = document.getElementById('iframe1').contentWindow.nui.get("datagrid2").getData();
			if(rows.length > 0 ){
				debugger;
				var json = nui.encode({data:rows});
				var url = "com.sfy.dms.wms.gys.provider.deleteFile_Wms.biz.ext";
				$.ajax({
					url:url,type:'POST',data:json,cache:false,contentType:'text/json',async:false,
					success:function(text){
						var returnJson = nui.decode(text);
						if(returnJson.exception == null){
                    	}else{
                      		nui.alert("删除附件失败", "系统提示");
                      		return;
                    	}
					}
				});
						
			}
			
			
			history.back()
		}
		//模糊查找功能
		function onSearchClick(){
			var goodsName=nui.get("searchgoodsName").getValue();
			var goodsCode=nui.get("searchgoodsCode").getValue();
			var providerCode=nui.get("providercode").getValue();
			if(providerCode)
			goodsGrid.load({check:{goodsName:goodsName,goodsCode:goodsCode,providerCode:providerCode}})
			else nui.alert("请选择供应商！");
		}
		//关闭功能
		function onCloseClick() {
            var lookup = nui.get("goodsName");
            lookup.hidePopup();
        }
         //联动价格和商品编号
        function onNameChanged(){
        	var lookup = nui.get("goodsName");
        	nui.get("goodsCode").setValue(lookup.getValue());
        	var goodsGrid=nui.get("goodsGrid");
        	var price=goodsGrid.getSelected().goodsPrice;
        	nui.get("goodsPrice").setValue(price);
        }
        //清楚选项
        function onClearClick() {
            var lookup = nui.get("goodsName");
            lookup.deselectAll();
            purchaseInfo.reset();
        }
        //关闭窗口
		function CloseWindow(action) {
			if (window.CloseOwnerWindow) {
				return window.CloseOwnerWindow(action);
			} else {
				window.close();
			}
		}
		//生成采购单
        function createPurchase(){
        	
        	debugger;
        	
        	detailGrid.validate();
        	if(!detailGrid.isValid()){
        		nui.alert("数量输入非法!");
        		return;
        	}
        	var purchasedetails=nui.get("detailGrid").getData();
        	var purchase=new nui.Form("#purchaseForm").getData();
        	
        	if(purchase.isEngineeringOrder=='1'){
        		if(document.getElementById('iframe1').contentWindow.nui.get("datagrid2").getData().length==0){//如果是工程订单的时候，必须要上传附件
        			nui.alert("工程订单必须要上传附件");
        			return;
        		}
        	}
        	
			if(purchasedetails.length==0||purchasedetails==null){
				nui.alert("请添加至少一条数据！","系统提示");
			}else{
				var json={purchase:purchase,purchasedetails:purchasedetails,token:nui.get("token").getValue()};
				nui.ajax({
	    			url:'com.sfy.dms.wms.cgd.purchase.addpurchse.biz.ext',
					type:'post',
					contentType:'text/json',
					async:false,
					data:json,
					success:function(text){
						if(!text.flag)
						nui.alert("新增成功！","提示",function(){
							window.history.back(-1);
						});
						
						/*CloseWindow("saveSuccess")
						else CloseWindow("ok");
						 if(nui.confirm("插入成功!是否继续添加")){
	            			new nui.Form("#purchaseForm").reset();
	            			new nui.Form("#purchaseInfo").reset();
	            			nui.get("purchasecode").setValue(purchasecode);
	            			nui.get("purchaseexecutor").setValue(purchaseexecutor);
						}else{
							CloseWindow("saveSuccess");
						} */
					}		
	    		})
			}
        }
        var row=0;
        //新增一行数据
        function addRow(data) { 
            var newRow = { name: "New Row" };
            detailGrid.addRow(data,row++);
           // detailGrid.beginEditCell(newRow, "LoginName");
            new nui.Form("#purchaseInfo").reset();
            dataResult={"total": detailGrid.getData().length,"data":detailGrid.getData()};
            fillData(0, detailGrid.getPageSize(), dataResult, detailGrid);
        }
        //绘制单元格采购单号
    	function onDrawCell(e) {
			var field = e.field;
			if (field=="action") {                                                 
				e.cellHtml = '<span style="color: blue;cursor: pointer;" onclick="removedetail()">删除\</span>';
			}
		}
		//移除一条记录
		function removedetail(){
			var rows = detailGrid.getSelecteds();
            if (rows.length > 0) {
                detailGrid.removeRows(rows, true);
                dataResult={"total": detailGrid.getData().length,"data":detailGrid.getData()};
            	fillData(0, detailGrid.getPageSize(), dataResult, detailGrid);
            }
            var s =	detailGrid.getData()
            if(detailGrid.getData().length==0){
	   			var providerid=nui.get("providerbtn");
	   			providerid.setReadOnly("false");
		   		nui.getbyName("standby04").setEnabled(true);
			}
		}
		//验证输入数量
		 function onNumValidation(e) {
		 	if (e.isValid) {
                var pattern = /^\d+(\.\d{1,3})?$/;
                if (e.value <= 0 || pattern.test(e.value) == false) {
                    //e.errorText = "必须输入15~18位数字";
                    e.isValid = false;
                }else{
                	pattern=/^0+\d+(\.\d{1,3})?$/;
                	if(pattern.test(e.value))
                	nui.get("purchaseNum").setValue(parseFloat(e.value));
                }
            }
        }
        //
        // 分页填充细节处理
	    function fillData(pageIndex, pageSize, dataResult, grid) {
	        var data = dataResult.data, totalCount = dataResult.total;
	        var arr = [];
	        var start = pageIndex * pageSize, end = start + pageSize;
	        for (var i = start, l = end; i < l; i++) {
	            var record = data[i];
	            if (!record) continue;
	            arr.push(record);
	        }
	        detailGrid.setTotalCount(totalCount);
	        detailGrid.setPageIndex(pageIndex);
	        detailGrid.setPageSize(pageSize);
	        detailGrid.setData(arr);
	    }
	    // 监听分页前事件，阻止后自行设置当前数据和分页信息
	    detailGrid.on("beforeload", function (e) {
	        e.cancel = true;
	        var pageIndex = e.data.pageIndex, pageSize = e.data.pageSize;
	        fillData(pageIndex, pageSize, dataResult, detailGrid);
	    });
	    // 第一次设置
	    var dataResult;
    	//当供应商改变时加载
		function onproviderChanged(){
			var providerCode=nui.get("providercode").getValue();
			if(providerCode)
			nui.get("goodsGrid").load({check:{providerCode:providerCode}});	
		}
		//验证输入数量
	function onCellValidation(e) {
        if (e.field == "purchaseNum") {
         	 var pattern = /^\d+(\.\d{1,3})?$/;
         	if (e.value==0 || (pattern.test(e.value) == false)) {
         		e.isValid = false;
         	} 
        };
    } 
    
    //是否工程单框value改变的时候触发
    function onvaluechanged(e){
    	debugger;
    	if(e.sender.name=='purchasetype'){
    		var designType = nui.getbyName("standby04").getValue();
    		if(designType=='0'){
    			var EngineeringOrder = nui.getbyName("isEngineeringOrder");//是否工程订单
				if(e.value=="0"){//不是设计部下单，并且不是饰品采购，是否工程单才可以编辑
					EngineeringOrder.setReadOnly(false);
				}
				if(e.value=="2"){//不是设计部下单，是饰品采购，是否工程单才可以编辑
					nui.get("engineeringClients").setValue(null);//不是工程订单的时候清楚工程客户的值
					nui.get("engineeringClients").setText(null);
					$(".tdTags").hide();
					document.getElementById('iframe1').contentWindow.$("#span1").hide();
					EngineeringOrder.setValue("0");
					EngineeringOrder.setReadOnly(true);
				}
    		}
    	}
    	if(e.sender.name=='isEngineeringOrder'){
    		if(e.value=="1"){
	    		$(".tdTags").show();
	    		document.getElementById('iframe1').contentWindow.$("#span1").show();
	    	}else{
	    		nui.get("engineeringClients").setValue(null);//不是工程订单的时候清楚工程客户的值
				nui.get("engineeringClients").setText(null);
	    		$(".tdTags").hide();
	    		document.getElementById('iframe1').contentWindow.$("#span1").hide();
	    	}
    	}
    	
    }
    
    
    
    /* lookup的事件 */
    //模糊查找功能
		function onSearch(){
			debugger;
			var cooperatorName=nui.get("cooperatorName").getValue();
			var tel=nui.get("tel").getValue();
			lookupGrid.load({map:{cooperatorName:cooperatorName,tel:tel}});
		}
    
    	function onOppClear() {
			lookupGrid.deselectAll();
			nui.get("engineeringClients").deselectAll();
		}
    	//关闭窗口按钮 
		function onOppClose() {
		debugger;
			nui.get("engineeringClients").hidePopup();
		}
		
		
		//lookup展开之前
		function onbeforeshowpopup(){
			lookupGrid.load();
		}
		
		
		function designEvent(e){
			debugger;
			var purchasetype = nui.getbyName("purchasetype");//采购类型   
			var EngineeringOrder = nui.getbyName("isEngineeringOrder");//是否工程订单
			if(e.value=="1"){
				purchasetype.setValue("0");
				EngineeringOrder.setValue("0");
				nui.get("engineeringClients").setValue(null);//不是工程订单的时候清楚工程客户的值
				nui.get("engineeringClients").setText(null);
				$(".tdTags").hide();
				document.getElementById('iframe1').contentWindow.$("#span1").hide();//隐藏附件星号标识
				purchasetype.setEnabled(false);
				EngineeringOrder.setReadOnly(true);
			}else{
				purchasetype.setEnabled(true);//不是设计部下单,采购类型可编辑
				if(purchasetype.getValue()=="0"){//不是设计部下单，并且不是饰品采购，是否工程单才可以编辑
					EngineeringOrder.setReadOnly(false);
				}
				if(purchasetype.getValue()=="2"){//不是设计部下单，是饰品采购，是否工程单才可以编辑
					nui.get("engineeringClients").setValue(null);//不是工程订单的时候清楚工程客户的值
					nui.get("engineeringClients").setText(null);
					$(".tdTags").hide();
					document.getElementById('iframe1').contentWindow.$("#span1").hide();
					EngineeringOrder.setValue("0");
					EngineeringOrder.setReadOnly(true);
				}
			}
		}
		
    
    </script>
</body>
</html>
