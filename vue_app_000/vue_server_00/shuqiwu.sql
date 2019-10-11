SET NAMES UTF8;
#如果存在丢弃cake数据库
DROP DATABASE IF EXISTS cake;
#创建新数据库并且设置编码格式
CREATE DATABASE cake CHARSET=UTF8;
#使用cake数据库
USE cake;
#创建数据表
# 壹、蛋糕列表 
CREATE TABLE danggao(
    id INT PRIMARY KEY AUTO_INCREMENT,
    dname VARCHAR(50),   #蛋糕名称
    detail VARCHAR(255),  #详情介绍
    price  DECIMAL(10,2), #价格
    tid INT,               #tid是分类id tid=dictionary
    term VARCHAR(255),     #term保存条件
    stock VARCHAR(255),    # stock原料 
    remark VARCHAR(500)   #备注
);
# 贰、规格尺寸列表 
CREATE TABLE norms(
    id INT PRIMARY KEY AUTO_INCREMENT,
    size VARCHAR(50),    #size 尺寸
    remark VARCHAR(50)   #备注
);
# 叁、蛋糕规格列表  更多蛋糕的尺寸 
CREATE TABLE danggaoNorms(
    id INT PRIMARY KEY AUTO_INCREMENT,
    did INT,      #did蛋糕id
    nid INT,      # nid规格id
    remark VARCHAR(50) #备注
);
# 肆、图片的列表
CREATE TABLE picter(
    id INT PRIMARY KEY AUTO_INCREMENT,
    did INT,                  # did蛋糕id（图片所属蛋糕）
    pic_url VARCHAR(255),     # 图片的路径
    pic_size VARCHAR(50),     #图片的大小
    remark VARCHAR(50)       #备注
);
# 伍、蛋糕分类的列表 dictionary分类
CREATE TABLE dictionary(
    id INT PRIMARY KEY AUTO_INCREMENT,
    dicName VARCHAR(100),     # dicName 分别名称
    remark VARCHAR(50)        
);
# 陆、购物车列表
CREATE TABLE shopping(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uid INT,
    userId VARCHAR(20),     #购物车id
    did INT,                # did蛋糕id（图片所属蛋糕）
    dname VARCHAR(50),        #蛋糕名称
    price  DECIMAL(10,2),   #蛋糕价格
    nid INT,                #nid规格id
    pid INT,                #pid图片的id
    isDeleted INT, #  1（删除） 0(未删除) 默认值0
    remark VARCHAR(50)                     
);
# 柒、用户列表
CREATE TABLE sqw_user(
    id INT PRIMARY KEY AUTO_INCREMENT,
    phone VARCHAR(20),      #手机号
    upwd VARCHAR(32),        #密码
    address VARCHAR(100),   #地址
    remark VARCHAR(50)
);

# 一 、插入蛋糕数据

#1.天然奶油蛋糕
insert into danggao values(null,"经典100%蛋糕","100%使用进口天然稀奶油:奶油丰富，简约时尚，享受经典原味","218.00","1","冷餐2天(建议当天食用)","100%使用进口天然奶油","");
insert into danggao values(null,"缤纷盛果蛋糕","100%使用进口天然稀奶油:搭配丰富的水果","308.00","1","冷藏2天(建议当天食用)","100%使用进口天然奶油、100%使用进口黄桃","");
insert into danggao values(null,"草莓公主蛋糕","娇艳欲滴草莓公主，在100%使用天然稀奶油的陪衬下鲜美无比，似乎每个人都想咬上一口","169.00","1","冷藏2天(建议当天食用)","100%使用进口天然奶油","");
insert into danggao values(null,"福寿绵长蛋糕","100%使用进口天然稀奶油的长寿祝福，绵延整个南山","218","1","冷藏2天(建议当天食用)","100%使用进口天然奶油","");
insert into danggao values(null,"萌萌兔蛋糕","呆萌兔儿的梦想很简单，就是吃口100%使用进口天然稀奶油的香甜","238","1","冷藏2天(建议当天食用)","100%使用进口天然奶油","");
insert into danggao values(null,"咩咩羊蛋糕","小羊的聪明才智来源于不断地尝试，不断地创新，不断地发掘100%使用进口天然稀奶油的美味所在","178","1","冷藏2天(建议当天食用)","100%使用进口天然奶油","");
insert into danggao values(null,"童梦奇缘蛋糕","孩子们都有个游乐园般的欢乐梦想，就是被100%使用进口天然稀奶油做成的礼物包围。（产品以实物为准）","198","1","冷藏2天(建议当天食用)","100%使用进口天然奶油","");
insert into danggao values(null,"华尔兹蛋糕","100%使用进口天然稀奶油；搭配进口扁桃仁片","228","1","冷藏2天(建议当天食用)","100%使用进口天然奶油","");
insert into danggao values(null,"花漾蛋糕","100%使用进口天然稀奶油的香气随风而至，傲娇的味蕾再也按耐不住，心花朵朵开","248","1","冷藏2天(建议当天食用)","100%使用进口天然奶油","");
insert into danggao values(null,"聚福蛋糕","100%使用进口天然稀奶油的香气随风而至，傲娇的味蕾再也按耐不住，心花朵朵开","248","1","冷藏2天(建议当天食用)","100%使用进口天然奶油","");



#2.巧克力风味蛋糕
insert into danggao values(null,"森林狂想曲蛋糕","100%使用进口天然稀奶油,简单时尚的'裸'蛋糕","228.00","5","冷餐2天(建议当天食用)","100%使用进口天然奶油、进口高脂可可粉","");
insert into danggao values(null,"经典黑森林蛋糕","100%使用进口天然稀奶油,与樱桃层层融合","228.00","5","冷餐2天(建议当天食用)","100%使用进口天然奶油","");
insert into danggao values(null,"经典黑森林蛋糕","巧克力奶油天堂，每一口都能尝到巧克力的香甜","228.00","5","冷餐2天(建议当天食用)","100%使用进口天然奶油100%使用进口三色爆谷米","");
insert into danggao values(null,"经典黑森林蛋糕","三层巧克力蛋糕坯，双层巧克力奶油","258.00","5","冷餐2天(建议当天食用)","100%使用进口天然奶油","");
insert into danggao values(null,"经典黑森林蛋糕","三层巧克力蛋糕坯，双层巧克力奶油","258.00","5","冷餐2天(建议当天食用)","100%使用进口天然奶油，100%使用可可脂巧克力","");
insert into danggao values(null,"经典黑森林蛋糕","三层巧克力蛋糕坯，双层巧克力奶油","258.00","5","冷餐2天(建议当天食用)","100%使用进口天然奶油，100%使用可可脂巧克力","");




#3.乳酪蛋糕
insert into danggao values(null,"草莓芝士蛋糕","粉色记忆弥足珍贵,100%使用进口干酪的甜美瞬间更是稀少,此时的草莓果祝福注定不能少","228.00","3","冷餐2天(建议当天食用)","100%使用进口天然奶油、100%使用进口树莓制作而成的树莓果溶","");
insert into danggao values(null,"甜蜜进行时","粉色记忆弥足珍贵,100%使用进口干酪的甜美瞬间更是稀少,此时的草莓果祝福注定不能少","239.00","3","冷餐2天(建议当天食用)","100%使用进口天然奶油、双莓慕斯、","");
insert into danggao values(null,"为你珍贵","粉色记忆弥足珍贵,100%使用进口干酪的甜美瞬间更是稀少,此时的草莓果祝福注定不能少","289.00","3","冷餐2天(建议当天食用)","100%使用进口天然奶油、巧克力奶油完美搭配","");
insert into danggao values(null,"为你珍贵","粉色记忆弥足珍贵,100%使用进口干酪的甜美瞬间更是稀少,此时的草莓果祝福注定不能少","289.00","3","冷餐2天(建议当天食用)","100%使用进口天然奶油、巧克力奶油完美搭配","");
insert into danggao values(null,"为你珍贵","粉色记忆弥足珍贵,100%使用进口干酪的甜美瞬间更是稀少,此时的草莓果祝福注定不能少","289.00","3","冷餐2天(建议当天食用)","100%使用进口天然奶油、巧克力奶油完美搭配","");
insert into danggao values(null,"为你珍贵","粉色记忆弥足珍贵,100%使用进口干酪的甜美瞬间更是稀少,此时的草莓果祝福注定不能少","289.00","3","冷餐2天(建议当天食用)","100%使用进口天然奶油、巧克力奶油完美搭配","");
insert into danggao values(null,"为你珍贵","粉色记忆弥足珍贵,100%使用进口干酪的甜美瞬间更是稀少,此时的草莓果祝福注定不能少","289.00","3","冷餐2天(建议当天食用)","100%使用进口天然奶油、巧克力奶油完美搭配","");
insert into danggao values(null,"为你珍贵","粉色记忆弥足珍贵,100%使用进口干酪的甜美瞬间更是稀少,此时的草莓果祝福注定不能少","289.00","3","冷餐2天(建议当天食用)","100%使用进口天然奶油、巧克力奶油完美搭配","");
insert into danggao values(null,"为你珍贵","粉色记忆弥足珍贵,100%使用进口干酪的甜美瞬间更是稀少,此时的草莓果祝福注定不能少","289.00","3","冷餐2天(建议当天食用)","100%使用进口天然奶油、巧克力奶油完美搭配","");
insert into danggao values(null,"为你珍贵","粉色记忆弥足珍贵,100%使用进口干酪的甜美瞬间更是稀少,此时的草莓果祝福注定不能少","289.00","3","冷餐2天(建议当天食用)","100%使用进口天然奶油、巧克力奶油完美搭配","");
insert into danggao values(null,"为你珍贵","粉色记忆弥足珍贵,100%使用进口干酪的甜美瞬间更是稀少,此时的草莓果祝福注定不能少","289.00","3","冷餐2天(建议当天食用)","中国松仁，和着甜润淡奶咀嚼","");




#4.慕斯蛋糕
insert into danggao values(null,"甜蜜时光蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一起,使得意式风情的甜蜜时光更是浪漫","194.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、100%使用进口天然奶油、进口高脂可可粉","");
insert into danggao values(null,"百里情人蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一起,玫瑰花瓣让你更迷人","194.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、100%使用进口天然奶油、玫瑰花瓣仅装饰使用，不可使用","");
insert into danggao values(null,"水果蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一起,","256.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、100%使用进口天然奶油、玫瑰花瓣仅装饰使用，不可使用","");
insert into danggao values(null,"芒果蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。采用新鲜芒果","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、100%使用进口天然奶油、最新鲜的芒果，香甜可口","");
insert into danggao values(null,"芒果蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。采用新鲜芒果","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、100%使用进口天然奶油、最新鲜的芒果，香甜可口","");
insert into danggao values(null,"松仁淡奶蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。中国松仁，和着甜润淡奶咀嚼","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、中国松仁，和着甜润淡奶咀嚼","");
insert into danggao values(null,"松仁淡奶蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。中国松仁，和着甜润淡奶咀嚼","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、中国松仁，和着甜润淡奶咀嚼","");
insert into danggao values(null,"莓果缤纷蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。中国松仁，和着甜润淡奶咀嚼","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、中国松仁，和着甜润淡奶咀嚼","");
insert into danggao values(null,"提拉米苏蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。中国松仁，和着甜润淡奶咀嚼","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、中国松仁，和着甜润淡奶咀嚼","");
insert into danggao values(null,"草莓千层蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。中国松仁，和着甜润淡奶咀嚼","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、中国松仁，和着甜润淡奶咀嚼","");
insert into danggao values(null,"数字玫瑰蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。中国松仁，和着甜润淡奶咀嚼","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、中国松仁，和着甜润淡奶咀嚼","");
insert into danggao values(null,"果然倾心蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。中国松仁，和着甜润淡奶咀嚼","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、中国松仁，和着甜润淡奶咀嚼","");
insert into danggao values(null,"雪域牛乳芝士蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。中国松仁，和着甜润淡奶咀嚼","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、中国松仁，和着甜润淡奶咀嚼","");
insert into danggao values(null,"布兰妮蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。中国松仁，和着甜润淡奶咀嚼","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、中国松仁，和着甜润淡奶咀嚼","");



#5.法式
insert into danggao values(null,"分享蛋糕","100%使用进口天然奶油,四种口味四种色彩纵享分享的快乐","168.00","2","冷餐2天(建议当天食用)","100%使用进口天然奶油、100%使用可可脂巧克力","");
insert into danggao values(null,"迷情冰激凌蛋糕"," 承袭比利时大师工艺，将源自比利时的可可豆缔造美味的巧克力风味；","1299.00","6","冷餐2天(建议当天食用)"," 当冰爽的冰淇淋与浓郁的巧克力蛋糕邂逅，冰火交融，香滑甜蜜","");
insert into danggao values(null,"鲜莓映雪","雪过天晴后的每一口呼吸，甜蜜清新得不落俗套","1299.00","6","冷餐2天(建议当天食用)"," 雪过天晴后的每一口呼吸，甜蜜清新得不落俗套，鲜红的草莓，如俏皮的精灵降落凡间。","");
insert into danggao values(null,"蜜桃物语","慕斯的轻盈，镶嵌白桃果肉搭配巴旦木坯","1299.00","6","冷餐2天(建议当天食用)"," 慕斯的轻盈，镶嵌白桃果肉搭配巴旦木坯，一层层地，细腻化，浪漫化，将高贵分离，却在唇齿间主动靠近。","");
insert into danggao values(null,"芒果蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。采用新鲜芒果","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、100%使用进口天然奶油、最新鲜的芒果，香甜可口","");
insert into danggao values(null,"松仁淡奶蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。中国松仁，和着甜润淡奶咀嚼","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、中国松仁，和着甜润淡奶咀嚼","");
insert into danggao values(null,"松仁淡奶蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。中国松仁，和着甜润淡奶咀嚼","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、中国松仁，和着甜润淡奶咀嚼","");
insert into danggao values(null,"莓果缤纷蛋糕","100%使用进口干酪与100%使用进口天然奶油搭配一一起。中国松仁，和着甜润淡奶咀嚼","190.00","4","冷餐2天(建议当天食用)","100%使用进口干酪、中国松仁，和着甜润淡奶咀嚼","");

insert into danggao values(null,"为你珍贵","粉色记忆弥足珍贵,100%使用进口干酪的甜美瞬间更是稀少,此时的草莓果祝福注定不能少","289.00","3","冷餐2天(建议当天食用)","100%使用进口天然奶油、巧克力奶油完美搭配","");
insert into danggao values(null,"为你珍贵","粉色记忆弥足珍贵,100%使用进口干酪的甜美瞬间更是稀少,此时的草莓果祝福注定不能少","289.00","3","冷餐2天(建议当天食用)","100%使用进口天然奶油、巧克力奶油完美搭配","");
insert into danggao values(null,"为你珍贵","粉色记忆弥足珍贵,100%使用进口干酪的甜美瞬间更是稀少,此时的草莓果祝福注定不能少","289.00","3","冷餐2天(建议当天食用)","100%使用进口天然奶油、巧克力奶油完美搭配","");


#6.大型蛋糕
insert into danggao values(null,"挚爱一生","挚爱一色,见证此刻幸福,天然奶油的甜蜜祝福,由味道铭记","1299.00","6","冷餐2天(建议当天食用)","100%使用进口天然奶油","");
insert into danggao values(null,"花漾年华"," 树莓慕斯搭配百香果、柑橘果茸","1299.00","6","冷餐2天(建议当天食用)","康乃馨在酸奶淋面上盛开成海， 入口后，清新的奶香在心间蔓延， 像小时候在春天里奔跑，踩过暖阳。","");
insert into danggao values(null,"迷情冰激凌蛋糕"," 承袭比利时大师工艺，将源自比利时的可可豆缔造美味的巧克力风味；","1299.00","6","冷餐2天(建议当天食用)"," 当冰爽的冰淇淋与浓郁的巧克力蛋糕邂逅，冰火交融，香滑甜蜜","");
insert into danggao values(null,"鲜莓映雪","雪过天晴后的每一口呼吸，甜蜜清新得不落俗套","1299.00","6","冷餐2天(建议当天食用)"," 雪过天晴后的每一口呼吸，甜蜜清新得不落俗套，鲜红的草莓，如俏皮的精灵降落凡间。","");
insert into danggao values(null,"蜜桃物语","慕斯的轻盈，镶嵌白桃果肉搭配巴旦木坯","1299.00","6","冷餐2天(建议当天食用)"," 慕斯的轻盈，镶嵌白桃果肉搭配巴旦木坯，一层层地，细腻化，浪漫化，将高贵分离，却在唇齿间主动靠近。","");
insert into danggao values(null,"蜜桃物语","慕斯的轻盈，镶嵌白桃果肉搭配巴旦木坯","1299.00","6","冷餐2天(建议当天食用)"," 慕斯的轻盈，镶嵌白桃果肉搭配巴旦木坯，一层层地，细腻化，浪漫化，将高贵分离，却在唇齿间主动靠近。","");
insert into danggao values(null,"蜜桃物语","慕斯的轻盈，镶嵌白桃果肉搭配巴旦木坯","1299.00","6","冷餐2天(建议当天食用)"," 慕斯的轻盈，镶嵌白桃果肉搭配巴旦木坯，一层层地，细腻化，浪漫化，将高贵分离，却在唇齿间主动靠近。","");
insert into danggao values(null,"蜜桃物语","慕斯的轻盈，镶嵌白桃果肉搭配巴旦木坯","1299.00","6","冷餐2天(建议当天食用)"," 慕斯的轻盈，镶嵌白桃果肉搭配巴旦木坯，一层层地，细腻化，浪漫化，将高贵分离，却在唇齿间主动靠近。","");
insert into danggao values(null,"蜜桃物语","慕斯的轻盈，镶嵌白桃果肉搭配巴旦木坯","1299.00","6","冷餐2天(建议当天食用)"," 慕斯的轻盈，镶嵌白桃果肉搭配巴旦木坯，一层层地，细腻化，浪漫化，将高贵分离，却在唇齿间主动靠近。","");

# 二、插入规格表尺寸数据 
insert into norms values(null,"15cm","");
insert into norms values(null,"20cm","");
insert into norms values(null,"25cm","");
insert into norms values(null,"30cm","");
insert into norms values(null,"11×11cm","");
insert into norms values(null,"16×16cm","");
insert into norms values(null,"3层","");
insert into norms values(null,"5层","");
insert into norms values(null,"6层","");

insert into norms values(null,"8层","");

# 三、蛋糕规格列表
# 蛋糕id=1 经典100%蛋糕 后面是尺寸的id
insert into danggaoNorms values(null,1,1,"");
insert into danggaoNorms values(null,1,2,"");
insert into danggaoNorms values(null,1,3,"");
insert into danggaoNorms values(null,1,4,"");
# 蛋糕id=2 缤纷盛果蛋糕 后面是尺寸的id
insert into danggaoNorms values(null,2,2,"");
insert into danggaoNorms values(null,2,3,"");
insert into danggaoNorms values(null,2,4,"");
# 蛋糕id=3  森林狂想曲蛋糕 后面是尺寸的id
insert into danggaoNorms values(null,3,1,"");
insert into danggaoNorms values(null,3,2,"");
insert into danggaoNorms values(null,3,3,"");
insert into danggaoNorms values(null,3,4,"");
# 蛋糕id=4  草莓芝士蛋糕 后面是尺寸的id
insert into danggaoNorms values(null,4,1,"");
insert into danggaoNorms values(null,4,2,"");
# 蛋糕id=5  甜蜜时光蛋糕 后面是尺寸的id
insert into danggaoNorms values(null,5,1,"");
insert into danggaoNorms values(null,5,2,"");
# 蛋糕id=6  分享蛋糕 后面是尺寸的id
insert into danggaoNorms values(null,6,1,"");
# 蛋糕id=7  挚爱一生 后面是尺寸的id
insert into danggaoNorms values(null,7,1,"");
insert into danggaoNorms values(null,7,2,"");
insert into danggaoNorms values(null,7,3,"");
insert into danggaoNorms values(null,7,4,"");

# 四、图片列表
#经典100%蛋糕 id=1
insert into picter values(null,1,"","sm","");
insert into picter values(null,1,"product/pmd-2.jpg","md","");
insert into picter values(null,1,"路径","lg","");
#缤纷圣果蛋糕 did=2
insert into picter values(null,2,"","sm","");
insert into picter values(null,2,"product/pmd-1.jpg","md","");
insert into picter values(null,2,"路径","lg","");
#森林狂想曲蛋糕 did=3
insert into picter values(null,3,"","sm","");
insert into picter values(null,3,"product/pmd-9.jpg","md","");
insert into picter values(null,3,"路径","lg","");
#草莓芝士蛋糕 did=4          这个蛋糕
insert into picter values(null,4,"","sm","");
insert into picter values(null,4,"product/pmd-10.jpg","md","");
insert into picter values(null,4,"路径","lg","");
#甜蜜时光蛋糕 did=5
insert into picter values(null,5,"","sm","");
insert into picter values(null,5,"product/pmd-3.jpg","md","");
insert into picter values(null,5,"路径","lg","");
#分享蛋糕   did=6
insert into picter values(null,6,"","sm","");
insert into picter values(null,6,"product/pmd-11.jpg","md","");
insert into picter values(null,6,"路径","lg","");
#草莓公主蛋糕 did=7
insert into picter values(null,7,"","sm","");
insert into picter values(null,7,"files/cao-md.jpg","md","");
insert into picter values(null,7,"路径","lg","")
#福寿绵长蛋糕 did=8
insert into picter values(null,8,"","sm","");
insert into picter values(null,8,"files/fu-md.jpg","md","");
insert into picter values(null,8,"路径","lg","")
#萌萌兔蛋糕 did=9
insert into picter values(null,9,"","sm","");
insert into picter values(null,9,"files/meng-md.jpg","md","");
insert into picter values(null,9,"路径","lg","")
#咩咩羊蛋糕 id=10
insert into picter values(null,10,"","sm","");
insert into picter values(null,10,"files/mie-md.jpg","md","");
insert into picter values(null,10,"路径","lg","")
#童梦奇缘蛋糕 id=11
insert into picter values(null,11,"","sm","");
insert into picter values(null,11,"files/tong-md.jpg","md","");
insert into picter values(null,11,"路径","lg","")
#华尔兹蛋糕 id=12
insert into picter values(null,12,"","sm","");
insert into picter values(null,12,"files/hua-md.jpg","md","");
insert into picter values(null,12,"路径","lg","")
#花漾蛋糕 id=13
insert into picter values(null,13,"","sm","");
insert into picter values(null,13,"files/huay-md.jpg","md","");
insert into picter values(null,13,"路径","lg","")
#聚福蛋糕 id=14
insert into picter values(null,14,"","sm","");
insert into picter values(null,14,"files/ju-md.jpg","md","");
insert into picter values(null,14,"路径","lg","");
# id=15
insert into picter values(null,15,"","sm","");
insert into picter values(null,15,"dictionary/1.jpg","md","");
insert into picter values(null,15,"路径","lg","");
# id=16
insert into picter values(null,16,"","sm","");
insert into picter values(null,16,"dictionary/2.jpg","md","");
insert into picter values(null,16,"路径","lg","");
# id=17
insert into picter values(null,17,"","sm","");
insert into picter values(null,17,"dictionary/3.jpg","md","");
insert into picter values(null,17,"路径","lg","");
# id=18
insert into picter values(null,18,"","sm","");
insert into picter values(null,18,"dictionary/4.jpg","md","");
insert into picter values(null,18,"路径","lg","");
# id=19
insert into picter values(null,19,"","sm","");
insert into picter values(null,19,"dictionary/5.jpg","md","");
insert into picter values(null,19,"路径","lg","");
# id=20
insert into picter values(null,20,"","sm","");
insert into picter values(null,20,"dictionary/6.jpg","md","");
insert into picter values(null,20,"路径","lg","");
# id=21
insert into picter values(null,21,"","sm","");
insert into picter values(null,21,"dictionary/7.jpg","md","");
insert into picter values(null,21,"路径","lg","");
# id=22
insert into picter values(null,22,"","sm","");
insert into picter values(null,22,"dictionary/8.jpg","md","");
insert into picter values(null,22,"路径","lg","");
# id=23
insert into picter values(null,23,"","sm","");
insert into picter values(null,23,"dictionary/9.jpg","md","");
insert into picter values(null,23,"路径","lg","");
# id=24
insert into picter values(null,24,"","sm","");
insert into picter values(null,24,"dictionary/10.jpg","md","");
insert into picter values(null,24,"路径","lg","");

# 五、插分类别表数据
insert into dictionary values(null,"天然奶油蛋糕","");
insert into dictionary values(null,"法式蛋糕","");
insert into dictionary values(null,"乳酪蛋糕","");
insert into dictionary values(null,"慕斯蛋糕","");
insert into dictionary values(null,"巧克力风味蛋糕","");
insert into dictionary values(null,"大型庆典蛋糕","");

# 六、插入用户列表
insert into sqw_user values(null,"12345678912","123456","天津市","");
insert into sqw_user values(null,"18404963260","123456","北京市","");



