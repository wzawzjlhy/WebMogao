create database mogao;
use mogao;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `distributiontime` varchar(100) DEFAULT NULL,
  `lastlogintime` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE course(
cid INT PRIMARY KEY AUTO_INCREMENT,
cname VARCHAR(50),
cdate VARCHAR(100),
credit INT,
cpath VARCHAR(200)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE user_course(
ucid INT PRIMARY KEY AUTO_INCREMENT,
cid INT,
ucstatu INT,
SCHEDULE VARCHAR(10),
ucscore INT
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_username` varchar(20) DEFAULT NULL,
  `log_ip` varchar(60) DEFAULT NULL,
  `log_content` varchar(500) DEFAULT NULL,
  `log_time` varchar(60) DEFAULT NULL,
  `log_module` varchar(60) DEFAULT NULL,
  `log_description` varchar(200) DEFAULT NULL,
  `log_able` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(30) DEFAULT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE courseware(
cwid INT PRIMARY KEY AUTO_INCREMENT,
cw_path VARCHAR(200),
cid INT
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;