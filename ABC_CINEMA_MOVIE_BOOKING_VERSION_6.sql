USE [master]
GO
/****** Object:  Database [ABC_CINEMA_MOVIE_BOOKING]    Script Date: 4/24/2024 8:53:17 PM ******/
CREATE DATABASE [ABC_CINEMA_MOVIE_BOOKING]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ABC_CINEMA_MOVIE_BOOKING', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ABC_CINEMA_MOVIE_BOOKING.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ABC_CINEMA_MOVIE_BOOKING_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ABC_CINEMA_MOVIE_BOOKING_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ABC_CINEMA_MOVIE_BOOKING].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET ARITHABORT OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET  MULTI_USER 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET QUERY_STORE = ON
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ABC_CINEMA_MOVIE_BOOKING]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	id [varchar](255) NOT NULL,
	name [nvarchar](255) NULL,
	password [varchar](255) NULL,
	email [varchar](255) NULL,
	phone [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
create proc [dbo].[proc_login] @username varchar(50), @password varchar(50)
as
begin
	select * from Account where id = @username and password =@password
end
GO
INSERT INTO [Account](id, name, password, email, phone)
VALUES 
('1', N'Thành', '1', '1@gmail.com','123'),
('2', N'Phúc', '2', '2@gmail.com','223'),
('3', N'Hậu', '3', '3@gmail.com','323');
/****** Object:  Table [dbo].[Address]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[streetAddress] [varchar](255) NULL,
	[cityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[bookingNumber] [varchar](255) NOT NULL,
	[createdOn] [date] NULL,
	[numberOfSeats] [int] NULL,
	[accountId] [varchar](255) NULL,
	[showId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bookingNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinema]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[totalCinemaHalls] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CinemaHall]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CinemaHall](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cinemaId] [int] NULL,
	[name] [varchar](255) NULL,
	[totalSeats] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[state] [varchar](255) NULL,
	[zipCode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[couponCode] [varchar](255) NOT NULL,
	[discountAmount] [float] NULL,
	[expiryDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[couponCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FrontDeskOfficer]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FrontDeskOfficer](
	[id] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[durationInMins] [int] NULL,
	[language] [nvarchar](250) NULL,
	[releaseDate] [date] NULL,
	[country] [nvarchar](100) NULL,
	[genre] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT INTO [Movie] ([title], [description], [durationInMins], [language], [releaseDate], [country], [genre])
VALUES (N'Bố Già', N'Lấy bối cảnh tại Thành phố Hồ Chí Minh, nội dung phim xoay quanh mỗi quan hệ giữa ông Sang – một người luôn lo chuyện bao đồng và giúp đỡ người khác – và con trai ông là Quắn
– một cậu thanh niên kiếm tiền bằng Youtube rất yêu thương ba và em gái – cùng những rắc rối mà cả hai gặp phải với những người thân trong gia đình mình.', 128, N'Việt Nam', '2021-03-12', N'Việt Nam', N'Hài-Chính kịch'
),
(N'Godzilla x Kong: Đế Chế Mới', N'Bộ phim sẽ tiếp nối sau những cuộc đối đầu bùng nổ của "Godzilla đại chiến Kong",
một cuộc phiêu lưu hoàn toàn mới, đưa Kong và Godzilla cùng nhau chống lại một mối đe dọa khổng lồ chưa được khám phá,
ẩn sâu trong Trái Đất. Bộ phim sẽ đào sâu hơn vào phần lịch sử của những Titan, nguồn gốc cũng như những bí ẩn tại Đảo Đầu Lâu,
đồng thời khám phá trận chiến thần thoại đã tạo nên những sinh vật phi thường và sự gắn kết của chúng với loài người.', 115, N'Tiếng Anh - Phụ đề Tiếng Việt, Tiếng Hàn', '2024-03-29', N'Mỹ', N'Giả tưởng, hành động, phiêu lưu'
),
(N'HÀO QUANG ĐẪM MÁU', N'Câu chuyện kể về Lee Soo-yeon (do Ji-yeon thủ vai) -
một nữ minh tinh màn bạc đang ở đỉnh cao sự nghiệp nhưng bất chợt tuột dốc không phanh vì tai nạn chết người do chính cô gây ra trong lúc say rượu.
Sau thời gian dài “ở ẩn” để trả giá cho sai lầm, Lee Soo-yeon bắt đầu nuôi mộng trở lại với khán giả nhưng bê bối từ quá khứ của cô luôn bị người đời đay nghiến, châm chọc.', 98, N'Tiếng Hàn - Phụ đề tiếng Việt', '2024-04-12', N'Hàn Quốc', N'Hồi hộp'
),
(N'ĐIỀM BÁO CỦA QUỶ', N'Khi một cô gái người Mỹ được đưa đến Rome để bắt đầu phụng sự Giáo Hội, 
cô đã phát hiện ra thế lực hắc ám khiến cô hoài nghi về đức tin của chính mình,
đồng thời hé lộ một âm mưu kinh hoàng nhằm tái sinh linh hồn ác quỷ đầu thai đến nhân thế.', 119, N'Tiếng Anh - Phụ đề Tiếng Việt', '2024-04-05', N'Mỹ', N'Kinh Dị'
),
(N'QUỶ CÁI', N'Được sự chỉ định của giáo sư, 5 sinh viên đại học năm cuối được mời đến dinh thự cổ thuộc sở hữu của dòng tộc danh giá ML.Salukjit. Trước khi quyết định ra đi hay ở lại, 
Ml.Salukjit đã khiến họ khiếp sợ trước sức mạnh ma quỷ của mình.', 90, N'Tiếng Anh - Phụ đề Tiếng Việt', '2024-04-05', N'Mỹ', N'Kinh Dị'
),
(N'DUNE: HÀNH TINH CÁT - PHẦN HAI', N'“Dune: Hành Tinh Cát – Phần 2” sẽ tiếp tục khám phá hành trình đậm chất thần thoại của Paul Atreides 
khi anh đồng hành cùng Chani và những người Fremen trên chặng đường trả thù những kẻ đã hủy hoại gia đình mình. 
Đối mặt với những lựa chọn giữa tình yêu của cuộc đời mình và số phận của vũ trụ, Paul phải ngăn chặn viễn cảnh tương lai tồi tệ chỉ mình anh nhìn thấy.', 166, N'Tiếng Anh - Phụ đề Tiếng Việt', '2024-03-01', N'Mỹ', N'Hành Động, Phiêu Lưu, Tâm Lý'
),
(N'MAI', N'"Mai" xoay quanh cuộc đời của một người phụ nữ đẹp tên Mai (do Phương Anh Đào thủ vai) có số phận rất đặc biệt. Bởi làm nghề mát xa, 
Mai thường phải đối mặt với ánh nhìn soi mói, phán xét từ những người xung quanh. Và rồi Mai gặp Dương (Tuấn Trần) - chàng trai đào hoa lãng tử. Những tưởng bản thân không còn thiết tha yêu đương và mưu cầu hạnh phúc cho riêng mình thì khao khát được sống một cuộc đời mới trong Mai trỗi dậy khi Dương tấn công cô không khoan nhượng.
Họ cho mình những khoảnh khắc tự do, say đắm và tràn đầy tiếng cười. Liệu cặp đôi ấy có nắm giữ được niềm hạnh phúc đó dài lâu khi miệng đời lắm khi cay nghiệt, bất công? 
"Mai" - một câu chuyện tâm lý, tình cảm pha lẫn nhiều tràng cười vui nhộn với sự đầu tư mạnh tay nhất trong ba phim của Trấn Thành hứa hẹn sẽ đem đến cho khán giả những phút giây thật sự ý nghĩa trong mùa Tết năm nay.', 131, N'Việt Nam', '2024-02-10', N'Việt Nam', N'Lãng Mạn'
),
(N'THANH XUÂN 18x2: LỮ TRÌNH HƯỚNG VỀ EM', N'Ký ức tình đầu ùa về khi Jimmy nhận được tấm bưu thiếp từ Ami. Cậu quyết định một mình bước lên chuyến tàu đến Nhật Bản gặp lại người con gái cậu đã bỏ lỡ 18 năm trước. 
Mối tình day dứt thời thanh xuân, liệu sẽ có một kết cục nào tốt đẹp khi đoàn tụ?', 123, N'Tiếng Nhật và Tiếng Trung Quốc với phụ đề Tiếng Việt và Tiếng Anh', '2024-04-12', N'Nhật Bản', N'Tình Cảm'
),
(N'KUNG FU PANDA 4', N'Sau khi Po được chọn trở thành Thủ lĩnh tinh thần của Thung lũng Bình Yên, Po cần tìm và huấn luyện một Chiến binh Rồng mới, 
trong khi đó một mụ phù thủy độc ác lên kế hoạch triệu hồi lại tất cả những kẻ phản diện mà Po đã đánh bại về cõi linh hồn.', 94, N'Tiếng Anh - Phụ đề Tiếng Việt; Lồng tiếng', '2024-03-08', N'Mỹ', N'Hài, Hoạt Hình'
),
(N'BIỆT ĐỘI SĂN MA: KỶ NGUYÊN BĂNG GIÁ', N'Sau các sự kiện của Ghostbusters: Afterlife, gia đình Spengler đang tìm kiếm cuộc sống mới ở Thành phố New York. 
Nhóm săn ma bao gồm Ray, Winston và Podcast sử dụng công nghệ mới để chống lại các mối đe dọa chết người cổ xưa đang ẩn náu trong các vật dụng hàng ngày.
Thế nhưng, họ sẽ phải đối đầu với một thế lực đen tối hùng mạnh mới.', 115, N'Tiếng Anh - Phụ đề Tiếng Việt', '2024-04-12', N'Mỹ', N'Hài, Phiêu Lưu, Thần thoại'
),
(N'ANH HÙNG BÀN PHÍM', N'Im Sang-jin - một phóng viên mảng xã hội đã bị đình chỉ công tác sau bài phóng sự điều tra sai lệch về những lùm xùm của tập đoàn Manjun. Tưởng rằng phải chịu nỗi oan ức suốt đời, Im Sang-jin bất ngờ nhận được thông tin ẩn danh khẳng định anh không sai,
mà mọi thứ đã bị thao túng bởi một “đội quân” trực tuyến: Chỉ cần có tiền, sự thật nào cũng hoá thành dối lừa, còn tin tức giả lại hoá thành sự thật. Quyết tâm dấn thân vào con đường điều tra “Team Aleph”, Im Sang-jin dần khám phá ra những bí mật động trời khi tiếp xúc với các thành viên chủ chốt của nhóm chuyên gieo rắc tin giả.
Thế lực đứng sau các thông tin sai lệch có sức mạnh khủng khiếp đến nhường nào? Liệu Im Sang-jin có thể lật tẩy tất cả và giành chiến thắng giữa ranh giới mong manh của sự thật và dối trá?', 106, N'Tiếng Hàn - Phụ đề tiếng Việt', '2024-04-19', N'Hàn Quốc', N'Tội phạm'
),
(N'TU VIỆN MÁU', N'Với đức tin sâu sắc, Cecilia đến với một tu viện cổ kính, nằm giữa một vùng quê đẹp nên thơ tại nước Ý trong sự chào đón của mọi người. Thế nhưng, những sự kiện kỳ lạ liên tiếp xảy ra, một bước ngoặt đưa Cecilia đến một vị trí cô không thể ngờ tới.
Cùng với đó, những bí mật kinh hoàng đằng sau vẻ bình yên của tu viện này dần lộ diện.', 85, N'Tiếng Anh - Phụ đề Tiếng Việt', '2024-04-19', N'Mỹ', N'Kinh Dị'
),
(N'ĐÓA HOA MONG MANH', N'Sau một đêm hát thay cho người chị họ Ellie, Thạch Thảo lọt vào mắt xanh của Sơn - một nhà sản xuất âm nhạc. Cô nhận được lời mời thu âm hấp dẫn từ vợ chồng Sơn và trở nên nổi tiếng.
Nàng càng lúc càng tỏa sáng như một đóa hoa, khiến đàn ông nào cũng muốn chở che, trong đó có cả Sơn. Vợ Sơn là một phụ nữ quyền lực, cô phát hiện ra chuyện này và tính toán âm mưu đối phó. Liệu đâu là ái tình phù phiếm, đâu là bến đỗ thật sự dành cho nàng?
Và đóa hoa Thạch Thảo này có" sớm nở chóng tàn" hay còn sự thật nào ẩn chứa đằng sau? Tất cả sẽ được giải đáp trong " ĐÓA HOA MONG MANH"', 95, N'Tiếng Việt - Phụ đề Tiếng Anh', '2024-04-12', N'Việt Nam', N'Tâm Lý'
),
(N'EXHUMA: QUẬT MỘ TRÙNG MA', N'Hai pháp sư, một thầy phong thuỷ và một chuyên gia khâm liệm cùng hợp lực khai quật ngôi mộ bị nguyền rủa của một gia đình giàu có, 
nhằm cứu lấy sinh mạng hậu duệ cuối cùng trong dòng tộc. Bí mật hắc ám của tổ tiên được đánh thức.', 133, N'Tiếng Hàn - Phụ đề Tiếng Anh và Tiếng Việt', '2024-03-15', N'Hàn Quốc', N'Kinh Dị'
),
(N'Cái Giá Của Hạnh Phúc', N'Bà Dương và ông Thoại luôn cố gắng để xây dựng một hình ảnh gia đình tài giỏi và danh giá trong mắt mọi người.
Tuy nhiên dưới lớp vỏ bọc hào nhoáng ấy là những biến cố và lục đục gia đình đầy sóng gió. Nhìn kĩ hơn một chút bức tranh gia đình hạnh phúc ấy, rất nhiều “khuyết điểm” sẽ lộ ra gây bất ngờ.
', 115, N' Vietnamese with English subtitle', '2024-04-19', N'Việt Nam', N'Tâm Lý'
);
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[transactionID] [int] IDENTITY(1,1) NOT NULL,
	[amount] [float] NULL,
	[paymentMethod] [varchar](100) NULL,
	[paymentStatus] [varchar](20) NULL,
	[bookingNumber] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[transactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[id] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Show]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Show](
	[showId] [int] IDENTITY(1,1) NOT NULL,
	[createdOn] [date] NULL,
	[startTime] [datetime] NULL,
	[endTime] [datetime] NULL,
	[movieId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[showId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShowSeat]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShowSeat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cinemaHallId] [int] NULL,
	[seatNumber] [int] NULL,
	[isReserved] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([cityId])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Account] FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Account]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([showId])
REFERENCES [dbo].[Show] ([showId])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Account]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Show] FOREIGN KEY([showId])
REFERENCES [dbo].[Show] ([showId])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Show]
GO
ALTER TABLE [dbo].[CinemaHall]  WITH CHECK ADD FOREIGN KEY([cinemaId])
REFERENCES [dbo].[Cinema] ([id])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
ALTER TABLE [dbo].[FrontDeskOfficer]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[FrontDeskOfficer]  WITH CHECK ADD  CONSTRAINT [FK_FrontDeskOfficer_Account] FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[FrontDeskOfficer] CHECK CONSTRAINT [FK_FrontDeskOfficer_Account]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([bookingNumber])
REFERENCES [dbo].[Booking] ([bookingNumber])
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Account] FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Account]
GO
ALTER TABLE [dbo].[Show]  WITH CHECK ADD FOREIGN KEY([movieId])
REFERENCES [dbo].[Movie] ([id])
GO
ALTER TABLE [dbo].[Show]  WITH CHECK ADD  CONSTRAINT [FK_Show_Movie] FOREIGN KEY([movieId])
REFERENCES [dbo].[Movie] ([id])
GO
ALTER TABLE [dbo].[Show] CHECK CONSTRAINT [FK_Show_Movie]
GO
ALTER TABLE [dbo].[ShowSeat]  WITH CHECK ADD FOREIGN KEY([cinemaHallId])
REFERENCES [dbo].[CinemaHall] ([id])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [CHK_Account_Status] CHECK  (([status]='BLOCKED' OR [status]='BLACKLISTED' OR [status]='CANCELED' OR [status]='CLOSED' OR [status]='ACTIVE'))
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [CHK_Account_Status]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [CHK_Payment_Status] CHECK  (([paymentStatus]='REFUNDED' OR [paymentStatus]='SETTLED' OR [paymentStatus]='SETTLING' OR [paymentStatus]='ABANDONED' OR [paymentStatus]='DECLINED' OR [paymentStatus]='COMPLETED' OR [paymentStatus]='FAILED' OR [paymentStatus]='PENDING' OR [paymentStatus]='UNPAID'))
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [CHK_Payment_Status]
GO
/****** Object:  StoredProcedure [dbo].[addMovie]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addMovie]
    @title VARCHAR(255),
    @description TEXT,
    @durationInMins INT,
    @language VARCHAR(50),
    @releaseDate DATE,
    @country VARCHAR(100),
    @genre VARCHAR(100)
AS
BEGIN
    -- Insert new movie into the Movie table
    INSERT INTO Movie (title, description, durationInMins, language, releaseDate, country, genre)
    VALUES (@title, @description, @durationInMins, @language, @releaseDate, @country, @genre);

    PRINT 'Movie added successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[addShow]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addShow]
    @startTime DATETIME,
    @endTime DATETIME,
    @movieId INT
AS
BEGIN
    -- Insert new show into the Show table
    INSERT INTO Show (startTime, endTime, movieId)
    VALUES (@startTime, @endTime, @movieId);

    PRINT 'Show added successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[blockUser]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[blockUser]
    @userId VARCHAR(255)
AS
BEGIN
    -- Update the status of the user account to 'BLOCKED'
    UPDATE Account
    SET status = 'BLOCKED'
    WHERE id = @userId;

    PRINT 'User account blocked successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[cancelBooking]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cancelBooking]
    @bookingNumber VARCHAR(255)
AS
BEGIN
    -- Check if the booking exists
    IF NOT EXISTS (SELECT 1 FROM Booking WHERE bookingNumber = @bookingNumber)
    BEGIN
        PRINT 'Booking does not exist. Cancellation failed.';
        RETURN;
    END
    
    -- Cancel the booking by deleting it from the Booking table
    DELETE FROM Booking WHERE bookingNumber = @bookingNumber;

    PRINT 'Booking canceled successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[getBooking]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getBooking]
    @accountId VARCHAR(255)
AS
BEGIN
    -- Retrieve booking information for the specified accountId
    SELECT bookingNumber, createdOn, numberOfSeats, showId
    FROM Booking
    WHERE accountId = @accountId;
END
GO
/****** Object:  StoredProcedure [dbo].[makeBooking]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[makeBooking]
    @bookingNumber VARCHAR(255),
    @createdOn DATE,
    @numberOfSeats INT,
    @accountId VARCHAR(255),
    @showId INT
AS
BEGIN
    -- Check if the account exists
    IF NOT EXISTS (SELECT 1 FROM Account WHERE id = @accountId)
    BEGIN
        PRINT 'Account does not exist. Booking failed.';
        RETURN;
    END
    
    -- Check if the show exists
    IF NOT EXISTS (SELECT 1 FROM Show WHERE showId = @showId)
    BEGIN
        PRINT 'Show does not exist. Booking failed.';
        RETURN;
    END

    -- Insert new booking into the Booking table
    INSERT INTO Booking (bookingNumber, createdOn, numberOfSeats, accountId, showId)
    VALUES (@bookingNumber, @createdOn, @numberOfSeats, @accountId, @showId);

    PRINT 'Booking made successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[registerAccount]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registerAccount]
    @id VARCHAR(255),
    @name VARCHAR(255),
    @password VARCHAR(255),
    @status VARCHAR(20),
    @email VARCHAR(255),
    @phone VARCHAR(20)
AS
BEGIN
    -- Check if the account ID already exists
    IF EXISTS (SELECT 1 FROM Account WHERE id = @id)
    BEGIN
        PRINT 'Account ID already exists. Registration failed.';
        RETURN;
    END

    -- Insert new account into the Account table
    INSERT INTO Account (id, name, password, status, email, phone)
    VALUES (@id, @name, @password, @status, @email, @phone);

    PRINT 'Account registered successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[resetPassword]    Script Date: 4/24/2024 8:53:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[resetPassword]
    @accountId VARCHAR(255),
    @currentPassword VARCHAR(255),
    @newPassword VARCHAR(255)
AS
BEGIN
    DECLARE @currentPasswordStored VARCHAR(255);

    -- Get the current password of the account
    SELECT @currentPasswordStored = password
    FROM Account
    WHERE id = @accountId;

    -- Check if the current password matches
    IF @currentPasswordStored = @currentPassword
    BEGIN
        -- Update the password for the account
        UPDATE Account
        SET password = @newPassword
        WHERE id = @accountId;

        PRINT 'Password has been updated successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Current password is incorrect.';
    END
END
GO
USE [master]
GO
ALTER DATABASE [ABC_CINEMA_MOVIE_BOOKING] SET  READ_WRITE 
GO
