

CREATE TABLE IF NOT EXISTS Role (
  id int(11) NOT NULL AUTO_INCREMENT,
  name char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  description char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  created datetime DEFAULT NULL,
  modified datetime DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY Role_id_uindex (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS RoleMapping (
  id int(11) NOT NULL AUTO_INCREMENT,
  principalType char(50) COLLATE utf8_unicode_ci NOT NULL,
  principalId int(11) DEFAULT NULL,
  roleId int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY AppRoleMapping_id_uindex (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE IF NOT EXISTS Plan (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    planID VARCHAR(50) NOT NULL,
    asin VARCHAR(50) NOT NULL,
    planNumber INT NOT NULL,
    finishNumber INT NOT NULL DEFAULT 0,
    note VARCHAR(255) DEFAULT '',
    operator VARCHAR(50)  DEFAULT '',
    createdDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS Task (
    id VARCHAR(50) NOT NULL PRIMARY KEY,
    plan INT NOT NULL,
    reviewProgress INT NOT NULL DEFAULT 1,
    orderProgress INT NOT NULL DEFAULT 1,
    note VARCHAR(255) ,
    finish BOOLEAN DEFAULT FALSE,
    status BOOLEAN DEFAULT TRUE,
    updatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (plan) REFERENCES Plan(id),
    FOREIGN KEY (reviewProgress) REFERENCES ReviewProgress(id),
    FOREIGN KEY (orderProgress) REFERENCES OrderProgress(id)
);

CREATE TABLE IF NOT EXISTS Review (
  id VARCHAR(50) NOT NULL PRIMARY KEY,
  priority INT NOT NULL DEFAULT 1,
  plan INT NOT NULL,
  rating INT DEFAULT 5,
  title VARCHAR(50) DEFAULT '',
  content VARCHAR(255) DEFAULT '',
  image VARCHAR(50)  DEFAULT '',
  note VARCHAR(255) DEFAULT '',
  message VARCHAR(255) DEFAULT '',
  operator VARCHAR(255)  DEFAULT '',
  status BOOLEAN DEFAULT TRUE,
  updatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (plan) REFERENCES Plan(id),
  FOREIGN KEY (priority) REFERENCES Priority(id)
);


CREATE TABLE IF NOT EXISTS `Order` (
  id VARCHAR(50) NOT NULL PRIMARY KEY,
  plan INT NOT NULL,
  seller INT,
  buyer INT ,
  orderNumber VARCHAR(255) DEFAULT NULL,
  price INT DEFAULT NULL,
  orderedDate TIMESTAMP DEFAULT NULL,
  postDate TIMESTAMP DEFAULT NULL,
  postBy VARCHAR(255) DEFAULT NULL,
  diabled BOOLEAN DEFAULT FALSE,
  diabledDate TIMESTAMP DEFAULT NULL,
  note VARCHAR(255) DEFAULT '',
  message VARCHAR(255) DEFAULT '',
  status BOOLEAN DEFAULT TRUE,
  updatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (plan) REFERENCES Plan(id),
  FOREIGN KEY (seller) REFERENCES Seller(id),
  FOREIGN KEY (buyer) REFERENCES Buyer(id)
);


CREATE TABLE IF NOT EXISTS Buyer (
  id INT PRIMARY KEY AUTO_INCREMENT,
  buyerID VARCHAR(50) UNIQUE NOT NULL,
  amzBuyerID VARCHAR(100) NOT NULL,
  status BOOLEAN  DEFAULT TRUE,
  note VARCHAR(255) DEFAULT '',
  manager VARCHAR(50)  DEFAULT '',
  description VARCHAR(255) DEFAULT '',
  errorCode smallint(4) DEFAULT NULL,
  createdDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Seller (
  id INT PRIMARY KEY AUTO_INCREMENT,
  sellerName VARCHAR(50) UNIQUE NOT NULL,
  marketPlace VARCHAR(50) NOT NULL,
  status BOOLEAN DEFAULT TRUE,
  note VARCHAR(255) DEFAULT '',
  manager VARCHAR(50)  DEFAULT '',
  description VARCHAR(255) DEFAULT '',
  errorCode smallint(4) DEFAULT NULL,
  createdDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS SellerWarning (
  id INT PRIMARY KEY AUTO_INCREMENT,
  reviewTaskID VARCHAR(255) UNIQUE NOT NULL,
  reviewRating INT DEFAULT NULL,
  reviewTitle VARCHAR(255) DEFAULT '',
  reviewContent VARCHAR(255) DEFAULT '',
  reiewImage VARCHAR(255)  DEFAULT '',
  note VARCHAR(255) DEFAULT '',
  operator VARCHAR(255)  DEFAULT '',
  status BOOLEAN DEFAULT FALSE,
  updatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (reviewTaskID) REFERENCES ReviewTask(id)
);







CREATE TABLE IF NOT EXISTS ReviewProgress(
  id INT PRIMARY KEY AUTO_INCREMENT,
  code INT UNIQUE NOT NULL,
  english VARCHAR(50) NOT NULL ,
  chinese VARCHAR(50) NOT NULL ,
  korean VARCHAR(50) NOT NULL
);
[
  {code:1, english:"REVIEW TASK CREATED DONE", chinese:"已创建评论任务", korean:"작성된 작업 검토 완료"},
  {code:2, english:"REVIEW WRITED DONE", chinese:"已经写评论", korean:"작성된 검토 완료"},
]
CREATE TABLE IF NOT EXISTS OrderProgress(
  id INT PRIMARY KEY AUTO_INCREMENT,
  code INT UNIQUE NOT NULL,
  english VARCHAR(50) NOT NULL ,
  chinese VARCHAR(50) NOT NULL ,
  korean VARCHAR(50) NOT NULL
);

[
  {code:1, english:"ORDER TASK CREATED DONE", chinese:"已创建订单任务", korean:"주문 작업 생성 완료"},
  {code:2, english:"ORDER NUMBER DONE", chinese:"已下单，待留评", korean:"주문 번호 완료"},
  {code:3, english:"ORDER REVIEW DONE", chinese:"已留评", korean:"주문 검토 완료"},
  {code:4, english:"ALL DONE", chinese:"已留评", korean:"모두 완료"},
  {code:5, english:"DELETED", chinese:"被删除", korean:"삭제됨"},
]

CREATE TABLE IF NOT EXISTS Priority(
  id INT PRIMARY KEY AUTO_INCREMENT,
  code INT UNIQUE NOT NULL,
  english VARCHAR(50) NOT NULL ,
  chinese VARCHAR(50) NOT NULL ,
  korean VARCHAR(50) NOT NULL
);
[
  {code:1, english:"ORDER TASK CREATED DONE", chinese:"已创建订单任务", korean:"주문 작업 생성 완료"},
  {code:2, english:"ORDER NUMBER DONE", chinese:"已下单，待留评", korean:"주문 번호 완료"},
  {code:0, english:"ALL DONE", chinese:"已留评", korean:"모두 완료"},
  {code:-1, english:"DELETED", chinese:"已删除", korean:"삭제됨"},
]
