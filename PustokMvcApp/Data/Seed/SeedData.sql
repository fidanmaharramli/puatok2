-- Pustok catalog snapshot exported from PustokDb on 2026-11-03.
-- Run against a database whose schema was created using the EXISTING migrations.
-- Select the target database in SSMS, or pass its name to sqlcmd with -d.
-- UTF-8 file: when using sqlcmd, pass -f 65001 and -b.
-- This is the complete current catalog; do NOT also run the older demo seed scripts.
-- Preserves existing GUIDs, Unicode text, prices, flags, image URLs and relationships.
-- Inserts missing primary keys only. Re-running does not duplicate rows or overwrite edits.
-- Does not delete data, alter schema, or include Identity accounts/passwords/roles.
-- Image files must also be present under wwwroot at the saved URLs.
-- Snapshot counts: Authors=21, Tags=4, Books=43, Sliders=4, BookImages=94, BookTags=34.

SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRY
    BEGIN TRANSACTION;
    IF OBJECT_ID(N'dbo.Authors', N'U') IS NULL
        THROW 50001, 'Required table dbo.Authors is missing. Apply the existing migrations first.', 1;
    IF OBJECT_ID(N'dbo.Tags', N'U') IS NULL
        THROW 50001, 'Required table dbo.Tags is missing. Apply the existing migrations first.', 1;
    IF OBJECT_ID(N'dbo.Books', N'U') IS NULL
        THROW 50001, 'Required table dbo.Books is missing. Apply the existing migrations first.', 1;
    IF OBJECT_ID(N'dbo.Sliders', N'U') IS NULL
        THROW 50001, 'Required table dbo.Sliders is missing. Apply the existing migrations first.', 1;
    IF OBJECT_ID(N'dbo.BookImages', N'U') IS NULL
        THROW 50001, 'Required table dbo.BookImages is missing. Apply the existing migrations first.', 1;
    IF OBJECT_ID(N'dbo.BookTags', N'U') IS NULL
        THROW 50001, 'Required table dbo.BookTags is missing. Apply the existing migrations first.', 1;

    -- Authors (21 rows)
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'36DE8F55-D9B7-4E65-B880-024F8DC2041F')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'36DE8F55-D9B7-4E65-B880-024F8DC2041F', N'Apple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'5D8D4200-FDB0-44D0-9A34-14444AC31596')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'5D8D4200-FDB0-44D0-9A34-14444AC31596', N'Epple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'4F3C9C1C-C144-4DEF-A72C-1FE7C6FDF7A0')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'4F3C9C1C-C144-4DEF-A72C-1FE7C6FDF7A0', N'Mpple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'856BF8EB-3AFA-46AC-B3D3-2434C3920F49')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'856BF8EB-3AFA-46AC-B3D3-2434C3920F49', N'Tpple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'044328D7-FFF3-429B-8BFB-417A39CBC36F')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'044328D7-FFF3-429B-8BFB-417A39CBC36F', N'Ypple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'9724C851-3069-4D84-B989-4B1A71B2E729')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'9724C851-3069-4D84-B989-4B1A71B2E729', N'Ppple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'3B7CD849-94AC-47BE-846B-4C2E38579592')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'3B7CD849-94AC-47BE-846B-4C2E38579592', N'Mople');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'360548F1-5F96-458C-B6D4-4EA20790919B')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'360548F1-5F96-458C-B6D4-4EA20790919B', N'Lpple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'370C3C63-6DD5-484B-AC24-64FCE479B0CD')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'370C3C63-6DD5-484B-AC24-64FCE479B0CD', N'Bpple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'EC53918E-DBC5-427A-A6B1-7681DA4E8961')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'EC53918E-DBC5-427A-A6B1-7681DA4E8961', N'Fpple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'D9F3FDD9-EE6F-4BD0-804E-773213507AAF')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'D9F3FDD9-EE6F-4BD0-804E-773213507AAF', N'Gpple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'63237E11-E62C-4337-9D32-91445B108F65')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'63237E11-E62C-4337-9D32-91445B108F65', N'Snurlan');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'ACF24837-2043-4D21-A014-97C0F79B7635')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'ACF24837-2043-4D21-A014-97C0F79B7635', N'Rpple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'C55201C7-A59D-4897-9402-B56A658A0A49')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'C55201C7-A59D-4897-9402-B56A658A0A49', N'Vpple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'951AEBBD-EB11-465D-ADC5-C8DEFD09F000')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'951AEBBD-EB11-465D-ADC5-C8DEFD09F000', N'Cpple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'135ACFBA-2DC5-4BA4-9466-C91864623D6E')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'135ACFBA-2DC5-4BA4-9466-C91864623D6E', N'Hpple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'A93D81ED-419D-47DC-9469-DA1EB228F2E7')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'A93D81ED-419D-47DC-9469-DA1EB228F2E7', N'Dpple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'36BFDBEA-97B9-4DB1-83CA-ED9B9378EC6B')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'36BFDBEA-97B9-4DB1-83CA-ED9B9378EC6B', N'jpple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'6B1B60FF-D1DF-4FB2-8EBF-F16C84A041E6')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'6B1B60FF-D1DF-4FB2-8EBF-F16C84A041E6', N'Wpple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'C57C197D-C600-431E-A751-F394EA425A6C')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'C57C197D-C600-431E-A751-F394EA425A6C', N'Upple');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Authors] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'AAB54E56-C1AE-4DAE-9213-FB683A88E3E6')
        INSERT INTO [dbo].[Authors] ([Id], [FullName])
        VALUES (N'AAB54E56-C1AE-4DAE-9213-FB683A88E3E6', N'zpple');

    -- Tags (4 rows)
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Tags] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'5BE80417-D304-4020-934C-1A57A92B93F2')
        INSERT INTO [dbo].[Tags] ([Id], [Name])
        VALUES (N'5BE80417-D304-4020-934C-1A57A92B93F2', N'Arts & Photography');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Tags] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309')
        INSERT INTO [dbo].[Tags] ([Id], [Name])
        VALUES (N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309', N'Deal of the day');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Tags] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'7AF9477B-0AA6-459D-9770-BD810CBEEE88')
        INSERT INTO [dbo].[Tags] ([Id], [Name])
        VALUES (N'7AF9477B-0AA6-459D-9770-BD810CBEEE88', N'Best sellers');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Tags] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5')
        INSERT INTO [dbo].[Tags] ([Id], [Name])
        VALUES (N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5', N'Children');

    -- Books (43 rows)
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'F0AD0FF8-075B-4A96-A8CC-02455DE0FCCA')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'F0AD0FF8-075B-4A96-A8CC-02455DE0FCCA', N'Do You Really Need It? This Will Help You', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0026', 0, 0, 0, N'/image/products/product-13.jpg', N'/image/products/product-11.jpg', N'AAB54E56-C1AE-4DAE-9213-FB683A88E3E6');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'1B1C0D5B-5067-463A-9BEB-04465C6D37C3')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'1B1C0D5B-5067-463A-9BEB-04465C6D37C3', N'Bpple iPad with Retina Display MD510LL/A', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-6776CAF5-54A4-4EC3-98FE-3BC0858A5525', 0, 0, 1, N'/image/products/product-3.jpg', N'/image/products/product-1.jpg', N'36BFDBEA-97B9-4DB1-83CA-ED9B9378EC6B');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'00EC06FA-7536-4E0A-8116-05D1DC535557')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'00EC06FA-7536-4E0A-8116-05D1DC535557', N'What Can You Do To Save Your BOOK', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0FCDC979-9485-4F35-80A5-629B6073CE04', 0, 1, 1, N'/image/products/product-9.jpg', N'/image/products/product-8.jpg', N'D9F3FDD9-EE6F-4BD0-804E-773213507AAF');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'0C174FB2-4048-435C-B079-07B62E352575')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'0C174FB2-4048-435C-B079-07B62E352575', N'Beats Solo2 Solo 2 Wired On-Ear Headphone', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-11BF19C6-5089-4CEE-83CC-B54AC8478BB5', 0, 1, 1, N'/image/products/product-4.jpg', N'/image/products/product-5.jpg', N'A93D81ED-419D-47DC-9469-DA1EB228F2E7');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'50DD4049-E0D7-4F56-9195-0B7A946A03CC')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'50DD4049-E0D7-4F56-9195-0B7A946A03CC', N'Zpple fPad with Retina Display MD510LL/A', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-E0FEB56F-8A1F-418B-9091-91F030FF41AA', 0, 0, 0, N'/image/products/product-1.jpg', N'/image/products/product-1.jpg', N'36BFDBEA-97B9-4DB1-83CA-ED9B9378EC6B');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'3E19D62D-1AAC-4A0A-A85C-10F3BB9C2201')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'3E19D62D-1AAC-4A0A-A85C-10F3BB9C2201', N'5 Ways To Get Through To Your BOOK', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-B5B3709A-D269-4AAF-9D2C-2946AA2F24FA', 0, 1, 1, N'/image/products/product-8.jpg', N'/image/products/product-9.jpg', N'63237E11-E62C-4337-9D32-91445B108F65');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'DF38986E-5396-4A76-9695-1364CFA7BD53')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'DF38986E-5396-4A76-9695-1364CFA7BD53', N'Do You Really Need It? This Will Help You', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0011', 0, 0, 0, N'/image/products/product-2.jpg', N'/image/products/product-2.jpg', N'6B1B60FF-D1DF-4FB2-8EBF-F16C84A041E6');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'B936BED7-0E3B-4B89-9AB5-201BEDAE9339')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'B936BED7-0E3B-4B89-9AB5-201BEDAE9339', N'Revolutionize Your BOOK With These Easy', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0021', 0, 0, 0, N'/image/products/product-2.jpg', N'/image/products/product-1.jpg', N'360548F1-5F96-458C-B6D4-4EA20790919B');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'A388317D-2DD0-423E-8625-3A90FFB0C4C5')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'A388317D-2DD0-423E-8625-3A90FFB0C4C5', N'Create Better BOOK With The Help Of Your', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0023', 0, 0, 0, N'/image/products/product-3.jpg', N'/image/products/product-2.jpg', N'6B1B60FF-D1DF-4FB2-8EBF-F16C84A041E6');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'F95650A9-0545-4008-8B58-3B4DB41AD0BD')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'F95650A9-0545-4008-8B58-3B4DB41AD0BD', N'Very Simple Things You Can Save BOOK', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0012', 0, 0, 0, N'/image/products/product-3.jpg', N'/image/products/product-3.jpg', N'044328D7-FFF3-429B-8BFB-417A39CBC36F');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'4434E953-AFC7-4CB9-87D0-40A246A2783F')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'4434E953-AFC7-4CB9-87D0-40A246A2783F', N'a Half Very Simple Things You To Save', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0004', 0, 0, 0, N'/image/products/product-3.jpg', N'/image/products/product-2.jpg', N'044328D7-FFF3-429B-8BFB-417A39CBC36F');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'471D8BD9-1ABC-462D-9E0F-428151DB2370')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'471D8BD9-1ABC-462D-9E0F-428151DB2370', N'What You Can Learn From Bill Gates', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0013', 0, 0, 0, N'/image/products/product-5.jpg', N'/image/products/product-5.jpg', N'3B7CD849-94AC-47BE-846B-4C2E38579592');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'8B662776-F525-4059-8673-4E9F1AAEC32D')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'8B662776-F525-4059-8673-4E9F1AAEC32D', N'Read This Controversial BOOK By Social Media?', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 99.20, N'PUSTOK-7743F5B7-41B8-47CA-9E38-F3F580F7F122', 0, 1, 0, N'/image/products/product-12.jpg', N'/image/products/product-11.jpg', N'C55201C7-A59D-4897-9402-B56A658A0A49');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'BFDAF989-D8B0-4F55-9C1B-654DEBB059AF')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'BFDAF989-D8B0-4F55-9C1B-654DEBB059AF', N'3 Ways To Have (A) More Appealing BOOK', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-D938818B-2E10-4044-AF64-5057B198E821', 0, 1, 1, N'/image/products/product-6.jpg', N'/image/products/product-7.jpg', N'EC53918E-DBC5-427A-A6B1-7681DA4E8961');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'A8BCCA30-8F61-4B20-94FC-6CB4FE484578')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'A8BCCA30-8F61-4B20-94FC-6CB4FE484578', N'Read This Controversial BOOK By Social Media?', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-6A445535-62C2-4989-952C-BD89A27798BD', 0, 0, 1, N'/image/products/product-9.jpg', N'/image/products/product-11.jpg', N'36DE8F55-D9B7-4E65-B880-024F8DC2041F');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'99F77AE9-DF4D-4EE7-A998-76B45E00EFAB')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'99F77AE9-DF4D-4EE7-A998-76B45E00EFAB', N'Here Is Quick Cure BOOK This Will Help', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0010', 0, 0, 0, N'/image/products/product-1.jpg', N'/image/products/product-1.jpg', N'5D8D4200-FDB0-44D0-9A34-14444AC31596');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'9A38182E-7243-4657-BFDA-7881629A3B2C')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'9A38182E-7243-4657-BFDA-7881629A3B2C', N'What You Can Learn From Bill Gates', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0005', 0, 0, 0, N'/image/products/product-5.jpg', N'/image/products/product-4.jpg', N'5D8D4200-FDB0-44D0-9A34-14444AC31596');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'FAF63FF4-5791-41D0-9C09-78FF925AAD4F')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'FAF63FF4-5791-41D0-9C09-78FF925AAD4F', N'3 Ways Create Better BOOK With', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0020', 0, 0, 0, N'/image/products/product-6.jpg', N'/image/products/product-6.jpg', N'6B1B60FF-D1DF-4FB2-8EBF-F16C84A041E6');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'97E62114-0F58-49C7-81C8-790B48260E4C')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'97E62114-0F58-49C7-81C8-790B48260E4C', N'Find Out More About BOOK By Social Media?', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0F44EB6F-0B2B-438B-BE15-71F0DF652F8F', 0, 1, 1, N'/image/products/product-11.jpg', N'/image/products/product-10.jpg', N'D9F3FDD9-EE6F-4BD0-804E-773213507AAF');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'30A37FB2-4CA1-4EDC-8907-7977176E1926')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'30A37FB2-4CA1-4EDC-8907-7977176E1926', N'Beats EP Wired On-Ear Headphone-Black', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-D6138B30-E72C-46D2-9436-FC02D2BD3D35', 0, 1, 1, N'/image/products/product-3.jpg', N'/image/products/product-2.jpg', N'951AEBBD-EB11-465D-ADC5-C8DEFD09F000');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'0FB62CDC-0945-4394-ABC4-7B16D419331C')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'0FB62CDC-0945-4394-ABC4-7B16D419331C', N'Do You Really Need It? This Will Help You', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0009', 0, 0, 0, N'/image/products/product-6.jpg', N'/image/products/product-6.jpg', N'ACF24837-2043-4D21-A014-97C0F79B7635');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'B0A937DF-F5AD-44E3-88A6-8491BBD1C1D8')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'B0A937DF-F5AD-44E3-88A6-8491BBD1C1D8', N'What You Can Learn From Bill Gates', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0019', 0, 0, 0, N'/image/products/product-5.jpg', N'/image/products/product-5.jpg', N'044328D7-FFF3-429B-8BFB-417A39CBC36F');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'C8F54769-257A-47CB-878E-87718A9EB922')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'C8F54769-257A-47CB-878E-87718A9EB922', N'Turn Your BOOK Into High Machine', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0007', 0, 0, 0, N'/image/products/product-8.jpg', N'/image/products/product-7.jpg', N'856BF8EB-3AFA-46AC-B3D3-2434C3920F49');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'299B605B-A1E7-4C1D-94CD-8B00BA87A6EC')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'299B605B-A1E7-4C1D-94CD-8B00BA87A6EC', N'Here Is A Quick Cure For Book', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0025', 0, 0, 0, N'/image/products/product-8.jpg', N'/image/products/product-7.jpg', N'370C3C63-6DD5-484B-AC24-64FCE479B0CD');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'F1882B3E-AD88-42C9-9007-8B6C5BF611C6')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'F1882B3E-AD88-42C9-9007-8B6C5BF611C6', N'Do You Really Need It? This Will Help You', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0002', 0, 0, 0, N'/image/products/product-2.jpg', N'/image/products/product-1.jpg', N'044328D7-FFF3-429B-8BFB-417A39CBC36F');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'1DB6F02D-F46A-4FDD-8929-991B9DEA5FA9')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'1DB6F02D-F46A-4FDD-8929-991B9DEA5FA9', N'Read This Controversial BOOK By Social Media? Out More', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-B36E3AE6-D3EA-4F2C-BE50-1DC9AAFDF121', 0, 0, 0, N'/image/products/product-12.jpg', N'/image/products/product-11.jpg', N'36DE8F55-D9B7-4E65-B880-024F8DC2041F');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'7EB8EE63-DBEC-4889-A99C-9F557A3506C8')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'7EB8EE63-DBEC-4889-A99C-9F557A3506C8', N'3 Ways Create Better BOOK With Help', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0014', 0, 0, 0, N'/image/products/product-4.jpg', N'/image/products/product-4.jpg', N'951AEBBD-EB11-465D-ADC5-C8DEFD09F000');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'76920EE9-5DB8-46BE-A2E2-A22C1173FC9A')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'76920EE9-5DB8-46BE-A2E2-A22C1173FC9A', N'Rpple iPad with Retina Display MD510LL/A', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0001', 0, 1, 0, N'/image/products/product-1.jpg', N'/image/products/product-1.jpg', N'36BFDBEA-97B9-4DB1-83CA-ED9B9378EC6B');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'02B4CAD8-E2DB-4EF7-8DB3-A28B6F204069')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'02B4CAD8-E2DB-4EF7-8DB3-A28B6F204069', N'Tad Bishop', N'Odio earum eveniet ', 19, 363.00, N'Incidunt praesentiu', 1, 0, 1, N'/image/products/3fa6fc24-aea1-40b3-b50f-03fea29b8f15.jpg', N'/image/products/265fc5d4-124d-4afd-a2fd-d9d7576b0a4f.jpg', N'63237E11-E62C-4337-9D32-91445B108F65');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'B69554EB-91F3-45E0-B81D-A4A2AA93D73B')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'B69554EB-91F3-45E0-B81D-A4A2AA93D73B', N'Koss KPH7 Lightweight Portable Headphone', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-D2498FC8-0092-4DF4-AA20-715FE1309D2F', 0, 1, 1, N'/image/products/product-2.jpg', N'/image/products/product-3.jpg', N'370C3C63-6DD5-484B-AC24-64FCE479B0CD');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'CCDF8450-9DA4-420A-8768-A4FA888C7D9A')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'CCDF8450-9DA4-420A-8768-A4FA888C7D9A', N'Turn Your BOOK Into High Machine', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0022', 0, 0, 0, N'/image/products/product-2.jpg', N'/image/products/product-1.jpg', N'36BFDBEA-97B9-4DB1-83CA-ED9B9378EC6B');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'5C90941A-3519-4073-86EC-B312B345D732')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'5C90941A-3519-4073-86EC-B312B345D732', N'Ethan Woodward', N'Dolorum tempor conse', 94, 418.00, N'Est quod placeat fu', 1, 1, 1, N'/image/products/1ae16a08-9a4d-4771-9246-72d94a00dfcb.jpg', N'/image/products/a7b0ac94-0aeb-431c-bbc3-bce8b13995ec.jpg', N'63237E11-E62C-4337-9D32-91445B108F65');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'19A9F9F4-083C-4A24-B99D-BBC093C0BAF6')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'19A9F9F4-083C-4A24-B99D-BBC093C0BAF6', N'a Half Very Simple Things You To Save', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0024', 0, 0, 0, N'/image/products/product-6.jpg', N'/image/products/product-4.jpg', N'135ACFBA-2DC5-4BA4-9466-C91864623D6E');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'61D9A1E8-D000-46EB-93F2-BDF049412D09')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'61D9A1E8-D000-46EB-93F2-BDF049412D09', N'Beats Solo3 Wireless On-Ear Headphones 2', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-16DCAA5D-CAD0-473F-8934-C06C577AD3F1', 0, 1, 1, N'/image/products/product-5.jpg', N'/image/products/product-4.jpg', N'360548F1-5F96-458C-B6D4-4EA20790919B');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'7C0C834F-818D-4D71-B326-D245FC3F4B9E')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'7C0C834F-818D-4D71-B326-D245FC3F4B9E', N'Here Is A Quick Cure For Book', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0018', 0, 0, 0, N'/image/products/product-4.jpg', N'/image/products/product-4.jpg', N'9724C851-3069-4D84-B989-4B1A71B2E729');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'199D02D2-7C84-4DE3-B750-DCD6902B2429')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'199D02D2-7C84-4DE3-B750-DCD6902B2429', N'In 10 Minutes, I''ll Give You The Truth About', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-ED8EBA14-F300-4ECD-9669-4CD9232424B5', 0, 1, 1, N'/image/products/product-7.jpg', N'/image/products/product-6.jpg', N'5D8D4200-FDB0-44D0-9A34-14444AC31596');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'315497CA-C797-4FE5-B1C1-DEEFC64CF0B1')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'315497CA-C797-4FE5-B1C1-DEEFC64CF0B1', N'Turn Your BOOK Into High Machine', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0016', 0, 0, 0, N'/image/products/product-1.jpg', N'/image/products/product-1.jpg', N'A93D81ED-419D-47DC-9469-DA1EB228F2E7');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'C7F62623-5DE2-4B9C-8B6C-E563B5FDDA41')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'C7F62623-5DE2-4B9C-8B6C-E563B5FDDA41', N'Revolutionize Your BOOK With These Easy', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0008', 0, 0, 0, N'/image/products/product-13.jpg', N'/image/products/product-11.jpg', N'4F3C9C1C-C144-4DEF-A72C-1FE7C6FDF7A0');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'F9FD2813-FBD3-44BF-9D87-E6B0FA4713A9')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'F9FD2813-FBD3-44BF-9D87-E6B0FA4713A9', N'From Destruction By Social Media?', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-E26ED7B0-6790-4671-BA3B-F89454D7F4F9', 0, 1, 1, N'/image/products/product-10.jpg', N'/image/products/product-11.jpg', N'135ACFBA-2DC5-4BA4-9466-C91864623D6E');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'5441A65B-3A20-4C55-95DB-E8E654C47B2D')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'5441A65B-3A20-4C55-95DB-E8E654C47B2D', N'BOOK: Do You Really Need It? This', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0017', 0, 0, 0, N'/image/products/product-3.jpg', N'/image/products/product-3.jpg', N'5D8D4200-FDB0-44D0-9A34-14444AC31596');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'74C7B77B-0FD4-408F-AD32-EAAE37B01F3D')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'74C7B77B-0FD4-408F-AD32-EAAE37B01F3D', N'Create Better BOOK With The Help Of Your', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0006', 0, 0, 0, N'/image/products/product-6.jpg', N'/image/products/product-4.jpg', N'ACF24837-2043-4D21-A014-97C0F79B7635');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'BD0A3027-68CB-4058-9703-F3E876C043EE')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'BD0A3027-68CB-4058-9703-F3E876C043EE', N'Revolutionize Your BOOK With', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0015', 0, 0, 0, N'/image/products/product-2.jpg', N'/image/products/product-2.jpg', N'ACF24837-2043-4D21-A014-97C0F79B7635');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Books] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'180E362B-14E3-4982-A669-FA6ACE14E852')
        INSERT INTO [dbo].[Books] ([Id], [Name], [Description], [DiscountPercent], [Price], [Code], [InStock], [IsFeatured], [IsNew], [MainImageUrl], [HoverImageUrl], [AuthorId])
        VALUES (N'180E362B-14E3-4982-A669-FA6ACE14E852', N'Here Is A Quick Cure For Book', N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.', 20, 51.20, N'PUSTOK-0003', 0, 0, 0, N'/image/products/product-1.jpg', N'/image/products/product-1.jpg', N'C57C197D-C600-431E-A751-F394EA425A6C');

    -- Sliders (4 rows)
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Sliders] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'6F25BBA8-E23A-40AB-A44E-02975EF941BA')
        INSERT INTO [dbo].[Sliders] ([Id], [Title], [Description], [ImageUrl], [ButtonText], [ButtonUrl], [Order])
        VALUES (N'6F25BBA8-E23A-40AB-A44E-02975EF941BA', N'H.G. Wells De Vengeance', N'Cover Up Front Of Books and Leave Summary', N'/image/bg-images/home-slider-2-ai.png', N'$78.09 - Order Now!', N'shop-grid.html', 1);
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Sliders] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'BD027601-2AAA-4F15-A759-69B43C82539B')
        INSERT INTO [dbo].[Sliders] ([Id], [Title], [Description], [ImageUrl], [ButtonText], [ButtonUrl], [Order])
        VALUES (N'BD027601-2AAA-4F15-A759-69B43C82539B', N'Repudiandae quia et ', N'Quia earum exercitat', N'/image/bg-images/5e8a096a-c6f8-43ec-93db-c58af8735e26.jpg', N'$99.90', N'Non ut sed aliquam d', 71);
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Sliders] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'715747BD-3252-4D8E-8ADB-D4636D9A75E4')
        INSERT INTO [dbo].[Sliders] ([Id], [Title], [Description], [ImageUrl], [ButtonText], [ButtonUrl], [Order])
        VALUES (N'715747BD-3252-4D8E-8ADB-D4636D9A75E4', N'J.D. Kurtness De Vengeance', N'Cover Up Front Of Books and Leave Summary', N'/image/bg-images/home-slider-1-ai.png', N'$78.09 - Learn More', N'shop-grid.html', 2);
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Sliders] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'512E2AF1-AD1E-438B-85EB-EF36AEF78D11')
        INSERT INTO [dbo].[Sliders] ([Id], [Title], [Description], [ImageUrl], [ButtonText], [ButtonUrl], [Order])
        VALUES (N'512E2AF1-AD1E-438B-85EB-EF36AEF78D11', N'Quia reprehenderit ', N'Exercitation veniam', N'/image/bg-images/09f14f2a-d71a-4b04-95af-dda705489a9f.jpg', N'$99.00', N'Nisi enim veritatis ', 83);

    -- BookImages (94 rows)
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'7481802D-8F6B-41B3-AD39-00B5CBD5E6AE')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'7481802D-8F6B-41B3-AD39-00B5CBD5E6AE', N'/image/products/product-11.jpg', N'C7F62623-5DE2-4B9C-8B6C-E563B5FDDA41');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'76DC4596-A2F2-46E3-8493-0210205ACAAD')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'76DC4596-A2F2-46E3-8493-0210205ACAAD', N'/image/products/product-11.jpg', N'1DB6F02D-F46A-4FDD-8929-991B9DEA5FA9');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'CBC8F04F-CCC5-4888-8FF0-0485AD1F88DC')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'CBC8F04F-CCC5-4888-8FF0-0485AD1F88DC', N'/image/products/product-8.jpg', N'3E19D62D-1AAC-4A0A-A85C-10F3BB9C2201');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'D9E6F2C2-DB7A-42EC-A7C3-09206D570832')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'D9E6F2C2-DB7A-42EC-A7C3-09206D570832', N'/image/products/product-4.jpg', N'9A38182E-7243-4657-BFDA-7881629A3B2C');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'7D666713-9453-40AD-8DBA-0CFCE055B457')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'7D666713-9453-40AD-8DBA-0CFCE055B457', N'/image/products/1383a601-6bde-4fdc-8dc3-a6efd90fb31d.jpg', N'5C90941A-3519-4073-86EC-B312B345D732');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'95121A1C-F74B-4CD8-8266-0F7FBD21C5E8')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'95121A1C-F74B-4CD8-8266-0F7FBD21C5E8', N'/image/products/fae59c3e-fa21-49f7-8190-778c913f99f0.jpg', N'5C90941A-3519-4073-86EC-B312B345D732');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'CCAB59F8-F662-48FB-B638-107D751AAC8A')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'CCAB59F8-F662-48FB-B638-107D751AAC8A', N'/image/products/product-2.jpg', N'F1882B3E-AD88-42C9-9007-8B6C5BF611C6');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'0B948434-612D-4BC1-972C-112CB8DBFC2C')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'0B948434-612D-4BC1-972C-112CB8DBFC2C', N'/image/products/product-6.jpg', N'0FB62CDC-0945-4394-ABC4-7B16D419331C');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'839ECD3B-36D0-476B-B9E7-12318A3D939A')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'839ECD3B-36D0-476B-B9E7-12318A3D939A', N'/image/products/product-3.jpg', N'B69554EB-91F3-45E0-B81D-A4A2AA93D73B');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'0FE4B815-F82A-433C-A313-1922F33655F4')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'0FE4B815-F82A-433C-A313-1922F33655F4', N'/image/products/product-10.jpg', N'F9FD2813-FBD3-44BF-9D87-E6B0FA4713A9');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'C2EA0A7A-964D-491C-A17D-1D180F1650D8')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'C2EA0A7A-964D-491C-A17D-1D180F1650D8', N'/image/products/product-8.jpg', N'299B605B-A1E7-4C1D-94CD-8B00BA87A6EC');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'42650144-D469-42F4-BD13-21D145FE545F')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'42650144-D469-42F4-BD13-21D145FE545F', N'/image/products/8d0cc1c3-282e-4bea-a255-cb45a2fb40ac.jpg', N'02B4CAD8-E2DB-4EF7-8DB3-A28B6F204069');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'7883BAB8-1A86-40B5-9376-2318575881E2')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'7883BAB8-1A86-40B5-9376-2318575881E2', N'/image/products/product-7.jpg', N'299B605B-A1E7-4C1D-94CD-8B00BA87A6EC');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'9C1DD5A6-9E63-4A8F-9C8B-23455E17BF97')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'9C1DD5A6-9E63-4A8F-9C8B-23455E17BF97', N'/image/products/product-2.jpg', N'DF38986E-5396-4A76-9695-1364CFA7BD53');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'A197ACE5-04A7-4CEB-8119-2479EFBA4826')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'A197ACE5-04A7-4CEB-8119-2479EFBA4826', N'/image/products/product-4.jpg', N'19A9F9F4-083C-4A24-B99D-BBC093C0BAF6');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'026910F9-F04B-4240-AA6F-28978564784D')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'026910F9-F04B-4240-AA6F-28978564784D', N'/image/products/product-4.jpg', N'7EB8EE63-DBEC-4889-A99C-9F557A3506C8');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'5054727B-EB10-4F75-A8DE-2A16F06767C6')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'5054727B-EB10-4F75-A8DE-2A16F06767C6', N'/image/products/product-11.jpg', N'F0AD0FF8-075B-4A96-A8CC-02455DE0FCCA');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'B915C023-2B5B-48BD-B3CB-312E73BF5721')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'B915C023-2B5B-48BD-B3CB-312E73BF5721', N'/image/products/56037041-4707-4e5e-b5b8-7642216afac2.jpg', N'5C90941A-3519-4073-86EC-B312B345D732');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'735B4E3F-FB4B-4ADA-9D9E-34550226E281')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'735B4E3F-FB4B-4ADA-9D9E-34550226E281', N'/image/products/product-7.jpg', N'C8F54769-257A-47CB-878E-87718A9EB922');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'1A792484-5AB2-41AE-9C2B-36C5886EA4A8')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'1A792484-5AB2-41AE-9C2B-36C5886EA4A8', N'/image/products/product-1.jpg', N'F1882B3E-AD88-42C9-9007-8B6C5BF611C6');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'129EADDC-E3AC-4DD0-A90A-37A1780C4E20')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'129EADDC-E3AC-4DD0-A90A-37A1780C4E20', N'/image/products/product-11.jpg', N'97E62114-0F58-49C7-81C8-790B48260E4C');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'9BBAFEF9-11B9-454E-AF12-3933CCD28658')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'9BBAFEF9-11B9-454E-AF12-3933CCD28658', N'/image/products/3d923468-1ca9-4671-a44a-89fb0ee3cf93.jpg', N'02B4CAD8-E2DB-4EF7-8DB3-A28B6F204069');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'48027B14-7951-4368-80E1-3F0CDAE94316')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'48027B14-7951-4368-80E1-3F0CDAE94316', N'/image/products/e0bb807a-c775-46de-b188-7de394667f24.jpg', N'02B4CAD8-E2DB-4EF7-8DB3-A28B6F204069');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'C2E09A36-DADE-4745-8008-3F49E7FC471E')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'C2E09A36-DADE-4745-8008-3F49E7FC471E', N'/image/products/product-3.jpg', N'00EC06FA-7536-4E0A-8116-05D1DC535557');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'AA55FABE-37CF-4756-98F8-411942A3D2E2')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'AA55FABE-37CF-4756-98F8-411942A3D2E2', N'/image/products/product-1.jpg', N'99F77AE9-DF4D-4EE7-A998-76B45E00EFAB');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'07EC17D1-794C-4683-837D-41351C2A3408')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'07EC17D1-794C-4683-837D-41351C2A3408', N'/image/products/product-10.jpg', N'97E62114-0F58-49C7-81C8-790B48260E4C');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'7ED29511-DAC1-400F-96C3-43F5EC27DAA7')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'7ED29511-DAC1-400F-96C3-43F5EC27DAA7', N'/image/products/product-5.jpg', N'0C174FB2-4048-435C-B079-07B62E352575');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'40A92105-D6BC-4927-BD84-4A3B35888C7A')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'40A92105-D6BC-4927-BD84-4A3B35888C7A', N'/image/products/product-12.jpg', N'1DB6F02D-F46A-4FDD-8929-991B9DEA5FA9');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'C86E111E-EACA-4177-8FEB-4AC4E320E23D')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'C86E111E-EACA-4177-8FEB-4AC4E320E23D', N'/image/products/product-3.jpg', N'5441A65B-3A20-4C55-95DB-E8E654C47B2D');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'431E88BD-2CF6-4786-B510-4E35B5DC097E')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'431E88BD-2CF6-4786-B510-4E35B5DC097E', N'/image/products/product-11.jpg', N'8B662776-F525-4059-8673-4E9F1AAEC32D');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'D83541F0-519C-40BC-ADFA-51022193873C')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'D83541F0-519C-40BC-ADFA-51022193873C', N'/image/products/d7180897-73ef-41da-a074-e68862578d2d.jpg', N'5C90941A-3519-4073-86EC-B312B345D732');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'AE12FD55-FD36-4DF1-B821-52D6BAC448CD')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'AE12FD55-FD36-4DF1-B821-52D6BAC448CD', N'/image/products/a52675a2-f99d-4be1-a47c-57f3de578f84.jpg', N'5C90941A-3519-4073-86EC-B312B345D732');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'4D2F86BC-30CE-4C83-B494-5493165555F4')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'4D2F86BC-30CE-4C83-B494-5493165555F4', N'/image/products/eb7e5cbc-1a7c-46df-b85c-947ade4c6c1b.jpg', N'5C90941A-3519-4073-86EC-B312B345D732');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'5091A654-3DCE-43D0-94CB-568D708F8C14')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'5091A654-3DCE-43D0-94CB-568D708F8C14', N'/image/products/product-4.jpg', N'61D9A1E8-D000-46EB-93F2-BDF049412D09');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'88766F26-471C-4423-AA7C-572050EEB1BB')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'88766F26-471C-4423-AA7C-572050EEB1BB', N'/image/products/product-9.jpg', N'00EC06FA-7536-4E0A-8116-05D1DC535557');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'A701F6B0-61B2-4B19-8FC9-582AB590860B')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'A701F6B0-61B2-4B19-8FC9-582AB590860B', N'/image/products/product-3.jpg', N'30A37FB2-4CA1-4EDC-8907-7977176E1926');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'4F213C12-2E6F-4899-9A96-5AF878FC8F98')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'4F213C12-2E6F-4899-9A96-5AF878FC8F98', N'/image/products/product-4.jpg', N'0C174FB2-4048-435C-B079-07B62E352575');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'7CF8ED29-7E85-43F8-A7A8-5B71E7E5D92E')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'7CF8ED29-7E85-43F8-A7A8-5B71E7E5D92E', N'/image/products/product-1.jpg', N'CCDF8450-9DA4-420A-8768-A4FA888C7D9A');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'74C745FB-C0C5-42C5-AA47-5C1B6E736995')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'74C745FB-C0C5-42C5-AA47-5C1B6E736995', N'/image/products/product-2.jpg', N'BD0A3027-68CB-4058-9703-F3E876C043EE');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'9A329312-BDF5-48C6-BB7B-62F3D20F440F')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'9A329312-BDF5-48C6-BB7B-62F3D20F440F', N'/image/products/product-1.jpg', N'50DD4049-E0D7-4F56-9195-0B7A946A03CC');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'795A2660-27ED-48F6-83F9-668BECA2B8F7')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'795A2660-27ED-48F6-83F9-668BECA2B8F7', N'/image/products/13b33fa1-068b-4628-8c5f-0ebf93d1e66b.jpg', N'02B4CAD8-E2DB-4EF7-8DB3-A28B6F204069');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'1EB7294F-1D52-4800-90ED-67F02ECBCE6C')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'1EB7294F-1D52-4800-90ED-67F02ECBCE6C', N'/image/products/product-2.jpg', N'B69554EB-91F3-45E0-B81D-A4A2AA93D73B');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'AABD91B6-F4DD-44BA-BE7C-6B6BF9AAF1AC')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'AABD91B6-F4DD-44BA-BE7C-6B6BF9AAF1AC', N'/image/products/product-2.jpg', N'30A37FB2-4CA1-4EDC-8907-7977176E1926');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'43DBA355-7DFB-45B8-8E22-6C424319A7B7')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'43DBA355-7DFB-45B8-8E22-6C424319A7B7', N'/image/products/product-1.jpg', N'315497CA-C797-4FE5-B1C1-DEEFC64CF0B1');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'AAF89726-FF1A-4AF5-9C55-6F0BE5C75907')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'AAF89726-FF1A-4AF5-9C55-6F0BE5C75907', N'/image/products/product-5.jpg', N'471D8BD9-1ABC-462D-9E0F-428151DB2370');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'2B24882F-9DA2-4EF3-A8A3-7052AA852101')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'2B24882F-9DA2-4EF3-A8A3-7052AA852101', N'/image/products/product-5.jpg', N'61D9A1E8-D000-46EB-93F2-BDF049412D09');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'B0D4F9F4-AB76-4225-B2DD-70C62B0156A5')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'B0D4F9F4-AB76-4225-B2DD-70C62B0156A5', N'/image/products/product-7.jpg', N'199D02D2-7C84-4DE3-B750-DCD6902B2429');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'8B08C3EB-D525-42C2-9DF2-75876B407201')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'8B08C3EB-D525-42C2-9DF2-75876B407201', N'/image/products/product-3.jpg', N'F95650A9-0545-4008-8B58-3B4DB41AD0BD');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'2EB3E701-E16B-4045-A2B3-831ECC996376')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'2EB3E701-E16B-4045-A2B3-831ECC996376', N'/image/products/product-8.jpg', N'C8F54769-257A-47CB-878E-87718A9EB922');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'468E96A6-CA25-4E7A-A446-8551C94A813F')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'468E96A6-CA25-4E7A-A446-8551C94A813F', N'/image/products/product-9.jpg', N'3E19D62D-1AAC-4A0A-A85C-10F3BB9C2201');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'F7264DE3-64D5-4377-A0E6-888AE09F8AD6')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'F7264DE3-64D5-4377-A0E6-888AE09F8AD6', N'/image/products/product-1.jpg', N'B936BED7-0E3B-4B89-9AB5-201BEDAE9339');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'64DA77F9-6B33-401D-B96F-8C2133BC5006')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'64DA77F9-6B33-401D-B96F-8C2133BC5006', N'/image/products/product-3.jpg', N'4434E953-AFC7-4CB9-87D0-40A246A2783F');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'B0A1D12F-0FE5-4F09-898E-945F5A70E27D')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'B0A1D12F-0FE5-4F09-898E-945F5A70E27D', N'/image/products/product-5.jpg', N'9A38182E-7243-4657-BFDA-7881629A3B2C');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'536C58DC-4CA3-43E4-9E04-958B83DBA7A0')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'536C58DC-4CA3-43E4-9E04-958B83DBA7A0', N'/image/products/product-2.jpg', N'B936BED7-0E3B-4B89-9AB5-201BEDAE9339');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'1CA09717-687F-4A09-AD1C-969385FF9F53')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'1CA09717-687F-4A09-AD1C-969385FF9F53', N'/image/products/product-6.jpg', N'FAF63FF4-5791-41D0-9C09-78FF925AAD4F');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'CD62A2BB-88BF-4B02-87C2-96A77A3375EF')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'CD62A2BB-88BF-4B02-87C2-96A77A3375EF', N'/image/products/product-5.jpg', N'B0A937DF-F5AD-44E3-88A6-8491BBD1C1D8');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'9F413716-BF3A-4287-B4D8-9962C388F32A')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'9F413716-BF3A-4287-B4D8-9962C388F32A', N'/image/products/product-9.jpg', N'A8BCCA30-8F61-4B20-94FC-6CB4FE484578');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'E2E46451-990C-45D3-982D-9C9CDD9DACCD')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'E2E46451-990C-45D3-982D-9C9CDD9DACCD', N'/image/products/product-13.jpg', N'F0AD0FF8-075B-4A96-A8CC-02455DE0FCCA');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'D416DF01-7035-4AD0-B09D-9CB0AD824D02')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'D416DF01-7035-4AD0-B09D-9CB0AD824D02', N'/image/products/product-3.jpg', N'A388317D-2DD0-423E-8625-3A90FFB0C4C5');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'F4B286C8-11CA-452A-8BE9-9CBA24A4D1C4')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'F4B286C8-11CA-452A-8BE9-9CBA24A4D1C4', N'/image/products/product-4.jpg', N'B69554EB-91F3-45E0-B81D-A4A2AA93D73B');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'DA6D61C8-4F2B-4BE0-972E-9D0BC3807674')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'DA6D61C8-4F2B-4BE0-972E-9D0BC3807674', N'/image/products/6f55bf6c-7474-42dc-a2ce-e5fe710a157a.jpg', N'5C90941A-3519-4073-86EC-B312B345D732');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'01CF24EA-1805-4999-9A96-9F802339E641')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'01CF24EA-1805-4999-9A96-9F802339E641', N'/image/products/product-3.jpg', N'1B1C0D5B-5067-463A-9BEB-04465C6D37C3');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'80790CAF-FB1F-45F8-8761-A0F06C549030')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'80790CAF-FB1F-45F8-8761-A0F06C549030', N'/image/products/product-11.jpg', N'F9FD2813-FBD3-44BF-9D87-E6B0FA4713A9');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'E34AFE75-4C22-4C9E-B65C-A78403B9419B')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'E34AFE75-4C22-4C9E-B65C-A78403B9419B', N'/image/products/product-5.jpg', N'00EC06FA-7536-4E0A-8116-05D1DC535557');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'62242264-FB08-406D-A27E-A8A1E168BB45')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'62242264-FB08-406D-A27E-A8A1E168BB45', N'/image/products/product-1.jpg', N'30A37FB2-4CA1-4EDC-8907-7977176E1926');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'C04BD8A1-A3A7-44DD-A87D-A9930BBF7208')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'C04BD8A1-A3A7-44DD-A87D-A9930BBF7208', N'/image/products/product-9.jpg', N'199D02D2-7C84-4DE3-B750-DCD6902B2429');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'3C95E91F-AB60-404E-BB7C-AD284C41C6B0')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'3C95E91F-AB60-404E-BB7C-AD284C41C6B0', N'/image/products/product-12.jpg', N'8B662776-F525-4059-8673-4E9F1AAEC32D');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'44739EE1-6D83-4B7A-8800-AD8F20D96A48')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'44739EE1-6D83-4B7A-8800-AD8F20D96A48', N'/image/products/product-10.jpg', N'BFDAF989-D8B0-4F55-9C1B-654DEBB059AF');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'5C1D6029-B9BA-41F0-A658-B146FBCAA043')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'5C1D6029-B9BA-41F0-A658-B146FBCAA043', N'/image/products/6dd97bde-8a2f-4994-a699-f743413a992a.jpg', N'5C90941A-3519-4073-86EC-B312B345D732');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'9ADA8784-A559-4DF8-8881-B22F0EAA6A29')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'9ADA8784-A559-4DF8-8881-B22F0EAA6A29', N'/image/products/product-2.jpg', N'4434E953-AFC7-4CB9-87D0-40A246A2783F');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'F7EA71FB-D833-4471-9684-B4EAB5036DF3')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'F7EA71FB-D833-4471-9684-B4EAB5036DF3', N'/image/products/product-8.jpg', N'00EC06FA-7536-4E0A-8116-05D1DC535557');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'686E1054-93AF-4D04-B5D2-B897F4EEBB0A')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'686E1054-93AF-4D04-B5D2-B897F4EEBB0A', N'/image/products/product-5.jpg', N'199D02D2-7C84-4DE3-B750-DCD6902B2429');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'B1416A5A-2526-4ACD-901B-BC78837DF08C')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'B1416A5A-2526-4ACD-901B-BC78837DF08C', N'/image/products/9ef4711b-f45a-42fa-9f87-8457cd98cb98.jpg', N'5C90941A-3519-4073-86EC-B312B345D732');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'7D362940-7941-4F6C-9FA5-C05317B8F93F')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'7D362940-7941-4F6C-9FA5-C05317B8F93F', N'/image/products/product-4.jpg', N'74C7B77B-0FD4-408F-AD32-EAAE37B01F3D');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'77FF9A7B-D354-45B7-8EAD-C5341E7935C0')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'77FF9A7B-D354-45B7-8EAD-C5341E7935C0', N'/image/products/product-1.jpg', N'0C174FB2-4048-435C-B079-07B62E352575');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'30149B92-95F2-4E5E-8C91-CB8F6805B137')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'30149B92-95F2-4E5E-8C91-CB8F6805B137', N'/image/products/product-6.jpg', N'19A9F9F4-083C-4A24-B99D-BBC093C0BAF6');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'0AE65BE2-13D1-450B-BF8C-CDF815461904')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'0AE65BE2-13D1-450B-BF8C-CDF815461904', N'/image/products/6cd0d71c-a406-4494-988a-8a1180c7d45f.jpg', N'02B4CAD8-E2DB-4EF7-8DB3-A28B6F204069');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'FC0BE08F-8354-463B-A11C-CE2E4BA649CA')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'FC0BE08F-8354-463B-A11C-CE2E4BA649CA', N'/image/products/34d5641a-2f4e-4bbe-a63d-a13dc20056b6.jpg', N'5C90941A-3519-4073-86EC-B312B345D732');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'9F583DF3-099A-495F-B846-D630EF307361')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'9F583DF3-099A-495F-B846-D630EF307361', N'/image/products/product-6.jpg', N'199D02D2-7C84-4DE3-B750-DCD6902B2429');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'757B9A96-F1BE-427B-AC55-D6459F08FCC8')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'757B9A96-F1BE-427B-AC55-D6459F08FCC8', N'/image/products/product-1.jpg', N'76920EE9-5DB8-46BE-A2E2-A22C1173FC9A');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'5E96995B-178A-46B5-84CB-DED5BF32BBE9')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'5E96995B-178A-46B5-84CB-DED5BF32BBE9', N'/image/products/product-13.jpg', N'C7F62623-5DE2-4B9C-8B6C-E563B5FDDA41');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'548E889E-CF5C-4ECC-B061-DF8494240CE9')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'548E889E-CF5C-4ECC-B061-DF8494240CE9', N'/image/products/product-4.jpg', N'7C0C834F-818D-4D71-B326-D245FC3F4B9E');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'28A8FE03-E3C0-4412-A380-E14931D26613')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'28A8FE03-E3C0-4412-A380-E14931D26613', N'/image/products/f4da53ee-fcba-4a89-b5fa-220880463af6.jpg', N'02B4CAD8-E2DB-4EF7-8DB3-A28B6F204069');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'5549D1FA-C0F6-4470-AD57-E311918FF9EF')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'5549D1FA-C0F6-4470-AD57-E311918FF9EF', N'/image/products/product-1.jpg', N'180E362B-14E3-4982-A669-FA6ACE14E852');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'826E3F5C-993B-4E2B-8E62-E489A0E60FAE')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'826E3F5C-993B-4E2B-8E62-E489A0E60FAE', N'/image/products/product-7.jpg', N'BFDAF989-D8B0-4F55-9C1B-654DEBB059AF');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'EC046164-2C1A-417A-B586-E98CA66536D6')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'EC046164-2C1A-417A-B586-E98CA66536D6', N'/image/products/product-6.jpg', N'BFDAF989-D8B0-4F55-9C1B-654DEBB059AF');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'E7788ABF-DDCA-420A-9454-EB0409DDD3C4')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'E7788ABF-DDCA-420A-9454-EB0409DDD3C4', N'/image/products/product-2.jpg', N'A388317D-2DD0-423E-8625-3A90FFB0C4C5');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'4529CB66-05B7-4102-A932-EB7205EE25D9')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'4529CB66-05B7-4102-A932-EB7205EE25D9', N'/image/products/product-7.jpg', N'61D9A1E8-D000-46EB-93F2-BDF049412D09');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'DA2BBD0B-6789-4E20-B85F-F7F2B322CE98')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'DA2BBD0B-6789-4E20-B85F-F7F2B322CE98', N'/image/products/product-11.jpg', N'61D9A1E8-D000-46EB-93F2-BDF049412D09');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'8E844437-AB61-4C1D-841D-F84493D8BC8C')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'8E844437-AB61-4C1D-841D-F84493D8BC8C', N'/image/products/product-9.jpg', N'F9FD2813-FBD3-44BF-9D87-E6B0FA4713A9');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'EDB6A80C-CE1E-4737-99A5-FB1BF758A101')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'EDB6A80C-CE1E-4737-99A5-FB1BF758A101', N'/image/products/product-11.jpg', N'A8BCCA30-8F61-4B20-94FC-6CB4FE484578');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'77AB48AB-B155-422F-A00C-FB7097248D13')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'77AB48AB-B155-422F-A00C-FB7097248D13', N'/image/products/product-3.jpg', N'F9FD2813-FBD3-44BF-9D87-E6B0FA4713A9');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'AF94CC2D-ACD4-4DAA-8C9C-FE5502B39CCC')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'AF94CC2D-ACD4-4DAA-8C9C-FE5502B39CCC', N'/image/products/product-6.jpg', N'74C7B77B-0FD4-408F-AD32-EAAE37B01F3D');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookImages] WITH (UPDLOCK, HOLDLOCK) WHERE [Id] = N'73F5C942-D595-4209-ABC4-FE6A2B7A8178')
        INSERT INTO [dbo].[BookImages] ([Id], [ImageUrl], [BookId])
        VALUES (N'73F5C942-D595-4209-ABC4-FE6A2B7A8178', N'/image/products/product-2.jpg', N'CCDF8450-9DA4-420A-8768-A4FA888C7D9A');

    -- BookTags (34 rows)
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'F0AD0FF8-075B-4A96-A8CC-02455DE0FCCA' AND [TagId] = N'5BE80417-D304-4020-934C-1A57A92B93F2')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'F0AD0FF8-075B-4A96-A8CC-02455DE0FCCA', N'5BE80417-D304-4020-934C-1A57A92B93F2', N'1A7DEF31-CF8A-40BB-A320-E84E347700C3');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'3E19D62D-1AAC-4A0A-A85C-10F3BB9C2201' AND [TagId] = N'5BE80417-D304-4020-934C-1A57A92B93F2')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'3E19D62D-1AAC-4A0A-A85C-10F3BB9C2201', N'5BE80417-D304-4020-934C-1A57A92B93F2', N'5080C6FE-22CC-4025-9940-D7B74F8CFDC1');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'3E19D62D-1AAC-4A0A-A85C-10F3BB9C2201' AND [TagId] = N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'3E19D62D-1AAC-4A0A-A85C-10F3BB9C2201', N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309', N'8D01F068-3389-4775-BEC9-D6C20C042835');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'DF38986E-5396-4A76-9695-1364CFA7BD53' AND [TagId] = N'7AF9477B-0AA6-459D-9770-BD810CBEEE88')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'DF38986E-5396-4A76-9695-1364CFA7BD53', N'7AF9477B-0AA6-459D-9770-BD810CBEEE88', N'11575211-C007-40DD-8ED2-216DC1AF961E');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'B936BED7-0E3B-4B89-9AB5-201BEDAE9339' AND [TagId] = N'5BE80417-D304-4020-934C-1A57A92B93F2')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'B936BED7-0E3B-4B89-9AB5-201BEDAE9339', N'5BE80417-D304-4020-934C-1A57A92B93F2', N'9B8FE91E-C1F3-48F1-909B-60FE0DBF0CFE');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'A388317D-2DD0-423E-8625-3A90FFB0C4C5' AND [TagId] = N'5BE80417-D304-4020-934C-1A57A92B93F2')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'A388317D-2DD0-423E-8625-3A90FFB0C4C5', N'5BE80417-D304-4020-934C-1A57A92B93F2', N'90F6D690-DA23-418F-ABC7-5163A8F0E38C');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'F95650A9-0545-4008-8B58-3B4DB41AD0BD' AND [TagId] = N'7AF9477B-0AA6-459D-9770-BD810CBEEE88')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'F95650A9-0545-4008-8B58-3B4DB41AD0BD', N'7AF9477B-0AA6-459D-9770-BD810CBEEE88', N'7E9A2A77-0C1F-4B0A-AB1F-F869738A52B0');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'4434E953-AFC7-4CB9-87D0-40A246A2783F' AND [TagId] = N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'4434E953-AFC7-4CB9-87D0-40A246A2783F', N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309', N'E91F8EF2-F7D6-4EAD-8B96-3A6032CEA5FA');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'471D8BD9-1ABC-462D-9E0F-428151DB2370' AND [TagId] = N'7AF9477B-0AA6-459D-9770-BD810CBEEE88')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'471D8BD9-1ABC-462D-9E0F-428151DB2370', N'7AF9477B-0AA6-459D-9770-BD810CBEEE88', N'29E7CD42-9EE0-46BE-99B9-18B9785C0A53');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'8B662776-F525-4059-8673-4E9F1AAEC32D' AND [TagId] = N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'8B662776-F525-4059-8673-4E9F1AAEC32D', N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309', N'FACC5981-3C34-4CD4-AB84-F112D27CED83');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'8B662776-F525-4059-8673-4E9F1AAEC32D' AND [TagId] = N'7AF9477B-0AA6-459D-9770-BD810CBEEE88')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'8B662776-F525-4059-8673-4E9F1AAEC32D', N'7AF9477B-0AA6-459D-9770-BD810CBEEE88', N'77EDDD7D-A303-4928-8FBC-C5B31DF1A574');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'99F77AE9-DF4D-4EE7-A998-76B45E00EFAB' AND [TagId] = N'7AF9477B-0AA6-459D-9770-BD810CBEEE88')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'99F77AE9-DF4D-4EE7-A998-76B45E00EFAB', N'7AF9477B-0AA6-459D-9770-BD810CBEEE88', N'024C23F7-D698-4E71-835F-09A546C33A3C');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'9A38182E-7243-4657-BFDA-7881629A3B2C' AND [TagId] = N'5BE80417-D304-4020-934C-1A57A92B93F2')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'9A38182E-7243-4657-BFDA-7881629A3B2C', N'5BE80417-D304-4020-934C-1A57A92B93F2', N'AAD54BD1-4965-4552-86BA-A812BE8DC4E6');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'9A38182E-7243-4657-BFDA-7881629A3B2C' AND [TagId] = N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'9A38182E-7243-4657-BFDA-7881629A3B2C', N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309', N'9E78E584-3863-4FA7-9C7B-79BB5E7356B3');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'FAF63FF4-5791-41D0-9C09-78FF925AAD4F' AND [TagId] = N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'FAF63FF4-5791-41D0-9C09-78FF925AAD4F', N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5', N'54B4F7B1-6455-4105-9C87-AE8CD6EAF044');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'0FB62CDC-0945-4394-ABC4-7B16D419331C' AND [TagId] = N'7AF9477B-0AA6-459D-9770-BD810CBEEE88')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'0FB62CDC-0945-4394-ABC4-7B16D419331C', N'7AF9477B-0AA6-459D-9770-BD810CBEEE88', N'6038FBBF-1742-4382-B318-5A0C19FEE095');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'B0A937DF-F5AD-44E3-88A6-8491BBD1C1D8' AND [TagId] = N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'B0A937DF-F5AD-44E3-88A6-8491BBD1C1D8', N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5', N'F8B09A75-61C2-463C-BF74-CA0E3DE13D28');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'C8F54769-257A-47CB-878E-87718A9EB922' AND [TagId] = N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'C8F54769-257A-47CB-878E-87718A9EB922', N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309', N'5CEA89D6-5977-400A-80CD-9B77155A1DD6');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'299B605B-A1E7-4C1D-94CD-8B00BA87A6EC' AND [TagId] = N'5BE80417-D304-4020-934C-1A57A92B93F2')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'299B605B-A1E7-4C1D-94CD-8B00BA87A6EC', N'5BE80417-D304-4020-934C-1A57A92B93F2', N'E07E1AB6-2FAB-434E-BFF9-70C903205E94');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'F1882B3E-AD88-42C9-9007-8B6C5BF611C6' AND [TagId] = N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'F1882B3E-AD88-42C9-9007-8B6C5BF611C6', N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309', N'19EE17B0-0F84-49D0-93A6-AE5D99C658EC');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'7EB8EE63-DBEC-4889-A99C-9F557A3506C8' AND [TagId] = N'7AF9477B-0AA6-459D-9770-BD810CBEEE88')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'7EB8EE63-DBEC-4889-A99C-9F557A3506C8', N'7AF9477B-0AA6-459D-9770-BD810CBEEE88', N'FEC26BBC-B620-4B6A-8EA5-FC459D98F789');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'02B4CAD8-E2DB-4EF7-8DB3-A28B6F204069' AND [TagId] = N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'02B4CAD8-E2DB-4EF7-8DB3-A28B6F204069', N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309', N'624A0ABA-E3F7-400C-AFEB-53A06EAAB084');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'02B4CAD8-E2DB-4EF7-8DB3-A28B6F204069' AND [TagId] = N'7AF9477B-0AA6-459D-9770-BD810CBEEE88')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'02B4CAD8-E2DB-4EF7-8DB3-A28B6F204069', N'7AF9477B-0AA6-459D-9770-BD810CBEEE88', N'ADD6B230-75EC-4B09-AD1E-8D560AD405B6');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'CCDF8450-9DA4-420A-8768-A4FA888C7D9A' AND [TagId] = N'5BE80417-D304-4020-934C-1A57A92B93F2')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'CCDF8450-9DA4-420A-8768-A4FA888C7D9A', N'5BE80417-D304-4020-934C-1A57A92B93F2', N'C2560AEF-366D-4D3E-8837-9C36CB6348D5');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'5C90941A-3519-4073-86EC-B312B345D732' AND [TagId] = N'5BE80417-D304-4020-934C-1A57A92B93F2')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'5C90941A-3519-4073-86EC-B312B345D732', N'5BE80417-D304-4020-934C-1A57A92B93F2', N'6D903061-E727-431E-8308-1E4DE842C309');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'5C90941A-3519-4073-86EC-B312B345D732' AND [TagId] = N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'5C90941A-3519-4073-86EC-B312B345D732', N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5', N'E06043D2-EB0A-4E0B-AB80-C85454C6332C');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'19A9F9F4-083C-4A24-B99D-BBC093C0BAF6' AND [TagId] = N'5BE80417-D304-4020-934C-1A57A92B93F2')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'19A9F9F4-083C-4A24-B99D-BBC093C0BAF6', N'5BE80417-D304-4020-934C-1A57A92B93F2', N'3AEC22AC-3C55-46C0-A724-435927D6BF50');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'7C0C834F-818D-4D71-B326-D245FC3F4B9E' AND [TagId] = N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'7C0C834F-818D-4D71-B326-D245FC3F4B9E', N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5', N'778258E8-704D-419D-840D-EA1A1B434543');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'315497CA-C797-4FE5-B1C1-DEEFC64CF0B1' AND [TagId] = N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'315497CA-C797-4FE5-B1C1-DEEFC64CF0B1', N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5', N'079584D9-AE41-46F8-A25C-F4628F4D6AFB');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'C7F62623-5DE2-4B9C-8B6C-E563B5FDDA41' AND [TagId] = N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'C7F62623-5DE2-4B9C-8B6C-E563B5FDDA41', N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309', N'1E278A88-CFF9-4693-B918-1693697341B3');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'5441A65B-3A20-4C55-95DB-E8E654C47B2D' AND [TagId] = N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'5441A65B-3A20-4C55-95DB-E8E654C47B2D', N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5', N'7C3DB4B8-3069-417E-BE9F-5C2C9E335DDE');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'74C7B77B-0FD4-408F-AD32-EAAE37B01F3D' AND [TagId] = N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'74C7B77B-0FD4-408F-AD32-EAAE37B01F3D', N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309', N'DC89EBEB-3C22-4472-93D4-EA51DCF20EBD');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'BD0A3027-68CB-4058-9703-F3E876C043EE' AND [TagId] = N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'BD0A3027-68CB-4058-9703-F3E876C043EE', N'B2BF74A9-E711-4949-BC11-D9A0FB3765E5', N'93F0668F-3BFD-4471-8738-127C52FE7BCF');
    IF NOT EXISTS (SELECT 1 FROM [dbo].[BookTags] WITH (UPDLOCK, HOLDLOCK) WHERE [BookId] = N'180E362B-14E3-4982-A669-FA6ACE14E852' AND [TagId] = N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309')
        INSERT INTO [dbo].[BookTags] ([BookId], [TagId], [Id])
        VALUES (N'180E362B-14E3-4982-A669-FA6ACE14E852', N'8D640B8E-8F51-43E0-8D38-9A1CBA90B309', N'F93638C5-E05B-415E-BB82-C81FAEC3C991');

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
    THROW;
END CATCH;
