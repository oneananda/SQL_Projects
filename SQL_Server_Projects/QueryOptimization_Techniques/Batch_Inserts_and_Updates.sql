/*
Batch Inserts and Updates : Performance tuning
Instead of inserting or updating rows one at a time, process them in batches to reduce performance overhead.
*/

-- Non-Optimized Multiple Insertion

-- Non-optimized approach: Separate INSERT statements
INSERT INTO Users (Name, Age) VALUES ('Abc', 28);
INSERT INTO Users (Name, Age) VALUES ('Xyz', 32);
INSERT INTO Users (Name, Age) VALUES ('Pqrs', 25);


-- Optimized Multiple Insertion

--Optimized multiple insertion aims to 
--minimize round-trips and improve performance 
--by inserting multiple rows in a single operation.

INSERT INTO Users (Name, Age)
VALUES
    ('Abc', 28),
    ('Xyz', 32),
    ('Pqrs', 25);

-- Using INSERT INTO ... SELECT for Inserting from Another Table or Query

INSERT INTO TargetTable (Column1, Column2)
SELECT ColumnA, ColumnB
FROM SourceTable
WHERE 1 = 1; -- Apply your condition here



-- Using MERGE statements


-- Creating a SourceTable
CREATE TABLE SourceTable  (
  ID INT IDENTITY(1, 1),
  Processed int,
  Column1 VARCHAR(255),  
  Column2 VARCHAR(255),
);

-- Creating a TargetTable
CREATE TABLE TargetTable  (
  ID INT IDENTITY(1, 1),
  Column1 VARCHAR(255),  
  Column2 VARCHAR(255),
);



INSERT INTO SourceTable(Processed, Column1, Column2) 
VALUES 
(0, 'Lorem ipsum dolor sit amet', 'Consectetur adipiscing elit. Morbi eleifend magna et ligula lobortis, at sollicitudin mi semper.'),
(0, 'Sed do eiusmod tempor incididunt', 'Ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
(0, 'Duis aute irure dolor in reprehenderit', 'In voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(0, 'Sunt in culpa qui officia deserunt', 'Mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.'),
(0, 'Eaque ipsa quae ab illo inventore', 'Veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.'),
(0, 'Sed ut perspiciatis unde omnis iste', 'Natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi.'),
(0, 'Architecto beatae vitae dicta sunt explicabo', 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.'),
(0, 'Neque porro quisquam est', 'Qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.'),
(0, 'Ut enim ad minima veniam', 'Quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam.'),
(0, 'At vero eos et accusamus', 'Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.'),
(0, 'Similique sunt in culpa', 'Qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.'),
(0, 'Nam libero tempore', '***** soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est omnis dolor repellendus.'),
(0, 'Temporibus autem quibusdam', 'Et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.'),
(0, 'Itaque earum rerum hic tenetur a sapiente', 'Delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.'),
(0, 'Lorem ipsum dolor sit amet', 'Consectetur adipiscing elit. Morbi eleifend magna et ligula lobortis, at sollicitudin mi semper.'),
(0, 'Sed do eiusmod tempor incididunt', 'Ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
(0, 'Duis aute irure dolor in reprehenderit', 'In voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(0, 'Sunt in culpa qui officia deserunt', 'Mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.'),
(0, 'Eaque ipsa quae ab illo inventore', 'Veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.'),
(0, 'Sed ut perspiciatis unde omnis iste', 'Natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi.'),
(0, 'Architecto beatae vitae dicta sunt explicabo', 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.'),
(0, 'Neque porro quisquam est', 'Qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.'),
(0, 'Ut enim ad minima veniam', 'Quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam.'),
(0, 'At vero eos et accusamus', 'Et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.'),
(0, 'Similique sunt in culpa', 'Qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.'),
(0, 'Nam libero tempore', '***** soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est omnis dolor repellendus.'),
(0, 'Temporibus autem quibusdam', 'Et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.'),
(0, 'Itaque earum rerum hic tenetur a sapiente', 'Delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.'),
(0, 'Lorem ipsum dolor sit amet', 'Consectetur adipiscing elit. Morbi eleifend magna et ligula lobortis, at sollicitudin mi semper.'),
(0, 'Sed do eiusmod tempor incididunt', 'Ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
(0, 'Duis aute irure dolor in reprehenderit', 'In voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(0, 'Sunt in culpa qui officia deserunt', 'Mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.'),
(0, 'Eaque ipsa quae ab illo inventore', 'Veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.'),
(0, 'Sed ut perspiciatis unde omnis iste', 'Natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi.'),
(0, 'Architecto beatae vitae dicta sunt explicabo', 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.'),
(0, 'Neque porro quisquam est', 'Qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.'),
(0, 'Ut enim ad minima veniam', 'Quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam.')

--select * from SourceTable


DECLARE @BatchSize INT = 5;
DECLARE @RowsInserted INT = 1;

WHILE (@RowsInserted > 0)
BEGIN
    BEGIN TRANSACTION;

    -- Insert rows in batches
    INSERT INTO TargetTable (Column1, Column2)
    SELECT TOP (@BatchSize) Column1, Column2
    FROM SourceTable
    WHERE Processed = 0;

    SET @RowsInserted = @@ROWCOUNT;

    -- Mark rows as processed
    UPDATE TOP (@BatchSize) SourceTable 
    SET Processed = 1 
    WHERE Processed = 0;

    COMMIT TRANSACTION;
END;

select * from TargetTable


/*
The same example is available for execution at : https://onecompiler.com/sqlserver/42hmwme9x
*/


