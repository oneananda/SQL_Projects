-- Declare a variable to hold the job ID
DECLARE @job_id UNIQUEIDENTIFIER;

-- Create a job to perform daily database backups
EXEC msdb.dbo.sp_add_job
    @job_name = N'Daily Database Backup',  -- Name of the job
    @enabled = 1,  -- Enable the job
    @description = N'Backup database every day at midnight',  -- Description of the job
    @owner_login_name = N'sa',  -- Owner of the job
    @job_id = @job_id OUTPUT;  -- Output parameter to get the job ID

-- Add a job step to perform the backup
EXEC msdb.dbo.sp_add_jobstep
    @job_id = @job_id,  -- Job ID
    @step_name = N'Backup Step',  -- Name of the step
    @subsystem = N'TSQL',  -- Subsystem (Transact-SQL)
    @command = N'BACKUP DATABASE [YourDatabase] TO DISK = N''C:\Backup\YourDatabase_'' + CONVERT(VARCHAR(8), GETDATE(), 112) + ''.bak''',  -- Command to perform the backup with date-stamped file name
    @retry_attempts = 3,  -- Number of retry attempts
    @retry_interval = 5;  -- Retry interval in minutes

-- Add a schedule to the job
EXEC msdb.dbo.sp_add_jobschedule
    @job_id = @job_id,  -- Job ID
    @name = N'Daily Schedule',  -- Name of the schedule
    @freq_type = 4,  -- Frequency type (daily)
    @freq_interval = 1,  -- Frequency interval (every day)
    @active_start_time = 000000;  -- Start time (midnight)

-- Add the job to the server
EXEC msdb.dbo.sp_add_jobserver
    @job_id = @job_id,  -- Job ID
    @server_name = N'(local)';  -- Server name
