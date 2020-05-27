create database GreenMall
drop database GreenMall

create table Useerinfo--用户表
(
UserID	int  primary key identity(1,1),
UserName	nvarchar(50)not null,
Usernumber	nvarchar(50)not null,
Userloginnuber	nvarchar(50)not null,
UserPwd	nvarchar(50)not null,
Userphoto	nvarchar(50),
UserEmail	nvarchar(50),
)
create table Administrators--管理员表
(
ManagerID	int primary key identity(1,1),
ManagerName	nvarchar(50)not null,
Managernumber	nvarchar(50)not null,
Managerloginnuber	nvarchar(50)not null,
ManagerrPwd	nvarchar(50)not null,
ManagerEmail	nvarchar(50),
Managerphoto	nvarchar(50),
) 
create table Goodstype--商品类型
(
ID	int primary key identity(1,1),
Typename	nvarchar(150),
Pid	int  foreign key references Goodstype(ID),

)
create table Shopinginfo--商品表
(
GoodsID	int primary key identity(1,1),
GoodsName	nvarchar(50)not null,
GoodsPicLarge	nvarchar(150),--浏览图
GoodsPPicSmall	nvarchar(150),--小图
GoodsVideo	nvarchar(150),--视频
TyIpeD	int foreign key references Goodstype(ID),
AddTime	datetime not null,
Price money,
)

create table Orderinfo--在线订单表
(
OrderID	int primary key identity(1,1),
GoodsName	nvarchar(50),
UserID	int  foreign key references Useerinfo(UserID),
GoodsID	int  foreign key references Shopinginfo(GoodsID),
ManagerID	int foreign key references Administrators(ManagerID),

Ordertime	datetime not null,
Oderstate	int not null,
Payable	money ,--应付价格
Hnrb	money ,--实付价格
Tobepaid	money ,--待付价格
Paymentmethod	nvarchar(10),--支付方式
Notes	nvarchar(150)--备注

)

create table Billinfo--账单表
(
BillID	int primary key identity(1,1),
OrderID int	foreign key references Orderinfo(OrderID),
BusinessPrice	money,--商家价格
Profits	money--利润

)
create table Recordsinfo--商家种植信息录入
 (
 	Merchantsid int primary key identity(1,1),
	MerchantsName nvarchar(50) not null,	
	MerchantsType	int ,
	MerchantsPhon  nvarchar(20)not null,
	MerPlantingShoping nvarchar(150)not null --种植产品

 )
  select * from Shopinginfo a,Goodstype b where a.TyIpeD=b.ID
