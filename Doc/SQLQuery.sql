--原料采购表
/*
Material_Name   原料名称    主键
Diameter        直径
Price           单价
Volume          体积
*/
Drop table Material_Order;
Create table Material_Order(
	id            nvarchar(30) not null,
    Material_Name nvarchar(50) not null,
    Diameter      decimal not null,
    Price         decimal not null,
    Volume        decimal not null,
    Order_ID      nvarchar(30) not null,
    Primary Key(id)
);

--采购记录表
/*
Order_ID       订单号    主键
Supplier       供应商
Phone_Num      联系方式
Order_Money    订单金额
Operater       下单员
Order_Date     下单日期
States         订单状态
*/
Drop table Order_RecordChart;
Create table Order_RecordChart(
    Order_ID    nvarchar(30) not null,
    Supplier    nvarchar(50) not null,
    Phone_Num   char(11),
    Order_Money decimal not null,
    Operater    nvarchar(50) not null,
    Order_Date  date,
    States      bit,
    Primary Key(Order_ID)
);

--生产流水表
/*

*/
Drop table Production_Detail;
Create table Production_Detail(
	ID		nvarchar(30) not null,
	Production_Name nvarchar(50) not null,
	Material_Name   nvarchar(50) not null,
	Diameter		decimal      not null,
	Volume			decimal		 not null,
	Production_Line	nvarchar(50) not null,
	Pro_Num			int          not null,
	Pro_ID			nvarchar(50) not null,
	primary key(ID)
)

--生产加工表
/*
Pro_ID             加工序列号    主键
Production_Name    产品名称
Material_Name      原料名称
Diameter           直径
Volume             体积
SaleNo             销售单号
Production_Line    生产线
Pro_Num            产品数量
Start_Time         开始生产时间
End_Time           产品交付时间
*/
Drop table Production;
Create table Production(
    Pro_ID          nvarchar(30) not null,
    SaleNo          nvarchar(30) not null,
    Start_Time      date not null,
    End_Time        date not null,
    Primary Key(Pro_ID),
);

--售货订单表
/*
Sao_ID             订单序列
Production_Name    产品名称
Sao_Num            订货数量
Pro_Price          产品单价
Remark             备注
*/
Drop table Sale_Order;
Create table Sale_Order(
    Sao_ID          nvarchar(30) not null,
    Production_Name nvarchar(50) not null,
    Sao_Num         int not null,
    Pro_Price       decimal not null,
    Remark          nvarchar(100),
    SaleNo			nvarchar(30) not null,
    Primary Key(Sao_ID)
);

--售货总览表
/*
SaleNo           售货单号
Purchaser        采购商
Phone_Num        联系方式
Sale_Money       售货金额
Operater         操作员
Order_Date       订货日期
Delivery_Date    交货日期
States           订单状态
*/
Drop table Sale_OverView;
Create table Sale_OverView(
    SaleNo        nvarchar(30) not null,
    Purchaser     nvarchar(50) not null,
    Phone_Num     char(11),
    Sale_Money    decimal not null,
    Operater      nvarchar(50) not null,
    Order_Date    date not null,
    Delivery_Date date not null,
    States        bit,
    Primary Key(SaleNo)
);

--仓库原料单
/*
Material_Name    原料名称
Diameter		 原料直径
Volume			 原料体积
Storage_Num      仓库号
*/
Drop table StorageMaterial;
Create table StorageMaterial(
	Material_Name nvarchar(50) not null,
	Diameter      decimal      not null, 
	Storage_Num   nvarchar(30) not null,    
	Volume		  decimal	   not null,
	primary key(Material_Name,Diameter)      
)

--原料入库单
/*
Mis_ID           入库单号号
Order_ID         原料采购单号
Operater         操作员
InS_Date         入库日期
*/
Drop table Material_InStorage;
Create table Material_InStorage(
    Mis_ID        nvarchar(30) not null,
    Order_ID      nvarchar(30) not null,
    Material_Name nvarchar(50) not null,
	Diameter      decimal      not null,
	Volume		  decimal	   not null, 
    Storage_Num   nvarchar(30) not null,
    Operater      nvarchar(50) not null,
    InS_Date      date not null,
    Primary Key(Mis_ID)
);

--原料出库单
/*
Mis_ID           入库原料序列号
Order_ID         原料采购单号
Storage_Num      仓库号
Operater         操作员
InS_Date         入库日期
*/
Drop table Material_OutStorage;
Create table Material_OutStorage(
    Mos_ID        nvarchar(30) not null,
    Pro_ID        nvarchar(30) not null,
    Material_Name nvarchar(50) not null,
	Diameter      decimal      not null,
	Volume		  decimal	   not null, 
    Storage_Num   nvarchar(30) not null,
    Operater      nvarchar(50) not null,
    OutS_Date     date not null,
    Primary Key(Mos_ID)
);

--仓库产品单
/*
Production_Name    产品名称
Pro_Num            产品数量
Storage_Num        仓库编号
*/
Drop table StorageProduction;
Create table StorageProduction(
	Production_Name nvarchar(50) not null,
	Pro_Num         int not null,
	Storage_Num     nvarchar(30) not null,
	primary key(Production_Name)
)

--产品入库单
/*
Pis_ID             入库产品序列号
SaleNo             销售单号
Storage_Num        仓库编号
Operater           操作员
InS_Date           入库日期
*/
Drop table Production_InStorage;
Create table Production_InStorage(
    Pis_ID          nvarchar(30) not null,
    SaleNo          nvarchar(30) not null,
    Production_Name nvarchar(50) not null,
	Pro_Num         int not null,
    Storage_Num     nvarchar(30) not null,
    Operater        nvarchar(50) not null,
    InS_Date        date not null,
    Primary Key(Pis_ID)
);

--产品出库单
/*
Pos_ID             出库产品序列号
SaleNo             销售单号
Storage_Num        仓库编号
Operater           操作员
OutS_Date          出库日期
*/
Drop table Production_OutStorage;
Create table Production_OutStorage(
    Pos_ID          nvarchar(30) not null,
    SaleNo          nvarchar(30) not null,
    Production_Name nvarchar(50) not null,
	Pro_Num         int not null,
    Storage_Num     nvarchar(30) not null,
    Operater        nvarchar(50) not null,
    OutS_Date       date not null,
    Primary Key(Pos_ID)
);

--付款单
/*
Pao_ID           付款单号
Order_ID         采购单号
Payable_Money    应付金额
Realpay_Money    实付金额
Supplier         供应商
Operater         操作员
Pao_Date         付款日期
*/
Drop table Payment_Order;
Create table Payment_Order(
    Pao_ID        nvarchar(30) not null,
    Order_ID      nvarchar(30) not null,
    Payable_Money decimal not null,
    Realpay_Money decimal,
    Supplier      nvarchar(50) not null,
    Operater      nvarchar(50) not null,
    Pao_Date      date not null,
    Remark        nvarchar(100),
    Primary Key(Pao_ID)
);

--收款单
/*
Coo_ID           收款单号
SaleNo           销售单号
Payable_Money    应付金额
Realpay_Money    实付金额
Purchaser        采购商
Operater         操作员
Coo_Date         收款日期
Remark           备注
*/
Drop table Collection_Order;
Create table Collection_Order(
    Coo_ID        nvarchar(30) not null,
    SaleNo        nvarchar(30) not null,
    Payable_Money decimal not null,
    Realpay_Money decimal,
    Purchaser     nvarchar(50) not null,
    Operater      nvarchar(50) not null,
    Coo_Date      date not null,
    Remark        nvarchar(100),
    Primary Key(Coo_ID)
);

--职工表
/*
Staff_ID      职工编号
Staff_Name    职工姓名
Position      职位
Line          所属生产线
Phone         联系方式
ID_num        身份证号
Addres        住址
Remark        备注
*/
Drop table Staff;
Create table Staff(
    Staff_ID   nvarchar(30) not null,
    Staff_Name nvarchar(50) not null,
    Position   nvarchar(50) not null,
    Line       nvarchar(50),
    Phone      char(11),
    ID_num     char(18) not null,
    Addres     nvarchar(50) not null,
    Remark     nvarchar(100),
    Primary Key(Staff_ID)
)

--工资表
/*
Staff_ID      职工工号
Staff_Name    职工姓名
Payroll       工资
Remark        备注
*/
Drop table Payroll;
Create table Payroll(
    Staff_ID   nvarchar(30) not null,
    Staff_Name nvarchar(50) not null,
    Payroll    decimal not null,
    Remark     nvarchar(100),
    Primary Key(Staff_ID)
);

--供应商表
/*
Supplier_ID      供应商编号
Supplier_Name    供应商名称
Supplier_Type    供货类型
Phone            联系方式
Addres           地址
Remark           备注
*/
Drop table Supplier;
Create table Supplier(
    Supplier_ID   nvarchar(30) not null,
    Supplier_Name nvarchar(50) not null,
    Supplier_Type nvarchar(50) not null,
    Phone         char(11),
    Addres        nvarchar(50) not null,
    Remark        nvarchar(100),
    Primary Key(Supplier_ID)
);

--采购商表
/*
Purchaser_ID      采购商编号
Purchaser_Name    采购商姓名
Pur_Pro_Type      采购商品类型
Phone             联系方式
Addres            地址
Remark            备注
*/
Drop table Purchaser;
Create table Purchaser(
    Purchaser_ID   nvarchar(30) not null,
    Purchaser_Name nvarchar(50) not null,
    Pur_Pro_Type   nvarchar(50),
    Phone          char(11),
    Addres         nvarchar(50),
    Remark         nvarchar(100),
    Primary Key(Purchaser_ID)
);