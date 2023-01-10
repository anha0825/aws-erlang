%% WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
%% See https://github.com/aws-beam/aws-codegen for more details.

%% @doc Amazon Kendra Intelligent Ranking uses Amazon Kendra semantic search
%% capabilities to intelligently re-rank a search service's results.
-module(aws_kendra_ranking).

-export([create_rescore_execution_plan/2,
         create_rescore_execution_plan/3,
         delete_rescore_execution_plan/2,
         delete_rescore_execution_plan/3,
         describe_rescore_execution_plan/2,
         describe_rescore_execution_plan/3,
         list_rescore_execution_plans/2,
         list_rescore_execution_plans/3,
         list_tags_for_resource/2,
         list_tags_for_resource/3,
         rescore/2,
         rescore/3,
         tag_resource/2,
         tag_resource/3,
         untag_resource/2,
         untag_resource/3,
         update_rescore_execution_plan/2,
         update_rescore_execution_plan/3]).

-include_lib("hackney/include/hackney_lib.hrl").

%%====================================================================
%% API
%%====================================================================

%% @doc Creates a rescore execution plan.
%%
%% A rescore execution plan is an Amazon Kendra Intelligent Ranking resource
%% used for provisioning the `Rescore' API. You set the number of capacity
%% units that you require for Amazon Kendra Intelligent Ranking to rescore or
%% re-rank a search service's results.
%%
%% For an example of using the `CreateRescoreExecutionPlan' API, including
%% using the Python and Java SDKs, see Semantically ranking a search
%% service's results.
create_rescore_execution_plan(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_rescore_execution_plan(Client, Input, []).
create_rescore_execution_plan(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateRescoreExecutionPlan">>, Input, Options).

%% @doc Deletes a rescore execution plan.
%%
%% A rescore execution plan is an Amazon Kendra Intelligent Ranking resource
%% used for provisioning the `Rescore' API.
delete_rescore_execution_plan(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_rescore_execution_plan(Client, Input, []).
delete_rescore_execution_plan(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteRescoreExecutionPlan">>, Input, Options).

%% @doc Gets information about a rescore execution plan.
%%
%% A rescore execution plan is an Amazon Kendra Intelligent Ranking resource
%% used for provisioning the `Rescore' API.
describe_rescore_execution_plan(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_rescore_execution_plan(Client, Input, []).
describe_rescore_execution_plan(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeRescoreExecutionPlan">>, Input, Options).

%% @doc Lists your rescore execution plans.
%%
%% A rescore execution plan is an Amazon Kendra Intelligent Ranking resource
%% used for provisioning the `Rescore' API.
list_rescore_execution_plans(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_rescore_execution_plans(Client, Input, []).
list_rescore_execution_plans(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListRescoreExecutionPlans">>, Input, Options).

%% @doc Gets a list of tags associated with a specified resource.
%%
%% A rescore execution plan is an example of a resource that can have tags
%% associated with it.
list_tags_for_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_tags_for_resource(Client, Input, []).
list_tags_for_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListTagsForResource">>, Input, Options).

%% @doc Rescores or re-ranks search results from a search service such as
%% OpenSearch (self managed).
%%
%% You use the semantic search capabilities of Amazon Kendra Intelligent
%% Ranking to improve the search service's results.
rescore(Client, Input)
  when is_map(Client), is_map(Input) ->
    rescore(Client, Input, []).
rescore(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"Rescore">>, Input, Options).

%% @doc Adds a specified tag to a specified rescore execution plan.
%%
%% A rescore execution plan is an Amazon Kendra Intelligent Ranking resource
%% used for provisioning the `Rescore' API. If the tag already exists, the
%% existing value is replaced with the new value.
tag_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    tag_resource(Client, Input, []).
tag_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"TagResource">>, Input, Options).

%% @doc Removes a tag from a rescore execution plan.
%%
%% A rescore execution plan is an Amazon Kendra Intelligent Ranking resource
%% used for provisioning the `Rescore' operation.
untag_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    untag_resource(Client, Input, []).
untag_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UntagResource">>, Input, Options).

%% @doc Updates a rescore execution plan.
%%
%% A rescore execution plan is an Amazon Kendra Intelligent Ranking resource
%% used for provisioning the `Rescore' API. You can update the number of
%% capacity units you require for Amazon Kendra Intelligent Ranking to
%% rescore or re-rank a search service's results.
update_rescore_execution_plan(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_rescore_execution_plan(Client, Input, []).
update_rescore_execution_plan(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateRescoreExecutionPlan">>, Input, Options).

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
    Client1 = Client#{service => <<"kendra-ranking">>},
    Host = build_host(<<"kendra-ranking">>, Client1),
    URL = build_url(Host, Client1),
    Headers = [
        {<<"Host">>, Host},
        {<<"Content-Type">>, <<"application/x-amz-json-1.0">>},
        {<<"X-Amz-Target">>, <<"AWSKendraRerankingFrontendService.", Action/binary>>}
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
