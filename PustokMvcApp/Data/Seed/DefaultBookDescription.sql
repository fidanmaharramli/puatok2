-- Fill missing descriptions without replacing individually written descriptions.
SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRANSACTION;

UPDATE dbo.Books
SET Description = N'Bu kitab haqqında ətraflı məlumat tezliklə əlavə ediləcək. Müəllif, qiymət və stok vəziyyəti ilə məhsul səhifəsində tanış ola bilərsiniz.'
WHERE Description IS NULL
   OR LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(Description, CHAR(9), ' '), CHAR(10), ' '), CHAR(13), ' '))) = N'';

SELECT @@ROWCOUNT AS UpdatedBooks;

COMMIT TRANSACTION;

SELECT COUNT(*) AS TotalBooks,
    SUM(CASE WHEN NULLIF(LTRIM(RTRIM(Description)), N'') IS NULL THEN 1 ELSE 0 END) AS EmptyDescriptions
FROM dbo.Books;
