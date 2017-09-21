--ԭ�ϲɹ���
/*
Material_Name   ԭ������    ����
Diameter        ֱ��
Price           ����
Volume          ���
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

--�ɹ���¼��
/*
Order_ID       ������    ����
Supplier       ��Ӧ��
Phone_Num      ��ϵ��ʽ
Order_Money    �������
Operater       �µ�Ա
Order_Date     �µ�����
States         ����״̬
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

--������ˮ��
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

--�����ӹ���
/*
Pro_ID             �ӹ����к�    ����
Production_Name    ��Ʒ����
Material_Name      ԭ������
Diameter           ֱ��
Volume             ���
SaleNo             ���۵���
Production_Line    ������
Pro_Num            ��Ʒ����
Start_Time         ��ʼ����ʱ��
End_Time           ��Ʒ����ʱ��
*/
Drop table Production;
Create table Production(
    Pro_ID          nvarchar(30) not null,
    SaleNo          nvarchar(30) not null,
    Start_Time      date not null,
    End_Time        date not null,
    Primary Key(Pro_ID),
);

--�ۻ�������
/*
Sao_ID             ��������
Production_Name    ��Ʒ����
Sao_Num            ��������
Pro_Price          ��Ʒ����
Remark             ��ע
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

--�ۻ�������
/*
SaleNo           �ۻ�����
Purchaser        �ɹ���
Phone_Num        ��ϵ��ʽ
Sale_Money       �ۻ����
Operater         ����Ա
Order_Date       ��������
Delivery_Date    ��������
States           ����״̬
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

--�ֿ�ԭ�ϵ�
/*
Material_Name    ԭ������
Diameter		 ԭ��ֱ��
Volume			 ԭ�����
Storage_Num      �ֿ��
*/
Drop table StorageMaterial;
Create table StorageMaterial(
	Material_Name nvarchar(50) not null,
	Diameter      decimal      not null, 
	Storage_Num   nvarchar(30) not null,    
	Volume		  decimal	   not null,
	primary key(Material_Name,Diameter)      
)

--ԭ����ⵥ
/*
Mis_ID           ��ⵥ�ź�
Order_ID         ԭ�ϲɹ�����
Operater         ����Ա
InS_Date         �������
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

--ԭ�ϳ��ⵥ
/*
Mis_ID           ���ԭ�����к�
Order_ID         ԭ�ϲɹ�����
Storage_Num      �ֿ��
Operater         ����Ա
InS_Date         �������
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

--�ֿ��Ʒ��
/*
Production_Name    ��Ʒ����
Pro_Num            ��Ʒ����
Storage_Num        �ֿ���
*/
Drop table StorageProduction;
Create table StorageProduction(
	Production_Name nvarchar(50) not null,
	Pro_Num         int not null,
	Storage_Num     nvarchar(30) not null,
	primary key(Production_Name)
)

--��Ʒ��ⵥ
/*
Pis_ID             ����Ʒ���к�
SaleNo             ���۵���
Storage_Num        �ֿ���
Operater           ����Ա
InS_Date           �������
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

--��Ʒ���ⵥ
/*
Pos_ID             �����Ʒ���к�
SaleNo             ���۵���
Storage_Num        �ֿ���
Operater           ����Ա
OutS_Date          ��������
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

--���
/*
Pao_ID           �����
Order_ID         �ɹ�����
Payable_Money    Ӧ�����
Realpay_Money    ʵ�����
Supplier         ��Ӧ��
Operater         ����Ա
Pao_Date         ��������
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

--�տ
/*
Coo_ID           �տ��
SaleNo           ���۵���
Payable_Money    Ӧ�����
Realpay_Money    ʵ�����
Purchaser        �ɹ���
Operater         ����Ա
Coo_Date         �տ�����
Remark           ��ע
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

--ְ����
/*
Staff_ID      ְ�����
Staff_Name    ְ������
Position      ְλ
Line          ����������
Phone         ��ϵ��ʽ
ID_num        ���֤��
Addres        סַ
Remark        ��ע
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

--���ʱ�
/*
Staff_ID      ְ������
Staff_Name    ְ������
Payroll       ����
Remark        ��ע
*/
Drop table Payroll;
Create table Payroll(
    Staff_ID   nvarchar(30) not null,
    Staff_Name nvarchar(50) not null,
    Payroll    decimal not null,
    Remark     nvarchar(100),
    Primary Key(Staff_ID)
);

--��Ӧ�̱�
/*
Supplier_ID      ��Ӧ�̱��
Supplier_Name    ��Ӧ������
Supplier_Type    ��������
Phone            ��ϵ��ʽ
Addres           ��ַ
Remark           ��ע
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

--�ɹ��̱�
/*
Purchaser_ID      �ɹ��̱��
Purchaser_Name    �ɹ�������
Pur_Pro_Type      �ɹ���Ʒ����
Phone             ��ϵ��ʽ
Addres            ��ַ
Remark            ��ע
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