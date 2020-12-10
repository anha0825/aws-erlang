%% WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
%% See https://github.com/aws-beam/aws-codegen for more details.

%% @doc Amazon DynamoDB
%%
%% Amazon DynamoDB is a fully managed NoSQL database service that provides
%% fast and predictable performance with seamless scalability.
%%
%% DynamoDB lets you offload the administrative burdens of operating and
%% scaling a distributed database, so that you don't have to worry about
%% hardware provisioning, setup and configuration, replication, software
%% patching, or cluster scaling.
%%
%% With DynamoDB, you can create database tables that can store and retrieve
%% any amount of data, and serve any level of request traffic. You can scale
%% up or scale down your tables' throughput capacity without downtime or
%% performance degradation, and use the AWS Management Console to monitor
%% resource utilization and performance metrics.
%%
%% DynamoDB automatically spreads the data and traffic for your tables over a
%% sufficient number of servers to handle your throughput and storage
%% requirements, while maintaining consistent and fast performance. All of
%% your data is stored on solid state disks (SSDs) and automatically
%% replicated across multiple Availability Zones in an AWS region, providing
%% built-in high availability and data durability.
-module(aws_dynamodb).

-export([batch_execute_statement/2,
         batch_execute_statement/3,
         batch_get_item/2,
         batch_get_item/3,
         batch_write_item/2,
         batch_write_item/3,
         create_backup/2,
         create_backup/3,
         create_global_table/2,
         create_global_table/3,
         create_table/2,
         create_table/3,
         delete_backup/2,
         delete_backup/3,
         delete_item/2,
         delete_item/3,
         delete_table/2,
         delete_table/3,
         describe_backup/2,
         describe_backup/3,
         describe_continuous_backups/2,
         describe_continuous_backups/3,
         describe_contributor_insights/2,
         describe_contributor_insights/3,
         describe_endpoints/2,
         describe_endpoints/3,
         describe_export/2,
         describe_export/3,
         describe_global_table/2,
         describe_global_table/3,
         describe_global_table_settings/2,
         describe_global_table_settings/3,
         describe_kinesis_streaming_destination/2,
         describe_kinesis_streaming_destination/3,
         describe_limits/2,
         describe_limits/3,
         describe_table/2,
         describe_table/3,
         describe_table_replica_auto_scaling/2,
         describe_table_replica_auto_scaling/3,
         describe_time_to_live/2,
         describe_time_to_live/3,
         disable_kinesis_streaming_destination/2,
         disable_kinesis_streaming_destination/3,
         enable_kinesis_streaming_destination/2,
         enable_kinesis_streaming_destination/3,
         execute_statement/2,
         execute_statement/3,
         execute_transaction/2,
         execute_transaction/3,
         export_table_to_point_in_time/2,
         export_table_to_point_in_time/3,
         get_item/2,
         get_item/3,
         list_backups/2,
         list_backups/3,
         list_contributor_insights/2,
         list_contributor_insights/3,
         list_exports/2,
         list_exports/3,
         list_global_tables/2,
         list_global_tables/3,
         list_tables/2,
         list_tables/3,
         list_tags_of_resource/2,
         list_tags_of_resource/3,
         put_item/2,
         put_item/3,
         query/2,
         query/3,
         restore_table_from_backup/2,
         restore_table_from_backup/3,
         restore_table_to_point_in_time/2,
         restore_table_to_point_in_time/3,
         scan/2,
         scan/3,
         tag_resource/2,
         tag_resource/3,
         transact_get_items/2,
         transact_get_items/3,
         transact_write_items/2,
         transact_write_items/3,
         untag_resource/2,
         untag_resource/3,
         update_continuous_backups/2,
         update_continuous_backups/3,
         update_contributor_insights/2,
         update_contributor_insights/3,
         update_global_table/2,
         update_global_table/3,
         update_global_table_settings/2,
         update_global_table_settings/3,
         update_item/2,
         update_item/3,
         update_table/2,
         update_table/3,
         update_table_replica_auto_scaling/2,
         update_table_replica_auto_scaling/3,
         update_time_to_live/2,
         update_time_to_live/3]).

-include_lib("hackney/include/hackney_lib.hrl").

%%====================================================================
%% API
%%====================================================================

%% @doc This operation allows you to perform batch reads and writes on data
%% stored in DynamoDB, using PartiQL.
batch_execute_statement(Client, Input)
  when is_map(Client), is_map(Input) ->
    batch_execute_statement(Client, Input, []).
batch_execute_statement(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"BatchExecuteStatement">>, Input, Options).

%% @doc The `BatchGetItem' operation returns the attributes of one or more
%% items from one or more tables.
%%
%% You identify requested items by primary key.
%%
%% A single operation can retrieve up to 16 MB of data, which can contain as
%% many as 100 items. `BatchGetItem' returns a partial result if the response
%% size limit is exceeded, the table's provisioned throughput is exceeded, or
%% an internal processing failure occurs. If a partial result is returned,
%% the operation returns a value for `UnprocessedKeys'. You can use this
%% value to retry the operation starting with the next item to get.
%%
%% If you request more than 100 items, `BatchGetItem' returns a
%% `ValidationException' with the message "Too many items requested for the
%% BatchGetItem call."
%%
%% For example, if you ask to retrieve 100 items, but each individual item is
%% 300 KB in size, the system returns 52 items (so as not to exceed the 16 MB
%% limit). It also returns an appropriate `UnprocessedKeys' value so you can
%% get the next page of results. If desired, your application can include its
%% own logic to assemble the pages of results into one dataset.
%%
%% If none of the items can be processed due to insufficient provisioned
%% throughput on all of the tables in the request, then `BatchGetItem'
%% returns a `ProvisionedThroughputExceededException'. If at least one of the
%% items is successfully processed, then `BatchGetItem' completes
%% successfully, while returning the keys of the unread items in
%% `UnprocessedKeys'.
%%
%% If DynamoDB returns any unprocessed items, you should retry the batch
%% operation on those items. However, we strongly recommend that you use an
%% exponential backoff algorithm. If you retry the batch operation
%% immediately, the underlying read or write requests can still fail due to
%% throttling on the individual tables. If you delay the batch operation
%% using exponential backoff, the individual requests in the batch are much
%% more likely to succeed.
%%
%% For more information, see Batch Operations and Error Handling in the
%% Amazon DynamoDB Developer Guide.
%%
%% By default, `BatchGetItem' performs eventually consistent reads on every
%% table in the request. If you want strongly consistent reads instead, you
%% can set `ConsistentRead' to `true' for any or all tables.
%%
%% In order to minimize response latency, `BatchGetItem' retrieves items in
%% parallel.
%%
%% When designing your application, keep in mind that DynamoDB does not
%% return items in any particular order. To help parse the response by item,
%% include the primary key values for the items in your request in the
%% `ProjectionExpression' parameter.
%%
%% If a requested item does not exist, it is not returned in the result.
%% Requests for nonexistent items consume the minimum read capacity units
%% according to the type of read. For more information, see Working with
%% Tables in the Amazon DynamoDB Developer Guide.
batch_get_item(Client, Input)
  when is_map(Client), is_map(Input) ->
    batch_get_item(Client, Input, []).
batch_get_item(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"BatchGetItem">>, Input, Options).

%% @doc The `BatchWriteItem' operation puts or deletes multiple items in one
%% or more tables.
%%
%% A single call to `BatchWriteItem' can write up to 16 MB of data, which can
%% comprise as many as 25 put or delete requests. Individual items to be
%% written can be as large as 400 KB.
%%
%% `BatchWriteItem' cannot update items. To update items, use the
%% `UpdateItem' action.
%%
%% The individual `PutItem' and `DeleteItem' operations specified in
%% `BatchWriteItem' are atomic; however `BatchWriteItem' as a whole is not.
%% If any requested operations fail because the table's provisioned
%% throughput is exceeded or an internal processing failure occurs, the
%% failed operations are returned in the `UnprocessedItems' response
%% parameter. You can investigate and optionally resend the requests.
%% Typically, you would call `BatchWriteItem' in a loop. Each iteration would
%% check for unprocessed items and submit a new `BatchWriteItem' request with
%% those unprocessed items until all items have been processed.
%%
%% If none of the items can be processed due to insufficient provisioned
%% throughput on all of the tables in the request, then `BatchWriteItem'
%% returns a `ProvisionedThroughputExceededException'.
%%
%% If DynamoDB returns any unprocessed items, you should retry the batch
%% operation on those items. However, we strongly recommend that you use an
%% exponential backoff algorithm. If you retry the batch operation
%% immediately, the underlying read or write requests can still fail due to
%% throttling on the individual tables. If you delay the batch operation
%% using exponential backoff, the individual requests in the batch are much
%% more likely to succeed.
%%
%% For more information, see Batch Operations and Error Handling in the
%% Amazon DynamoDB Developer Guide.
%%
%% With `BatchWriteItem', you can efficiently write or delete large amounts
%% of data, such as from Amazon EMR, or copy data from another database into
%% DynamoDB. In order to improve performance with these large-scale
%% operations, `BatchWriteItem' does not behave in the same way as individual
%% `PutItem' and `DeleteItem' calls would. For example, you cannot specify
%% conditions on individual put and delete requests, and `BatchWriteItem'
%% does not return deleted items in the response.
%%
%% If you use a programming language that supports concurrency, you can use
%% threads to write items in parallel. Your application must include the
%% necessary logic to manage the threads. With languages that don't support
%% threading, you must update or delete the specified items one at a time. In
%% both situations, `BatchWriteItem' performs the specified put and delete
%% operations in parallel, giving you the power of the thread pool approach
%% without having to introduce complexity into your application.
%%
%% Parallel processing reduces latency, but each specified put and delete
%% request consumes the same number of write capacity units whether it is
%% processed in parallel or not. Delete operations on nonexistent items
%% consume one write capacity unit.
%%
%% If one or more of the following is true, DynamoDB rejects the entire batch
%% write operation:
%%
%% <ul> <li> One or more tables specified in the `BatchWriteItem' request
%% does not exist.
%%
%% </li> <li> Primary key attributes specified on an item in the request do
%% not match those in the corresponding table's primary key schema.
%%
%% </li> <li> You try to perform multiple operations on the same item in the
%% same `BatchWriteItem' request. For example, you cannot put and delete the
%% same item in the same `BatchWriteItem' request.
%%
%% </li> <li> Your request contains at least two items with identical hash
%% and range keys (which essentially is two put operations).
%%
%% </li> <li> There are more than 25 requests in the batch.
%%
%% </li> <li> Any individual item in a batch exceeds 400 KB.
%%
%% </li> <li> The total request size exceeds 16 MB.
%%
%% </li> </ul>
batch_write_item(Client, Input)
  when is_map(Client), is_map(Input) ->
    batch_write_item(Client, Input, []).
batch_write_item(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"BatchWriteItem">>, Input, Options).

%% @doc Creates a backup for an existing table.
%%
%% Each time you create an on-demand backup, the entire table data is backed
%% up. There is no limit to the number of on-demand backups that can be
%% taken.
%%
%% When you create an on-demand backup, a time marker of the request is
%% cataloged, and the backup is created asynchronously, by applying all
%% changes until the time of the request to the last full table snapshot.
%% Backup requests are processed instantaneously and become available for
%% restore within minutes.
%%
%% You can call `CreateBackup' at a maximum rate of 50 times per second.
%%
%% All backups in DynamoDB work without consuming any provisioned throughput
%% on the table.
%%
%% If you submit a backup request on 2018-12-14 at 14:25:00, the backup is
%% guaranteed to contain all data committed to the table up to 14:24:00, and
%% data committed after 14:26:00 will not be. The backup might contain data
%% modifications made between 14:24:00 and 14:26:00. On-demand backup does
%% not support causal consistency.
%%
%% Along with data, the following are also included on the backups:
%%
%% <ul> <li> Global secondary indexes (GSIs)
%%
%% </li> <li> Local secondary indexes (LSIs)
%%
%% </li> <li> Streams
%%
%% </li> <li> Provisioned read and write capacity
%%
%% </li> </ul>
create_backup(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_backup(Client, Input, []).
create_backup(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateBackup">>, Input, Options).

%% @doc Creates a global table from an existing table.
%%
%% A global table creates a replication relationship between two or more
%% DynamoDB tables with the same table name in the provided Regions.
%%
%% This operation only applies to Version 2017.11.29 of global tables.
%%
%% If you want to add a new replica table to a global table, each of the
%% following conditions must be true:
%%
%% <ul> <li> The table must have the same primary key as all of the other
%% replicas.
%%
%% </li> <li> The table must have the same name as all of the other replicas.
%%
%% </li> <li> The table must have DynamoDB Streams enabled, with the stream
%% containing both the new and the old images of the item.
%%
%% </li> <li> None of the replica tables in the global table can contain any
%% data.
%%
%% </li> </ul> If global secondary indexes are specified, then the following
%% conditions must also be met:
%%
%% <ul> <li> The global secondary indexes must have the same name.
%%
%% </li> <li> The global secondary indexes must have the same hash key and
%% sort key (if present).
%%
%% </li> </ul> If local secondary indexes are specified, then the following
%% conditions must also be met:
%%
%% <ul> <li> The local secondary indexes must have the same name.
%%
%% </li> <li> The local secondary indexes must have the same hash key and
%% sort key (if present).
%%
%% </li> </ul> Write capacity settings should be set consistently across your
%% replica tables and secondary indexes. DynamoDB strongly recommends
%% enabling auto scaling to manage the write capacity settings for all of
%% your global tables replicas and indexes.
%%
%% If you prefer to manage write capacity settings manually, you should
%% provision equal replicated write capacity units to your replica tables.
%% You should also provision equal replicated write capacity units to
%% matching secondary indexes across your global table.
create_global_table(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_global_table(Client, Input, []).
create_global_table(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateGlobalTable">>, Input, Options).

%% @doc The `CreateTable' operation adds a new table to your account.
%%
%% In an AWS account, table names must be unique within each Region. That is,
%% you can have two tables with same name if you create the tables in
%% different Regions.
%%
%% `CreateTable' is an asynchronous operation. Upon receiving a `CreateTable'
%% request, DynamoDB immediately returns a response with a `TableStatus' of
%% `CREATING'. After the table is created, DynamoDB sets the `TableStatus' to
%% `ACTIVE'. You can perform read and write operations only on an `ACTIVE'
%% table.
%%
%% You can optionally define secondary indexes on the new table, as part of
%% the `CreateTable' operation. If you want to create multiple tables with
%% secondary indexes on them, you must create the tables sequentially. Only
%% one table with secondary indexes can be in the `CREATING' state at any
%% given time.
%%
%% You can use the `DescribeTable' action to check the table status.
create_table(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_table(Client, Input, []).
create_table(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateTable">>, Input, Options).

%% @doc Deletes an existing backup of a table.
%%
%% You can call `DeleteBackup' at a maximum rate of 10 times per second.
delete_backup(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_backup(Client, Input, []).
delete_backup(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteBackup">>, Input, Options).

%% @doc Deletes a single item in a table by primary key.
%%
%% You can perform a conditional delete operation that deletes the item if it
%% exists, or if it has an expected attribute value.
%%
%% In addition to deleting an item, you can also return the item's attribute
%% values in the same operation, using the `ReturnValues' parameter.
%%
%% Unless you specify conditions, the `DeleteItem' is an idempotent
%% operation; running it multiple times on the same item or attribute does
%% not result in an error response.
%%
%% Conditional deletes are useful for deleting items only if specific
%% conditions are met. If those conditions are met, DynamoDB performs the
%% delete. Otherwise, the item is not deleted.
delete_item(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_item(Client, Input, []).
delete_item(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteItem">>, Input, Options).

%% @doc The `DeleteTable' operation deletes a table and all of its items.
%%
%% After a `DeleteTable' request, the specified table is in the `DELETING'
%% state until DynamoDB completes the deletion. If the table is in the
%% `ACTIVE' state, you can delete it. If a table is in `CREATING' or
%% `UPDATING' states, then DynamoDB returns a `ResourceInUseException'. If
%% the specified table does not exist, DynamoDB returns a
%% `ResourceNotFoundException'. If table is already in the `DELETING' state,
%% no error is returned.
%%
%% DynamoDB might continue to accept data read and write operations, such as
%% `GetItem' and `PutItem', on a table in the `DELETING' state until the
%% table deletion is complete.
%%
%% When you delete a table, any indexes on that table are also deleted.
%%
%% If you have DynamoDB Streams enabled on the table, then the corresponding
%% stream on that table goes into the `DISABLED' state, and the stream is
%% automatically deleted after 24 hours.
%%
%% Use the `DescribeTable' action to check the status of the table.
delete_table(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_table(Client, Input, []).
delete_table(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteTable">>, Input, Options).

%% @doc Describes an existing backup of a table.
%%
%% You can call `DescribeBackup' at a maximum rate of 10 times per second.
describe_backup(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_backup(Client, Input, []).
describe_backup(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeBackup">>, Input, Options).

%% @doc Checks the status of continuous backups and point in time recovery on
%% the specified table.
%%
%% Continuous backups are `ENABLED' on all tables at table creation. If point
%% in time recovery is enabled, `PointInTimeRecoveryStatus' will be set to
%% ENABLED.
%%
%% After continuous backups and point in time recovery are enabled, you can
%% restore to any point in time within `EarliestRestorableDateTime' and
%% `LatestRestorableDateTime'.
%%
%% `LatestRestorableDateTime' is typically 5 minutes before the current time.
%% You can restore your table to any point in time during the last 35 days.
%%
%% You can call `DescribeContinuousBackups' at a maximum rate of 10 times per
%% second.
describe_continuous_backups(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_continuous_backups(Client, Input, []).
describe_continuous_backups(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeContinuousBackups">>, Input, Options).

%% @doc Returns information about contributor insights, for a given table or
%% global secondary index.
describe_contributor_insights(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_contributor_insights(Client, Input, []).
describe_contributor_insights(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeContributorInsights">>, Input, Options).

%% @doc Returns the regional endpoint information.
describe_endpoints(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_endpoints(Client, Input, []).
describe_endpoints(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeEndpoints">>, Input, Options).

%% @doc Describes an existing table export.
describe_export(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_export(Client, Input, []).
describe_export(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeExport">>, Input, Options).

%% @doc Returns information about the specified global table.
%%
%% This operation only applies to Version 2017.11.29 of global tables. If you
%% are using global tables Version 2019.11.21 you can use DescribeTable
%% instead.
describe_global_table(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_global_table(Client, Input, []).
describe_global_table(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeGlobalTable">>, Input, Options).

%% @doc Describes Region-specific settings for a global table.
%%
%% This operation only applies to Version 2017.11.29 of global tables.
describe_global_table_settings(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_global_table_settings(Client, Input, []).
describe_global_table_settings(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeGlobalTableSettings">>, Input, Options).

%% @doc Returns information about the status of Kinesis streaming.
describe_kinesis_streaming_destination(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_kinesis_streaming_destination(Client, Input, []).
describe_kinesis_streaming_destination(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeKinesisStreamingDestination">>, Input, Options).

%% @doc Returns the current provisioned-capacity quotas for your AWS account
%% in a Region, both for the Region as a whole and for any one DynamoDB table
%% that you create there.
%%
%% When you establish an AWS account, the account has initial quotas on the
%% maximum read capacity units and write capacity units that you can
%% provision across all of your DynamoDB tables in a given Region. Also,
%% there are per-table quotas that apply when you create a table there. For
%% more information, see Service, Account, and Table Quotas page in the
%% Amazon DynamoDB Developer Guide.
%%
%% Although you can increase these quotas by filing a case at AWS Support
%% Center, obtaining the increase is not instantaneous. The `DescribeLimits'
%% action lets you write code to compare the capacity you are currently using
%% to those quotas imposed by your account so that you have enough time to
%% apply for an increase before you hit a quota.
%%
%% For example, you could use one of the AWS SDKs to do the following:
%%
%% <ol> <li> Call `DescribeLimits' for a particular Region to obtain your
%% current account quotas on provisioned capacity there.
%%
%% </li> <li> Create a variable to hold the aggregate read capacity units
%% provisioned for all your tables in that Region, and one to hold the
%% aggregate write capacity units. Zero them both.
%%
%% </li> <li> Call `ListTables' to obtain a list of all your DynamoDB tables.
%%
%% </li> <li> For each table name listed by `ListTables', do the following:
%%
%% <ul> <li> Call `DescribeTable' with the table name.
%%
%% </li> <li> Use the data returned by `DescribeTable' to add the read
%% capacity units and write capacity units provisioned for the table itself
%% to your variables.
%%
%% </li> <li> If the table has one or more global secondary indexes (GSIs),
%% loop over these GSIs and add their provisioned capacity values to your
%% variables as well.
%%
%% </li> </ul> </li> <li> Report the account quotas for that Region returned
%% by `DescribeLimits', along with the total current provisioned capacity
%% levels you have calculated.
%%
%% </li> </ol> This will let you see whether you are getting close to your
%% account-level quotas.
%%
%% The per-table quotas apply only when you are creating a new table. They
%% restrict the sum of the provisioned capacity of the new table itself and
%% all its global secondary indexes.
%%
%% For existing tables and their GSIs, DynamoDB doesn't let you increase
%% provisioned capacity extremely rapidly, but the only quota that applies is
%% that the aggregate provisioned capacity over all your tables and GSIs
%% cannot exceed either of the per-account quotas.
%%
%% `DescribeLimits' should only be called periodically. You can expect
%% throttling errors if you call it more than once in a minute.
%%
%% The `DescribeLimits' Request element has no content.
describe_limits(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_limits(Client, Input, []).
describe_limits(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeLimits">>, Input, Options).

%% @doc Returns information about the table, including the current status of
%% the table, when it was created, the primary key schema, and any indexes on
%% the table.
%%
%% If you issue a `DescribeTable' request immediately after a `CreateTable'
%% request, DynamoDB might return a `ResourceNotFoundException'. This is
%% because `DescribeTable' uses an eventually consistent query, and the
%% metadata for your table might not be available at that moment. Wait for a
%% few seconds, and then try the `DescribeTable' request again.
describe_table(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_table(Client, Input, []).
describe_table(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeTable">>, Input, Options).

%% @doc Describes auto scaling settings across replicas of the global table
%% at once.
%%
%% This operation only applies to Version 2019.11.21 of global tables.
describe_table_replica_auto_scaling(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_table_replica_auto_scaling(Client, Input, []).
describe_table_replica_auto_scaling(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeTableReplicaAutoScaling">>, Input, Options).

%% @doc Gives a description of the Time to Live (TTL) status on the specified
%% table.
describe_time_to_live(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_time_to_live(Client, Input, []).
describe_time_to_live(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeTimeToLive">>, Input, Options).

%% @doc Stops replication from the DynamoDB table to the Kinesis data stream.
%%
%% This is done without deleting either of the resources.
disable_kinesis_streaming_destination(Client, Input)
  when is_map(Client), is_map(Input) ->
    disable_kinesis_streaming_destination(Client, Input, []).
disable_kinesis_streaming_destination(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DisableKinesisStreamingDestination">>, Input, Options).

%% @doc Starts table data replication to the specified Kinesis data stream at
%% a timestamp chosen during the enable workflow.
%%
%% If this operation doesn't return results immediately, use
%% DescribeKinesisStreamingDestination to check if streaming to the Kinesis
%% data stream is ACTIVE.
enable_kinesis_streaming_destination(Client, Input)
  when is_map(Client), is_map(Input) ->
    enable_kinesis_streaming_destination(Client, Input, []).
enable_kinesis_streaming_destination(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"EnableKinesisStreamingDestination">>, Input, Options).

%% @doc This operation allows you to perform reads and singleton writes on
%% data stored in DynamoDB, using PartiQL.
execute_statement(Client, Input)
  when is_map(Client), is_map(Input) ->
    execute_statement(Client, Input, []).
execute_statement(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ExecuteStatement">>, Input, Options).

%% @doc This operation allows you to perform transactional reads or writes on
%% data stored in DynamoDB, using PartiQL.
execute_transaction(Client, Input)
  when is_map(Client), is_map(Input) ->
    execute_transaction(Client, Input, []).
execute_transaction(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ExecuteTransaction">>, Input, Options).

%% @doc Exports table data to an S3 bucket.
%%
%% The table must have point in time recovery enabled, and you can export
%% data from any time within the point in time recovery window.
export_table_to_point_in_time(Client, Input)
  when is_map(Client), is_map(Input) ->
    export_table_to_point_in_time(Client, Input, []).
export_table_to_point_in_time(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ExportTableToPointInTime">>, Input, Options).

%% @doc The `GetItem' operation returns a set of attributes for the item with
%% the given primary key.
%%
%% If there is no matching item, `GetItem' does not return any data and there
%% will be no `Item' element in the response.
%%
%% `GetItem' provides an eventually consistent read by default. If your
%% application requires a strongly consistent read, set `ConsistentRead' to
%% `true'. Although a strongly consistent read might take more time than an
%% eventually consistent read, it always returns the last updated value.
get_item(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_item(Client, Input, []).
get_item(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetItem">>, Input, Options).

%% @doc List backups associated with an AWS account.
%%
%% To list backups for a given table, specify `TableName'. `ListBackups'
%% returns a paginated list of results with at most 1 MB worth of items in a
%% page. You can also specify a maximum number of entries to be returned in a
%% page.
%%
%% In the request, start time is inclusive, but end time is exclusive. Note
%% that these boundaries are for the time at which the original backup was
%% requested.
%%
%% You can call `ListBackups' a maximum of five times per second.
list_backups(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_backups(Client, Input, []).
list_backups(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListBackups">>, Input, Options).

%% @doc Returns a list of ContributorInsightsSummary for a table and all its
%% global secondary indexes.
list_contributor_insights(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_contributor_insights(Client, Input, []).
list_contributor_insights(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListContributorInsights">>, Input, Options).

%% @doc Lists completed exports within the past 90 days.
list_exports(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_exports(Client, Input, []).
list_exports(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListExports">>, Input, Options).

%% @doc Lists all global tables that have a replica in the specified Region.
%%
%% This operation only applies to Version 2017.11.29 of global tables.
list_global_tables(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_global_tables(Client, Input, []).
list_global_tables(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListGlobalTables">>, Input, Options).

%% @doc Returns an array of table names associated with the current account
%% and endpoint.
%%
%% The output from `ListTables' is paginated, with each page returning a
%% maximum of 100 table names.
list_tables(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_tables(Client, Input, []).
list_tables(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListTables">>, Input, Options).

%% @doc List all tags on an Amazon DynamoDB resource.
%%
%% You can call ListTagsOfResource up to 10 times per second, per account.
%%
%% For an overview on tagging DynamoDB resources, see Tagging for DynamoDB in
%% the Amazon DynamoDB Developer Guide.
list_tags_of_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_tags_of_resource(Client, Input, []).
list_tags_of_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListTagsOfResource">>, Input, Options).

%% @doc Creates a new item, or replaces an old item with a new item.
%%
%% If an item that has the same primary key as the new item already exists in
%% the specified table, the new item completely replaces the existing item.
%% You can perform a conditional put operation (add a new item if one with
%% the specified primary key doesn't exist), or replace an existing item if
%% it has certain attribute values. You can return the item's attribute
%% values in the same operation, using the `ReturnValues' parameter.
%%
%% This topic provides general information about the `PutItem' API.
%%
%% For information on how to call the `PutItem' API using the AWS SDK in
%% specific languages, see the following:
%%
%% PutItem in the AWS Command Line Interface
%%
%% PutItem in the AWS SDK for .NET
%%
%% PutItem in the AWS SDK for C++
%%
%% PutItem in the AWS SDK for Go
%%
%% PutItem in the AWS SDK for Java
%%
%% PutItem in the AWS SDK for JavaScript
%%
%% PutItem in the AWS SDK for PHP V3
%%
%% PutItem in the AWS SDK for Python
%%
%% PutItem in the AWS SDK for Ruby V2
%%
%% When you add an item, the primary key attributes are the only required
%% attributes. Attribute values cannot be null.
%%
%% Empty String and Binary attribute values are allowed. Attribute values of
%% type String and Binary must have a length greater than zero if the
%% attribute is used as a key attribute for a table or index. Set type
%% attributes cannot be empty.
%%
%% Invalid Requests with empty values will be rejected with a
%% `ValidationException' exception.
%%
%% To prevent a new item from replacing an existing item, use a conditional
%% expression that contains the `attribute_not_exists' function with the name
%% of the attribute being used as the partition key for the table. Since
%% every record must contain that attribute, the `attribute_not_exists'
%% function will only succeed if no matching item exists.
%%
%% For more information about `PutItem', see Working with Items in the Amazon
%% DynamoDB Developer Guide.
put_item(Client, Input)
  when is_map(Client), is_map(Input) ->
    put_item(Client, Input, []).
put_item(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"PutItem">>, Input, Options).

%% @doc The `Query' operation finds items based on primary key values.
%%
%% You can query any table or secondary index that has a composite primary
%% key (a partition key and a sort key).
%%
%% Use the `KeyConditionExpression' parameter to provide a specific value for
%% the partition key. The `Query' operation will return all of the items from
%% the table or index with that partition key value. You can optionally
%% narrow the scope of the `Query' operation by specifying a sort key value
%% and a comparison operator in `KeyConditionExpression'. To further refine
%% the `Query' results, you can optionally provide a `FilterExpression'. A
%% `FilterExpression' determines which items within the results should be
%% returned to you. All of the other results are discarded.
%%
%% A `Query' operation always returns a result set. If no matching items are
%% found, the result set will be empty. Queries that do not return results
%% consume the minimum number of read capacity units for that type of read
%% operation.
%%
%% DynamoDB calculates the number of read capacity units consumed based on
%% item size, not on the amount of data that is returned to an application.
%% The number of capacity units consumed will be the same whether you request
%% all of the attributes (the default behavior) or just some of them (using a
%% projection expression). The number will also be the same whether or not
%% you use a `FilterExpression'.
%%
%% `Query' results are always sorted by the sort key value. If the data type
%% of the sort key is Number, the results are returned in numeric order;
%% otherwise, the results are returned in order of UTF-8 bytes. By default,
%% the sort order is ascending. To reverse the order, set the
%% `ScanIndexForward' parameter to false.
%%
%% A single `Query' operation will read up to the maximum number of items set
%% (if using the `Limit' parameter) or a maximum of 1 MB of data and then
%% apply any filtering to the results using `FilterExpression'. If
%% `LastEvaluatedKey' is present in the response, you will need to paginate
%% the result set. For more information, see Paginating the Results in the
%% Amazon DynamoDB Developer Guide.
%%
%% `FilterExpression' is applied after a `Query' finishes, but before the
%% results are returned. A `FilterExpression' cannot contain partition key or
%% sort key attributes. You need to specify those attributes in the
%% `KeyConditionExpression'.
%%
%% A `Query' operation can return an empty result set and a
%% `LastEvaluatedKey' if all the items read for the page of results are
%% filtered out.
%%
%% You can query a table, a local secondary index, or a global secondary
%% index. For a query on a table or on a local secondary index, you can set
%% the `ConsistentRead' parameter to `true' and obtain a strongly consistent
%% result. Global secondary indexes support eventually consistent reads only,
%% so do not specify `ConsistentRead' when querying a global secondary index.
query(Client, Input)
  when is_map(Client), is_map(Input) ->
    query(Client, Input, []).
query(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"Query">>, Input, Options).

%% @doc Creates a new table from an existing backup.
%%
%% Any number of users can execute up to 4 concurrent restores (any type of
%% restore) in a given account.
%%
%% You can call `RestoreTableFromBackup' at a maximum rate of 10 times per
%% second.
%%
%% You must manually set up the following on the restored table:
%%
%% <ul> <li> Auto scaling policies
%%
%% </li> <li> IAM policies
%%
%% </li> <li> Amazon CloudWatch metrics and alarms
%%
%% </li> <li> Tags
%%
%% </li> <li> Stream settings
%%
%% </li> <li> Time to Live (TTL) settings
%%
%% </li> </ul>
restore_table_from_backup(Client, Input)
  when is_map(Client), is_map(Input) ->
    restore_table_from_backup(Client, Input, []).
restore_table_from_backup(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"RestoreTableFromBackup">>, Input, Options).

%% @doc Restores the specified table to the specified point in time within
%% `EarliestRestorableDateTime' and `LatestRestorableDateTime'.
%%
%% You can restore your table to any point in time during the last 35 days.
%% Any number of users can execute up to 4 concurrent restores (any type of
%% restore) in a given account.
%%
%% When you restore using point in time recovery, DynamoDB restores your
%% table data to the state based on the selected date and time
%% (day:hour:minute:second) to a new table.
%%
%% Along with data, the following are also included on the new restored table
%% using point in time recovery:
%%
%% <ul> <li> Global secondary indexes (GSIs)
%%
%% </li> <li> Local secondary indexes (LSIs)
%%
%% </li> <li> Provisioned read and write capacity
%%
%% </li> <li> Encryption settings
%%
%% All these settings come from the current settings of the source table at
%% the time of restore.
%%
%% </li> </ul> You must manually set up the following on the restored table:
%%
%% <ul> <li> Auto scaling policies
%%
%% </li> <li> IAM policies
%%
%% </li> <li> Amazon CloudWatch metrics and alarms
%%
%% </li> <li> Tags
%%
%% </li> <li> Stream settings
%%
%% </li> <li> Time to Live (TTL) settings
%%
%% </li> <li> Point in time recovery settings
%%
%% </li> </ul>
restore_table_to_point_in_time(Client, Input)
  when is_map(Client), is_map(Input) ->
    restore_table_to_point_in_time(Client, Input, []).
restore_table_to_point_in_time(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"RestoreTableToPointInTime">>, Input, Options).

%% @doc The `Scan' operation returns one or more items and item attributes by
%% accessing every item in a table or a secondary index.
%%
%% To have DynamoDB return fewer items, you can provide a `FilterExpression'
%% operation.
%%
%% If the total number of scanned items exceeds the maximum dataset size
%% limit of 1 MB, the scan stops and results are returned to the user as a
%% `LastEvaluatedKey' value to continue the scan in a subsequent operation.
%% The results also include the number of items exceeding the limit. A scan
%% can result in no table data meeting the filter criteria.
%%
%% A single `Scan' operation reads up to the maximum number of items set (if
%% using the `Limit' parameter) or a maximum of 1 MB of data and then apply
%% any filtering to the results using `FilterExpression'. If
%% `LastEvaluatedKey' is present in the response, you need to paginate the
%% result set. For more information, see Paginating the Results in the Amazon
%% DynamoDB Developer Guide.
%%
%% `Scan' operations proceed sequentially; however, for faster performance on
%% a large table or secondary index, applications can request a parallel
%% `Scan' operation by providing the `Segment' and `TotalSegments'
%% parameters. For more information, see Parallel Scan in the Amazon DynamoDB
%% Developer Guide.
%%
%% `Scan' uses eventually consistent reads when accessing the data in a
%% table; therefore, the result set might not include the changes to data in
%% the table immediately before the operation began. If you need a consistent
%% copy of the data, as of the time that the `Scan' begins, you can set the
%% `ConsistentRead' parameter to `true'.
scan(Client, Input)
  when is_map(Client), is_map(Input) ->
    scan(Client, Input, []).
scan(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"Scan">>, Input, Options).

%% @doc Associate a set of tags with an Amazon DynamoDB resource.
%%
%% You can then activate these user-defined tags so that they appear on the
%% Billing and Cost Management console for cost allocation tracking. You can
%% call TagResource up to five times per second, per account.
%%
%% For an overview on tagging DynamoDB resources, see Tagging for DynamoDB in
%% the Amazon DynamoDB Developer Guide.
tag_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    tag_resource(Client, Input, []).
tag_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"TagResource">>, Input, Options).

%% @doc `TransactGetItems' is a synchronous operation that atomically
%% retrieves multiple items from one or more tables (but not from indexes) in
%% a single account and Region.
%%
%% A `TransactGetItems' call can contain up to 25 `TransactGetItem' objects,
%% each of which contains a `Get' structure that specifies an item to
%% retrieve from a table in the account and Region. A call to
%% `TransactGetItems' cannot retrieve items from tables in more than one AWS
%% account or Region. The aggregate size of the items in the transaction
%% cannot exceed 4 MB.
%%
%% DynamoDB rejects the entire `TransactGetItems' request if any of the
%% following is true:
%%
%% <ul> <li> A conflicting operation is in the process of updating an item to
%% be read.
%%
%% </li> <li> There is insufficient provisioned capacity for the transaction
%% to be completed.
%%
%% </li> <li> There is a user error, such as an invalid data format.
%%
%% </li> <li> The aggregate size of the items in the transaction cannot
%% exceed 4 MB.
%%
%% </li> </ul>
transact_get_items(Client, Input)
  when is_map(Client), is_map(Input) ->
    transact_get_items(Client, Input, []).
transact_get_items(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"TransactGetItems">>, Input, Options).

%% @doc `TransactWriteItems' is a synchronous write operation that groups up
%% to 25 action requests.
%%
%% These actions can target items in different tables, but not in different
%% AWS accounts or Regions, and no two actions can target the same item. For
%% example, you cannot both `ConditionCheck' and `Update' the same item. The
%% aggregate size of the items in the transaction cannot exceed 4 MB.
%%
%% The actions are completed atomically so that either all of them succeed,
%% or all of them fail. They are defined by the following objects:
%%
%% <ul> <li> `Put'  —   Initiates a `PutItem' operation to write a new item.
%% This structure specifies the primary key of the item to be written, the
%% name of the table to write it in, an optional condition expression that
%% must be satisfied for the write to succeed, a list of the item's
%% attributes, and a field indicating whether to retrieve the item's
%% attributes if the condition is not met.
%%
%% </li> <li> `Update'  —   Initiates an `UpdateItem' operation to update an
%% existing item. This structure specifies the primary key of the item to be
%% updated, the name of the table where it resides, an optional condition
%% expression that must be satisfied for the update to succeed, an expression
%% that defines one or more attributes to be updated, and a field indicating
%% whether to retrieve the item's attributes if the condition is not met.
%%
%% </li> <li> `Delete'  —   Initiates a `DeleteItem' operation to delete an
%% existing item. This structure specifies the primary key of the item to be
%% deleted, the name of the table where it resides, an optional condition
%% expression that must be satisfied for the deletion to succeed, and a field
%% indicating whether to retrieve the item's attributes if the condition is
%% not met.
%%
%% </li> <li> `ConditionCheck'  —   Applies a condition to an item that is
%% not being modified by the transaction. This structure specifies the
%% primary key of the item to be checked, the name of the table where it
%% resides, a condition expression that must be satisfied for the transaction
%% to succeed, and a field indicating whether to retrieve the item's
%% attributes if the condition is not met.
%%
%% </li> </ul> DynamoDB rejects the entire `TransactWriteItems' request if
%% any of the following is true:
%%
%% <ul> <li> A condition in one of the condition expressions is not met.
%%
%% </li> <li> An ongoing operation is in the process of updating the same
%% item.
%%
%% </li> <li> There is insufficient provisioned capacity for the transaction
%% to be completed.
%%
%% </li> <li> An item size becomes too large (bigger than 400 KB), a local
%% secondary index (LSI) becomes too large, or a similar validation error
%% occurs because of changes made by the transaction.
%%
%% </li> <li> The aggregate size of the items in the transaction exceeds 4
%% MB.
%%
%% </li> <li> There is a user error, such as an invalid data format.
%%
%% </li> </ul>
transact_write_items(Client, Input)
  when is_map(Client), is_map(Input) ->
    transact_write_items(Client, Input, []).
transact_write_items(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"TransactWriteItems">>, Input, Options).

%% @doc Removes the association of tags from an Amazon DynamoDB resource.
%%
%% You can call `UntagResource' up to five times per second, per account.
%%
%% For an overview on tagging DynamoDB resources, see Tagging for DynamoDB in
%% the Amazon DynamoDB Developer Guide.
untag_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    untag_resource(Client, Input, []).
untag_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UntagResource">>, Input, Options).

%% @doc `UpdateContinuousBackups' enables or disables point in time recovery
%% for the specified table.
%%
%% A successful `UpdateContinuousBackups' call returns the current
%% `ContinuousBackupsDescription'. Continuous backups are `ENABLED' on all
%% tables at table creation. If point in time recovery is enabled,
%% `PointInTimeRecoveryStatus' will be set to ENABLED.
%%
%% Once continuous backups and point in time recovery are enabled, you can
%% restore to any point in time within `EarliestRestorableDateTime' and
%% `LatestRestorableDateTime'.
%%
%% `LatestRestorableDateTime' is typically 5 minutes before the current time.
%% You can restore your table to any point in time during the last 35 days.
update_continuous_backups(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_continuous_backups(Client, Input, []).
update_continuous_backups(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateContinuousBackups">>, Input, Options).

%% @doc Updates the status for contributor insights for a specific table or
%% index.
update_contributor_insights(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_contributor_insights(Client, Input, []).
update_contributor_insights(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateContributorInsights">>, Input, Options).

%% @doc Adds or removes replicas in the specified global table.
%%
%% The global table must already exist to be able to use this operation. Any
%% replica to be added must be empty, have the same name as the global table,
%% have the same key schema, have DynamoDB Streams enabled, and have the same
%% provisioned and maximum write capacity units.
%%
%% Although you can use `UpdateGlobalTable' to add replicas and remove
%% replicas in a single request, for simplicity we recommend that you issue
%% separate requests for adding or removing replicas.
%%
%% If global secondary indexes are specified, then the following conditions
%% must also be met:
%%
%% <ul> <li> The global secondary indexes must have the same name.
%%
%% </li> <li> The global secondary indexes must have the same hash key and
%% sort key (if present).
%%
%% </li> <li> The global secondary indexes must have the same provisioned and
%% maximum write capacity units.
%%
%% </li> </ul>
update_global_table(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_global_table(Client, Input, []).
update_global_table(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateGlobalTable">>, Input, Options).

%% @doc Updates settings for a global table.
update_global_table_settings(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_global_table_settings(Client, Input, []).
update_global_table_settings(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateGlobalTableSettings">>, Input, Options).

%% @doc Edits an existing item's attributes, or adds a new item to the table
%% if it does not already exist.
%%
%% You can put, delete, or add attribute values. You can also perform a
%% conditional update on an existing item (insert a new attribute name-value
%% pair if it doesn't exist, or replace an existing name-value pair if it has
%% certain expected attribute values).
%%
%% You can also return the item's attribute values in the same `UpdateItem'
%% operation using the `ReturnValues' parameter.
update_item(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_item(Client, Input, []).
update_item(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateItem">>, Input, Options).

%% @doc Modifies the provisioned throughput settings, global secondary
%% indexes, or DynamoDB Streams settings for a given table.
%%
%% You can only perform one of the following operations at once:
%%
%% <ul> <li> Modify the provisioned throughput settings of the table.
%%
%% </li> <li> Enable or disable DynamoDB Streams on the table.
%%
%% </li> <li> Remove a global secondary index from the table.
%%
%% </li> <li> Create a new global secondary index on the table. After the
%% index begins backfilling, you can use `UpdateTable' to perform other
%% operations.
%%
%% </li> </ul> `UpdateTable' is an asynchronous operation; while it is
%% executing, the table status changes from `ACTIVE' to `UPDATING'. While it
%% is `UPDATING', you cannot issue another `UpdateTable' request. When the
%% table returns to the `ACTIVE' state, the `UpdateTable' operation is
%% complete.
update_table(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_table(Client, Input, []).
update_table(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateTable">>, Input, Options).

%% @doc Updates auto scaling settings on your global tables at once.
%%
%% This operation only applies to Version 2019.11.21 of global tables.
update_table_replica_auto_scaling(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_table_replica_auto_scaling(Client, Input, []).
update_table_replica_auto_scaling(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateTableReplicaAutoScaling">>, Input, Options).

%% @doc The `UpdateTimeToLive' method enables or disables Time to Live (TTL)
%% for the specified table.
%%
%% A successful `UpdateTimeToLive' call returns the current
%% `TimeToLiveSpecification'. It can take up to one hour for the change to
%% fully process. Any additional `UpdateTimeToLive' calls for the same table
%% during this one hour duration result in a `ValidationException'.
%%
%% TTL compares the current time in epoch time format to the time stored in
%% the TTL attribute of an item. If the epoch time value stored in the
%% attribute is less than the current time, the item is marked as expired and
%% subsequently deleted.
%%
%% The epoch time format is the number of seconds elapsed since 12:00:00 AM
%% January 1, 1970 UTC.
%%
%% DynamoDB deletes expired items on a best-effort basis to ensure
%% availability of throughput for other data operations.
%%
%% DynamoDB typically deletes expired items within two days of expiration.
%% The exact duration within which an item gets deleted after expiration is
%% specific to the nature of the workload. Items that have expired and not
%% been deleted will still show up in reads, queries, and scans.
%%
%% As items are deleted, they are removed from any local secondary index and
%% global secondary index immediately in the same eventually consistent way
%% as a standard delete operation.
%%
%% For more information, see Time To Live in the Amazon DynamoDB Developer
%% Guide.
update_time_to_live(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_time_to_live(Client, Input, []).
update_time_to_live(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateTimeToLive">>, Input, Options).

%%====================================================================
%% Internal functions
%%====================================================================

-spec request(aws_client:aws_client(), binary(), map(), list()) ->
    {ok, Result, {integer(), list(), hackney:client()}} |
    {error, Error, {integer(), list(), hackney:client()}} |
    {error, term()} when
    Result :: map() | undefined,
    Error :: map().
request(Client, Action, Input0, Options) ->
    Client1 = Client#{service => <<"dynamodb">>},
    Host = build_host(<<"dynamodb">>, Client1),
    URL = build_url(Host, Client1),
    Headers = [
        {<<"Host">>, Host},
        {<<"Content-Type">>, <<"application/x-amz-json-1.0">>},
        {<<"X-Amz-Target">>, <<"DynamoDB_20120810.", Action/binary>>}
    ],

    Input = Input0,

    Payload = jsx:encode(Input),
    SignedHeaders = aws_request:sign_request(Client1, <<"POST">>, URL, Headers, Payload),
    Response = hackney:request(post, URL, SignedHeaders, Payload, Options),
    handle_response(Response).

handle_response({ok, 200, ResponseHeaders, Client}) ->
    case hackney:body(Client) of
        {ok, <<>>} ->
            {ok, undefined, {200, ResponseHeaders, Client}};
        {ok, Body} ->
            Result = jsx:decode(Body),
            {ok, Result, {200, ResponseHeaders, Client}}
    end;
handle_response({ok, StatusCode, ResponseHeaders, Client}) ->
    {ok, Body} = hackney:body(Client),
    Error = jsx:decode(Body),
    {error, Error, {StatusCode, ResponseHeaders, Client}};
handle_response({error, Reason}) ->
    {error, Reason}.

build_host(_EndpointPrefix, #{region := <<"local">>, endpoint := Endpoint}) ->
    Endpoint;
build_host(_EndpointPrefix, #{region := <<"local">>}) ->
    <<"localhost">>;
build_host(EndpointPrefix, #{region := Region, endpoint := Endpoint}) ->
    aws_util:binary_join([EndpointPrefix, Region, Endpoint], <<".">>).

build_url(Host, Client) ->
    Proto = maps:get(proto, Client),
    Port = maps:get(port, Client),
    aws_util:binary_join([Proto, <<"://">>, Host, <<":">>, Port, <<"/">>], <<"">>).