%% WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
%% See https://github.com/aws-beam/aws-codegen for more details.

%% @doc AWS IAM Access Analyzer helps identify potential resource-access
%% risks by enabling you to identify any policies that grant access to an
%% external principal.
%%
%% It does this by using logic-based reasoning to analyze resource-based
%% policies in your AWS environment. An external principal can be another AWS
%% account, a root user, an IAM user or role, a federated user, an AWS
%% service, or an anonymous user. This guide describes the AWS IAM Access
%% Analyzer operations that you can call programmatically. For general
%% information about Access Analyzer, see AWS IAM Access Analyzer in the IAM
%% User Guide.
%%
%% To start using Access Analyzer, you first need to create an analyzer.
-module(aws_accessanalyzer).

-export([apply_archive_rule/2,
         apply_archive_rule/3,
         create_analyzer/2,
         create_analyzer/3,
         create_archive_rule/3,
         create_archive_rule/4,
         delete_analyzer/3,
         delete_analyzer/4,
         delete_archive_rule/4,
         delete_archive_rule/5,
         get_analyzed_resource/3,
         get_analyzed_resource/4,
         get_analyzer/2,
         get_analyzer/3,
         get_archive_rule/3,
         get_archive_rule/4,
         get_finding/3,
         get_finding/4,
         list_analyzed_resources/2,
         list_analyzed_resources/3,
         list_analyzers/4,
         list_analyzers/5,
         list_archive_rules/4,
         list_archive_rules/5,
         list_findings/2,
         list_findings/3,
         list_tags_for_resource/2,
         list_tags_for_resource/3,
         start_resource_scan/2,
         start_resource_scan/3,
         tag_resource/3,
         tag_resource/4,
         untag_resource/3,
         untag_resource/4,
         update_archive_rule/4,
         update_archive_rule/5,
         update_findings/2,
         update_findings/3]).

-include_lib("hackney/include/hackney_lib.hrl").

%%====================================================================
%% API
%%====================================================================

%% @doc Retroactively applies the archive rule to existing findings that meet
%% the archive rule criteria.
apply_archive_rule(Client, Input) ->
    apply_archive_rule(Client, Input, []).
apply_archive_rule(Client, Input0, Options) ->
    Method = put,
    Path = ["/archive-rule"],
    SuccessStatusCode = 200,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Creates an analyzer for your account.
create_analyzer(Client, Input) ->
    create_analyzer(Client, Input, []).
create_analyzer(Client, Input0, Options) ->
    Method = put,
    Path = ["/analyzer"],
    SuccessStatusCode = 200,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Creates an archive rule for the specified analyzer.
%%
%% Archive rules automatically archive new findings that meet the criteria
%% you define when you create the rule.
create_archive_rule(Client, AnalyzerName, Input) ->
    create_archive_rule(Client, AnalyzerName, Input, []).
create_archive_rule(Client, AnalyzerName, Input0, Options) ->
    Method = put,
    Path = ["/analyzer/", aws_util:encode_uri(AnalyzerName), "/archive-rule"],
    SuccessStatusCode = 200,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Deletes the specified analyzer.
%%
%% When you delete an analyzer, Access Analyzer is disabled for the account
%% or organization in the current or specific Region. All findings that were
%% generated by the analyzer are deleted. You cannot undo this action.
delete_analyzer(Client, AnalyzerName, Input) ->
    delete_analyzer(Client, AnalyzerName, Input, []).
delete_analyzer(Client, AnalyzerName, Input0, Options) ->
    Method = delete,
    Path = ["/analyzer/", aws_util:encode_uri(AnalyzerName), ""],
    SuccessStatusCode = 200,

    Headers = [],
    Input1 = Input0,

    QueryMapping = [
                     {<<"clientToken">>, <<"clientToken">>}
                   ],
    {Query_, Input} = aws_request:build_headers(QueryMapping, Input1),
    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Deletes the specified archive rule.
delete_archive_rule(Client, AnalyzerName, RuleName, Input) ->
    delete_archive_rule(Client, AnalyzerName, RuleName, Input, []).
delete_archive_rule(Client, AnalyzerName, RuleName, Input0, Options) ->
    Method = delete,
    Path = ["/analyzer/", aws_util:encode_uri(AnalyzerName), "/archive-rule/", aws_util:encode_uri(RuleName), ""],
    SuccessStatusCode = 200,

    Headers = [],
    Input1 = Input0,

    QueryMapping = [
                     {<<"clientToken">>, <<"clientToken">>}
                   ],
    {Query_, Input} = aws_request:build_headers(QueryMapping, Input1),
    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Retrieves information about a resource that was analyzed.
get_analyzed_resource(Client, AnalyzerArn, ResourceArn)
  when is_map(Client) ->
    get_analyzed_resource(Client, AnalyzerArn, ResourceArn, []).
get_analyzed_resource(Client, AnalyzerArn, ResourceArn, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/analyzed-resource"],
    SuccessStatusCode = 200,

    Headers = [],

    Query0_ =
      [
        {<<"analyzerArn">>, AnalyzerArn},
        {<<"resourceArn">>, ResourceArn}
      ],
    Query_ = [H || {_, V} = H <- Query0_, V =/= undefined],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Retrieves information about the specified analyzer.
get_analyzer(Client, AnalyzerName)
  when is_map(Client) ->
    get_analyzer(Client, AnalyzerName, []).
get_analyzer(Client, AnalyzerName, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/analyzer/", aws_util:encode_uri(AnalyzerName), ""],
    SuccessStatusCode = 200,

    Headers = [],

    Query_ = [],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Retrieves information about an archive rule.
%%
%% To learn about filter keys that you can use to create an archive rule, see
%% Access Analyzer filter keys in the IAM User Guide.
get_archive_rule(Client, AnalyzerName, RuleName)
  when is_map(Client) ->
    get_archive_rule(Client, AnalyzerName, RuleName, []).
get_archive_rule(Client, AnalyzerName, RuleName, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/analyzer/", aws_util:encode_uri(AnalyzerName), "/archive-rule/", aws_util:encode_uri(RuleName), ""],
    SuccessStatusCode = 200,

    Headers = [],

    Query_ = [],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Retrieves information about the specified finding.
get_finding(Client, Id, AnalyzerArn)
  when is_map(Client) ->
    get_finding(Client, Id, AnalyzerArn, []).
get_finding(Client, Id, AnalyzerArn, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/finding/", aws_util:encode_uri(Id), ""],
    SuccessStatusCode = 200,

    Headers = [],

    Query0_ =
      [
        {<<"analyzerArn">>, AnalyzerArn}
      ],
    Query_ = [H || {_, V} = H <- Query0_, V =/= undefined],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Retrieves a list of resources of the specified type that have been
%% analyzed by the specified analyzer..
list_analyzed_resources(Client, Input) ->
    list_analyzed_resources(Client, Input, []).
list_analyzed_resources(Client, Input0, Options) ->
    Method = post,
    Path = ["/analyzed-resource"],
    SuccessStatusCode = 200,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Retrieves a list of analyzers.
list_analyzers(Client, MaxResults, NextToken, Type)
  when is_map(Client) ->
    list_analyzers(Client, MaxResults, NextToken, Type, []).
list_analyzers(Client, MaxResults, NextToken, Type, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/analyzer"],
    SuccessStatusCode = 200,

    Headers = [],

    Query0_ =
      [
        {<<"maxResults">>, MaxResults},
        {<<"nextToken">>, NextToken},
        {<<"type">>, Type}
      ],
    Query_ = [H || {_, V} = H <- Query0_, V =/= undefined],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Retrieves a list of archive rules created for the specified analyzer.
list_archive_rules(Client, AnalyzerName, MaxResults, NextToken)
  when is_map(Client) ->
    list_archive_rules(Client, AnalyzerName, MaxResults, NextToken, []).
list_archive_rules(Client, AnalyzerName, MaxResults, NextToken, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/analyzer/", aws_util:encode_uri(AnalyzerName), "/archive-rule"],
    SuccessStatusCode = 200,

    Headers = [],

    Query0_ =
      [
        {<<"maxResults">>, MaxResults},
        {<<"nextToken">>, NextToken}
      ],
    Query_ = [H || {_, V} = H <- Query0_, V =/= undefined],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Retrieves a list of findings generated by the specified analyzer.
%%
%% To learn about filter keys that you can use to create an archive rule, see
%% Access Analyzer filter keys in the IAM User Guide.
list_findings(Client, Input) ->
    list_findings(Client, Input, []).
list_findings(Client, Input0, Options) ->
    Method = post,
    Path = ["/finding"],
    SuccessStatusCode = 200,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Retrieves a list of tags applied to the specified resource.
list_tags_for_resource(Client, ResourceArn)
  when is_map(Client) ->
    list_tags_for_resource(Client, ResourceArn, []).
list_tags_for_resource(Client, ResourceArn, Options)
  when is_map(Client), is_list(Options) ->
    Path = ["/tags/", aws_util:encode_uri(ResourceArn), ""],
    SuccessStatusCode = 200,

    Headers = [],

    Query_ = [],

    request(Client, get, Path, Query_, Headers, undefined, Options, SuccessStatusCode).

%% @doc Immediately starts a scan of the policies applied to the specified
%% resource.
start_resource_scan(Client, Input) ->
    start_resource_scan(Client, Input, []).
start_resource_scan(Client, Input0, Options) ->
    Method = post,
    Path = ["/resource/scan"],
    SuccessStatusCode = 200,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Adds a tag to the specified resource.
tag_resource(Client, ResourceArn, Input) ->
    tag_resource(Client, ResourceArn, Input, []).
tag_resource(Client, ResourceArn, Input0, Options) ->
    Method = post,
    Path = ["/tags/", aws_util:encode_uri(ResourceArn), ""],
    SuccessStatusCode = 200,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Removes a tag from the specified resource.
untag_resource(Client, ResourceArn, Input) ->
    untag_resource(Client, ResourceArn, Input, []).
untag_resource(Client, ResourceArn, Input0, Options) ->
    Method = delete,
    Path = ["/tags/", aws_util:encode_uri(ResourceArn), ""],
    SuccessStatusCode = 200,

    Headers = [],
    Input1 = Input0,

    QueryMapping = [
                     {<<"tagKeys">>, <<"tagKeys">>}
                   ],
    {Query_, Input} = aws_request:build_headers(QueryMapping, Input1),
    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Updates the criteria and values for the specified archive rule.
update_archive_rule(Client, AnalyzerName, RuleName, Input) ->
    update_archive_rule(Client, AnalyzerName, RuleName, Input, []).
update_archive_rule(Client, AnalyzerName, RuleName, Input0, Options) ->
    Method = put,
    Path = ["/analyzer/", aws_util:encode_uri(AnalyzerName), "/archive-rule/", aws_util:encode_uri(RuleName), ""],
    SuccessStatusCode = 200,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%% @doc Updates the status for the specified findings.
update_findings(Client, Input) ->
    update_findings(Client, Input, []).
update_findings(Client, Input0, Options) ->
    Method = put,
    Path = ["/finding"],
    SuccessStatusCode = 200,

    Headers = [],
    Input1 = Input0,

    Query_ = [],
    Input = Input1,

    request(Client, Method, Path, Query_, Headers, Input, Options, SuccessStatusCode).

%%====================================================================
%% Internal functions
%%====================================================================

-spec request(aws_client:aws_client(), atom(), iolist(), list(),
              list(), map() | undefined, list(), pos_integer() | undefined) ->
    {ok, Result, {integer(), list(), hackney:client()}} |
    {error, Error, {integer(), list(), hackney:client()}} |
    {error, term()} when
    Result :: map(),
    Error :: map().
request(Client, Method, Path, Query, Headers0, Input, Options, SuccessStatusCode) ->
    Client1 = Client#{service => <<"access-analyzer">>},
    Host = build_host(<<"access-analyzer">>, Client1),
    URL0 = build_url(Host, Path, Client1),
    URL = aws_request:add_query(URL0, Query),
    AdditionalHeaders = [ {<<"Host">>, Host}
                        , {<<"Content-Type">>, <<"application/x-amz-json-1.1">>}
                        ],
    Headers1 = aws_request:add_headers(AdditionalHeaders, Headers0),

    Payload =
      case proplists:get_value(should_send_body_as_binary, Options) of
        true ->
          maps:get(<<"Body">>, Input, <<"">>);
        undefined ->
          encode_payload(Input)
      end,

    MethodBin = aws_request:method_to_binary(Method),
    SignedHeaders = aws_request:sign_request(Client1, MethodBin, URL, Headers1, Payload),
    Response = hackney:request(Method, URL, SignedHeaders, Payload, Options),
    handle_response(Response, SuccessStatusCode).

handle_response({ok, StatusCode, ResponseHeaders, Client}, SuccessStatusCode)
  when StatusCode =:= 200;
       StatusCode =:= 202;
       StatusCode =:= 204;
       StatusCode =:= SuccessStatusCode ->
    case hackney:body(Client) of
        {ok, <<>>} when StatusCode =:= 200;
                        StatusCode =:= SuccessStatusCode ->
            {ok, #{}, {StatusCode, ResponseHeaders, Client}};
        {ok, Body} ->
            Result = jsx:decode(Body),
            {ok, Result, {StatusCode, ResponseHeaders, Client}}
    end;
handle_response({ok, StatusCode, ResponseHeaders, Client}, _) ->
    {ok, Body} = hackney:body(Client),
    Error = jsx:decode(Body),
    {error, Error, {StatusCode, ResponseHeaders, Client}};
handle_response({error, Reason}, _) ->
  {error, Reason}.

build_host(_EndpointPrefix, #{region := <<"local">>, endpoint := Endpoint}) ->
    Endpoint;
build_host(_EndpointPrefix, #{region := <<"local">>}) ->
    <<"localhost">>;
build_host(EndpointPrefix, #{region := Region, endpoint := Endpoint}) ->
    aws_util:binary_join([EndpointPrefix, Region, Endpoint], <<".">>).

build_url(Host, Path0, Client) ->
    Proto = maps:get(proto, Client),
    Path = erlang:iolist_to_binary(Path0),
    Port = maps:get(port, Client),
    aws_util:binary_join([Proto, <<"://">>, Host, <<":">>, Port, Path], <<"">>).

-spec encode_payload(undefined | map()) -> binary().
encode_payload(undefined) ->
  <<>>;
encode_payload(Input) ->
  jsx:encode(Input).
