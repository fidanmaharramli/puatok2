-- Homepage section membership copied from the static Index.cshtml cards.
-- Best sellers is a template selection, not calculated sales data.
-- Additive and repeatable: existing tags and relationships are preserved.
SET NOCOUNT ON;
SET XACT_ABORT ON;
DECLARE @Source TABLE(Tag nvarchar(50),Author nvarchar(50),Name nvarchar(100));
INSERT @Source VALUES
(N'Deal of the day',N'Ypple',N'Do You Really Need It? This Will Help You'),
(N'Deal of the day',N'Upple',N'Here Is A Quick Cure For Book'),
(N'Deal of the day',N'Ypple',N'a Half Very Simple Things You To Save'),
(N'Deal of the day',N'Epple',N'What You Can Learn From Bill Gates'),
(N'Deal of the day',N'Rpple',N'Create Better BOOK With The Help Of Your'),
(N'Deal of the day',N'Tpple',N'Turn Your BOOK Into High Machine'),
(N'Deal of the day',N'Mpple',N'Revolutionize Your BOOK With These Easy'),
(N'Best sellers',N'Rpple',N'Do You Really Need It? This Will Help You'),
(N'Best sellers',N'Epple',N'Here Is Quick Cure BOOK This Will Help'),
(N'Best sellers',N'Wpple',N'Do You Really Need It? This Will Help You'),
(N'Best sellers',N'Ypple',N'Very Simple Things You Can Save BOOK'),
(N'Best sellers',N'Mople',N'What You Can Learn From Bill Gates'),
(N'Best sellers',N'Cpple',N'3 Ways Create Better BOOK With Help'),
(N'Children',N'Rpple',N'Revolutionize Your BOOK With'),
(N'Children',N'Dpple',N'Turn Your BOOK Into High Machine'),
(N'Children',N'Epple',N'BOOK: Do You Really Need It? This'),
(N'Children',N'Ppple',N'Here Is A Quick Cure For Book'),
(N'Children',N'Ypple',N'What You Can Learn From Bill Gates'),
(N'Children',N'Wpple',N'3 Ways Create Better BOOK With'),
(N'Arts & Photography',N'Lpple',N'Revolutionize Your BOOK With These Easy'),
(N'Arts & Photography',N'Jpple',N'Turn Your BOOK Into High Machine'),
(N'Arts & Photography',N'Wpple',N'Create Better BOOK With The Help Of Your'),
(N'Arts & Photography',N'Epple',N'What You Can Learn From Bill Gates'),
(N'Arts & Photography',N'Hpple',N'a Half Very Simple Things You To Save'),
(N'Arts & Photography',N'Bpple',N'Here Is A Quick Cure For Book'),
(N'Arts & Photography',N'zpple',N'Do You Really Need It? This Will Help You');
BEGIN TRANSACTION;
DECLARE @LockResult int;
EXEC @LockResult=sys.sp_getapplock @Resource=N'PustokHomeSectionsSeed',
    @LockMode='Exclusive',@LockOwner='Transaction';
IF @LockResult<0 THROW 50001, 'Could not acquire section seed lock.',1;
IF EXISTS(SELECT 1 FROM @Source s WHERE
    (SELECT COUNT(*) FROM dbo.Books b JOIN dbo.Authors a ON a.Id=b.AuthorId
     WHERE a.FullName=s.Author AND b.Name=s.Name)<>1)
    THROW 50002, 'Each source card must match exactly one database book.',1;
IF EXISTS(SELECT t.Name FROM dbo.Tags t JOIN (SELECT DISTINCT Tag FROM @Source) s
    ON s.Tag=t.Name GROUP BY t.Name HAVING COUNT(*)>1)
    THROW 50003, 'Duplicate section tags require review.',1;
INSERT dbo.Tags(Id,Name)
SELECT NEWID(),s.Tag FROM (SELECT DISTINCT Tag FROM @Source) s
WHERE NOT EXISTS(SELECT 1 FROM dbo.Tags t WHERE t.Name=s.Tag);
INSERT dbo.BookTags(Id,BookId,TagId)
SELECT NEWID(),b.Id,t.Id FROM @Source s
JOIN dbo.Authors a ON a.FullName=s.Author
JOIN dbo.Books b ON b.AuthorId=a.Id AND b.Name=s.Name
JOIN dbo.Tags t ON t.Name=s.Tag
WHERE NOT EXISTS(SELECT 1 FROM dbo.BookTags bt WHERE bt.BookId=b.Id AND bt.TagId=t.Id);
IF EXISTS(
    SELECT Tag,Author,Name FROM @Source
    EXCEPT SELECT t.Name,a.FullName,b.Name FROM dbo.BookTags bt
    JOIN dbo.Tags t ON t.Id=bt.TagId JOIN dbo.Books b ON b.Id=bt.BookId
    JOIN dbo.Authors a ON a.Id=b.AuthorId)
    THROW 50004, 'Section membership verification failed.',1;
COMMIT;
SELECT t.Name,COUNT(*) AS BookCount FROM dbo.BookTags bt JOIN dbo.Tags t ON t.Id=bt.TagId
WHERE t.Name IN(SELECT Tag FROM @Source) GROUP BY t.Name ORDER BY t.Name;