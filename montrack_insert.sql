INSERT INTO "language" ("id", "name", "created_at", "updated_at", "deleted_at") VALUES
	(1, 'EN', '2024-10-31 09:03:32.179659', '2024-10-31 09:03:32.179659', NULL),
	(2, 'ID', '2024-10-31 09:03:46.706344', '2024-10-31 09:03:46.706344', NULL);

INSERT INTO "user" ("id", "name", "email", "password", "pin", "quote", "image_url", "created_at", "updated_at", "deleted_at", "language_id") VALUES
	(1, 'gora', 'gora@example', 'LNIAUSYD*(OU!HJN#@QEUICLTY', 1234, 'hehe', 'google.com', '2024-10-31 07:22:07.337309', '2024-10-31 07:22:07.337309', NULL, 1);

INSERT INTO "wallet" ("id", "user_id", "name", "balance", "is_active", "created_at", "updated_at", "deleted_at") VALUES
	(1, 1, 'Main wallet', 0, 'true', '2024-10-31 07:30:06.671378', '2024-10-31 07:30:06.671378', NULL);

INSERT INTO "pocket" ("id", "wallet_id", "name", "balance", "description", "created_at", "updated_at", "deleted_at", "emoji") VALUES
	(1, 1, 'jajan hari ini', 20000, 'hehe', '2024-10-31 07:49:58.363421', '2024-10-31 07:49:58.363421', NULL, 'U+1F600');

INSERT INTO "transaction_history" ("id", "wallet_id", "amount", "is_income", "description", "created_at", "updated_at", "deleted_at", "pocket_id", "transaction_date") VALUES
	(2, 1, 10000, 'false', 'jajan', '2024-10-31 07:51:44.90305', '2024-10-31 07:51:44.90305', NULL, 1, '2024-10-31 09:00:54.513858'),
	(1, 1, 10000, 'true', 'ngemis', '2024-10-31 07:42:30.975861', '2024-10-31 07:42:30.975861', NULL, 1, '2024-10-31 09:00:59.266965');

INSERT INTO "goal" ("id", "wallet_id", "name", "amount", "description", "created_at", "updated_at", "deleted_at", "image_url") VALUES
	(1, 1, 'beli baju', 300000, 'beli baju lebaran', '2024-10-31 08:45:36.390635', '2024-10-31 08:45:36.390635', NULL, 'google.com');

INSERT INTO "goal_history" ("id", "goal_id", "name", "amount", "created_at", "updated_at", "deleted_at") VALUES
	(1, 1, 'freelance bikin web', 200000, '2024-10-31 08:50:25.567492', '2024-10-31 08:50:25.567492', NULL);

INSERT INTO "notification" ("id", "user_id", "title", "description", "is_read", "created_at", "updated_at", "deleted_at") VALUES
	(1, 1, 'Dana kurang', 'Dana dalam poket anda kurang', 'false', '2024-10-31 09:42:32.726861', '2024-10-31 09:42:32.726861', NULL);
