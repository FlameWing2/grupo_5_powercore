/*
 Navicat Premium Data Transfer

 Source Server         : mipc
 Source Server Type    : MySQL
 Source Server Version : 110502
 Source Host           : localhost:3306
 Source Schema         : l2jdb

 Target Server Type    : MySQL
 Target Server Version : 110502
 File Encoding         : 65001

 Date: 27/09/2024 00:37:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for VIPinfo
-- ----------------------------
DROP TABLE IF EXISTS `VIPinfo`;
CREATE TABLE `VIPinfo`  (
  `teamID` int NOT NULL,
  `endx` int NOT NULL,
  `endy` int NOT NULL,
  `endz` int NOT NULL,
  `startx` int NOT NULL,
  `starty` int NOT NULL,
  `startz` int NOT NULL,
  PRIMARY KEY (`teamID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for access_levels
-- ----------------------------
DROP TABLE IF EXISTS `access_levels`;
CREATE TABLE `access_levels`  (
  `accessLevel` mediumint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `nameColor` char(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT 'FFFFFF',
  `useNameColor` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `titleColor` char(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT 'FFFFFF',
  `useTitleColor` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `isGm` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `allowPeaceAttack` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `allowFixedRes` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `allowTransaction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `allowAltg` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `giveDamage` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `takeAggro` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `gainExp` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `canDisableGmStatus` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`accessLevel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_data
-- ----------------------------
DROP TABLE IF EXISTS `account_data`;
CREATE TABLE `account_data`  (
  `account_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `var` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`account_name`, `var`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `login` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lastactive` decimal(20, 0) NULL DEFAULT NULL,
  `access_level` int NULL DEFAULT NULL,
  `lastIP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lastServer` int NULL DEFAULT 1,
  PRIMARY KEY (`login`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_command_access_rights
-- ----------------------------
DROP TABLE IF EXISTS `admin_command_access_rights`;
CREATE TABLE `admin_command_access_rights`  (
  `adminCommand` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT 'admin_',
  `accessLevels` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL,
  PRIMARY KEY (`adminCommand`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for areas
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas`  (
  `idarea` int NOT NULL AUTO_INCREMENT,
  `nombre_area` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idarea`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for armor
-- ----------------------------
DROP TABLE IF EXISTS `armor`;
CREATE TABLE `armor`  (
  `item_id` int NOT NULL DEFAULT 0,
  `name` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bodypart` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `crystallizable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `armor_type` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `weight` int NOT NULL DEFAULT 0,
  `crystal_type` enum('none','d','c','b','a','s') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'none',
  `avoid_modify` int NOT NULL DEFAULT 0,
  `duration` int NOT NULL DEFAULT 0,
  `p_def` int NOT NULL DEFAULT 0,
  `m_def` int NOT NULL DEFAULT 0,
  `mp_bonus` int NOT NULL DEFAULT 0,
  `price` int NOT NULL DEFAULT 0,
  `crystal_count` int NULL DEFAULT NULL,
  `sellable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dropable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `destroyable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tradeable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `item_skill_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `item_skill_lvl` decimal(11, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for armorsets
-- ----------------------------
DROP TABLE IF EXISTS `armorsets`;
CREATE TABLE `armorsets`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `chest` decimal(11, 0) NOT NULL DEFAULT 0,
  `legs` decimal(11, 0) NOT NULL DEFAULT 0,
  `head` decimal(11, 0) NOT NULL DEFAULT 0,
  `gloves` decimal(11, 0) NOT NULL DEFAULT 0,
  `feet` decimal(11, 0) NOT NULL DEFAULT 0,
  `skill_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `shield` decimal(11, 0) NOT NULL DEFAULT 0,
  `shield_skill_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `enchant6skill` decimal(11, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `chest`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 52 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for auction
-- ----------------------------
DROP TABLE IF EXISTS `auction`;
CREATE TABLE `auction`  (
  `id` int NOT NULL DEFAULT 0,
  `sellerId` int NOT NULL DEFAULT 0,
  `sellerName` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NPC',
  `sellerClanName` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `itemType` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `itemId` int NOT NULL DEFAULT 0,
  `itemObjectId` int NOT NULL DEFAULT 0,
  `itemName` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `itemQuantity` int NOT NULL DEFAULT 0,
  `startingBid` int NOT NULL DEFAULT 0,
  `currentBid` int NOT NULL DEFAULT 0,
  `endDate` decimal(20, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`itemType`, `itemId`, `itemObjectId`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auction_bid
-- ----------------------------
DROP TABLE IF EXISTS `auction_bid`;
CREATE TABLE `auction_bid`  (
  `id` int NOT NULL DEFAULT 0,
  `auctionId` int NOT NULL DEFAULT 0,
  `bidderId` int NOT NULL DEFAULT 0,
  `bidderName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clan_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `maxBid` int NOT NULL DEFAULT 0,
  `time_bid` decimal(20, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`auctionId`, `bidderId`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auction_watch
-- ----------------------------
DROP TABLE IF EXISTS `auction_watch`;
CREATE TABLE `auction_watch`  (
  `charObjId` int NOT NULL DEFAULT 0,
  `auctionId` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`charObjId`, `auctionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for augmentations
-- ----------------------------
DROP TABLE IF EXISTS `augmentations`;
CREATE TABLE `augmentations`  (
  `item_id` int NOT NULL DEFAULT 0,
  `attributes` int NULL DEFAULT 0,
  `skill` int NULL DEFAULT 0,
  `level` int NULL DEFAULT 0,
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auto_announcements
-- ----------------------------
DROP TABLE IF EXISTS `auto_announcements`;
CREATE TABLE `auto_announcements`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `announcement` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL,
  `delay` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auto_chat
-- ----------------------------
DROP TABLE IF EXISTS `auto_chat`;
CREATE TABLE `auto_chat`  (
  `groupId` int NOT NULL DEFAULT 0,
  `npcId` int NOT NULL DEFAULT 0,
  `chatDelay` bigint NOT NULL DEFAULT -1,
  PRIMARY KEY (`groupId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auto_chat_text
-- ----------------------------
DROP TABLE IF EXISTS `auto_chat_text`;
CREATE TABLE `auto_chat_text`  (
  `groupId` int NOT NULL DEFAULT 0,
  `chatText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`groupId`, `chatText`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for boxaccess
-- ----------------------------
DROP TABLE IF EXISTS `boxaccess`;
CREATE TABLE `boxaccess`  (
  `spawn` decimal(11, 0) NULL DEFAULT NULL,
  `charname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for boxes
-- ----------------------------
DROP TABLE IF EXISTS `boxes`;
CREATE TABLE `boxes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `spawn` decimal(11, 0) NULL DEFAULT NULL,
  `npcid` decimal(11, 0) NULL DEFAULT NULL,
  `drawer` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `itemid` decimal(11, 0) NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `count` decimal(11, 0) NULL DEFAULT NULL,
  `enchant` decimal(2, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for buff_templates
-- ----------------------------
DROP TABLE IF EXISTS `buff_templates`;
CREATE TABLE `buff_templates`  (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `skill_id` int UNSIGNED NOT NULL,
  `skill_name` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NULL DEFAULT NULL,
  `skill_level` int UNSIGNED NOT NULL DEFAULT 1,
  `skill_force` int NOT NULL DEFAULT 1,
  `skill_order` int UNSIGNED NOT NULL,
  `char_min_level` int UNSIGNED NOT NULL DEFAULT 0,
  `char_max_level` int UNSIGNED NOT NULL DEFAULT 0,
  `price_adena` decimal(10, 0) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`, `name`, `skill_order`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for carritos
-- ----------------------------
DROP TABLE IF EXISTS `carritos`;
CREATE TABLE `carritos`  (
  `id_carrito` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `total_adena` int NULL DEFAULT NULL,
  `total_dinero` decimal(10, 2) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_carrito`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for castle
-- ----------------------------
DROP TABLE IF EXISTS `castle`;
CREATE TABLE `castle`  (
  `id` int NOT NULL DEFAULT 0,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxPercent` int NOT NULL DEFAULT 15,
  `treasury` int NOT NULL DEFAULT 0,
  `siegeDate` decimal(20, 0) NOT NULL DEFAULT 0,
  `siegeDayOfWeek` int NOT NULL DEFAULT 7,
  `siegeHourOfDay` int NOT NULL DEFAULT 20,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for castle_door
-- ----------------------------
DROP TABLE IF EXISTS `castle_door`;
CREATE TABLE `castle_door`  (
  `castleId` int NOT NULL DEFAULT 0,
  `id` int NOT NULL DEFAULT 0,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `x` int NOT NULL DEFAULT 0,
  `y` int NOT NULL DEFAULT 0,
  `z` int NOT NULL DEFAULT 0,
  `range_xmin` int NOT NULL DEFAULT 0,
  `range_ymin` int NOT NULL DEFAULT 0,
  `range_zmin` int NOT NULL DEFAULT 0,
  `range_xmax` int NOT NULL DEFAULT 0,
  `range_ymax` int NOT NULL DEFAULT 0,
  `range_zmax` int NOT NULL DEFAULT 0,
  `hp` int NOT NULL DEFAULT 0,
  `pDef` int NOT NULL DEFAULT 0,
  `mDef` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`castleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for castle_doorupgrade
-- ----------------------------
DROP TABLE IF EXISTS `castle_doorupgrade`;
CREATE TABLE `castle_doorupgrade`  (
  `doorId` int NOT NULL DEFAULT 0,
  `hp` int NOT NULL DEFAULT 0,
  `pDef` int NOT NULL DEFAULT 0,
  `mDef` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`doorId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for castle_manor_procure
-- ----------------------------
DROP TABLE IF EXISTS `castle_manor_procure`;
CREATE TABLE `castle_manor_procure`  (
  `castle_id` int NOT NULL DEFAULT 0,
  `crop_id` int NOT NULL DEFAULT 0,
  `can_buy` int NOT NULL DEFAULT 0,
  `start_buy` int NOT NULL DEFAULT 0,
  `price` int NOT NULL DEFAULT 0,
  `reward_type` int NOT NULL DEFAULT 0,
  `period` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`castle_id`, `crop_id`, `period`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for castle_manor_production
-- ----------------------------
DROP TABLE IF EXISTS `castle_manor_production`;
CREATE TABLE `castle_manor_production`  (
  `castle_id` int NOT NULL DEFAULT 0,
  `seed_id` int NOT NULL DEFAULT 0,
  `can_produce` int NOT NULL DEFAULT 0,
  `start_produce` int NOT NULL DEFAULT 0,
  `seed_price` int NOT NULL DEFAULT 0,
  `period` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`castle_id`, `seed_id`, `period`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for castle_siege_guards
-- ----------------------------
DROP TABLE IF EXISTS `castle_siege_guards`;
CREATE TABLE `castle_siege_guards`  (
  `castleId` int NOT NULL DEFAULT 0,
  `id` int NOT NULL AUTO_INCREMENT,
  `npcId` int NOT NULL DEFAULT 0,
  `x` int NOT NULL DEFAULT 0,
  `y` int NOT NULL DEFAULT 0,
  `z` int NOT NULL DEFAULT 0,
  `heading` int NOT NULL DEFAULT 0,
  `respawnDelay` int NOT NULL DEFAULT 0,
  `isHired` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`castleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3690 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for char_templates
-- ----------------------------
DROP TABLE IF EXISTS `char_templates`;
CREATE TABLE `char_templates`  (
  `ClassId` int NOT NULL DEFAULT 0,
  `ClassName` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `RaceId` int NOT NULL DEFAULT 0,
  `STR` int NOT NULL DEFAULT 0,
  `CON` int NOT NULL DEFAULT 0,
  `DEX` int NOT NULL DEFAULT 0,
  `_INT` int NOT NULL DEFAULT 0,
  `WIT` int NOT NULL DEFAULT 0,
  `MEN` int NOT NULL DEFAULT 0,
  `P_ATK` int NOT NULL DEFAULT 0,
  `P_DEF` int NOT NULL DEFAULT 0,
  `M_ATK` int NOT NULL DEFAULT 0,
  `M_DEF` int NOT NULL DEFAULT 0,
  `P_SPD` int NOT NULL DEFAULT 0,
  `M_SPD` int NOT NULL DEFAULT 0,
  `ACC` int NOT NULL DEFAULT 0,
  `CRITICAL` int NOT NULL DEFAULT 0,
  `EVASION` int NOT NULL DEFAULT 0,
  `MOVE_SPD` int NOT NULL DEFAULT 0,
  `_LOAD` int NOT NULL DEFAULT 0,
  `x` int NOT NULL DEFAULT 0,
  `y` int NOT NULL DEFAULT 0,
  `z` int NOT NULL DEFAULT 0,
  `canCraft` int NOT NULL DEFAULT 0,
  `M_UNK1` decimal(4, 2) NOT NULL DEFAULT 0.00,
  `M_UNK2` decimal(8, 6) NOT NULL DEFAULT 0.000000,
  `M_COL_R` decimal(3, 1) NOT NULL DEFAULT 0.0,
  `M_COL_H` decimal(4, 1) NOT NULL DEFAULT 0.0,
  `F_UNK1` decimal(4, 2) NOT NULL DEFAULT 0.00,
  `F_UNK2` decimal(8, 6) NOT NULL DEFAULT 0.000000,
  `F_COL_R` decimal(3, 1) NOT NULL DEFAULT 0.0,
  `F_COL_H` decimal(4, 1) NOT NULL DEFAULT 0.0,
  `items1` int NOT NULL DEFAULT 0,
  `items2` int NOT NULL DEFAULT 0,
  `items3` int NOT NULL DEFAULT 0,
  `items4` int NOT NULL DEFAULT 0,
  `items5` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`ClassId`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_friends
-- ----------------------------
DROP TABLE IF EXISTS `character_friends`;
CREATE TABLE `character_friends`  (
  `char_id` int NOT NULL DEFAULT 0,
  `friend_id` int NOT NULL DEFAULT 0,
  `friend_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `not_blocked` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`char_id`, `friend_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_hennas
-- ----------------------------
DROP TABLE IF EXISTS `character_hennas`;
CREATE TABLE `character_hennas`  (
  `char_obj_id` int NOT NULL DEFAULT 0,
  `symbol_id` int NULL DEFAULT NULL,
  `slot` int NOT NULL DEFAULT 0,
  `class_index` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`, `slot`, `class_index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_macroses
-- ----------------------------
DROP TABLE IF EXISTS `character_macroses`;
CREATE TABLE `character_macroses`  (
  `char_obj_id` int NOT NULL DEFAULT 0,
  `id` int NOT NULL DEFAULT 0,
  `icon` int NULL DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `descr` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `acronym` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `commands` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`char_obj_id`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_offline_trade
-- ----------------------------
DROP TABLE IF EXISTS `character_offline_trade`;
CREATE TABLE `character_offline_trade`  (
  `charId` int NOT NULL,
  `time` bigint UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint NOT NULL DEFAULT 0,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`charId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_offline_trade_items
-- ----------------------------
DROP TABLE IF EXISTS `character_offline_trade_items`;
CREATE TABLE `character_offline_trade_items`  (
  `charId` int NOT NULL DEFAULT 0,
  `item` int NOT NULL DEFAULT 0,
  `count` int NOT NULL DEFAULT 0,
  `price` int NOT NULL DEFAULT 0,
  `enchant` int NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_quests
-- ----------------------------
DROP TABLE IF EXISTS `character_quests`;
CREATE TABLE `character_quests`  (
  `char_id` int NOT NULL DEFAULT 0,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `var` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `class_index` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`, `name`, `var`, `class_index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_raid_points
-- ----------------------------
DROP TABLE IF EXISTS `character_raid_points`;
CREATE TABLE `character_raid_points`  (
  `charId` int UNSIGNED NOT NULL DEFAULT 0,
  `boss_id` int UNSIGNED NOT NULL DEFAULT 0,
  `points` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`, `boss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_recipebook
-- ----------------------------
DROP TABLE IF EXISTS `character_recipebook`;
CREATE TABLE `character_recipebook`  (
  `char_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `id` decimal(11, 0) NOT NULL DEFAULT 0,
  `type` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_recommends
-- ----------------------------
DROP TABLE IF EXISTS `character_recommends`;
CREATE TABLE `character_recommends`  (
  `char_id` int NOT NULL DEFAULT 0,
  `target_id` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`, `target_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_shortcuts
-- ----------------------------
DROP TABLE IF EXISTS `character_shortcuts`;
CREATE TABLE `character_shortcuts`  (
  `char_obj_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `slot` decimal(3, 0) NOT NULL DEFAULT 0,
  `page` decimal(3, 0) NOT NULL DEFAULT 0,
  `type` decimal(3, 0) NULL DEFAULT NULL,
  `shortcut_id` decimal(16, 0) NULL DEFAULT NULL,
  `level` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `class_index` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`, `slot`, `page`, `class_index`) USING BTREE,
  INDEX `shortcut_id`(`shortcut_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_skills
-- ----------------------------
DROP TABLE IF EXISTS `character_skills`;
CREATE TABLE `character_skills`  (
  `char_obj_id` int NOT NULL DEFAULT 0,
  `skill_id` int NOT NULL DEFAULT 0,
  `skill_level` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `skill_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `class_index` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`, `skill_id`, `class_index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_skills_save
-- ----------------------------
DROP TABLE IF EXISTS `character_skills_save`;
CREATE TABLE `character_skills_save`  (
  `char_obj_id` int NOT NULL DEFAULT 0,
  `skill_id` int NOT NULL DEFAULT 0,
  `skill_level` int NOT NULL DEFAULT 0,
  `effect_count` int NOT NULL DEFAULT 0,
  `effect_cur_time` int NOT NULL DEFAULT 0,
  `reuse_delay` int NOT NULL DEFAULT 0,
  `systime` bigint UNSIGNED NOT NULL DEFAULT 0,
  `restore_type` int NOT NULL DEFAULT 0,
  `class_index` int NOT NULL DEFAULT 0,
  `buff_index` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`, `skill_id`, `class_index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_subclasses
-- ----------------------------
DROP TABLE IF EXISTS `character_subclasses`;
CREATE TABLE `character_subclasses`  (
  `char_obj_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `class_id` int NOT NULL DEFAULT 0,
  `exp` decimal(20, 0) NOT NULL DEFAULT 0,
  `sp` decimal(11, 0) NOT NULL DEFAULT 0,
  `level` int NOT NULL DEFAULT 40,
  `class_index` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`, `class_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for characters
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters`  (
  `account_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `obj_Id` decimal(11, 0) NOT NULL DEFAULT 0,
  `char_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` decimal(11, 0) NULL DEFAULT NULL,
  `maxHp` decimal(11, 0) NULL DEFAULT 1,
  `curHp` decimal(18, 0) NULL DEFAULT 1,
  `maxCp` decimal(11, 0) NULL DEFAULT 1,
  `curCp` decimal(18, 0) NULL DEFAULT 1,
  `maxMp` decimal(11, 0) NULL DEFAULT 1,
  `curMp` decimal(18, 0) NULL DEFAULT 1,
  `acc` decimal(11, 0) NULL DEFAULT NULL,
  `crit` decimal(10, 0) NULL DEFAULT NULL,
  `evasion` decimal(11, 0) NULL DEFAULT NULL,
  `mAtk` decimal(11, 0) NULL DEFAULT NULL,
  `mDef` decimal(11, 0) NULL DEFAULT NULL,
  `mSpd` decimal(11, 0) NULL DEFAULT NULL,
  `pAtk` decimal(11, 0) NULL DEFAULT NULL,
  `pDef` decimal(11, 0) NULL DEFAULT NULL,
  `pSpd` decimal(11, 0) NULL DEFAULT NULL,
  `runSpd` decimal(11, 0) NULL DEFAULT NULL,
  `walkSpd` decimal(11, 0) NULL DEFAULT NULL,
  `str` decimal(11, 0) NULL DEFAULT NULL,
  `con` decimal(11, 0) NULL DEFAULT NULL,
  `dex` decimal(11, 0) NULL DEFAULT NULL,
  `_int` decimal(11, 0) NULL DEFAULT NULL,
  `men` decimal(11, 0) NULL DEFAULT NULL,
  `wit` decimal(11, 0) NULL DEFAULT NULL,
  `face` decimal(11, 0) NULL DEFAULT NULL,
  `hairStyle` decimal(11, 0) NULL DEFAULT NULL,
  `hairColor` decimal(11, 0) NULL DEFAULT NULL,
  `sex` decimal(11, 0) NULL DEFAULT NULL,
  `heading` decimal(11, 0) NULL DEFAULT NULL,
  `x` decimal(11, 0) NULL DEFAULT NULL,
  `y` decimal(11, 0) NULL DEFAULT NULL,
  `z` decimal(11, 0) NULL DEFAULT NULL,
  `movement_multiplier` decimal(9, 8) NULL DEFAULT NULL,
  `attack_speed_multiplier` decimal(10, 9) NULL DEFAULT NULL,
  `colRad` decimal(10, 3) NULL DEFAULT NULL,
  `colHeight` decimal(10, 3) NULL DEFAULT NULL,
  `exp` decimal(20, 0) NULL DEFAULT NULL,
  `expBeforeDeath` decimal(20, 0) NULL DEFAULT 0,
  `sp` decimal(11, 0) NULL DEFAULT NULL,
  `karma` decimal(11, 0) NULL DEFAULT NULL,
  `pvpkills` decimal(11, 0) NULL DEFAULT NULL,
  `pkkills` decimal(11, 0) NULL DEFAULT NULL,
  `clanid` decimal(11, 0) NULL DEFAULT NULL,
  `maxload` decimal(11, 0) NULL DEFAULT NULL,
  `race` decimal(11, 0) NULL DEFAULT NULL,
  `classid` decimal(11, 0) NULL DEFAULT NULL,
  `base_class` int NOT NULL DEFAULT 0,
  `deletetime` decimal(20, 0) NULL DEFAULT NULL,
  `cancraft` decimal(11, 0) NULL DEFAULT NULL,
  `title` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rec_have` int NOT NULL DEFAULT 0,
  `rec_left` int NOT NULL DEFAULT 0,
  `accesslevel` decimal(4, 0) NULL DEFAULT NULL,
  `online` decimal(1, 0) NULL DEFAULT NULL,
  `onlinetime` decimal(20, 0) NULL DEFAULT NULL,
  `char_slot` decimal(1, 0) NULL DEFAULT NULL,
  `newbie` decimal(1, 0) NULL DEFAULT 1,
  `lastAccess` decimal(20, 0) NULL DEFAULT NULL,
  `clan_privs` int NULL DEFAULT 0,
  `wantspeace` decimal(1, 0) NULL DEFAULT 0,
  `isin7sdungeon` decimal(1, 0) NOT NULL DEFAULT 0,
  `punish_level` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `punish_timer` int UNSIGNED NOT NULL DEFAULT 0,
  `power_grade` decimal(11, 0) NULL DEFAULT NULL,
  `nobless` decimal(1, 0) NOT NULL DEFAULT 0,
  `subpledge` int NOT NULL DEFAULT 0,
  `last_recom_date` decimal(20, 0) NOT NULL DEFAULT 0,
  `lvl_joined_academy` int NOT NULL DEFAULT 0,
  `apprentice` int NOT NULL DEFAULT 0,
  `sponsor` int NOT NULL DEFAULT 0,
  `varka_ketra_ally` int NOT NULL DEFAULT 0,
  `clan_join_expiry_time` decimal(20, 0) NOT NULL DEFAULT 0,
  `clan_create_expiry_time` decimal(20, 0) NOT NULL DEFAULT 0,
  `death_penalty_level` int NOT NULL DEFAULT 0,
  `pc_point` int NOT NULL DEFAULT 0,
  `name_color` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '\0\0\0',
  `title_color` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '\0\0\0',
  `first_log` int NULL DEFAULT 1,
  `aio` decimal(1, 0) NOT NULL DEFAULT 0,
  `aio_end` decimal(20, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`obj_Id`) USING BTREE,
  INDEX `clanid`(`clanid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for characters_custom_data
-- ----------------------------
DROP TABLE IF EXISTS `characters_custom_data`;
CREATE TABLE `characters_custom_data`  (
  `obj_Id` decimal(11, 0) NOT NULL DEFAULT 0,
  `char_name` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `hero` decimal(1, 0) NOT NULL DEFAULT 0,
  `noble` decimal(1, 0) NOT NULL DEFAULT 0,
  `donator` decimal(1, 0) NOT NULL DEFAULT 0,
  `hero_end_date` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`obj_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clan_data
-- ----------------------------
DROP TABLE IF EXISTS `clan_data`;
CREATE TABLE `clan_data`  (
  `clan_id` int NOT NULL DEFAULT 0,
  `clan_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `clan_level` int NULL DEFAULT NULL,
  `reputation_score` int NOT NULL DEFAULT 0,
  `hasCastle` int NULL DEFAULT NULL,
  `ally_id` int NULL DEFAULT NULL,
  `ally_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `leader_id` int NULL DEFAULT NULL,
  `crest_id` int NULL DEFAULT NULL,
  `crest_large_id` int NULL DEFAULT NULL,
  `ally_crest_id` int NULL DEFAULT NULL,
  `auction_bid_at` int NOT NULL DEFAULT 0,
  `ally_penalty_expiry_time` decimal(20, 0) NOT NULL DEFAULT 0,
  `ally_penalty_type` decimal(1, 0) NOT NULL DEFAULT 0,
  `char_penalty_expiry_time` decimal(20, 0) NOT NULL DEFAULT 0,
  `dissolving_expiry_time` decimal(20, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`clan_id`) USING BTREE,
  INDEX `leader_id`(`leader_id`) USING BTREE,
  INDEX `ally_id`(`ally_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clan_notices
-- ----------------------------
DROP TABLE IF EXISTS `clan_notices`;
CREATE TABLE `clan_notices`  (
  `clan_id` int NOT NULL,
  `notice` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `enabled` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`clan_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clan_privs
-- ----------------------------
DROP TABLE IF EXISTS `clan_privs`;
CREATE TABLE `clan_privs`  (
  `clan_id` int NOT NULL DEFAULT 0,
  `rank` int NOT NULL DEFAULT 0,
  `party` int NOT NULL DEFAULT 0,
  `privs` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`clan_id`, `rank`, `party`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clan_skills
-- ----------------------------
DROP TABLE IF EXISTS `clan_skills`;
CREATE TABLE `clan_skills`  (
  `clan_id` int NOT NULL DEFAULT 0,
  `skill_id` int NOT NULL DEFAULT 0,
  `skill_level` int NOT NULL DEFAULT 0,
  `skill_name` varchar(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`clan_id`, `skill_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clan_subpledges
-- ----------------------------
DROP TABLE IF EXISTS `clan_subpledges`;
CREATE TABLE `clan_subpledges`  (
  `clan_id` int NOT NULL DEFAULT 0,
  `sub_pledge_id` int NOT NULL DEFAULT 0,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `leader_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`clan_id`, `sub_pledge_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clan_wars
-- ----------------------------
DROP TABLE IF EXISTS `clan_wars`;
CREATE TABLE `clan_wars`  (
  `clan1` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `clan2` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `wantspeace1` decimal(1, 0) NOT NULL DEFAULT 0,
  `wantspeace2` decimal(1, 0) NOT NULL DEFAULT 0
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clanhall
-- ----------------------------
DROP TABLE IF EXISTS `clanhall`;
CREATE TABLE `clanhall`  (
  `id` int NOT NULL DEFAULT 0,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ownerId` int NOT NULL DEFAULT 0,
  `lease` int NOT NULL DEFAULT 0,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `paidUntil` decimal(20, 0) NOT NULL DEFAULT 0,
  `Grade` decimal(1, 0) NOT NULL DEFAULT 0,
  `paid` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clanhall_functions
-- ----------------------------
DROP TABLE IF EXISTS `clanhall_functions`;
CREATE TABLE `clanhall_functions`  (
  `hall_id` int NOT NULL DEFAULT 0,
  `type` int NOT NULL DEFAULT 0,
  `lvl` int NOT NULL DEFAULT 0,
  `lease` int NOT NULL DEFAULT 0,
  `rate` decimal(20, 0) NOT NULL DEFAULT 0,
  `endTime` decimal(20, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`hall_id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clanhall_siege
-- ----------------------------
DROP TABLE IF EXISTS `clanhall_siege`;
CREATE TABLE `clanhall_siege`  (
  `id` int NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL,
  `siege_data` decimal(20, 0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for class_list
-- ----------------------------
DROP TABLE IF EXISTS `class_list`;
CREATE TABLE `class_list`  (
  `class_name` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id` int UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for connection_test_table
-- ----------------------------
DROP TABLE IF EXISTS `connection_test_table`;
CREATE TABLE `connection_test_table`  (
  `a` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contactos
-- ----------------------------
DROP TABLE IF EXISTS `contactos`;
CREATE TABLE `contactos`  (
  `id_contacto` int NOT NULL AUTO_INCREMENT,
  `apenom` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mensaje` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `id_area` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_contacto`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ctf
-- ----------------------------
DROP TABLE IF EXISTS `ctf`;
CREATE TABLE `ctf`  (
  `eventName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `eventDesc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `joiningLocation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `minlvl` int NOT NULL DEFAULT 0,
  `maxlvl` int NOT NULL DEFAULT 0,
  `npcId` int NOT NULL DEFAULT 0,
  `npcX` int NOT NULL DEFAULT 0,
  `npcY` int NOT NULL DEFAULT 0,
  `npcZ` int NOT NULL DEFAULT 0,
  `npcHeading` int NOT NULL DEFAULT 0,
  `rewardId` int NOT NULL DEFAULT 0,
  `rewardAmount` int NOT NULL DEFAULT 0,
  `teamsCount` int NOT NULL DEFAULT 0,
  `joinTime` int NOT NULL DEFAULT 0,
  `eventTime` int NOT NULL DEFAULT 0,
  `minPlayers` int NOT NULL DEFAULT 0,
  `maxPlayers` int NOT NULL DEFAULT 0,
  `delayForNextEvent` bigint NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ctf_teams
-- ----------------------------
DROP TABLE IF EXISTS `ctf_teams`;
CREATE TABLE `ctf_teams`  (
  `teamId` int NOT NULL DEFAULT 0,
  `teamName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `teamX` int NOT NULL DEFAULT 0,
  `teamY` int NOT NULL DEFAULT 0,
  `teamZ` int NOT NULL DEFAULT 0,
  `teamColor` int NOT NULL DEFAULT 0,
  `flagX` int NOT NULL DEFAULT 0,
  `flagY` int NOT NULL DEFAULT 0,
  `flagZ` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`teamId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cursed_weapons
-- ----------------------------
DROP TABLE IF EXISTS `cursed_weapons`;
CREATE TABLE `cursed_weapons`  (
  `itemId` int NOT NULL,
  `playerId` int NULL DEFAULT 0,
  `playerKarma` int NULL DEFAULT 0,
  `playerPkKills` int NULL DEFAULT 0,
  `nbKills` int NULL DEFAULT 0,
  `endTime` decimal(20, 0) NULL DEFAULT 0,
  PRIMARY KEY (`itemId`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for custom_armor
-- ----------------------------
DROP TABLE IF EXISTS `custom_armor`;
CREATE TABLE `custom_armor`  (
  `item_id` int NOT NULL DEFAULT 0,
  `name` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bodypart` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `crystallizable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `armor_type` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `weight` int NOT NULL DEFAULT 0,
  `crystal_type` enum('none','d','c','b','a','s') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'none',
  `avoid_modify` int NOT NULL DEFAULT 0,
  `duration` int NOT NULL DEFAULT 0,
  `p_def` int NOT NULL DEFAULT 0,
  `m_def` int NOT NULL DEFAULT 0,
  `mp_bonus` int NOT NULL DEFAULT 0,
  `price` int NOT NULL DEFAULT 0,
  `crystal_count` int NULL DEFAULT NULL,
  `sellable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dropable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `destroyable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tradeable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `item_skill_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `item_skill_lvl` decimal(11, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_armorsets
-- ----------------------------
DROP TABLE IF EXISTS `custom_armorsets`;
CREATE TABLE `custom_armorsets`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `chest` decimal(11, 0) NOT NULL DEFAULT 0,
  `legs` decimal(11, 0) NOT NULL DEFAULT 0,
  `head` decimal(11, 0) NOT NULL DEFAULT 0,
  `gloves` decimal(11, 0) NOT NULL DEFAULT 0,
  `feet` decimal(11, 0) NOT NULL DEFAULT 0,
  `skill_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `shield` decimal(11, 0) NOT NULL DEFAULT 0,
  `shield_skill_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `enchant6skill` decimal(11, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `chest`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for custom_droplist
-- ----------------------------
DROP TABLE IF EXISTS `custom_droplist`;
CREATE TABLE `custom_droplist`  (
  `mobId` int NOT NULL DEFAULT 0,
  `itemId` int NOT NULL DEFAULT 0,
  `min` int NOT NULL DEFAULT 0,
  `max` int NOT NULL DEFAULT 0,
  `category` int NOT NULL DEFAULT 0,
  `chance` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`mobId`, `itemId`, `category`) USING BTREE,
  INDEX `key_mobId`(`mobId`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for custom_etcitem
-- ----------------------------
DROP TABLE IF EXISTS `custom_etcitem`;
CREATE TABLE `custom_etcitem`  (
  `item_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `crystallizable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `item_type` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `weight` decimal(4, 0) NULL DEFAULT NULL,
  `consume_type` varchar(9) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `crystal_type` enum('none','d','c','b','a','s') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'none',
  `duration` decimal(3, 0) NULL DEFAULT NULL,
  `price` decimal(11, 0) NULL DEFAULT NULL,
  `crystal_count` int NULL DEFAULT NULL,
  `sellable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dropable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `destroyable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tradeable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `oldname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `oldtype` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_merchant_buylists
-- ----------------------------
DROP TABLE IF EXISTS `custom_merchant_buylists`;
CREATE TABLE `custom_merchant_buylists`  (
  `item_id` decimal(9, 0) NOT NULL DEFAULT 0,
  `price` decimal(11, 0) NOT NULL DEFAULT 0,
  `shop_id` decimal(9, 0) NOT NULL DEFAULT 0,
  `order` decimal(4, 0) NOT NULL DEFAULT 0,
  `count` int NOT NULL DEFAULT -1,
  `currentCount` int NOT NULL DEFAULT -1,
  `time` int NOT NULL DEFAULT 0,
  `savetimer` decimal(20, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`shop_id`, `order`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for custom_merchant_shopids
-- ----------------------------
DROP TABLE IF EXISTS `custom_merchant_shopids`;
CREATE TABLE `custom_merchant_shopids`  (
  `shop_id` decimal(9, 0) NOT NULL DEFAULT 0,
  `npc_id` varchar(9) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_notspawned
-- ----------------------------
DROP TABLE IF EXISTS `custom_notspawned`;
CREATE TABLE `custom_notspawned`  (
  `id` int NOT NULL,
  `isCustom` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_npc
-- ----------------------------
DROP TABLE IF EXISTS `custom_npc`;
CREATE TABLE `custom_npc`  (
  `id` decimal(11, 0) NOT NULL DEFAULT 0,
  `idTemplate` int NOT NULL DEFAULT 0,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `serverSideName` int NULL DEFAULT 0,
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `serverSideTitle` int NULL DEFAULT 0,
  `class` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `collision_radius` decimal(5, 2) NULL DEFAULT NULL,
  `collision_height` decimal(5, 2) NULL DEFAULT NULL,
  `level` decimal(2, 0) NULL DEFAULT NULL,
  `sex` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attackrange` int NULL DEFAULT NULL,
  `hp` decimal(8, 0) NULL DEFAULT NULL,
  `mp` decimal(5, 0) NULL DEFAULT NULL,
  `hpreg` decimal(8, 2) NULL DEFAULT NULL,
  `mpreg` decimal(5, 2) NULL DEFAULT NULL,
  `str` decimal(7, 0) NULL DEFAULT NULL,
  `con` decimal(7, 0) NULL DEFAULT NULL,
  `dex` decimal(7, 0) NULL DEFAULT NULL,
  `int` decimal(7, 0) NULL DEFAULT NULL,
  `wit` decimal(7, 0) NULL DEFAULT NULL,
  `men` decimal(7, 0) NULL DEFAULT NULL,
  `exp` decimal(9, 0) NULL DEFAULT NULL,
  `sp` decimal(8, 0) NULL DEFAULT NULL,
  `patk` decimal(5, 0) NULL DEFAULT NULL,
  `pdef` decimal(5, 0) NULL DEFAULT NULL,
  `matk` decimal(5, 0) NULL DEFAULT NULL,
  `mdef` decimal(5, 0) NULL DEFAULT NULL,
  `atkspd` decimal(3, 0) NULL DEFAULT NULL,
  `aggro` decimal(6, 0) NULL DEFAULT NULL,
  `matkspd` decimal(4, 0) NULL DEFAULT NULL,
  `rhand` decimal(4, 0) NULL DEFAULT NULL,
  `lhand` decimal(4, 0) NULL DEFAULT NULL,
  `armor` decimal(1, 0) NULL DEFAULT NULL,
  `walkspd` decimal(3, 0) NULL DEFAULT NULL,
  `runspd` decimal(3, 0) NULL DEFAULT NULL,
  `faction_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `faction_range` decimal(4, 0) NULL DEFAULT NULL,
  `isUndead` int NULL DEFAULT 0,
  `absorb_level` decimal(2, 0) NULL DEFAULT 0,
  `absorb_type` enum('FULL_PARTY','LAST_HIT','PARTY_ONE_RANDOM') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LAST_HIT',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_spawnlist
-- ----------------------------
DROP TABLE IF EXISTS `custom_spawnlist`;
CREATE TABLE `custom_spawnlist`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `count` int NOT NULL DEFAULT 0,
  `npc_templateid` int NOT NULL DEFAULT 0,
  `locx` int NOT NULL DEFAULT 0,
  `locy` int NOT NULL DEFAULT 0,
  `locz` int NOT NULL DEFAULT 0,
  `randomx` int NOT NULL DEFAULT 0,
  `randomy` int NOT NULL DEFAULT 0,
  `heading` int NOT NULL DEFAULT 0,
  `respawn_delay` int NOT NULL DEFAULT 0,
  `loc_id` int NOT NULL DEFAULT 0,
  `periodOfDay` decimal(2, 0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_npc_templateid`(`npc_templateid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_teleport
-- ----------------------------
DROP TABLE IF EXISTS `custom_teleport`;
CREATE TABLE `custom_teleport`  (
  `Description` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id` decimal(11, 0) NOT NULL DEFAULT 0,
  `loc_x` decimal(9, 0) NULL DEFAULT NULL,
  `loc_y` decimal(9, 0) NULL DEFAULT NULL,
  `loc_z` decimal(9, 0) NULL DEFAULT NULL,
  `price` decimal(6, 0) NULL DEFAULT NULL,
  `fornoble` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_weapon
-- ----------------------------
DROP TABLE IF EXISTS `custom_weapon`;
CREATE TABLE `custom_weapon`  (
  `item_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `name` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bodypart` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `crystallizable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `weight` decimal(4, 0) NULL DEFAULT NULL,
  `soulshots` decimal(2, 0) NULL DEFAULT NULL,
  `spiritshots` decimal(1, 0) NULL DEFAULT NULL,
  `crystal_type` enum('none','d','c','b','a','s') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'none',
  `p_dam` decimal(5, 0) NULL DEFAULT NULL,
  `rnd_dam` decimal(2, 0) NULL DEFAULT NULL,
  `weaponType` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `critical` decimal(2, 0) NULL DEFAULT NULL,
  `hit_modify` decimal(6, 5) NULL DEFAULT NULL,
  `avoid_modify` decimal(2, 0) NULL DEFAULT NULL,
  `shield_def` decimal(3, 0) NULL DEFAULT NULL,
  `shield_def_rate` decimal(2, 0) NULL DEFAULT NULL,
  `atk_speed` decimal(3, 0) NULL DEFAULT NULL,
  `mp_consume` decimal(2, 0) NULL DEFAULT NULL,
  `m_dam` decimal(3, 0) NULL DEFAULT NULL,
  `duration` decimal(3, 0) NULL DEFAULT NULL,
  `price` decimal(11, 0) NULL DEFAULT NULL,
  `crystal_count` int NULL DEFAULT NULL,
  `sellable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dropable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `destroyable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tradeable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `item_skill_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `item_skill_lvl` decimal(11, 0) NOT NULL DEFAULT 0,
  `enchant4_skill_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `enchant4_skill_lvl` decimal(11, 0) NOT NULL DEFAULT 0,
  `onCast_skill_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `onCast_skill_lvl` decimal(11, 0) NOT NULL DEFAULT 0,
  `onCast_skill_chance` decimal(11, 0) NOT NULL DEFAULT 0,
  `onCrit_skill_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `onCrit_skill_lvl` decimal(11, 0) NOT NULL DEFAULT 0,
  `onCrit_skill_chance` decimal(11, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dimensional_rift
-- ----------------------------
DROP TABLE IF EXISTS `dimensional_rift`;
CREATE TABLE `dimensional_rift`  (
  `type` tinyint(1) NOT NULL,
  `room_id` tinyint(1) NOT NULL,
  `xMin` int NOT NULL,
  `xMax` int NOT NULL,
  `yMin` int NOT NULL,
  `yMax` int NOT NULL,
  `zMin` int NOT NULL,
  `zMax` int NOT NULL,
  `xT` int NOT NULL,
  `yT` int NOT NULL,
  `zT` int NOT NULL,
  `boss` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`type`, `room_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dm
-- ----------------------------
DROP TABLE IF EXISTS `dm`;
CREATE TABLE `dm`  (
  `eventName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `eventDesc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `joiningLocation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `minlvl` int NOT NULL DEFAULT 0,
  `maxlvl` int NOT NULL DEFAULT 0,
  `npcId` int NOT NULL DEFAULT 0,
  `npcX` int NOT NULL DEFAULT 0,
  `npcY` int NOT NULL DEFAULT 0,
  `npcZ` int NOT NULL DEFAULT 0,
  `npcHeading` int NOT NULL DEFAULT 0,
  `rewardId` int NOT NULL DEFAULT 0,
  `rewardAmount` int NOT NULL DEFAULT 0,
  `joinTime` int NOT NULL DEFAULT 0,
  `eventTime` int NOT NULL DEFAULT 0,
  `minPlayers` int NOT NULL DEFAULT 0,
  `maxPlayers` int NOT NULL DEFAULT 0,
  `color` int NOT NULL DEFAULT 0,
  `playerX` int NOT NULL DEFAULT 0,
  `playerY` int NOT NULL DEFAULT 0,
  `playerZ` int NOT NULL DEFAULT 0,
  `delayForNextEvent` bigint NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for droplist
-- ----------------------------
DROP TABLE IF EXISTS `droplist`;
CREATE TABLE `droplist`  (
  `mobId` int NOT NULL DEFAULT 0,
  `itemId` int NOT NULL DEFAULT 0,
  `min` int NOT NULL DEFAULT 0,
  `max` int NOT NULL DEFAULT 0,
  `category` int NOT NULL DEFAULT 0,
  `chance` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`mobId`, `itemId`, `category`) USING BTREE,
  INDEX `key_mobId`(`mobId`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for enchant_skill_trees
-- ----------------------------
DROP TABLE IF EXISTS `enchant_skill_trees`;
CREATE TABLE `enchant_skill_trees`  (
  `skill_id` int NOT NULL DEFAULT 0,
  `level` int NOT NULL DEFAULT 0,
  `name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `base_lvl` int NOT NULL DEFAULT 0,
  `enchant_type` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NULL DEFAULT NULL,
  `sp` int NOT NULL DEFAULT 0,
  `exp` int NULL DEFAULT NULL,
  `min_skill_lvl` int NOT NULL DEFAULT 0,
  `success_rate76` int UNSIGNED NOT NULL DEFAULT 0,
  `success_rate77` int NOT NULL DEFAULT 0,
  `success_rate78` int NOT NULL DEFAULT 0,
  `success_rate79` int NOT NULL DEFAULT 0,
  `success_rate80` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`skill_id`, `level`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for engraved_items
-- ----------------------------
DROP TABLE IF EXISTS `engraved_items`;
CREATE TABLE `engraved_items`  (
  `object_id` int NOT NULL,
  `item_id` int NOT NULL,
  `engraver_id` int NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for engraved_log
-- ----------------------------
DROP TABLE IF EXISTS `engraved_log`;
CREATE TABLE `engraved_log`  (
  `object_id` int NOT NULL,
  `actiondate` decimal(12, 0) NOT NULL,
  `process` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `itemName` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `form_char` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `to_char` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for etcitem
-- ----------------------------
DROP TABLE IF EXISTS `etcitem`;
CREATE TABLE `etcitem`  (
  `item_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `crystallizable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `item_type` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `weight` decimal(4, 0) NULL DEFAULT NULL,
  `consume_type` varchar(9) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `crystal_type` enum('none','d','c','b','a','s') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'none',
  `duration` decimal(3, 0) NULL DEFAULT NULL,
  `price` decimal(11, 0) NULL DEFAULT NULL,
  `crystal_count` int NULL DEFAULT NULL,
  `sellable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dropable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `destroyable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tradeable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `oldname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `oldtype` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fish
-- ----------------------------
DROP TABLE IF EXISTS `fish`;
CREATE TABLE `fish`  (
  `id` int NOT NULL DEFAULT 0,
  `level` int NOT NULL DEFAULT 0,
  `name` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `hp` int NOT NULL DEFAULT 0,
  `hpregen` int NOT NULL DEFAULT 5,
  `fish_type` int NOT NULL DEFAULT 0,
  `fish_group` int NOT NULL DEFAULT 0,
  `fish_guts` int NOT NULL DEFAULT 0,
  `guts_check_time` int NOT NULL DEFAULT 0,
  `wait_time` int NOT NULL DEFAULT 0,
  `combat_time` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `level`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fishing_skill_trees
-- ----------------------------
DROP TABLE IF EXISTS `fishing_skill_trees`;
CREATE TABLE `fishing_skill_trees`  (
  `skill_id` int NOT NULL DEFAULT 0,
  `level` int NOT NULL DEFAULT 0,
  `name` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `sp` int NOT NULL DEFAULT 0,
  `min_level` int NOT NULL DEFAULT 0,
  `costid` int NOT NULL DEFAULT 0,
  `cost` int NOT NULL DEFAULT 0,
  `isfordwarf` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`skill_id`, `level`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fort
-- ----------------------------
DROP TABLE IF EXISTS `fort`;
CREATE TABLE `fort`  (
  `id` int NOT NULL DEFAULT 0,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `siegeDate` decimal(20, 0) NOT NULL DEFAULT 0,
  `siegeDayOfWeek` int NOT NULL DEFAULT 7,
  `siegeHourOfDay` int NOT NULL DEFAULT 20,
  `owner` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fort_door
-- ----------------------------
DROP TABLE IF EXISTS `fort_door`;
CREATE TABLE `fort_door`  (
  `fortId` int NOT NULL DEFAULT 0,
  `id` int NOT NULL DEFAULT 0,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `x` int NOT NULL DEFAULT 0,
  `y` int NOT NULL DEFAULT 0,
  `z` int NOT NULL DEFAULT 0,
  `range_xmin` int NOT NULL DEFAULT 0,
  `range_ymin` int NOT NULL DEFAULT 0,
  `range_zmin` int NOT NULL DEFAULT 0,
  `range_xmax` int NOT NULL DEFAULT 0,
  `range_ymax` int NOT NULL DEFAULT 0,
  `range_zmax` int NOT NULL DEFAULT 0,
  `hp` int NOT NULL DEFAULT 0,
  `pDef` int NOT NULL DEFAULT 0,
  `mDef` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`fortId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fort_doorupgrade
-- ----------------------------
DROP TABLE IF EXISTS `fort_doorupgrade`;
CREATE TABLE `fort_doorupgrade`  (
  `doorId` int NOT NULL DEFAULT 0,
  `fortId` int NOT NULL,
  `hp` int NOT NULL DEFAULT 0,
  `pDef` int NOT NULL DEFAULT 0,
  `mDef` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`doorId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fort_siege_guards
-- ----------------------------
DROP TABLE IF EXISTS `fort_siege_guards`;
CREATE TABLE `fort_siege_guards`  (
  `fortId` int NOT NULL DEFAULT 0,
  `id` int NOT NULL AUTO_INCREMENT,
  `npcId` int NOT NULL DEFAULT 0,
  `x` int NOT NULL DEFAULT 0,
  `y` int NOT NULL DEFAULT 0,
  `z` int NOT NULL DEFAULT 0,
  `heading` int NOT NULL DEFAULT 0,
  `respawnDelay` int NOT NULL DEFAULT 0,
  `isHired` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`fortId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3408 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fortsiege_clans
-- ----------------------------
DROP TABLE IF EXISTS `fortsiege_clans`;
CREATE TABLE `fortsiege_clans`  (
  `fort_id` int NOT NULL DEFAULT 0,
  `clan_id` int NOT NULL DEFAULT 0,
  `type` int NULL DEFAULT NULL,
  `fort_owner` int NULL DEFAULT NULL,
  PRIMARY KEY (`clan_id`, `fort_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for forums
-- ----------------------------
DROP TABLE IF EXISTS `forums`;
CREATE TABLE `forums`  (
  `forum_id` int NOT NULL DEFAULT 0,
  `forum_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `forum_parent` int NOT NULL DEFAULT 0,
  `forum_post` int NOT NULL DEFAULT 0,
  `forum_type` int NOT NULL DEFAULT 0,
  `forum_perm` int NOT NULL DEFAULT 0,
  `forum_owner_id` int NOT NULL DEFAULT 0,
  UNIQUE INDEX `forum_id`(`forum_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for four_sepulchers_spawnlist
-- ----------------------------
DROP TABLE IF EXISTS `four_sepulchers_spawnlist`;
CREATE TABLE `four_sepulchers_spawnlist`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `count` int NOT NULL DEFAULT 0,
  `npc_templateid` int NOT NULL DEFAULT 0,
  `locx` int NOT NULL DEFAULT 0,
  `locy` int NOT NULL DEFAULT 0,
  `locz` int NOT NULL DEFAULT 0,
  `randomx` int NOT NULL DEFAULT 0,
  `randomy` int NOT NULL DEFAULT 0,
  `heading` int NOT NULL DEFAULT 0,
  `respawn_delay` int NOT NULL DEFAULT 0,
  `key_npc_id` int NOT NULL DEFAULT 0,
  `spawntype` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1613 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for games
-- ----------------------------
DROP TABLE IF EXISTS `games`;
CREATE TABLE `games`  (
  `id` int NOT NULL DEFAULT 0,
  `idnr` int NOT NULL DEFAULT 0,
  `number1` int NOT NULL DEFAULT 0,
  `number2` int NOT NULL DEFAULT 0,
  `prize` int NOT NULL DEFAULT 0,
  `newprize` int NOT NULL DEFAULT 0,
  `prize1` int NOT NULL DEFAULT 0,
  `prize2` int NOT NULL DEFAULT 0,
  `prize3` int NOT NULL DEFAULT 0,
  `enddate` decimal(20, 0) NOT NULL DEFAULT 0,
  `finished` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `idnr`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gameservers
-- ----------------------------
DROP TABLE IF EXISTS `gameservers`;
CREATE TABLE `gameservers`  (
  `server_id` int NOT NULL DEFAULT 0,
  `hexid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `host` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`server_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for global_tasks
-- ----------------------------
DROP TABLE IF EXISTS `global_tasks`;
CREATE TABLE `global_tasks`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `task` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_activation` decimal(20, 0) NOT NULL DEFAULT 0,
  `param1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `param2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `param3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for grandboss_data
-- ----------------------------
DROP TABLE IF EXISTS `grandboss_data`;
CREATE TABLE `grandboss_data`  (
  `boss_id` int NOT NULL DEFAULT 0,
  `loc_x` int NOT NULL DEFAULT 0,
  `loc_y` int NOT NULL DEFAULT 0,
  `loc_z` int NOT NULL DEFAULT 0,
  `heading` int NOT NULL DEFAULT 0,
  `respawn_time` bigint NOT NULL DEFAULT 0,
  `currentHP` decimal(8, 0) NULL DEFAULT NULL,
  `currentMP` decimal(8, 0) NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`boss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for grandboss_list
-- ----------------------------
DROP TABLE IF EXISTS `grandboss_list`;
CREATE TABLE `grandboss_list`  (
  `player_id` decimal(11, 0) NOT NULL,
  `zone` decimal(11, 0) NOT NULL,
  PRIMARY KEY (`player_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for helper_buff_list
-- ----------------------------
DROP TABLE IF EXISTS `helper_buff_list`;
CREATE TABLE `helper_buff_list`  (
  `id` int NOT NULL DEFAULT 0,
  `skill_id` int UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `skill_level` int UNSIGNED NOT NULL DEFAULT 0,
  `lower_level` int UNSIGNED NOT NULL DEFAULT 0,
  `upper_level` int UNSIGNED NOT NULL DEFAULT 0,
  `is_magic_class` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for henna_trees
-- ----------------------------
DROP TABLE IF EXISTS `henna_trees`;
CREATE TABLE `henna_trees`  (
  `class_id` decimal(10, 0) NOT NULL DEFAULT 0,
  `symbol_id` decimal(10, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`class_id`, `symbol_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for heroes
-- ----------------------------
DROP TABLE IF EXISTS `heroes`;
CREATE TABLE `heroes`  (
  `charId` decimal(11, 0) NOT NULL DEFAULT 0,
  `char_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `class_id` decimal(3, 0) NOT NULL DEFAULT 0,
  `count` decimal(3, 0) NOT NULL DEFAULT 0,
  `played` decimal(1, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `owner_id` int NULL DEFAULT NULL,
  `object_id` int NOT NULL DEFAULT 0,
  `item_id` int NULL DEFAULT NULL,
  `count` int NULL DEFAULT NULL,
  `enchant_level` int NULL DEFAULT NULL,
  `loc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `loc_data` int NULL DEFAULT NULL,
  `price_sell` int NULL DEFAULT NULL,
  `price_buy` int NULL DEFAULT NULL,
  `time_of_use` int NULL DEFAULT NULL,
  `custom_type1` int NULL DEFAULT 0,
  `custom_type2` int NULL DEFAULT 0,
  `mana_left` decimal(3, 0) NOT NULL DEFAULT -1,
  PRIMARY KEY (`object_id`) USING BTREE,
  INDEX `key_owner_id`(`owner_id`) USING BTREE,
  INDEX `key_loc`(`loc`) USING BTREE,
  INDEX `key_item_id`(`item_id`) USING BTREE,
  INDEX `key_time_of_use`(`time_of_use`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for itemsonground
-- ----------------------------
DROP TABLE IF EXISTS `itemsonground`;
CREATE TABLE `itemsonground`  (
  `object_id` int NOT NULL DEFAULT 0,
  `item_id` int NULL DEFAULT NULL,
  `count` int NULL DEFAULT NULL,
  `enchant_level` int NULL DEFAULT NULL,
  `x` int NULL DEFAULT NULL,
  `y` int NULL DEFAULT NULL,
  `z` int NULL DEFAULT NULL,
  `drop_time` decimal(20, 0) NULL DEFAULT NULL,
  `equipable` int NULL DEFAULT 0,
  PRIMARY KEY (`object_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for l2votes
-- ----------------------------
DROP TABLE IF EXISTS `l2votes`;
CREATE TABLE `l2votes`  (
  `votedate` datetime NOT NULL,
  `charName` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  INDEX `votedate_idx`(`votedate`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for locations
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations`  (
  `loc_id` int NOT NULL DEFAULT 0,
  `loc_x` int NOT NULL DEFAULT 0,
  `loc_y` int NOT NULL DEFAULT 0,
  `loc_zmin` int NOT NULL DEFAULT 0,
  `loc_zmax` int NOT NULL DEFAULT 0,
  `proc` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`loc_id`, `loc_x`, `loc_y`) USING BTREE,
  INDEX `proc`(`proc`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for lvlupgain
-- ----------------------------
DROP TABLE IF EXISTS `lvlupgain`;
CREATE TABLE `lvlupgain`  (
  `classid` int NOT NULL DEFAULT 0,
  `defaulthpbase` decimal(5, 1) NOT NULL DEFAULT 0.0,
  `defaulthpadd` decimal(4, 2) NOT NULL DEFAULT 0.00,
  `defaulthpmod` decimal(4, 2) NOT NULL DEFAULT 0.00,
  `defaultcpbase` decimal(5, 1) NOT NULL DEFAULT 0.0,
  `defaultcpadd` decimal(4, 2) NOT NULL DEFAULT 0.00,
  `defaultcpmod` decimal(4, 2) NOT NULL DEFAULT 0.00,
  `defaultmpbase` decimal(5, 1) NOT NULL DEFAULT 0.0,
  `defaultmpadd` decimal(4, 2) NOT NULL DEFAULT 0.00,
  `defaultmpmod` decimal(4, 2) NOT NULL DEFAULT 0.00,
  `class_lvl` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`classid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for merchant_areas_list
-- ----------------------------
DROP TABLE IF EXISTS `merchant_areas_list`;
CREATE TABLE `merchant_areas_list`  (
  `merchant_area_id` int UNSIGNED NOT NULL DEFAULT 0,
  `merchant_area_name` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tax` double(3, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `Chaotic` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`merchant_area_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for merchant_buylists
-- ----------------------------
DROP TABLE IF EXISTS `merchant_buylists`;
CREATE TABLE `merchant_buylists`  (
  `item_id` decimal(9, 0) NOT NULL DEFAULT 0,
  `price` decimal(11, 0) NOT NULL DEFAULT 0,
  `shop_id` decimal(9, 0) NOT NULL DEFAULT 0,
  `order` decimal(4, 0) NOT NULL DEFAULT 0,
  `count` int NOT NULL DEFAULT -1,
  `currentCount` int NOT NULL DEFAULT -1,
  `time` int NOT NULL DEFAULT 0,
  `savetimer` decimal(20, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`shop_id`, `order`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for merchant_lease
-- ----------------------------
DROP TABLE IF EXISTS `merchant_lease`;
CREATE TABLE `merchant_lease`  (
  `merchant_id` int NOT NULL DEFAULT 0,
  `player_id` int NOT NULL DEFAULT 0,
  `bid` int NULL DEFAULT NULL,
  `type` int NOT NULL DEFAULT 0,
  `player_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`merchant_id`, `player_id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for merchant_shopids
-- ----------------------------
DROP TABLE IF EXISTS `merchant_shopids`;
CREATE TABLE `merchant_shopids`  (
  `shop_id` decimal(9, 0) NOT NULL DEFAULT 0,
  `npc_id` varchar(9) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for merchants
-- ----------------------------
DROP TABLE IF EXISTS `merchants`;
CREATE TABLE `merchants`  (
  `npc_id` int NOT NULL DEFAULT 0,
  `merchant_area_id` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`npc_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for minions
-- ----------------------------
DROP TABLE IF EXISTS `minions`;
CREATE TABLE `minions`  (
  `boss_id` int NOT NULL DEFAULT 0,
  `minion_id` int NOT NULL DEFAULT 0,
  `amount_min` int NOT NULL DEFAULT 0,
  `amount_max` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`boss_id`, `minion_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for mods_buffer_schemes
-- ----------------------------
DROP TABLE IF EXISTS `mods_buffer_schemes`;
CREATE TABLE `mods_buffer_schemes`  (
  `ownerId` int UNSIGNED NOT NULL DEFAULT 0,
  `id` int UNSIGNED NOT NULL DEFAULT 0,
  `level` int UNSIGNED NOT NULL DEFAULT 0,
  `scheme` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default'
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mods_buffer_skills
-- ----------------------------
DROP TABLE IF EXISTS `mods_buffer_skills`;
CREATE TABLE `mods_buffer_skills`  (
  `id` int UNSIGNED NOT NULL DEFAULT 0,
  `level` int UNSIGNED NOT NULL DEFAULT 0,
  `skill_group` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `adena` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mods_wedding
-- ----------------------------
DROP TABLE IF EXISTS `mods_wedding`;
CREATE TABLE `mods_wedding`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `player1Id` int NOT NULL DEFAULT 0,
  `player2Id` int NOT NULL DEFAULT 0,
  `married` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `affianceDate` decimal(20, 0) NULL DEFAULT 0,
  `weddingDate` decimal(20, 0) NULL DEFAULT 0,
  `coupleType` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for npc
-- ----------------------------
DROP TABLE IF EXISTS `npc`;
CREATE TABLE `npc`  (
  `id` decimal(11, 0) NOT NULL DEFAULT 0,
  `idTemplate` int NOT NULL DEFAULT 0,
  `name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `serverSideName` int NULL DEFAULT 0,
  `title` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `serverSideTitle` int NULL DEFAULT 0,
  `class` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `collision_radius` decimal(5, 2) NULL DEFAULT NULL,
  `collision_height` decimal(5, 2) NULL DEFAULT NULL,
  `level` decimal(2, 0) NULL DEFAULT NULL,
  `sex` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `attackrange` int NULL DEFAULT NULL,
  `hp` decimal(8, 0) NULL DEFAULT NULL,
  `mp` decimal(5, 0) NULL DEFAULT NULL,
  `hpreg` decimal(8, 2) NULL DEFAULT NULL,
  `mpreg` decimal(5, 2) NULL DEFAULT NULL,
  `str` decimal(7, 0) NULL DEFAULT NULL,
  `con` decimal(7, 0) NULL DEFAULT NULL,
  `dex` decimal(7, 0) NULL DEFAULT NULL,
  `int` decimal(7, 0) NULL DEFAULT NULL,
  `wit` decimal(7, 0) NULL DEFAULT NULL,
  `men` decimal(7, 0) NULL DEFAULT NULL,
  `exp` decimal(9, 0) NULL DEFAULT NULL,
  `sp` decimal(8, 0) NULL DEFAULT NULL,
  `patk` decimal(5, 0) NULL DEFAULT NULL,
  `pdef` decimal(5, 0) NULL DEFAULT NULL,
  `matk` decimal(5, 0) NULL DEFAULT NULL,
  `mdef` decimal(5, 0) NULL DEFAULT NULL,
  `atkspd` decimal(3, 0) NULL DEFAULT NULL,
  `aggro` decimal(6, 0) NULL DEFAULT NULL,
  `matkspd` decimal(4, 0) NULL DEFAULT NULL,
  `rhand` decimal(4, 0) NULL DEFAULT NULL,
  `lhand` decimal(4, 0) NULL DEFAULT NULL,
  `armor` decimal(1, 0) NULL DEFAULT NULL,
  `walkspd` decimal(3, 0) NULL DEFAULT NULL,
  `runspd` decimal(3, 0) NULL DEFAULT NULL,
  `faction_id` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `faction_range` decimal(4, 0) NULL DEFAULT NULL,
  `isUndead` int NULL DEFAULT 0,
  `absorb_level` decimal(2, 0) NULL DEFAULT 0,
  `absorb_type` enum('FULL_PARTY','LAST_HIT','PARTY_ONE_RANDOM') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'LAST_HIT',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for npc_to_pc_polymorph
-- ----------------------------
DROP TABLE IF EXISTS `npc_to_pc_polymorph`;
CREATE TABLE `npc_to_pc_polymorph`  (
  `spawn` int NOT NULL DEFAULT 0,
  `template` int NOT NULL DEFAULT 0,
  `name` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NULL DEFAULT NULL,
  `title` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NULL DEFAULT NULL,
  `class_id` int NOT NULL DEFAULT 0,
  `female` int NOT NULL DEFAULT 0,
  `hair_style` int NOT NULL DEFAULT 0,
  `hair_color` int NOT NULL DEFAULT 0,
  `face` int NOT NULL DEFAULT 0,
  `name_color` int NOT NULL DEFAULT 0,
  `title_color` int NOT NULL DEFAULT 0,
  `noble` int NOT NULL DEFAULT 0,
  `hero` int NOT NULL DEFAULT 0,
  `pvp` int NOT NULL DEFAULT 0,
  `karma` int NOT NULL DEFAULT 0,
  `wpn_enchant` int NOT NULL DEFAULT 0,
  `right_hand` int NOT NULL DEFAULT 0,
  `left_hand` int NOT NULL DEFAULT 0,
  `gloves` int NOT NULL DEFAULT 0,
  `chest` int NOT NULL DEFAULT 0,
  `legs` int NOT NULL DEFAULT 0,
  `feet` int NOT NULL DEFAULT 0,
  `hair` int NOT NULL DEFAULT 0,
  `hair2` int NOT NULL DEFAULT 0,
  `pledge` int NOT NULL DEFAULT 0,
  `cw_level` int NOT NULL DEFAULT 0,
  `clan_id` int NOT NULL DEFAULT 0,
  `ally_id` int NOT NULL DEFAULT 0,
  `clan_crest` int NOT NULL DEFAULT 0,
  `ally_crest` int NOT NULL DEFAULT 0,
  `rnd_class` int NOT NULL DEFAULT 0,
  `rnd_appearance` int NOT NULL DEFAULT 0,
  `rnd_weapon` int NOT NULL DEFAULT 0,
  `rnd_armor` int NOT NULL DEFAULT 0,
  `max_rnd_enchant` int NOT NULL DEFAULT 0,
  INDEX `spawn`(`spawn`) USING BTREE,
  INDEX `template`(`template`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for npcskills
-- ----------------------------
DROP TABLE IF EXISTS `npcskills`;
CREATE TABLE `npcskills`  (
  `npcid` int NOT NULL DEFAULT 0,
  `skillid` int NOT NULL DEFAULT 0,
  `level` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`npcid`, `skillid`, `level`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ofertas
-- ----------------------------
DROP TABLE IF EXISTS `ofertas`;
CREATE TABLE `ofertas`  (
  `id_oferta` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `item_id` int NULL DEFAULT NULL,
  `cantidad_adena` int NULL DEFAULT NULL,
  `cantidad_dinero` decimal(10, 2) NULL DEFAULT NULL,
  `fecha_inicio` datetime NULL DEFAULT NULL,
  `fecha_hasta` datetime NULL DEFAULT NULL,
  `estado` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_oferta`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for olympiad_nobles
-- ----------------------------
DROP TABLE IF EXISTS `olympiad_nobles`;
CREATE TABLE `olympiad_nobles`  (
  `charId` decimal(11, 0) NOT NULL DEFAULT 0,
  `class_id` decimal(3, 0) NOT NULL DEFAULT 0,
  `char_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `olympiad_points` decimal(10, 0) NOT NULL DEFAULT 0,
  `competitions_done` decimal(3, 0) NOT NULL DEFAULT 0,
  `competitions_won` decimal(3, 0) NOT NULL DEFAULT 0,
  `competitions_lost` decimal(3, 0) NOT NULL DEFAULT 0,
  `competitions_drawn` decimal(3, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for olympiad_nobles_eom
-- ----------------------------
DROP TABLE IF EXISTS `olympiad_nobles_eom`;
CREATE TABLE `olympiad_nobles_eom`  (
  `charId` decimal(11, 0) NOT NULL DEFAULT 0,
  `class_id` decimal(3, 0) NOT NULL DEFAULT 0,
  `char_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `olympiad_points` decimal(10, 0) NOT NULL DEFAULT 0,
  `competitions_done` decimal(3, 0) NOT NULL DEFAULT 0,
  `competitions_won` decimal(3, 0) NOT NULL DEFAULT 0,
  `competitions_lost` decimal(3, 0) NOT NULL DEFAULT 0,
  `competitions_drawn` decimal(3, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for paystream
-- ----------------------------
DROP TABLE IF EXISTS `paystream`;
CREATE TABLE `paystream`  (
  `msgid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymentdate` datetime NOT NULL,
  `number_from` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `numebr_to` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `char_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL,
  `summ` decimal(12, 2) NOT NULL,
  `currency` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`msgid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pets
-- ----------------------------
DROP TABLE IF EXISTS `pets`;
CREATE TABLE `pets`  (
  `item_obj_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `level` decimal(11, 0) NULL DEFAULT NULL,
  `curHp` decimal(18, 0) NULL DEFAULT NULL,
  `curMp` decimal(18, 0) NULL DEFAULT NULL,
  `exp` decimal(20, 0) NULL DEFAULT NULL,
  `sp` decimal(11, 0) NULL DEFAULT NULL,
  `karma` decimal(11, 0) NULL DEFAULT NULL,
  `pkkills` decimal(11, 0) NULL DEFAULT NULL,
  `fed` decimal(11, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`item_obj_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pets_stats
-- ----------------------------
DROP TABLE IF EXISTS `pets_stats`;
CREATE TABLE `pets_stats`  (
  `type` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `typeID` int NOT NULL DEFAULT 0,
  `level` int NOT NULL DEFAULT 0,
  `expMax` int NOT NULL DEFAULT 0,
  `hpMax` int NOT NULL DEFAULT 0,
  `mpMax` int NOT NULL DEFAULT 0,
  `patk` int NOT NULL DEFAULT 0,
  `pdef` int NOT NULL DEFAULT 0,
  `matk` int NOT NULL DEFAULT 0,
  `mdef` int NOT NULL DEFAULT 0,
  `acc` int NOT NULL DEFAULT 0,
  `evasion` int NOT NULL DEFAULT 0,
  `crit` int NOT NULL DEFAULT 0,
  `speed` int NOT NULL DEFAULT 0,
  `atk_speed` int NOT NULL DEFAULT 0,
  `cast_speed` int NOT NULL DEFAULT 0,
  `feedMax` int NOT NULL DEFAULT 0,
  `feedbattle` int NOT NULL DEFAULT 0,
  `feednormal` int NOT NULL DEFAULT 0,
  `loadMax` int NOT NULL DEFAULT 0,
  `hpregen` int NOT NULL DEFAULT 0,
  `mpregen` int NOT NULL DEFAULT 0,
  `owner_exp_taken` decimal(3, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`typeID`, `level`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pkkills
-- ----------------------------
DROP TABLE IF EXISTS `pkkills`;
CREATE TABLE `pkkills`  (
  `killerId` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `killedId` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kills` decimal(11, 0) NOT NULL,
  PRIMARY KEY (`killerId`, `killedId`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pledge_skill_trees
-- ----------------------------
DROP TABLE IF EXISTS `pledge_skill_trees`;
CREATE TABLE `pledge_skill_trees`  (
  `skill_id` int NULL DEFAULT NULL,
  `level` int NULL DEFAULT NULL,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `clan_lvl` int NULL DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `repCost` int NULL DEFAULT NULL,
  `itemId` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `post_id` int NOT NULL DEFAULT 0,
  `post_owner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_ownerid` int NOT NULL DEFAULT 0,
  `post_date` decimal(20, 0) NOT NULL DEFAULT 0,
  `post_topic_id` int NOT NULL DEFAULT 0,
  `post_forum_id` int NOT NULL DEFAULT 0,
  `post_txt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quest_global_data
-- ----------------------------
DROP TABLE IF EXISTS `quest_global_data`;
CREATE TABLE `quest_global_data`  (
  `quest_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `var` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`quest_name`, `var`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for raidboss_spawnlist
-- ----------------------------
DROP TABLE IF EXISTS `raidboss_spawnlist`;
CREATE TABLE `raidboss_spawnlist`  (
  `boss_id` int NOT NULL DEFAULT 0,
  `amount` int NOT NULL DEFAULT 0,
  `loc_x` int NOT NULL DEFAULT 0,
  `loc_y` int NOT NULL DEFAULT 0,
  `loc_z` int NOT NULL DEFAULT 0,
  `heading` int NOT NULL DEFAULT 0,
  `respawn_min_delay` int NOT NULL DEFAULT 43200,
  `respawn_max_delay` int NOT NULL DEFAULT 129600,
  `respawn_time` bigint NOT NULL DEFAULT 0,
  `currentHp` decimal(8, 0) NULL DEFAULT NULL,
  `currentMp` decimal(8, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`boss_id`, `loc_x`, `loc_y`, `loc_z`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for random_spawn
-- ----------------------------
DROP TABLE IF EXISTS `random_spawn`;
CREATE TABLE `random_spawn`  (
  `groupId` int NOT NULL DEFAULT 0,
  `npcId` int NOT NULL DEFAULT 0,
  `count` int NOT NULL DEFAULT 0,
  `initialDelay` bigint NOT NULL DEFAULT -1,
  `respawnDelay` bigint NOT NULL DEFAULT -1,
  `despawnDelay` bigint NOT NULL DEFAULT -1,
  `broadcastSpawn` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `randomSpawn` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  PRIMARY KEY (`groupId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for random_spawn_loc
-- ----------------------------
DROP TABLE IF EXISTS `random_spawn_loc`;
CREATE TABLE `random_spawn_loc`  (
  `groupId` int NOT NULL DEFAULT 0,
  `x` int NOT NULL DEFAULT 0,
  `y` int NOT NULL DEFAULT 0,
  `z` int NOT NULL DEFAULT 0,
  `heading` int NOT NULL DEFAULT -1,
  PRIMARY KEY (`groupId`, `x`, `y`, `z`, `heading`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rebirth_manager
-- ----------------------------
DROP TABLE IF EXISTS `rebirth_manager`;
CREATE TABLE `rebirth_manager`  (
  `playerId` int NOT NULL,
  `rebirthCount` int NOT NULL,
  PRIMARY KEY (`playerId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_accounts_carritos
-- ----------------------------
DROP TABLE IF EXISTS `rel_accounts_carritos`;
CREATE TABLE `rel_accounts_carritos`  (
  `id_account_carrito` int NOT NULL AUTO_INCREMENT,
  `id_carrito` int NULL DEFAULT NULL,
  `item_id` int NULL DEFAULT NULL,
  `cantidad` int NULL DEFAULT NULL,
  `total_adena` int NULL DEFAULT NULL,
  `total_dinero` decimal(10, 2) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_account_carrito`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for seven_signs
-- ----------------------------
DROP TABLE IF EXISTS `seven_signs`;
CREATE TABLE `seven_signs`  (
  `char_obj_id` int NOT NULL DEFAULT 0,
  `cabal` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `seal` int NOT NULL DEFAULT 0,
  `red_stones` int NOT NULL DEFAULT 0,
  `green_stones` int NOT NULL DEFAULT 0,
  `blue_stones` int NOT NULL DEFAULT 0,
  `ancient_adena_amount` decimal(20, 0) NOT NULL DEFAULT 0,
  `contribution_score` decimal(20, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for seven_signs_festival
-- ----------------------------
DROP TABLE IF EXISTS `seven_signs_festival`;
CREATE TABLE `seven_signs_festival`  (
  `festivalId` int NOT NULL DEFAULT 0,
  `cabal` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cycle` int NOT NULL DEFAULT 0,
  `date` bigint NULL DEFAULT 0,
  `score` int NOT NULL DEFAULT 0,
  `members` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`festivalId`, `cabal`, `cycle`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for seven_signs_status
-- ----------------------------
DROP TABLE IF EXISTS `seven_signs_status`;
CREATE TABLE `seven_signs_status`  (
  `id` int NOT NULL DEFAULT 0,
  `current_cycle` int NOT NULL DEFAULT 1,
  `festival_cycle` int NOT NULL DEFAULT 1,
  `active_period` int NOT NULL DEFAULT 1,
  `date` int NOT NULL DEFAULT 1,
  `previous_winner` int NOT NULL DEFAULT 0,
  `dawn_stone_score` decimal(20, 0) NOT NULL DEFAULT 0,
  `dawn_festival_score` int NOT NULL DEFAULT 0,
  `dusk_stone_score` decimal(20, 0) NOT NULL DEFAULT 0,
  `dusk_festival_score` int NOT NULL DEFAULT 0,
  `avarice_owner` int NOT NULL DEFAULT 0,
  `gnosis_owner` int NOT NULL DEFAULT 0,
  `strife_owner` int NOT NULL DEFAULT 0,
  `avarice_dawn_score` int NOT NULL DEFAULT 0,
  `gnosis_dawn_score` int NOT NULL DEFAULT 0,
  `strife_dawn_score` int NOT NULL DEFAULT 0,
  `avarice_dusk_score` int NOT NULL DEFAULT 0,
  `gnosis_dusk_score` int NOT NULL DEFAULT 0,
  `strife_dusk_score` int NOT NULL DEFAULT 0,
  `accumulated_bonus0` int NOT NULL DEFAULT 0,
  `accumulated_bonus1` int NOT NULL DEFAULT 0,
  `accumulated_bonus2` int NOT NULL DEFAULT 0,
  `accumulated_bonus3` int NOT NULL DEFAULT 0,
  `accumulated_bonus4` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for siege_clans
-- ----------------------------
DROP TABLE IF EXISTS `siege_clans`;
CREATE TABLE `siege_clans`  (
  `castle_id` int NOT NULL DEFAULT 0,
  `clan_id` int NOT NULL DEFAULT 0,
  `type` int NULL DEFAULT NULL,
  `castle_owner` int NULL DEFAULT NULL,
  PRIMARY KEY (`clan_id`, `castle_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for skill_learn
-- ----------------------------
DROP TABLE IF EXISTS `skill_learn`;
CREATE TABLE `skill_learn`  (
  `npc_id` int NOT NULL DEFAULT 0,
  `class_id` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`npc_id`, `class_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for skill_spellbooks
-- ----------------------------
DROP TABLE IF EXISTS `skill_spellbooks`;
CREATE TABLE `skill_spellbooks`  (
  `skill_id` int NOT NULL DEFAULT -1,
  `item_id` int NOT NULL DEFAULT -1,
  INDEX `skill_id`(`skill_id`, `item_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for skill_trees
-- ----------------------------
DROP TABLE IF EXISTS `skill_trees`;
CREATE TABLE `skill_trees`  (
  `class_id` int UNSIGNED NOT NULL DEFAULT 0,
  `skill_id` int UNSIGNED NOT NULL DEFAULT 0,
  `level` int UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `sp` int UNSIGNED NOT NULL DEFAULT 0,
  `min_level` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`class_id`, `skill_id`, `level`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smsonline
-- ----------------------------
DROP TABLE IF EXISTS `smsonline`;
CREATE TABLE `smsonline`  (
  `smstimestamp` decimal(12, 2) NOT NULL,
  `user_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `char_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`smstimestamp`, `user_phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spawnlist
-- ----------------------------
DROP TABLE IF EXISTS `spawnlist`;
CREATE TABLE `spawnlist`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `count` int NOT NULL DEFAULT 0,
  `npc_templateid` int NOT NULL DEFAULT 0,
  `locx` int NOT NULL DEFAULT 0,
  `locy` int NOT NULL DEFAULT 0,
  `locz` int NOT NULL DEFAULT 0,
  `randomx` int NOT NULL DEFAULT 0,
  `randomy` int NOT NULL DEFAULT 0,
  `heading` int NOT NULL DEFAULT 0,
  `respawn_delay` int NOT NULL DEFAULT 0,
  `loc_id` int NOT NULL DEFAULT 0,
  `periodOfDay` decimal(2, 0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_npc_templateid`(`npc_templateid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 191255 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teleport
-- ----------------------------
DROP TABLE IF EXISTS `teleport`;
CREATE TABLE `teleport`  (
  `Description` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id` decimal(11, 0) NOT NULL DEFAULT 0,
  `loc_x` decimal(9, 0) NULL DEFAULT NULL,
  `loc_y` decimal(9, 0) NULL DEFAULT NULL,
  `loc_z` decimal(9, 0) NULL DEFAULT NULL,
  `price` decimal(6, 0) NULL DEFAULT NULL,
  `fornoble` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporaryObjectTable
-- ----------------------------
DROP TABLE IF EXISTS `temporaryObjectTable`;
CREATE TABLE `temporaryObjectTable`  (
  `object_id` int NOT NULL,
  PRIMARY KEY (`object_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`  (
  `topic_id` int NOT NULL DEFAULT 0,
  `topic_forum_id` int NOT NULL DEFAULT 0,
  `topic_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topic_date` decimal(20, 0) NOT NULL DEFAULT 0,
  `topic_ownername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `topic_ownerid` int NOT NULL DEFAULT 0,
  `topic_type` int NOT NULL DEFAULT 0,
  `topic_reply` int NOT NULL DEFAULT 0
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tvt
-- ----------------------------
DROP TABLE IF EXISTS `tvt`;
CREATE TABLE `tvt`  (
  `eventName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `eventDesc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `joiningLocation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `minlvl` int NOT NULL DEFAULT 0,
  `maxlvl` int NOT NULL DEFAULT 0,
  `npcId` int NOT NULL DEFAULT 0,
  `npcX` int NOT NULL DEFAULT 0,
  `npcY` int NOT NULL DEFAULT 0,
  `npcZ` int NOT NULL DEFAULT 0,
  `npcHeading` int NOT NULL DEFAULT 0,
  `rewardId` int NOT NULL DEFAULT 0,
  `rewardAmount` int NOT NULL DEFAULT 0,
  `teamsCount` int NOT NULL DEFAULT 0,
  `joinTime` int NOT NULL DEFAULT 0,
  `eventTime` int NOT NULL DEFAULT 0,
  `minPlayers` int NOT NULL DEFAULT 0,
  `maxPlayers` int NOT NULL DEFAULT 0,
  `delayForNextEvent` bigint NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tvt_teams
-- ----------------------------
DROP TABLE IF EXISTS `tvt_teams`;
CREATE TABLE `tvt_teams`  (
  `teamId` int NOT NULL DEFAULT 0,
  `teamName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `teamX` int NOT NULL DEFAULT 0,
  `teamY` int NOT NULL DEFAULT 0,
  `teamZ` int NOT NULL DEFAULT 0,
  `teamColor` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`teamId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vanhalter_spawnlist
-- ----------------------------
DROP TABLE IF EXISTS `vanhalter_spawnlist`;
CREATE TABLE `vanhalter_spawnlist`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NOT NULL DEFAULT '',
  `count` int NOT NULL DEFAULT 0,
  `npc_templateid` int NOT NULL DEFAULT 0,
  `locx` int NOT NULL DEFAULT 0,
  `locy` int NOT NULL DEFAULT 0,
  `locz` int NOT NULL DEFAULT 0,
  `randomx` int NOT NULL DEFAULT 0,
  `randomy` int NOT NULL DEFAULT 0,
  `heading` int NOT NULL DEFAULT 0,
  `respawn_delay` int NOT NULL DEFAULT 0,
  `loc_id` int NOT NULL DEFAULT 0,
  `periodOfDay` decimal(2, 0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_npc_templateid`(`npc_templateid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for weapon
-- ----------------------------
DROP TABLE IF EXISTS `weapon`;
CREATE TABLE `weapon`  (
  `item_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `name` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bodypart` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `crystallizable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `weight` decimal(4, 0) NULL DEFAULT NULL,
  `soulshots` decimal(2, 0) NULL DEFAULT NULL,
  `spiritshots` decimal(1, 0) NULL DEFAULT NULL,
  `crystal_type` enum('none','d','c','b','a','s') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'none',
  `p_dam` decimal(5, 0) NULL DEFAULT NULL,
  `rnd_dam` decimal(2, 0) NULL DEFAULT NULL,
  `weaponType` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `critical` decimal(2, 0) NULL DEFAULT NULL,
  `hit_modify` decimal(6, 5) NULL DEFAULT NULL,
  `avoid_modify` decimal(2, 0) NULL DEFAULT NULL,
  `shield_def` decimal(3, 0) NULL DEFAULT NULL,
  `shield_def_rate` decimal(2, 0) NULL DEFAULT NULL,
  `atk_speed` decimal(3, 0) NULL DEFAULT NULL,
  `mp_consume` decimal(2, 0) NULL DEFAULT NULL,
  `m_dam` decimal(3, 0) NULL DEFAULT NULL,
  `duration` decimal(3, 0) NULL DEFAULT NULL,
  `price` decimal(11, 0) NULL DEFAULT NULL,
  `crystal_count` int NULL DEFAULT NULL,
  `sellable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dropable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `destroyable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tradeable` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `item_skill_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `item_skill_lvl` decimal(11, 0) NOT NULL DEFAULT 0,
  `enchant4_skill_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `enchant4_skill_lvl` decimal(11, 0) NOT NULL DEFAULT 0,
  `onCast_skill_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `onCast_skill_lvl` decimal(11, 0) NOT NULL DEFAULT 0,
  `onCast_skill_chance` decimal(11, 0) NOT NULL DEFAULT 0,
  `onCrit_skill_id` decimal(11, 0) NOT NULL DEFAULT 0,
  `onCrit_skill_lvl` decimal(11, 0) NOT NULL DEFAULT 0,
  `onCrit_skill_chance` decimal(11, 0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zone_vertices
-- ----------------------------
DROP TABLE IF EXISTS `zone_vertices`;
CREATE TABLE `zone_vertices`  (
  `id` int NOT NULL,
  `order` int NOT NULL,
  `x` int NOT NULL,
  `y` int NOT NULL,
  PRIMARY KEY (`id`, `order`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
