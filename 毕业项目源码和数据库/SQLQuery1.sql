create database GreenMall
drop database GreenMall

create table Useerinfo--�û���
(
UserID	int  primary key identity(1,1),
UserName	nvarchar(50)not null,
Usernumber	nvarchar(50)not null,
Userloginnuber	nvarchar(50)not null,
UserPwd	nvarchar(50)not null,
Userphoto	nvarchar(50),
UserEmail	nvarchar(50),
)
create table Administrators--����Ա��
(
ManagerID	int primary key identity(1,1),
ManagerName	nvarchar(50)not null,
Managernumber	nvarchar(50)not null,
Managerloginnuber	nvarchar(50)not null,
ManagerrPwd	nvarchar(50)not null,
ManagerEmail	nvarchar(50),
Managerphoto	nvarchar(50),
) 
create table Goodstype--��Ʒ����
(
ID	int primary key identity(1,1),
Typename	nvarchar(150),
Pid	int  foreign key references Goodstype(ID),

)
create table Shopinginfo--��Ʒ��
(
GoodsID	int primary key identity(1,1),
GoodsName	nvarchar(50)not null,
GoodsPicLarge	nvarchar(150),--���ͼ
GoodsPPicSmall	nvarchar(150),--Сͼ
GoodsVideo	nvarchar(150),--��Ƶ
TyIpeD	int foreign key references Goodstype(ID),
AddTime	datetime not null,
Price money,
)

create table Orderinfo--���߶�����
(
OrderID	int primary key identity(1,1),
GoodsName	nvarchar(50),
UserID	int  foreign key references Useerinfo(UserID),
GoodsID	int  foreign key references Shopinginfo(GoodsID),
ManagerID	int foreign key references Administrators(ManagerID),

Ordertime	datetime not null,
Oderstate	int not null,
Payable	money ,--Ӧ���۸�
Hnrb	money ,--ʵ���۸�
Tobepaid	money ,--�����۸�
Paymentmethod	nvarchar(10),--֧����ʽ
Notes	nvarchar(150)--��ע

)

create table Billinfo--�˵���
(
BillID	int primary key identity(1,1),
OrderID int	foreign key references Orderinfo(OrderID),
BusinessPrice	money,--�̼Ҽ۸�
Profits	money--����

)
create table Recordsinfo--�̼���ֲ��Ϣ¼��
 (
 	Merchantsid int primary key identity(1,1),
	MerchantsName nvarchar(50) not null,	
	MerchantsType	int ,
	MerchantsPhon  nvarchar(20)not null,
	MerPlantingShoping nvarchar(150)not null --��ֲ��Ʒ

 )
  select * from Shopinginfo a,Goodstype b where a.TyIpeD=b.ID
