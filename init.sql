SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;
SET collation_connection = 'utf8mb4_unicode_ci';
DROP TABLE IF EXISTS `food`;

CREATE TABLE `food` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` VARCHAR(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageUrl` VARCHAR(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `food` (`id`, `name`, `detail`, `imageUrl`) VALUES
(1, 'ผัดไทย', 'เส้นผัดรสกลมกล่อม เปรี้ยวหวานเค็ม เผ็ดนิด ๆ กินกับถั่วงอกและมะนาว', 'https://media.discordapp.net/attachments/1008415932651155578/1274680647918555171/download.jpg?ex=693dec9c&is=693c9b1c&hm=7bd368b8afa37dd61e54caa1bfb113275597c478846c1b68ed2f77a835a1a8eb&=&format=webp&width=450&height=450'),
(2, 'ส้มตำ', 'ยำมะละกอรสจัด เปรี้ยวหวานเค็ม เผ็ดสดชื่น กินคู่กับผักและข้าวเหนียว', 'https://media.discordapp.net/attachments/1008415932651155578/1274680945970253885/download-1.jpg?ex=693dece3&is=693c9b63&hm=469b99a4e451445a56e96626c0422bda107669a4ad9bbb5affea4050925d5536&=&format=webp&width=450&height=450'),
(3, 'ต้มยำกุ้ง', 'ซุปเผ็ดเปรี้ยวหอมสมุนไพรไทย กุ้งเด้ง น้ำซุปเข้มข้น', 'https://media.discordapp.net/attachments/1008415932651155578/1274681192272101398/images.jpg?ex=693ded1e&is=693c9b9e&hm=3affa9d89487946598809ef2f215621bc41eec387f4e695ab61209e842d18832&=&format=webp&width=450&height=450'),
(4, 'แกงเขียวหวาน', 'แกงกะทิหอมพริกแกงเขียวหวาน รสเข้มข้น กินกับข้าวสวยหรือขนมจีน', 'https://media.discordapp.net/attachments/1008415932651155578/1274681271670276137/images-1.jpg?ex=693ded31&is=693c9bb1&hm=0d4da31dd21e778a672dc55f138391315cf4dea02395f21f434c2393ca33e400&=&format=webp&width=450&height=450'),
(5, 'ข้าวมันไก่', 'ข้าวหอมมัน เสิร์ฟกับไก่นุ่มและน้ำจิ้มเต้าเจี้ยวรสเด็ด', 'https://media.discordapp.net/attachments/1008415932651155578/1274681549337526365/download-2.jpg?ex=693ded73&is=693c9bf3&hm=ffad92a99c8ff5bdfe20675666e4429d818d294e03f0581c47ca579b003d27ee&=&format=webp&width=450&height=450'),
(6, 'ขนมจีน', 'เส้นขนมจีนเสิร์ฟกับน้ำยาหรือแกง รสเข้มข้น กินกับผักสดหลากหลาย', 'https://media.discordapp.net/attachments/1008415932651155578/1274682395651608688/images-2.jpg?ex=693dee3d&is=693c9cbd&hm=051bb2eec10993a3a7d2e049c334a4df0791632704f45d5d4e05147fdf53fc7f&=&format=webp&width=450&height=450'),
(7, 'เปาะเปี๊ยะทอด', 'ของทอดกรอบ ไส้ผักหรือวุ้นเส้น กินคู่กับน้ำจิ้มหวาน', 'https://media.discordapp.net/attachments/1008415932651155578/1274682515436601445/download-3.jpg?ex=693dee5a&is=693c9cda&hm=d38b3588de284afcf6d4fde305322f6c009e70f0b98102c971134ad3bd5986a2&=&format=webp&width=450&height=450'),
(8, 'ข้าวผัดไข่', 'ข้าวผัดหอม ๆ ไข่เน้น ๆ ทำง่าย กินได้ทุกมื้อ', 'https://media.discordapp.net/attachments/1008415932651155578/1274711448223744032/download-6.jpg?ex=693e094c&is=693cb7cc&hm=a95dafe6c96d56b6a6b8bbba7d66c78b9d671d2a2f648395ed35632be3e2e2ce&=&format=webp&width=450&height=450'),
(9, 'แกงมัสมั่น', 'แกงกะทิหอมเครื่องเทศ รสนุ่มลึก ออกหวานเค็ม กินกับข้าวสวย', 'https://media.discordapp.net/attachments/1008415932651155578/1274682384930836501/download-4.jpg?ex=693dee3b&is=693c9cbb&hm=8e12728758ce68daddcb67bdb5a7781d690ba7bf3e516cd564d70581bbdda827&=&format=webp&width=450&height=450'),
(10, 'น้ำพริกปลาทู', 'น้ำพริกรสจัด กินคู่กับผักสดและปลาทูทอด', 'https://media.discordapp.net/attachments/1008415932651155578/1449321166178353182/7fe5aef2f92246c5bcfbbce6ab78e201.png?ex=693e7905&is=693d2785&hm=08125a14cbe5745953bf98dfdd1913d9171d84bf130674ced0a509a6048326eb&=&format=webp&quality=lossless&width=1678&height=1258'),
(11, 'ข้าวหมกไก่', 'ข้าวหุงกับเครื่องเทศ เสิร์ฟพร้อมไก่นุ่ม', 'https://media.discordapp.net/attachments/1008415932651155578/1449321380964204574/images.png?ex=693e7938&is=693d27b8&hm=afeb2d5c1fb3db1615c22003403d9b26ed27ebd077b0112eacff1c0517255610&=&format=webp&quality=lossless&width=450&height=450'),
(12, 'ข้าวต้มหมู', 'ข้าวต้มร้อน ๆ ซุปใส หมูนุ่ม กินสบายท้อง', 'https://media.discordapp.net/attachments/1008415932651155578/1449321466091798618/4e0063e0a0354fb5b15caa9993e085c2.png?ex=693e794c&is=693d27cc&hm=52218a8cbd93caafcf4e665dd89690c0c610656b384fe4af4f48d67e20703a50&=&format=webp&quality=lossless&width=1334&height=1334');

ALTER TABLE `food` AUTO_INCREMENT = 13;