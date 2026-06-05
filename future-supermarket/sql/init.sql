CREATE DATABASE IF NOT EXISTS futuresupermarket
  DEFAULT CHARACTER SET utf8
  COLLATE utf8_bin;

USE futuresupermarket;

CREATE TABLE IF NOT EXISTS employee (
  id bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  name varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  username varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  password varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  phone varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  sex varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '性别',
  id_number varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  status int NOT NULL DEFAULT '1' COMMENT '状态 0:禁用，1:启用',
  create_time datetime DEFAULT NULL COMMENT '创建时间',
  update_time datetime DEFAULT NULL COMMENT '更新时间',
  create_user bigint DEFAULT NULL COMMENT '创建人',
  update_user bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (id),
  UNIQUE KEY idx_username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='员工信息';

CREATE TABLE IF NOT EXISTS category (
  id bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  type int DEFAULT NULL COMMENT '类型 1 菜品分类 2 套餐分类',
  name varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  sort int NOT NULL DEFAULT '0' COMMENT '顺序',
  status int DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  create_time datetime DEFAULT NULL COMMENT '创建时间',
  update_time datetime DEFAULT NULL COMMENT '更新时间',
  create_user bigint DEFAULT NULL COMMENT '创建人',
  update_user bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (id),
  UNIQUE KEY idx_category_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品及套餐分类';

CREATE TABLE IF NOT EXISTS dish (
  id bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  name varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜品名称',
  category_id bigint NOT NULL COMMENT '菜品分类id',
  price decimal(10,2) DEFAULT NULL COMMENT '菜品价格',
  image varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  description varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  status int DEFAULT '1' COMMENT '0 停售 1 起售',
  create_time datetime DEFAULT NULL COMMENT '创建时间',
  update_time datetime DEFAULT NULL COMMENT '更新时间',
  create_user bigint DEFAULT NULL COMMENT '创建人',
  update_user bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (id),
  UNIQUE KEY idx_dish_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品';

CREATE TABLE IF NOT EXISTS dish_flavor (
  id bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  dish_id bigint NOT NULL COMMENT '菜品',
  name varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '口味名称',
  value varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品口味关系表';

CREATE TABLE IF NOT EXISTS setmeal (
  id bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  category_id bigint NOT NULL COMMENT '套餐分类id',
  name varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
  price decimal(10,2) NOT NULL COMMENT '套餐价格',
  status int DEFAULT '1' COMMENT '售卖状态 0:停售 1:起售',
  description varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  image varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  create_time datetime DEFAULT NULL COMMENT '创建时间',
  update_time datetime DEFAULT NULL COMMENT '更新时间',
  create_user bigint DEFAULT NULL COMMENT '创建人',
  update_user bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (id),
  UNIQUE KEY idx_setmeal_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='套餐';

CREATE TABLE IF NOT EXISTS setmeal_dish (
  id bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  setmeal_id bigint DEFAULT NULL COMMENT '套餐id',
  dish_id bigint DEFAULT NULL COMMENT '菜品id',
  name varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '菜品名称（冗余字段）',
  price decimal(10,2) DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  copies int DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='套餐菜品关系';

CREATE TABLE IF NOT EXISTS user (
  id bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  openid varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微信用户唯一标识',
  name varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  phone varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  sex varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  id_number varchar(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  avatar varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  create_time datetime DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户信息';

CREATE TABLE IF NOT EXISTS address_book (
  id bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  user_id bigint NOT NULL COMMENT '用户id',
  consignee varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货人',
  sex varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  phone varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  province_code varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级区划编号',
  province_name varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级名称',
  city_code varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级区划编号',
  city_name varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级名称',
  district_code varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级区划编号',
  district_name varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级名称',
  detail varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '详细地址',
  label varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标签',
  is_default tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认 0 否 1是',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地址簿';

CREATE TABLE IF NOT EXISTS shopping_cart (
  id bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  name varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  image varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  user_id bigint NOT NULL COMMENT '用户id',
  dish_id bigint DEFAULT NULL COMMENT '菜品id',
  setmeal_id bigint DEFAULT NULL COMMENT '套餐id',
  dish_flavor varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '口味',
  number int NOT NULL DEFAULT '1' COMMENT '数量',
  amount decimal(10,2) NOT NULL COMMENT '金额',
  create_time datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='购物车';

CREATE TABLE IF NOT EXISTS orders (
  id bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  number varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  status int NOT NULL DEFAULT '1' COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  user_id bigint NOT NULL COMMENT '下单用户',
  address_book_id bigint NOT NULL COMMENT '地址id',
  order_time datetime NOT NULL COMMENT '下单时间',
  checkout_time datetime DEFAULT NULL COMMENT '结账时间',
  pay_method int NOT NULL DEFAULT '1' COMMENT '支付方式 1微信,2支付宝',
  pay_status tinyint NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付 1已支付 2退款',
  amount decimal(10,2) NOT NULL COMMENT '实收金额',
  remark varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  phone varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  address varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  user_name varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户名称',
  consignee varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货人',
  cancel_reason varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '订单取消原因',
  rejection_reason varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '订单拒绝原因',
  cancel_time datetime DEFAULT NULL COMMENT '订单取消时间',
  estimated_delivery_time datetime DEFAULT NULL COMMENT '预计送达时间',
  delivery_status tinyint(1) NOT NULL DEFAULT '1' COMMENT '配送状态 1立即送出 0选择具体时间',
  delivery_time datetime DEFAULT NULL COMMENT '送达时间',
  pack_amount int DEFAULT NULL COMMENT '打包费',
  tableware_number int DEFAULT NULL COMMENT '餐具数量',
  tableware_status tinyint(1) NOT NULL DEFAULT '1' COMMENT '餐具数量状态 1按餐量提供 0选择具体数量',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表';

CREATE TABLE IF NOT EXISTS order_detail (
  id bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  name varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '名字',
  image varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  order_id bigint NOT NULL COMMENT '订单id',
  dish_id bigint DEFAULT NULL COMMENT '菜品id',
  setmeal_id bigint DEFAULT NULL COMMENT '套餐id',
  dish_flavor varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '口味',
  number int NOT NULL DEFAULT '1' COMMENT '数量',
  amount decimal(10,2) NOT NULL COMMENT '金额',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单明细表';

START TRANSACTION;

INSERT INTO employee (id, name, username, password, phone, sex, id_number, status, create_time, update_time, create_user, update_user)
VALUES
  (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812345678', '1', '110101199001010011', 1, NOW(), NOW(), 1, 1)
ON DUPLICATE KEY UPDATE
  name = VALUES(name),
  password = VALUES(password),
  status = VALUES(status),
  update_time = NOW();

INSERT INTO category (id, type, name, sort, status, create_time, update_time, create_user, update_user)
VALUES
  (11, 1, '酒水饮料', 10, 1, NOW(), NOW(), 1, 1),
  (12, 1, '传统主食', 9, 1, NOW(), NOW(), 1, 1),
  (13, 2, '人气套餐', 12, 1, NOW(), NOW(), 1, 1),
  (15, 2, '商务套餐', 13, 1, NOW(), NOW(), 1, 1),
  (18, 1, '特色蒸菜', 6, 1, NOW(), NOW(), 1, 1),
  (19, 1, '新鲜时蔬', 7, 1, NOW(), NOW(), 1, 1),
  (20, 1, '水煮鱼', 8, 1, NOW(), NOW(), 1, 1),
  (21, 1, '汤类', 11, 1, NOW(), NOW(), 1, 1)
ON DUPLICATE KEY UPDATE
  type = VALUES(type),
  sort = VALUES(sort),
  status = VALUES(status),
  update_time = NOW();

INSERT INTO dish (id, name, category_id, price, image, description, status, create_time, update_time, create_user, update_user)
VALUES
  (46, '王老吉', 11, 6.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', '测试基础菜品', 1, NOW(), NOW(), 1, 1),
  (47, '北冰洋', 11, 4.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4451d4be-89a2-4939-9c69-3a87151cb979.png', '测试基础菜品', 1, NOW(), NOW(), 1, 1),
  (49, '米饭', 12, 2.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', '测试基础菜品', 1, NOW(), NOW(), 1, 1),
  (51, '老坛酸菜鱼', 20, 56.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4a9cefba-6a74-467e-9fde-6e687ea725d7.png', '测试基础菜品', 1, NOW(), NOW(), 1, 1),
  (54, '清炒小油菜', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/3613d38e-5614-41c2-90ed-ff175bf50716.png', '测试基础菜品', 1, NOW(), NOW(), 1, 1),
  (55, '蒜蓉娃娃菜', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', '测试基础菜品', 1, NOW(), NOW(), 1, 1),
  (56, '清炒西兰花', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/e9ec4ba4-4b22-4fc8-9be0-4946e6aeb937.png', '测试基础菜品', 1, NOW(), NOW(), 1, 1),
  (58, '清蒸鲈鱼', 18, 98.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', '测试基础菜品', 1, NOW(), NOW(), 1, 1),
  (68, '鸡蛋汤', 21, 4.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c09a0ee8-9d19-428d-81b9-746221824113.png', '测试基础菜品', 1, NOW(), NOW(), 1, 1)
ON DUPLICATE KEY UPDATE
  category_id = VALUES(category_id),
  price = VALUES(price),
  image = VALUES(image),
  status = VALUES(status),
  update_time = NOW();

INSERT INTO setmeal (category_id, name, price, status, description, image, create_time, update_time, create_user, update_user)
SELECT c.id, '未来鲜活双人套餐', 88.00, 1, '测试数据：酸菜鱼、米饭、饮料组合，适合套餐管理页面展示。', d.image, NOW(), NOW(), 1, 1
FROM category c
JOIN dish d ON d.name = '老坛酸菜鱼'
WHERE c.name = '人气套餐'
ON DUPLICATE KEY UPDATE
  category_id = VALUES(category_id),
  price = VALUES(price),
  status = VALUES(status),
  description = VALUES(description),
  image = VALUES(image),
  update_time = NOW();

INSERT INTO setmeal (category_id, name, price, status, description, image, create_time, update_time, create_user, update_user)
SELECT c.id, '蔬菜轻食人气套餐', 39.90, 1, '测试数据：时蔬、主食、汤品组合，用于验证套餐列表。', d.image, NOW(), NOW(), 1, 1
FROM category c
JOIN dish d ON d.name = '清炒小油菜'
WHERE c.name = '人气套餐'
ON DUPLICATE KEY UPDATE
  category_id = VALUES(category_id),
  price = VALUES(price),
  status = VALUES(status),
  description = VALUES(description),
  image = VALUES(image),
  update_time = NOW();

INSERT INTO setmeal (category_id, name, price, status, description, image, create_time, update_time, create_user, update_user)
SELECT c.id, '商务午餐优选套餐', 128.00, 1, '测试数据：蒸菜、配菜、饮品组合，用于验证商务套餐分类。', d.image, NOW(), NOW(), 1, 1
FROM category c
JOIN dish d ON d.name = '清蒸鲈鱼'
WHERE c.name = '商务套餐'
ON DUPLICATE KEY UPDATE
  category_id = VALUES(category_id),
  price = VALUES(price),
  status = VALUES(status),
  description = VALUES(description),
  image = VALUES(image),
  update_time = NOW();

DELETE sd
FROM setmeal_dish sd
JOIN setmeal s ON sd.setmeal_id = s.id
WHERE s.name IN ('未来鲜活双人套餐', '蔬菜轻食人气套餐', '商务午餐优选套餐');

INSERT INTO setmeal_dish (setmeal_id, dish_id, name, price, copies)
SELECT s.id, d.id, d.name, d.price, seed.copies
FROM (
  SELECT '未来鲜活双人套餐' AS setmeal_name, '老坛酸菜鱼' AS dish_name, 1 AS copies
  UNION ALL SELECT '未来鲜活双人套餐', '米饭', 2
  UNION ALL SELECT '未来鲜活双人套餐', '王老吉', 2
  UNION ALL SELECT '蔬菜轻食人气套餐', '清炒小油菜', 1
  UNION ALL SELECT '蔬菜轻食人气套餐', '清炒西兰花', 1
  UNION ALL SELECT '蔬菜轻食人气套餐', '鸡蛋汤', 1
  UNION ALL SELECT '商务午餐优选套餐', '清蒸鲈鱼', 1
  UNION ALL SELECT '商务午餐优选套餐', '蒜蓉娃娃菜', 1
  UNION ALL SELECT '商务午餐优选套餐', '北冰洋', 2
) seed
JOIN setmeal s ON s.name = seed.setmeal_name
JOIN dish d ON d.name = seed.dish_name;

INSERT INTO user (id, openid, name, phone, sex, id_number, avatar, create_time)
VALUES
  (1, 'mock-openid-001', '测试用户', '13800000001', '1', '110101199001010021', NULL, NOW())
ON DUPLICATE KEY UPDATE
  openid = VALUES(openid),
  name = VALUES(name),
  phone = VALUES(phone),
  sex = VALUES(sex),
  id_number = VALUES(id_number);

INSERT INTO address_book (
  id,
  user_id,
  consignee,
  sex,
  phone,
  province_code,
  province_name,
  city_code,
  city_name,
  district_code,
  district_name,
  detail,
  label,
  is_default
)
VALUES
  (1, 1, '测试用户', '1', '13800000001', '110000', '北京市', '110100', '北京市', '110108', '海淀区', '上地十街未来超市测试地址', '公司', 1)
ON DUPLICATE KEY UPDATE
  user_id = VALUES(user_id),
  consignee = VALUES(consignee),
  phone = VALUES(phone),
  province_name = VALUES(province_name),
  city_name = VALUES(city_name),
  district_name = VALUES(district_name),
  detail = VALUES(detail),
  label = VALUES(label),
  is_default = VALUES(is_default);

DELETE od
FROM order_detail od
JOIN orders o ON od.order_id = o.id
WHERE o.number IN (
  'MOCK202606050001',
  'MOCK202606050002',
  'MOCK202606050003',
  'MOCK202606050004',
  'MOCK202606050005'
);

DELETE FROM orders
WHERE number IN (
  'MOCK202606050001',
  'MOCK202606050002',
  'MOCK202606050003',
  'MOCK202606050004',
  'MOCK202606050005'
);

INSERT INTO orders (
  number,
  status,
  user_id,
  address_book_id,
  order_time,
  checkout_time,
  pay_method,
  pay_status,
  amount,
  remark,
  phone,
  address,
  user_name,
  consignee,
  cancel_reason,
  rejection_reason,
  cancel_time,
  estimated_delivery_time,
  delivery_status,
  delivery_time,
  pack_amount,
  tableware_number,
  tableware_status
)
VALUES
  ('MOCK202606050001', 2, 1, 1, NOW() - INTERVAL 50 MINUTE, NOW() - INTERVAL 49 MINUTE, 1, 1, 88.00, '请尽快配送', '13800000001', '北京市海淀区上地十街未来超市测试地址', '测试用户', '测试用户', NULL, NULL, NULL, NOW() + INTERVAL 30 MINUTE, 1, NULL, 2, 2, 0),
  ('MOCK202606050002', 3, 1, 1, NOW() - INTERVAL 45 MINUTE, NOW() - INTERVAL 44 MINUTE, 1, 1, 39.90, '少放油', '13800000001', '北京市海淀区上地十街未来超市测试地址', '测试用户', '测试用户', NULL, NULL, NULL, NOW() + INTERVAL 25 MINUTE, 1, NULL, 1, 1, 0),
  ('MOCK202606050003', 4, 1, 1, NOW() - INTERVAL 40 MINUTE, NOW() - INTERVAL 39 MINUTE, 2, 1, 128.00, '门口电话联系', '13800000001', '北京市海淀区上地十街未来超市测试地址', '测试用户', '测试用户', NULL, NULL, NULL, NOW() + INTERVAL 20 MINUTE, 1, NULL, 3, 2, 0),
  ('MOCK202606050004', 5, 1, 1, NOW() - INTERVAL 2 HOUR, NOW() - INTERVAL 119 MINUTE, 1, 1, 62.00, '已完成测试订单', '13800000001', '北京市海淀区上地十街未来超市测试地址', '测试用户', '测试用户', NULL, NULL, NULL, NOW() - INTERVAL 80 MINUTE, 1, NOW() - INTERVAL 75 MINUTE, 2, 2, 0),
  ('MOCK202606050005', 6, 1, 1, NOW() - INTERVAL 90 MINUTE, NOW() - INTERVAL 89 MINUTE, 1, 2, 45.90, '已取消测试订单', '13800000001', '北京市海淀区上地十街未来超市测试地址', '测试用户', '测试用户', '用户临时取消', NULL, NOW() - INTERVAL 80 MINUTE, NOW() - INTERVAL 45 MINUTE, 1, NULL, 1, 1, 0);

INSERT INTO order_detail (name, image, order_id, dish_id, setmeal_id, dish_flavor, number, amount)
SELECT '未来鲜活双人套餐', s.image, o.id, NULL, s.id, NULL, 1, 88.00
FROM orders o
JOIN setmeal s ON s.name = '未来鲜活双人套餐'
WHERE o.number = 'MOCK202606050001';

INSERT INTO order_detail (name, image, order_id, dish_id, setmeal_id, dish_flavor, number, amount)
SELECT '蔬菜轻食人气套餐', s.image, o.id, NULL, s.id, NULL, 1, 39.90
FROM orders o
JOIN setmeal s ON s.name = '蔬菜轻食人气套餐'
WHERE o.number = 'MOCK202606050002';

INSERT INTO order_detail (name, image, order_id, dish_id, setmeal_id, dish_flavor, number, amount)
SELECT '商务午餐优选套餐', s.image, o.id, NULL, s.id, NULL, 1, 128.00
FROM orders o
JOIN setmeal s ON s.name = '商务午餐优选套餐'
WHERE o.number = 'MOCK202606050003';

INSERT INTO order_detail (name, image, order_id, dish_id, setmeal_id, dish_flavor, number, amount)
SELECT d.name, d.image, o.id, d.id, NULL, NULL, 1, d.price
FROM orders o
JOIN dish d ON d.name = '老坛酸菜鱼'
WHERE o.number = 'MOCK202606050004';

INSERT INTO order_detail (name, image, order_id, dish_id, setmeal_id, dish_flavor, number, amount)
SELECT d.name, d.image, o.id, d.id, NULL, NULL, 2, d.price
FROM orders o
JOIN dish d ON d.name = '米饭'
WHERE o.number = 'MOCK202606050004';

INSERT INTO order_detail (name, image, order_id, dish_id, setmeal_id, dish_flavor, number, amount)
SELECT d.name, d.image, o.id, d.id, NULL, NULL, 1, d.price
FROM orders o
JOIN dish d ON d.name = '清炒小油菜'
WHERE o.number = 'MOCK202606050005';

INSERT INTO order_detail (name, image, order_id, dish_id, setmeal_id, dish_flavor, number, amount)
SELECT d.name, d.image, o.id, d.id, NULL, NULL, 1, d.price
FROM orders o
JOIN dish d ON d.name = '北冰洋'
WHERE o.number = 'MOCK202606050005';

COMMIT;
