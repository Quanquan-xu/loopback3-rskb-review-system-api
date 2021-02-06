CREATE TABLE IF NOT EXISTS member (
    id INT PRIMARY KEY AUTO_INCREMENT,
    signUpBy VARCHAR(255) NOT NULL DEFAULT '',
    username VARCHAR(255) NOT NULL,
    signUpInfo VARCHAR(255) NOT NULL DEFAULT '',
    email VARCHAR(255) NOT NULL ,
    password VARCHAR(255) NOT NULL ,
    emailInfo VARCHAR(255) NOT NULL DEFAULT '',
    phoneNumber VARCHAR(255) NOT NULL DEFAULT '',
    bidYear smallint(4) NOT NULL DEFAULT 0,
    bidMonth smallint(4) NOT NULL DEFAULT 0,
    monIncome VARCHAR(255) NOT NULL DEFAULT '',
    education VARCHAR(255) NOT NULL DEFAULT '',
    gender CHAR(10) NOT NULL DEFAULT '',
    favourites VARCHAR(255) NOT NULL DEFAULT '',
    notification BOOLEAN NOT NULL DEFAULT FALSE,
    realm VARCHAR(255) NOT NULL DEFAULT '',
    emailVerified BOOLEAN NOT NULL DEFAULT FALSE,
    verificationToken VARCHAR(255) DEFAULT NULL,
    createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status smallint(4) NOT NULL DEFAULT 1
);


CREATE TABLE IF NOT EXISTS reviewPlaning (
    index INT PRIMARY KEY AUTO_INCREMENT,
    asin VARCHAR(255) NOT NULL,
    planReviewCount INT NOT NULL,
    note VARCHAR(255) DEFAULT '',
    operator VARCHAR(255)  DEFAULT '',
    createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS favourite (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL  DEFAULT '',
    description VARCHAR(255) DEFAULT '',
    status BOOLEAN NOT NULL DEFAULT TRUE
);

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


<<<<<<< HEAD
<<<<<<< HEAD
SELECT concat('DROP TABLE IF EXISTS `', table_name, '`;')
FROM information_schema.tables
WHERE table_schema = 'reviewsystem';

=======
CREATE TABLE IF NOT EXISTS reviewPlaning (
    index INT PRIMARY KEY AUTO_INCREMENT,
    asin VARCHAR(255) NOT NULL,
    planReviewCount INT NOT NULL,
    note VARCHAR(255) DEFAULT '',
    operator VARCHAR(255)  DEFAULT '',
    createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS reviewTask (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    reviewPlaning VARCHAR(255) NOT NULL,
    count VARCHAR(255) NOT NULL,
    asin VARCHAR(255) NOT NULL,
    url VARCHAR(255) DEFAULT '',
);
>>>>>>> parent of d9759e4... restruct models
=======

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
    planID INT NOT NULL,
    reviewProgress INT NOT NULL DEFAULT 1,
    orderProgress INT NOT NULL DEFAULT 1,
    note VARCHAR(255) ,
    finish BOOLEAN DEFAULT FALSE,
    status BOOLEAN DEFAULT TRUE,
    updatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (planID) REFERENCES Plan(id),
    FOREIGN KEY (reviewProgress) REFERENCES ReviewProgress(code),
    FOREIGN KEY (orderProgress) REFERENCES OrderProgress(code)
);

CREATE TABLE IF NOT EXISTS Review (
  id VARCHAR(50) NOT NULL PRIMARY KEY,
  priority INT NOT NULL DEFAULT 1,
  planID INT NOT NULL,
  rating INT DEFAULT 5,
  title VARCHAR(50) DEFAULT '',
  content VARCHAR(255) DEFAULT '',
  image VARCHAR(50)  DEFAULT '',
  note VARCHAR(255) DEFAULT '',
  message VARCHAR(255) DEFAULT '',
  operator VARCHAR(255)  DEFAULT '',
  status BOOLEAN DEFAULT TRUE,
  updatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (planID) REFERENCES Plan(id),
  FOREIGN KEY (priority) REFERENCES TaskPriority(code)
);


CREATE TABLE IF NOT EXISTS Order (
  id VARCHAR(50) NOT NULL PRIMARY KEY,
  planID INT NOT NULL,
  sellerID INT ,
  buyerID INT ,
  orderNumber VARCHAR(255) DEFAULT '',
  price INT ,
  orderedDate TIMESTAMP ,
  postDate TIMESTAMP ,
  postBy VARCHAR(255) DEFAULT '',
  isDelete BOOLEAN DEFAULT FALSE,
  deleteDate TIMESTAMP ,
  note VARCHAR(255) DEFAULT '',
  message VARCHAR(255) DEFAULT '',
  status BOOLEAN DEFAULT TRUE,
  updatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (planID) REFERENCES Plan(id),
  FOREIGN KEY (sellerID) REFERENCES Seller(id),
  FOREIGN KEY (buyerID) REFERENCES Buyer(id)
);
>>>>>>> parent of 125259c... modify primary key for models


CREATE TABLE Buyer (
  index INT PRIMARY KEY AUTO_INCREMENT,
  buyerID VARCHAR(255) UNIQUE NOT NULL,
  amzBuyerID VARCHAR(255) UNIQUE NOT NULL,
  status BOOLEAN NOT NULL DEFAULT TRUE,
  note VARCHAR(255) DEFAULT '',
<<<<<<< HEAD
<<<<<<< HEAD
  manager VARCHAR(50)  DEFAULT '',
=======
  mananger VARCHAR(255)  DEFAULT '',
>>>>>>> parent of d9759e4... restruct models
=======
  mananger VARCHAR(50)  DEFAULT '',
>>>>>>> parent of 125259c... modify primary key for models
  description VARCHAR(255) DEFAULT '',
  errorCode smallint(4) NOT NULL DEFAULT 0,
  createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Seller (
  index INT PRIMARY KEY AUTO_INCREMENT,
  sellerName VARCHAR(255) UNIQUE NOT NULL,
  marketPlace VARCHAR(255) NOT NULL,
  status BOOLEAN NOT NULL DEFAULT TRUE,
  note VARCHAR(255) DEFAULT '',
<<<<<<< HEAD
<<<<<<< HEAD
  manager VARCHAR(50)  DEFAULT '',
=======
  mananger VARCHAR(255)  DEFAULT '',
>>>>>>> parent of d9759e4... restruct models
=======
  mananger VARCHAR(50)  DEFAULT '',
>>>>>>> parent of 125259c... modify primary key for models
  description VARCHAR(255) DEFAULT '',
  errorCode smallint(4) NOT NULL DEFAULT 0,
  createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

<<<<<<< HEAD
<<<<<<< HEAD
=======
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

>>>>>>> parent of 125259c... modify primary key for models






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
<<<<<<< HEAD

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
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    taskID VARCHAR(50) UNIQUE NOT NULL,
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
  id INT PRIMARY KEY NOT NULL,
  taskID VARCHAR(50) UNIQUE NOT NULL,
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
  id INT PRIMARY KEY NOT NULL,
  taskID VARCHAR(50) UNIQUE NOT NULL,
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
=======
CREATE TABLE Seller (
  index INT PRIMARY KEY AUTO_INCREMENT,
  sellerName VARCHAR(255) UNIQUE NOT NULL,
  marketPlace VARCHAR(255) NOT NULL,
  status BOOLEAN NOT NULL DEFAULT TRUE,
  note VARCHAR(255) DEFAULT '',
  mananger VARCHAR(255)  DEFAULT '',
  description VARCHAR(255) DEFAULT '',
  errorCode smallint(4) NOT NULL DEFAULT 0,
  createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
>>>>>>> parent of d9759e4... restruct models
=======
[
  {code:1, english:"ORDER TASK CREATED DONE", chinese:"已创建订单任务", korean:"주문 작업 생성 완료"},
  {code:2, english:"ORDER NUMBER DONE", chinese:"已下单，待留评", korean:"주문 번호 완료"},
  {code:0, english:"ALL DONE", chinese:"已留评", korean:"모두 완료"},
  {code:-1, english:"DELETED", chinese:"已删除", korean:"삭제됨"},
]
>>>>>>> parent of 125259c... modify primary key for models
