-- Source: saved Views/Home/Index.cshtml; image paths verified against wwwroot.
-- Author + title identifies products. Repeated cards combine images and tab flags.
-- Template names preserved. Price uses price-old; discount uses price-discount.
-- First source occurrence supplies main/hover images; all images enter BookImages.
-- New records: empty description, unknown stock=false, generated code.
-- Existing codes/descriptions/stock and records absent from source are preserved.
-- Requires ExpandBookNameLength migration.
SET NOCOUNT ON;
SET XACT_ABORT ON;
DECLARE @Books TABLE (Author nvarchar(50), Name nvarchar(100), Price decimal(18,2),
    DiscountPercent int, IsFeatured bit, IsNew bit, MainImageUrl nvarchar(200), HoverImageUrl nvarchar(200));
DECLARE @Images TABLE (Author nvarchar(50), Name nvarchar(100), ImageUrl nvarchar(200));
DECLARE @Sliders TABLE (Title nvarchar(100), Description nvarchar(500), ImageUrl nvarchar(200),
    ButtonText nvarchar(50), ButtonUrl nvarchar(200), [Order] int);
INSERT @Books VALUES
(N'jpple',N'Rpple iPad with Retina Display MD510LL/A',51.20,20,1,0,N'/image/products/product-1.jpg',N'/image/products/product-1.jpg'),
(N'Bpple',N'Koss KPH7 Lightweight Portable Headphone',51.20,20,1,1,N'/image/products/product-2.jpg',N'/image/products/product-3.jpg'),
(N'Cpple',N'Beats EP Wired On-Ear Headphone-Black',51.20,20,1,1,N'/image/products/product-3.jpg',N'/image/products/product-2.jpg'),
(N'Dpple',N'Beats Solo2 Solo 2 Wired On-Ear Headphone',51.20,20,1,1,N'/image/products/product-4.jpg',N'/image/products/product-5.jpg'),
(N'Lpple',N'Beats Solo3 Wireless On-Ear Headphones 2',51.20,20,1,1,N'/image/products/product-5.jpg',N'/image/products/product-4.jpg'),
(N'Fpple',N'3 Ways To Have (A) More Appealing BOOK',51.20,20,1,1,N'/image/products/product-6.jpg',N'/image/products/product-7.jpg'),
(N'Epple',N'In 10 Minutes, I''ll Give You The Truth About',51.20,20,1,1,N'/image/products/product-7.jpg',N'/image/products/product-6.jpg'),
(N'Fpple',N'5 Ways To Get Through To Your BOOK',51.20,20,1,1,N'/image/products/product-8.jpg',N'/image/products/product-9.jpg'),
(N'Gpple',N'What Can You Do To Save Your BOOK',51.20,20,1,1,N'/image/products/product-9.jpg',N'/image/products/product-8.jpg'),
(N'Hpple',N'From Destruction By Social Media?',51.20,20,1,1,N'/image/products/product-10.jpg',N'/image/products/product-11.jpg'),
(N'Gpple',N'Find Out More About BOOK By Social Media?',51.20,20,1,1,N'/image/products/product-11.jpg',N'/image/products/product-10.jpg'),
(N'Vpple',N'Read This Controversial BOOK By Social Media?',51.20,20,1,0,N'/image/products/product-12.jpg',N'/image/products/product-11.jpg'),
(N'jpple',N'Bpple iPad with Retina Display MD510LL/A',51.20,20,0,1,N'/image/products/product-3.jpg',N'/image/products/product-1.jpg'),
(N'Apple',N'Read This Controversial BOOK By Social Media?',51.20,20,0,1,N'/image/products/product-9.jpg',N'/image/products/product-11.jpg'),
(N'jpple',N'Zpple fPad with Retina Display MD510LL/A',51.20,20,0,0,N'/image/products/product-1.jpg',N'/image/products/product-1.jpg'),
(N'Apple',N'Read This Controversial BOOK By Social Media? Out More',51.20,20,0,0,N'/image/products/product-12.jpg',N'/image/products/product-11.jpg'),
(N'Ypple',N'Do You Really Need It? This Will Help You',51.20,20,0,0,N'/image/products/product-2.jpg',N'/image/products/product-1.jpg'),
(N'Upple',N'Here Is A Quick Cure For Book',51.20,20,0,0,N'/image/products/product-1.jpg',N'/image/products/product-1.jpg'),
(N'Ypple',N'a Half Very Simple Things You To Save',51.20,20,0,0,N'/image/products/product-3.jpg',N'/image/products/product-2.jpg'),
(N'Epple',N'What You Can Learn From Bill Gates',51.20,20,0,0,N'/image/products/product-5.jpg',N'/image/products/product-4.jpg'),
(N'Rpple',N'Create Better BOOK With The Help Of Your',51.20,20,0,0,N'/image/products/product-6.jpg',N'/image/products/product-4.jpg'),
(N'Tpple',N'Turn Your BOOK Into High Machine',51.20,20,0,0,N'/image/products/product-8.jpg',N'/image/products/product-7.jpg'),
(N'Mpple',N'Revolutionize Your BOOK With These Easy',51.20,20,0,0,N'/image/products/product-13.jpg',N'/image/products/product-11.jpg'),
(N'Rpple',N'Do You Really Need It? This Will Help You',51.20,20,0,0,N'/image/products/product-6.jpg',N'/image/products/product-6.jpg'),
(N'Epple',N'Here Is Quick Cure BOOK This Will Help',51.20,20,0,0,N'/image/products/product-1.jpg',N'/image/products/product-1.jpg'),
(N'Wpple',N'Do You Really Need It? This Will Help You',51.20,20,0,0,N'/image/products/product-2.jpg',N'/image/products/product-2.jpg'),
(N'Ypple',N'Very Simple Things You Can Save BOOK',51.20,20,0,0,N'/image/products/product-3.jpg',N'/image/products/product-3.jpg'),
(N'Mople',N'What You Can Learn From Bill Gates',51.20,20,0,0,N'/image/products/product-5.jpg',N'/image/products/product-5.jpg'),
(N'Cpple',N'3 Ways Create Better BOOK With Help',51.20,20,0,0,N'/image/products/product-4.jpg',N'/image/products/product-4.jpg'),
(N'Rpple',N'Revolutionize Your BOOK With',51.20,20,0,0,N'/image/products/product-2.jpg',N'/image/products/product-2.jpg'),
(N'Dpple',N'Turn Your BOOK Into High Machine',51.20,20,0,0,N'/image/products/product-1.jpg',N'/image/products/product-1.jpg'),
(N'Epple',N'BOOK: Do You Really Need It? This',51.20,20,0,0,N'/image/products/product-3.jpg',N'/image/products/product-3.jpg'),
(N'Ppple',N'Here Is A Quick Cure For Book',51.20,20,0,0,N'/image/products/product-4.jpg',N'/image/products/product-4.jpg'),
(N'Ypple',N'What You Can Learn From Bill Gates',51.20,20,0,0,N'/image/products/product-5.jpg',N'/image/products/product-5.jpg'),
(N'Wpple',N'3 Ways Create Better BOOK With',51.20,20,0,0,N'/image/products/product-6.jpg',N'/image/products/product-6.jpg'),
(N'Lpple',N'Revolutionize Your BOOK With These Easy',51.20,20,0,0,N'/image/products/product-2.jpg',N'/image/products/product-1.jpg'),
(N'Jpple',N'Turn Your BOOK Into High Machine',51.20,20,0,0,N'/image/products/product-2.jpg',N'/image/products/product-1.jpg'),
(N'Wpple',N'Create Better BOOK With The Help Of Your',51.20,20,0,0,N'/image/products/product-3.jpg',N'/image/products/product-2.jpg'),
(N'Hpple',N'a Half Very Simple Things You To Save',51.20,20,0,0,N'/image/products/product-6.jpg',N'/image/products/product-4.jpg'),
(N'Bpple',N'Here Is A Quick Cure For Book',51.20,20,0,0,N'/image/products/product-8.jpg',N'/image/products/product-7.jpg'),
(N'zpple',N'Do You Really Need It? This Will Help You',51.20,20,0,0,N'/image/products/product-13.jpg',N'/image/products/product-11.jpg');
INSERT @Images VALUES
(N'jpple',N'Rpple iPad with Retina Display MD510LL/A',N'/image/products/product-1.jpg'),
(N'Bpple',N'Koss KPH7 Lightweight Portable Headphone',N'/image/products/product-2.jpg'),
(N'Bpple',N'Koss KPH7 Lightweight Portable Headphone',N'/image/products/product-3.jpg'),
(N'Bpple',N'Koss KPH7 Lightweight Portable Headphone',N'/image/products/product-4.jpg'),
(N'Cpple',N'Beats EP Wired On-Ear Headphone-Black',N'/image/products/product-3.jpg'),
(N'Cpple',N'Beats EP Wired On-Ear Headphone-Black',N'/image/products/product-2.jpg'),
(N'Cpple',N'Beats EP Wired On-Ear Headphone-Black',N'/image/products/product-1.jpg'),
(N'Dpple',N'Beats Solo2 Solo 2 Wired On-Ear Headphone',N'/image/products/product-4.jpg'),
(N'Dpple',N'Beats Solo2 Solo 2 Wired On-Ear Headphone',N'/image/products/product-5.jpg'),
(N'Dpple',N'Beats Solo2 Solo 2 Wired On-Ear Headphone',N'/image/products/product-1.jpg'),
(N'Lpple',N'Beats Solo3 Wireless On-Ear Headphones 2',N'/image/products/product-5.jpg'),
(N'Lpple',N'Beats Solo3 Wireless On-Ear Headphones 2',N'/image/products/product-4.jpg'),
(N'Lpple',N'Beats Solo3 Wireless On-Ear Headphones 2',N'/image/products/product-7.jpg'),
(N'Lpple',N'Beats Solo3 Wireless On-Ear Headphones 2',N'/image/products/product-11.jpg'),
(N'Fpple',N'3 Ways To Have (A) More Appealing BOOK',N'/image/products/product-6.jpg'),
(N'Fpple',N'3 Ways To Have (A) More Appealing BOOK',N'/image/products/product-7.jpg'),
(N'Fpple',N'3 Ways To Have (A) More Appealing BOOK',N'/image/products/product-10.jpg'),
(N'Epple',N'In 10 Minutes, I''ll Give You The Truth About',N'/image/products/product-7.jpg'),
(N'Epple',N'In 10 Minutes, I''ll Give You The Truth About',N'/image/products/product-6.jpg'),
(N'Epple',N'In 10 Minutes, I''ll Give You The Truth About',N'/image/products/product-5.jpg'),
(N'Epple',N'In 10 Minutes, I''ll Give You The Truth About',N'/image/products/product-9.jpg'),
(N'Fpple',N'5 Ways To Get Through To Your BOOK',N'/image/products/product-8.jpg'),
(N'Fpple',N'5 Ways To Get Through To Your BOOK',N'/image/products/product-9.jpg'),
(N'Gpple',N'What Can You Do To Save Your BOOK',N'/image/products/product-9.jpg'),
(N'Gpple',N'What Can You Do To Save Your BOOK',N'/image/products/product-8.jpg'),
(N'Gpple',N'What Can You Do To Save Your BOOK',N'/image/products/product-3.jpg'),
(N'Gpple',N'What Can You Do To Save Your BOOK',N'/image/products/product-5.jpg'),
(N'Hpple',N'From Destruction By Social Media?',N'/image/products/product-10.jpg'),
(N'Hpple',N'From Destruction By Social Media?',N'/image/products/product-11.jpg'),
(N'Hpple',N'From Destruction By Social Media?',N'/image/products/product-9.jpg'),
(N'Hpple',N'From Destruction By Social Media?',N'/image/products/product-3.jpg'),
(N'Gpple',N'Find Out More About BOOK By Social Media?',N'/image/products/product-11.jpg'),
(N'Gpple',N'Find Out More About BOOK By Social Media?',N'/image/products/product-10.jpg'),
(N'Vpple',N'Read This Controversial BOOK By Social Media?',N'/image/products/product-12.jpg'),
(N'Vpple',N'Read This Controversial BOOK By Social Media?',N'/image/products/product-11.jpg'),
(N'jpple',N'Bpple iPad with Retina Display MD510LL/A',N'/image/products/product-3.jpg'),
(N'jpple',N'Bpple iPad with Retina Display MD510LL/A',N'/image/products/product-1.jpg'),
(N'Apple',N'Read This Controversial BOOK By Social Media?',N'/image/products/product-9.jpg'),
(N'Apple',N'Read This Controversial BOOK By Social Media?',N'/image/products/product-11.jpg'),
(N'jpple',N'Zpple fPad with Retina Display MD510LL/A',N'/image/products/product-1.jpg'),
(N'Apple',N'Read This Controversial BOOK By Social Media? Out More',N'/image/products/product-12.jpg'),
(N'Apple',N'Read This Controversial BOOK By Social Media? Out More',N'/image/products/product-11.jpg'),
(N'Ypple',N'Do You Really Need It? This Will Help You',N'/image/products/product-2.jpg'),
(N'Ypple',N'Do You Really Need It? This Will Help You',N'/image/products/product-1.jpg'),
(N'Upple',N'Here Is A Quick Cure For Book',N'/image/products/product-1.jpg'),
(N'Ypple',N'a Half Very Simple Things You To Save',N'/image/products/product-3.jpg'),
(N'Ypple',N'a Half Very Simple Things You To Save',N'/image/products/product-2.jpg'),
(N'Epple',N'What You Can Learn From Bill Gates',N'/image/products/product-5.jpg'),
(N'Epple',N'What You Can Learn From Bill Gates',N'/image/products/product-4.jpg'),
(N'Rpple',N'Create Better BOOK With The Help Of Your',N'/image/products/product-6.jpg'),
(N'Rpple',N'Create Better BOOK With The Help Of Your',N'/image/products/product-4.jpg'),
(N'Tpple',N'Turn Your BOOK Into High Machine',N'/image/products/product-8.jpg'),
(N'Tpple',N'Turn Your BOOK Into High Machine',N'/image/products/product-7.jpg'),
(N'Mpple',N'Revolutionize Your BOOK With These Easy',N'/image/products/product-13.jpg'),
(N'Mpple',N'Revolutionize Your BOOK With These Easy',N'/image/products/product-11.jpg'),
(N'Rpple',N'Do You Really Need It? This Will Help You',N'/image/products/product-6.jpg'),
(N'Epple',N'Here Is Quick Cure BOOK This Will Help',N'/image/products/product-1.jpg'),
(N'Wpple',N'Do You Really Need It? This Will Help You',N'/image/products/product-2.jpg'),
(N'Ypple',N'Very Simple Things You Can Save BOOK',N'/image/products/product-3.jpg'),
(N'Mople',N'What You Can Learn From Bill Gates',N'/image/products/product-5.jpg'),
(N'Cpple',N'3 Ways Create Better BOOK With Help',N'/image/products/product-4.jpg'),
(N'Rpple',N'Revolutionize Your BOOK With',N'/image/products/product-2.jpg'),
(N'Dpple',N'Turn Your BOOK Into High Machine',N'/image/products/product-1.jpg'),
(N'Epple',N'BOOK: Do You Really Need It? This',N'/image/products/product-3.jpg'),
(N'Ppple',N'Here Is A Quick Cure For Book',N'/image/products/product-4.jpg'),
(N'Ypple',N'What You Can Learn From Bill Gates',N'/image/products/product-5.jpg'),
(N'Wpple',N'3 Ways Create Better BOOK With',N'/image/products/product-6.jpg'),
(N'Lpple',N'Revolutionize Your BOOK With These Easy',N'/image/products/product-2.jpg'),
(N'Lpple',N'Revolutionize Your BOOK With These Easy',N'/image/products/product-1.jpg'),
(N'Jpple',N'Turn Your BOOK Into High Machine',N'/image/products/product-2.jpg'),
(N'Jpple',N'Turn Your BOOK Into High Machine',N'/image/products/product-1.jpg'),
(N'Wpple',N'Create Better BOOK With The Help Of Your',N'/image/products/product-3.jpg'),
(N'Wpple',N'Create Better BOOK With The Help Of Your',N'/image/products/product-2.jpg'),
(N'Hpple',N'a Half Very Simple Things You To Save',N'/image/products/product-6.jpg'),
(N'Hpple',N'a Half Very Simple Things You To Save',N'/image/products/product-4.jpg'),
(N'Bpple',N'Here Is A Quick Cure For Book',N'/image/products/product-8.jpg'),
(N'Bpple',N'Here Is A Quick Cure For Book',N'/image/products/product-7.jpg'),
(N'zpple',N'Do You Really Need It? This Will Help You',N'/image/products/product-13.jpg'),
(N'zpple',N'Do You Really Need It? This Will Help You',N'/image/products/product-11.jpg');
INSERT @Sliders VALUES
(N'H.G. Wells De Vengeance',N'Cover Up Front Of Books and Leave Summary',N'/image/bg-images/home-slider-2-ai.png',N'$78.09 - Order Now!',N'shop-grid.html',1),
(N'J.D. Kurtness De Vengeance',N'Cover Up Front Of Books and Leave Summary',N'/image/bg-images/home-slider-1-ai.png',N'$78.09 - Learn More',N'shop-grid.html',2);
BEGIN TRANSACTION;
DECLARE @LockResult int;
EXEC @LockResult = sys.sp_getapplock @Resource=N'PustokFrontendSeed',
    @LockMode='Exclusive', @LockOwner='Transaction';
IF @LockResult < 0 THROW 50001, 'Could not acquire seed lock.', 1;
IF EXISTS (SELECT AuthorId,Name FROM dbo.Books GROUP BY AuthorId,Name HAVING COUNT(*)>1)
    THROW 50002, 'Duplicate books require review.', 1;
IF EXISTS (SELECT FullName FROM dbo.Authors GROUP BY FullName HAVING COUNT(*)>1)
    THROW 50003, 'Duplicate authors require review.', 1;
DECLARE @NewAuthors int, @NewBooks int, @ChangedBooks int, @NewImages int, @NewSliders int, @ChangedSliders int;
INSERT dbo.Authors(Id,FullName)
SELECT NEWID(), s.Author FROM (SELECT DISTINCT Author FROM @Books) s
WHERE NOT EXISTS (SELECT 1 FROM dbo.Authors a WHERE a.FullName=s.Author);
SET @NewAuthors=@@ROWCOUNT;
INSERT dbo.Books(Id,Name,Description,Price,DiscountPercent,Code,InStock,IsFeatured,IsNew,MainImageUrl,HoverImageUrl,AuthorId)
SELECT NEWID(),s.Name,N'',s.Price,s.DiscountPercent,
    N'PUSTOK-'+CONVERT(nvarchar(36),NEWID()),0,s.IsFeatured,s.IsNew,s.MainImageUrl,s.HoverImageUrl,a.Id
FROM @Books s JOIN dbo.Authors a ON a.FullName=s.Author
WHERE NOT EXISTS (SELECT 1 FROM dbo.Books b WHERE b.AuthorId=a.Id AND b.Name=s.Name);
SET @NewBooks=@@ROWCOUNT;
UPDATE b SET Price=s.Price,DiscountPercent=s.DiscountPercent,IsFeatured=s.IsFeatured,IsNew=s.IsNew,
    MainImageUrl=s.MainImageUrl,HoverImageUrl=s.HoverImageUrl
FROM dbo.Books b JOIN dbo.Authors a ON a.Id=b.AuthorId
JOIN @Books s ON s.Author=a.FullName AND s.Name=b.Name
WHERE b.Price<>s.Price OR b.DiscountPercent<>s.DiscountPercent OR b.IsFeatured<>s.IsFeatured
    OR b.IsNew<>s.IsNew OR b.MainImageUrl<>s.MainImageUrl OR b.HoverImageUrl<>s.HoverImageUrl;
SET @ChangedBooks=@@ROWCOUNT;
INSERT dbo.BookImages(Id,BookId,ImageUrl)
SELECT NEWID(),b.Id,s.ImageUrl FROM @Images s
JOIN dbo.Authors a ON a.FullName=s.Author JOIN dbo.Books b ON b.AuthorId=a.Id AND b.Name=s.Name
WHERE NOT EXISTS (SELECT 1 FROM dbo.BookImages i WHERE i.BookId=b.Id AND i.ImageUrl=s.ImageUrl);
SET @NewImages=@@ROWCOUNT;
INSERT dbo.Sliders(Id,Title,Description,ImageUrl,ButtonText,ButtonUrl,[Order])
SELECT NEWID(),s.Title,s.Description,s.ImageUrl,s.ButtonText,s.ButtonUrl,s.[Order] FROM @Sliders s
WHERE NOT EXISTS (SELECT 1 FROM dbo.Sliders d WHERE d.Title=s.Title AND d.ImageUrl=s.ImageUrl);
SET @NewSliders=@@ROWCOUNT;
UPDATE d SET Description=s.Description,ButtonText=s.ButtonText,ButtonUrl=s.ButtonUrl,[Order]=s.[Order]
FROM dbo.Sliders d JOIN @Sliders s ON s.Title=d.Title AND s.ImageUrl=d.ImageUrl
WHERE d.Description<>s.Description OR d.ButtonText<>s.ButtonText OR d.ButtonUrl<>s.ButtonUrl OR d.[Order]<>s.[Order];
SET @ChangedSliders=@@ROWCOUNT;
IF EXISTS (
    SELECT Author,Name,Price,DiscountPercent,IsFeatured,IsNew,MainImageUrl,HoverImageUrl FROM @Books
    EXCEPT SELECT a.FullName,b.Name,b.Price,b.DiscountPercent,b.IsFeatured,b.IsNew,b.MainImageUrl,b.HoverImageUrl
    FROM dbo.Books b JOIN dbo.Authors a ON a.Id=b.AuthorId)
    THROW 50004, 'Book verification failed.', 1;
IF EXISTS (
    SELECT Author,Name,ImageUrl FROM @Images
    EXCEPT SELECT a.FullName,b.Name,i.ImageUrl FROM dbo.BookImages i
    JOIN dbo.Books b ON b.Id=i.BookId JOIN dbo.Authors a ON a.Id=b.AuthorId)
    THROW 50005, 'Image verification failed.', 1;
IF EXISTS (
    SELECT Title,Description,ImageUrl,ButtonText,ButtonUrl,[Order] FROM @Sliders
    EXCEPT SELECT Title,Description,ImageUrl,ButtonText,ButtonUrl,[Order] FROM dbo.Sliders)
    THROW 50006, 'Slider verification failed.', 1;
COMMIT;
SELECT @NewAuthors AS AddedAuthors,@NewBooks AS AddedBooks,@ChangedBooks AS UpdatedBooks,
    @NewImages AS AddedImages,@NewSliders AS AddedSliders,@ChangedSliders AS UpdatedSliders;
SELECT (SELECT COUNT(*) FROM dbo.Authors) AS Authors,(SELECT COUNT(*) FROM dbo.Books) AS Books,
    (SELECT COUNT(*) FROM dbo.BookImages) AS BookImages,(SELECT COUNT(*) FROM dbo.Sliders) AS Sliders;
SELECT SUM(CAST(IsFeatured AS int)) AS Featured,SUM(CAST(IsNew AS int)) AS NewBooks FROM dbo.Books;