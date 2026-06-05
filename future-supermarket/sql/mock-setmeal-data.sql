USE futuresupermarket;

START TRANSACTION;

INSERT INTO setmeal (
    category_id,
    name,
    price,
    status,
    description,
    image,
    create_time,
    update_time,
    create_user,
    update_user
)
SELECT
    c.id,
    '未来鲜活双人套餐',
    88.00,
    1,
    '测试数据：酸菜鱼、米饭、饮料组合，适合套餐管理页面展示。',
    d.image,
    NOW(),
    NOW(),
    1,
    1
FROM category c
JOIN dish d ON d.name = '老坛酸菜鱼'
WHERE c.name = '人气套餐'
  AND NOT EXISTS (SELECT 1 FROM setmeal WHERE name = '未来鲜活双人套餐');

INSERT INTO setmeal (
    category_id,
    name,
    price,
    status,
    description,
    image,
    create_time,
    update_time,
    create_user,
    update_user
)
SELECT
    c.id,
    '蔬菜轻食人气套餐',
    39.90,
    1,
    '测试数据：时蔬、主食、汤品组合，用于验证套餐列表。',
    d.image,
    NOW(),
    NOW(),
    1,
    1
FROM category c
JOIN dish d ON d.name = '清炒小油菜'
WHERE c.name = '人气套餐'
  AND NOT EXISTS (SELECT 1 FROM setmeal WHERE name = '蔬菜轻食人气套餐');

INSERT INTO setmeal (
    category_id,
    name,
    price,
    status,
    description,
    image,
    create_time,
    update_time,
    create_user,
    update_user
)
SELECT
    c.id,
    '商务午餐优选套餐',
    128.00,
    1,
    '测试数据：蒸菜、配菜、饮品组合，用于验证商务套餐分类。',
    d.image,
    NOW(),
    NOW(),
    1,
    1
FROM category c
JOIN dish d ON d.name = '清蒸鲈鱼'
WHERE c.name = '商务套餐'
  AND NOT EXISTS (SELECT 1 FROM setmeal WHERE name = '商务午餐优选套餐');

INSERT INTO setmeal_dish (setmeal_id, dish_id, name, price, copies)
SELECT s.id, d.id, d.name, d.price, 1
FROM setmeal s
JOIN dish d ON d.name = '老坛酸菜鱼'
WHERE s.name = '未来鲜活双人套餐'
  AND NOT EXISTS (
      SELECT 1 FROM setmeal_dish sd WHERE sd.setmeal_id = s.id AND sd.dish_id = d.id
  );

INSERT INTO setmeal_dish (setmeal_id, dish_id, name, price, copies)
SELECT s.id, d.id, d.name, d.price, 2
FROM setmeal s
JOIN dish d ON d.name = '米饭'
WHERE s.name = '未来鲜活双人套餐'
  AND NOT EXISTS (
      SELECT 1 FROM setmeal_dish sd WHERE sd.setmeal_id = s.id AND sd.dish_id = d.id
  );

INSERT INTO setmeal_dish (setmeal_id, dish_id, name, price, copies)
SELECT s.id, d.id, d.name, d.price, 2
FROM setmeal s
JOIN dish d ON d.name = '王老吉'
WHERE s.name = '未来鲜活双人套餐'
  AND NOT EXISTS (
      SELECT 1 FROM setmeal_dish sd WHERE sd.setmeal_id = s.id AND sd.dish_id = d.id
  );

INSERT INTO setmeal_dish (setmeal_id, dish_id, name, price, copies)
SELECT s.id, d.id, d.name, d.price, 1
FROM setmeal s
JOIN dish d ON d.name = '清炒小油菜'
WHERE s.name = '蔬菜轻食人气套餐'
  AND NOT EXISTS (
      SELECT 1 FROM setmeal_dish sd WHERE sd.setmeal_id = s.id AND sd.dish_id = d.id
  );

INSERT INTO setmeal_dish (setmeal_id, dish_id, name, price, copies)
SELECT s.id, d.id, d.name, d.price, 1
FROM setmeal s
JOIN dish d ON d.name = '清炒西兰花'
WHERE s.name = '蔬菜轻食人气套餐'
  AND NOT EXISTS (
      SELECT 1 FROM setmeal_dish sd WHERE sd.setmeal_id = s.id AND sd.dish_id = d.id
  );

INSERT INTO setmeal_dish (setmeal_id, dish_id, name, price, copies)
SELECT s.id, d.id, d.name, d.price, 1
FROM setmeal s
JOIN dish d ON d.name = '鸡蛋汤'
WHERE s.name = '蔬菜轻食人气套餐'
  AND NOT EXISTS (
      SELECT 1 FROM setmeal_dish sd WHERE sd.setmeal_id = s.id AND sd.dish_id = d.id
  );

INSERT INTO setmeal_dish (setmeal_id, dish_id, name, price, copies)
SELECT s.id, d.id, d.name, d.price, 1
FROM setmeal s
JOIN dish d ON d.name = '清蒸鲈鱼'
WHERE s.name = '商务午餐优选套餐'
  AND NOT EXISTS (
      SELECT 1 FROM setmeal_dish sd WHERE sd.setmeal_id = s.id AND sd.dish_id = d.id
  );

INSERT INTO setmeal_dish (setmeal_id, dish_id, name, price, copies)
SELECT s.id, d.id, d.name, d.price, 1
FROM setmeal s
JOIN dish d ON d.name = '蒜蓉娃娃菜'
WHERE s.name = '商务午餐优选套餐'
  AND NOT EXISTS (
      SELECT 1 FROM setmeal_dish sd WHERE sd.setmeal_id = s.id AND sd.dish_id = d.id
  );

INSERT INTO setmeal_dish (setmeal_id, dish_id, name, price, copies)
SELECT s.id, d.id, d.name, d.price, 2
FROM setmeal s
JOIN dish d ON d.name = '北冰洋'
WHERE s.name = '商务午餐优选套餐'
  AND NOT EXISTS (
      SELECT 1 FROM setmeal_dish sd WHERE sd.setmeal_id = s.id AND sd.dish_id = d.id
  );

COMMIT;
