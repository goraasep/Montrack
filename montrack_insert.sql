-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               PostgreSQL 17.0 on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
-- Server OS:                    
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping data for table montrack.goal: -1 rows
/*!40000 ALTER TABLE "goal" DISABLE KEYS */;
INSERT INTO "goal" ("id", "wallet_id", "name", "amount", "description", "created_at", "updated_at", "deleted_at", "image_url") VALUES
	(1, 1, 'beli baju', 300000, 'beli baju lebaran', '2024-10-31 08:45:36.390635', '2024-10-31 08:45:36.390635', NULL, 'google.com');
/*!40000 ALTER TABLE "goal" ENABLE KEYS */;

-- Dumping data for table montrack.goal_history: -1 rows
/*!40000 ALTER TABLE "goal_history" DISABLE KEYS */;
INSERT INTO "goal_history" ("id", "goal_id", "name", "amount", "created_at", "updated_at", "deleted_at") VALUES
	(1, 1, 'freelance bikin web', 200000, '2024-10-31 08:50:25.567492', '2024-10-31 08:50:25.567492', NULL);
/*!40000 ALTER TABLE "goal_history" ENABLE KEYS */;

-- Dumping data for table montrack.language: -1 rows
/*!40000 ALTER TABLE "language" DISABLE KEYS */;
INSERT INTO "language" ("id", "name", "created_at", "updated_at", "deleted_at") VALUES
	(1, 'EN', '2024-10-31 09:03:32.179659', '2024-10-31 09:03:32.179659', NULL),
	(2, 'ID', '2024-10-31 09:03:46.706344', '2024-10-31 09:03:46.706344', NULL);
/*!40000 ALTER TABLE "language" ENABLE KEYS */;

-- Dumping data for table montrack.notification: -1 rows
/*!40000 ALTER TABLE "notification" DISABLE KEYS */;
INSERT INTO "notification" ("id", "user_id", "title", "description", "is_read", "created_at", "updated_at", "deleted_at") VALUES
	(1, 1, 'Dana kurang', 'Dana dalam poket anda kurang', 'false', '2024-10-31 09:42:32.726861', '2024-10-31 09:42:32.726861', NULL);
/*!40000 ALTER TABLE "notification" ENABLE KEYS */;

-- Dumping data for table montrack.pocket: 1 rows
/*!40000 ALTER TABLE "pocket" DISABLE KEYS */;
INSERT INTO "pocket" ("id", "wallet_id", "name", "balance", "description", "created_at", "updated_at", "deleted_at", "emoji") VALUES
	(1, 1, 'jajan hari ini', 20000, 'hehe', '2024-10-31 07:49:58.363421', '2024-10-31 07:49:58.363421', NULL, 'U+1F600');
/*!40000 ALTER TABLE "pocket" ENABLE KEYS */;

-- Dumping data for table montrack.transaction_history: -1 rows
/*!40000 ALTER TABLE "transaction_history" DISABLE KEYS */;
INSERT INTO "transaction_history" ("id", "wallet_id", "amount", "is_income", "description", "created_at", "updated_at", "deleted_at", "pocket_id", "transaction_date") VALUES
	(2, 1, 10000, 'false', 'jajan', '2024-10-31 07:51:44.90305', '2024-10-31 07:51:44.90305', NULL, 1, '2024-10-31 09:00:54.513858'),
	(1, 1, 10000, 'true', 'ngemis', '2024-10-31 07:42:30.975861', '2024-10-31 07:42:30.975861', NULL, 1, '2024-10-31 09:00:59.266965');
/*!40000 ALTER TABLE "transaction_history" ENABLE KEYS */;

-- Dumping data for table montrack.user: 1 rows
/*!40000 ALTER TABLE "user" DISABLE KEYS */;
INSERT INTO "user" ("id", "name", "email", "password", "pin", "quote", "image_url", "created_at", "updated_at", "deleted_at", "language_id") VALUES
	(1, 'gora', 'gora@example', 'LNIAUSYD*(OU!HJN#@QEUICLTY', 1234, 'hehe', 'google.com', '2024-10-31 07:22:07.337309', '2024-10-31 07:22:07.337309', NULL, 1);
/*!40000 ALTER TABLE "user" ENABLE KEYS */;

-- Dumping data for table montrack.wallet: -1 rows
/*!40000 ALTER TABLE "wallet" DISABLE KEYS */;
INSERT INTO "wallet" ("id", "user_id", "name", "balance", "is_active", "created_at", "updated_at", "deleted_at") VALUES
	(1, 1, 'Main wallet', 0, 'true', '2024-10-31 07:30:06.671378', '2024-10-31 07:30:06.671378', NULL);
/*!40000 ALTER TABLE "wallet" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
