%% WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
%% See https://github.com/aws-beam/aws-codegen for more details.

%% @doc You can use the Amazon Web Services Cost and Usage Report API to
%% programmatically create, query, and delete
%% Amazon Web Services Cost and Usage Report definitions.
%%
%% Amazon Web Services Cost and Usage Report track the monthly Amazon Web
%% Services costs and usage
%% associated with your Amazon Web Services account.
%%
%% The report contains line items for each unique combination of Amazon Web
%% Services product,
%% usage type, and operation that your Amazon Web Services account uses.
%%
%% You can configure the Amazon Web Services Cost and Usage Report to show
%% only the data that you want, using the
%% Amazon Web Services Cost and Usage Report API.
%%
%% Service Endpoint
%%
%% The Amazon Web Services Cost and Usage Report API provides the following
%% endpoint:
%%
%% cur.us-east-1.amazonaws.com
-module(aws_cost_and_usage_report).

-export([delete_report_definition/2,
         delete_report_definition/3,
         describe_report_definitions/2,
         describe_report_definitions/3,
         list_tags_for_resource/2,
         list_tags_for_resource/3,
         modify_report_definition/2,
         modify_report_definition/3,
         put_report_definition/2,
         put_report_definition/3,
         tag_resource/2,
         tag_resource/3,
         untag_resource/2,
         untag_resource/3]).

-include_lib("hackney/include/hackney_lib.hrl").

%%====================================================================
%% API
%%====================================================================

%% @doc Deletes the specified report.
%%
%% Any tags associated with the report are also
%% deleted.
delete_report_definition(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_report_definition(Client, Input, []).
delete_report_definition(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteReportDefinition">>, Input, Options).

%% @doc Lists the Amazon Web Services Cost and Usage Report available to this
%% account.
describe_report_definitions(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_report_definitions(Client, Input, []).
describe_report_definitions(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeReportDefinitions">>, Input, Options).

%% @doc Lists the tags associated with the specified report definition.
list_tags_for_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_tags_for_resource(Client, Input, []).
list_tags_for_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListTagsForResource">>, Input, Options).

%% @doc Allows you to programmatically update your report preferences.
modify_report_definition(Client, Input)
  when is_map(Client), is_map(Input) ->
    modify_report_definition(Client, Input, []).
modify_report_definition(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ModifyReportDefinition">>, Input, Options).

%% @doc Creates a new report using the description that you provide.
put_report_definition(Client, Input)
  when is_map(Client), is_map(Input) ->
    put_report_definition(Client, Input, []).
put_report_definition(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"PutReportDefinition">>, Input, Options).

%% @doc Associates a set of tags with a report definition.
tag_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    tag_resource(Client, Input, []).
tag_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"TagResource">>, Input, Options).

%% @doc Disassociates a set of tags from a report definition.
untag_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    untag_resource(Client, Input, []).
untag_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UntagResource">>, Input, Options).

%%====================================================================
%% Internal functions
%%====================================================================

-spec request(aws_client:aws_client(), binary(), map(), list()) ->
    {ok, Result, {integer(), list(), hackney:client()}} |
    {error, Error, {integer(), list(), hackney:client()}} |
    {error, term()} when
    Result :: map() | undefined,
    Error :: map().
request(Client, Action, Input, Options) ->
    RequestFun = fun() -> do_request(Client, Action, Input, Options) end,
    aws_request:request(RequestFun, Options).

do_request(Client, Action, Input0, Options) ->
    Client1 = Client#{service => <<"cur">>},
    Host = build_host(<<"cur">>, Client1),
    URL = build_url(Host, Client1),
    Headers = [
        {<<"Host">>, Host},
        {<<"Content-Type">>, <<"application/x-amz-json-1.1">>},
        {<<"X-Amz-Target">>, <<"AWSOrigamiServiceGatewayService.", Action/binary>>}
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
    Proto = aws_client:proto(Client),
    Port = aws_client:port(Client),
    aws_util:binary_join([Proto, <<"://">>, Host, <<":">>, Port, <<"/">>], <<"">>).
