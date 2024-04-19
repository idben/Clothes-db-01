-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2024 年 04 月 19 日 09:49
-- 伺服器版本： 10.4.28-MariaDB
-- PHP 版本： 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `Clothes`
--

-- --------------------------------------------------------

--
-- 資料表結構 `Brands`
--

CREATE TABLE `Brands` (
  `BrandID` int(11) NOT NULL,
  `BrandName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `Brands`
--

INSERT INTO `Brands` (`BrandID`, `BrandName`) VALUES
(1, '品牌A'),
(2, '品牌B');

-- --------------------------------------------------------

--
-- 資料表結構 `Clothes`
--

CREATE TABLE `Clothes` (
  `ClothID` int(11) NOT NULL,
  `BrandID` int(11) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `Clothes`
--

INSERT INTO `Clothes` (`ClothID`, `BrandID`, `Description`, `Price`) VALUES
(1, 1, '時尚T恤', 299.00),
(2, 2, '休閒襯衫', 399.00);

-- --------------------------------------------------------

--
-- 資料表結構 `ClothesColors`
--

CREATE TABLE `ClothesColors` (
  `ClothID` int(11) NOT NULL,
  `ColorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `ClothesColors`
--

INSERT INTO `ClothesColors` (`ClothID`, `ColorID`) VALUES
(1, 1),
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `ClothesSizes`
--

CREATE TABLE `ClothesSizes` (
  `ClothID` int(11) NOT NULL,
  `SizeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `ClothesSizes`
--

INSERT INTO `ClothesSizes` (`ClothID`, `SizeID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 3);

-- --------------------------------------------------------

--
-- 資料表結構 `Colors`
--

CREATE TABLE `Colors` (
  `ColorID` int(11) NOT NULL,
  `ColorName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `Colors`
--

INSERT INTO `Colors` (`ColorID`, `ColorName`) VALUES
(1, '黑色'),
(2, '白色'),
(3, '紅色'),
(4, '藍色');

-- --------------------------------------------------------

--
-- 資料表結構 `Sizes`
--

CREATE TABLE `Sizes` (
  `SizeID` int(11) NOT NULL,
  `SizeName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `Sizes`
--

INSERT INTO `Sizes` (`SizeID`, `SizeName`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L');

-- --------------------------------------------------------

--
-- 資料表結構 `Stock`
--

CREATE TABLE `Stock` (
  `StockID` int(11) NOT NULL,
  `ClothID` int(11) DEFAULT NULL,
  `ColorID` int(11) DEFAULT NULL,
  `SizeID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `Stock`
--

INSERT INTO `Stock` (`StockID`, `ClothID`, `ColorID`, `SizeID`, `Quantity`) VALUES
(1, 1, 1, 1, 10),
(2, 1, 1, 2, 20),
(3, 1, 1, 3, 15),
(4, 1, 2, 1, 1),
(5, 1, 2, 3, 2),
(6, 1, 3, 2, 5),
(7, 1, 4, 2, 2);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `Brands`
--
ALTER TABLE `Brands`
  ADD PRIMARY KEY (`BrandID`);

--
-- 資料表索引 `Clothes`
--
ALTER TABLE `Clothes`
  ADD PRIMARY KEY (`ClothID`),
  ADD KEY `BrandID` (`BrandID`);

--
-- 資料表索引 `ClothesColors`
--
ALTER TABLE `ClothesColors`
  ADD PRIMARY KEY (`ClothID`,`ColorID`),
  ADD KEY `ColorID` (`ColorID`);

--
-- 資料表索引 `ClothesSizes`
--
ALTER TABLE `ClothesSizes`
  ADD PRIMARY KEY (`ClothID`,`SizeID`),
  ADD KEY `SizeID` (`SizeID`);

--
-- 資料表索引 `Colors`
--
ALTER TABLE `Colors`
  ADD PRIMARY KEY (`ColorID`);

--
-- 資料表索引 `Sizes`
--
ALTER TABLE `Sizes`
  ADD PRIMARY KEY (`SizeID`);

--
-- 資料表索引 `Stock`
--
ALTER TABLE `Stock`
  ADD PRIMARY KEY (`StockID`),
  ADD UNIQUE KEY `UniqueStock` (`ClothID`,`ColorID`,`SizeID`),
  ADD KEY `ColorID` (`ColorID`),
  ADD KEY `SizeID` (`SizeID`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Brands`
--
ALTER TABLE `Brands`
  MODIFY `BrandID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Clothes`
--
ALTER TABLE `Clothes`
  MODIFY `ClothID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Colors`
--
ALTER TABLE `Colors`
  MODIFY `ColorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Sizes`
--
ALTER TABLE `Sizes`
  MODIFY `SizeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Stock`
--
ALTER TABLE `Stock`
  MODIFY `StockID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `Clothes`
--
ALTER TABLE `Clothes`
  ADD CONSTRAINT `clothes_ibfk_1` FOREIGN KEY (`BrandID`) REFERENCES `Brands` (`BrandID`);

--
-- 資料表的限制式 `ClothesColors`
--
ALTER TABLE `ClothesColors`
  ADD CONSTRAINT `clothescolors_ibfk_1` FOREIGN KEY (`ClothID`) REFERENCES `Clothes` (`ClothID`),
  ADD CONSTRAINT `clothescolors_ibfk_2` FOREIGN KEY (`ColorID`) REFERENCES `Colors` (`ColorID`);

--
-- 資料表的限制式 `ClothesSizes`
--
ALTER TABLE `ClothesSizes`
  ADD CONSTRAINT `clothessizes_ibfk_1` FOREIGN KEY (`ClothID`) REFERENCES `Clothes` (`ClothID`),
  ADD CONSTRAINT `clothessizes_ibfk_2` FOREIGN KEY (`SizeID`) REFERENCES `Sizes` (`SizeID`);

--
-- 資料表的限制式 `Stock`
--
ALTER TABLE `Stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`ClothID`) REFERENCES `Clothes` (`ClothID`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`ColorID`) REFERENCES `Colors` (`ColorID`),
  ADD CONSTRAINT `stock_ibfk_3` FOREIGN KEY (`SizeID`) REFERENCES `Sizes` (`SizeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
