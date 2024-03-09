%% WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
%% See https://github.com/aws-beam/aws-codegen for more details.

%% @doc Amazon Inspector
%%
%% Amazon Inspector enables you to analyze the behavior of your AWS resources
%% and to
%% identify potential security issues.
%%
%% For more information, see Amazon Inspector User
%% Guide:
%% https://docs.aws.amazon.com/inspector/latest/userguide/inspector_introduction.html.
-module(aws_inspector).

-export([add_attributes_to_findings/2,
         add_attributes_to_findings/3,
         create_assessment_target/2,
         create_assessment_target/3,
         create_assessment_template/2,
         create_assessment_template/3,
         create_exclusions_preview/2,
         create_exclusions_preview/3,
         create_resource_group/2,
         create_resource_group/3,
         delete_assessment_run/2,
         delete_assessment_run/3,
         delete_assessment_target/2,
         delete_assessment_target/3,
         delete_assessment_template/2,
         delete_assessment_template/3,
         describe_assessment_runs/2,
         describe_assessment_runs/3,
         describe_assessment_targets/2,
         describe_assessment_targets/3,
         describe_assessment_templates/2,
         describe_assessment_templates/3,
         describe_cross_account_access_role/2,
         describe_cross_account_access_role/3,
         describe_exclusions/2,
         describe_exclusions/3,
         describe_findings/2,
         describe_findings/3,
         describe_resource_groups/2,
         describe_resource_groups/3,
         describe_rules_packages/2,
         describe_rules_packages/3,
         get_assessment_report/2,
         get_assessment_report/3,
         get_exclusions_preview/2,
         get_exclusions_preview/3,
         get_telemetry_metadata/2,
         get_telemetry_metadata/3,
         list_assessment_run_agents/2,
         list_assessment_run_agents/3,
         list_assessment_runs/2,
         list_assessment_runs/3,
         list_assessment_targets/2,
         list_assessment_targets/3,
         list_assessment_templates/2,
         list_assessment_templates/3,
         list_event_subscriptions/2,
         list_event_subscriptions/3,
         list_exclusions/2,
         list_exclusions/3,
         list_findings/2,
         list_findings/3,
         list_rules_packages/2,
         list_rules_packages/3,
         list_tags_for_resource/2,
         list_tags_for_resource/3,
         preview_agents/2,
         preview_agents/3,
         register_cross_account_access_role/2,
         register_cross_account_access_role/3,
         remove_attributes_from_findings/2,
         remove_attributes_from_findings/3,
         set_tags_for_resource/2,
         set_tags_for_resource/3,
         start_assessment_run/2,
         start_assessment_run/3,
         stop_assessment_run/2,
         stop_assessment_run/3,
         subscribe_to_event/2,
         subscribe_to_event/3,
         unsubscribe_from_event/2,
         unsubscribe_from_event/3,
         update_assessment_target/2,
         update_assessment_target/3]).

-include_lib("hackney/include/hackney_lib.hrl").

%%====================================================================
%% API
%%====================================================================

%% @doc Assigns attributes (key and value pairs) to the findings that are
%% specified by the
%% ARNs of the findings.
add_attributes_to_findings(Client, Input)
  when is_map(Client), is_map(Input) ->
    add_attributes_to_findings(Client, Input, []).
add_attributes_to_findings(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"AddAttributesToFindings">>, Input, Options).

%% @doc Creates a new assessment target using the ARN of the resource group
%% that is generated
%% by `CreateResourceGroup'.
%%
%% If resourceGroupArn is not specified, all EC2
%% instances in the current AWS account and region are included in the
%% assessment target. If
%% the service-linked role:
%% https://docs.aws.amazon.com/inspector/latest/userguide/inspector_slr.html
%% isn’t already registered, this action also creates and
%% registers a service-linked role to grant Amazon Inspector access to AWS
%% Services needed to
%% perform security assessments. You can create up to 50 assessment targets
%% per AWS account.
%% You can run up to 500 concurrent agents per AWS account. For more
%% information, see
%% Amazon Inspector Assessment Targets:
%% https://docs.aws.amazon.com/inspector/latest/userguide/inspector_applications.html.
create_assessment_target(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_assessment_target(Client, Input, []).
create_assessment_target(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateAssessmentTarget">>, Input, Options).

%% @doc Creates an assessment template for the assessment target that is
%% specified by the ARN
%% of the assessment target.
%%
%% If the service-linked role:
%% https://docs.aws.amazon.com/inspector/latest/userguide/inspector_slr.html
%% isn’t already registered, this action also creates and
%% registers a service-linked role to grant Amazon Inspector access to AWS
%% Services needed to
%% perform security assessments.
create_assessment_template(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_assessment_template(Client, Input, []).
create_assessment_template(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateAssessmentTemplate">>, Input, Options).

%% @doc Starts the generation of an exclusions preview for the specified
%% assessment template.
%%
%% The exclusions preview lists the potential exclusions (ExclusionPreview)
%% that Inspector can
%% detect before it runs the assessment.
create_exclusions_preview(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_exclusions_preview(Client, Input, []).
create_exclusions_preview(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateExclusionsPreview">>, Input, Options).

%% @doc Creates a resource group using the specified set of tags (key and
%% value pairs) that
%% are used to select the EC2 instances to be included in an Amazon Inspector
%% assessment
%% target.
%%
%% The created resource group is then used to create an Amazon Inspector
%% assessment
%% target. For more information, see `CreateAssessmentTarget'.
create_resource_group(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_resource_group(Client, Input, []).
create_resource_group(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateResourceGroup">>, Input, Options).

%% @doc Deletes the assessment run that is specified by the ARN of the
%% assessment
%% run.
delete_assessment_run(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_assessment_run(Client, Input, []).
delete_assessment_run(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteAssessmentRun">>, Input, Options).

%% @doc Deletes the assessment target that is specified by the ARN of the
%% assessment
%% target.
delete_assessment_target(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_assessment_target(Client, Input, []).
delete_assessment_target(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteAssessmentTarget">>, Input, Options).

%% @doc Deletes the assessment template that is specified by the ARN of the
%% assessment
%% template.
delete_assessment_template(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_assessment_template(Client, Input, []).
delete_assessment_template(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteAssessmentTemplate">>, Input, Options).

%% @doc Describes the assessment runs that are specified by the ARNs of the
%% assessment
%% runs.
describe_assessment_runs(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_assessment_runs(Client, Input, []).
describe_assessment_runs(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeAssessmentRuns">>, Input, Options).

%% @doc Describes the assessment targets that are specified by the ARNs of
%% the assessment
%% targets.
describe_assessment_targets(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_assessment_targets(Client, Input, []).
describe_assessment_targets(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeAssessmentTargets">>, Input, Options).

%% @doc Describes the assessment templates that are specified by the ARNs of
%% the assessment
%% templates.
describe_assessment_templates(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_assessment_templates(Client, Input, []).
describe_assessment_templates(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeAssessmentTemplates">>, Input, Options).

%% @doc Describes the IAM role that enables Amazon Inspector to access your
%% AWS
%% account.
describe_cross_account_access_role(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_cross_account_access_role(Client, Input, []).
describe_cross_account_access_role(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeCrossAccountAccessRole">>, Input, Options).

%% @doc Describes the exclusions that are specified by the exclusions'
%% ARNs.
describe_exclusions(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_exclusions(Client, Input, []).
describe_exclusions(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeExclusions">>, Input, Options).

%% @doc Describes the findings that are specified by the ARNs of the
%% findings.
describe_findings(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_findings(Client, Input, []).
describe_findings(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeFindings">>, Input, Options).

%% @doc Describes the resource groups that are specified by the ARNs of the
%% resource
%% groups.
describe_resource_groups(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_resource_groups(Client, Input, []).
describe_resource_groups(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeResourceGroups">>, Input, Options).

%% @doc Describes the rules packages that are specified by the ARNs of the
%% rules
%% packages.
describe_rules_packages(Client, Input)
  when is_map(Client), is_map(Input) ->
    describe_rules_packages(Client, Input, []).
describe_rules_packages(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DescribeRulesPackages">>, Input, Options).

%% @doc Produces an assessment report that includes detailed and
%% comprehensive results of a
%% specified assessment run.
get_assessment_report(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_assessment_report(Client, Input, []).
get_assessment_report(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetAssessmentReport">>, Input, Options).

%% @doc Retrieves the exclusions preview (a list of ExclusionPreview objects)
%% specified by
%% the preview token.
%%
%% You can obtain the preview token by running the CreateExclusionsPreview
%% API.
get_exclusions_preview(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_exclusions_preview(Client, Input, []).
get_exclusions_preview(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetExclusionsPreview">>, Input, Options).

%% @doc Information about the data that is collected for the specified
%% assessment
%% run.
get_telemetry_metadata(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_telemetry_metadata(Client, Input, []).
get_telemetry_metadata(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetTelemetryMetadata">>, Input, Options).

%% @doc Lists the agents of the assessment runs that are specified by the
%% ARNs of the
%% assessment runs.
list_assessment_run_agents(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_assessment_run_agents(Client, Input, []).
list_assessment_run_agents(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListAssessmentRunAgents">>, Input, Options).

%% @doc Lists the assessment runs that correspond to the assessment templates
%% that are
%% specified by the ARNs of the assessment templates.
list_assessment_runs(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_assessment_runs(Client, Input, []).
list_assessment_runs(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListAssessmentRuns">>, Input, Options).

%% @doc Lists the ARNs of the assessment targets within this AWS account.
%%
%% For more
%% information about assessment targets, see Amazon Inspector Assessment
%% Targets:
%% https://docs.aws.amazon.com/inspector/latest/userguide/inspector_applications.html.
list_assessment_targets(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_assessment_targets(Client, Input, []).
list_assessment_targets(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListAssessmentTargets">>, Input, Options).

%% @doc Lists the assessment templates that correspond to the assessment
%% targets that are
%% specified by the ARNs of the assessment targets.
list_assessment_templates(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_assessment_templates(Client, Input, []).
list_assessment_templates(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListAssessmentTemplates">>, Input, Options).

%% @doc Lists all the event subscriptions for the assessment template that is
%% specified by
%% the ARN of the assessment template.
%%
%% For more information, see `SubscribeToEvent' and
%% `UnsubscribeFromEvent'.
list_event_subscriptions(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_event_subscriptions(Client, Input, []).
list_event_subscriptions(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListEventSubscriptions">>, Input, Options).

%% @doc List exclusions that are generated by the assessment run.
list_exclusions(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_exclusions(Client, Input, []).
list_exclusions(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListExclusions">>, Input, Options).

%% @doc Lists findings that are generated by the assessment runs that are
%% specified by the
%% ARNs of the assessment runs.
list_findings(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_findings(Client, Input, []).
list_findings(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListFindings">>, Input, Options).

%% @doc Lists all available Amazon Inspector rules packages.
list_rules_packages(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_rules_packages(Client, Input, []).
list_rules_packages(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListRulesPackages">>, Input, Options).

%% @doc Lists all tags associated with an assessment template.
list_tags_for_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_tags_for_resource(Client, Input, []).
list_tags_for_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListTagsForResource">>, Input, Options).

%% @doc Previews the agents installed on the EC2 instances that are part of
%% the specified
%% assessment target.
preview_agents(Client, Input)
  when is_map(Client), is_map(Input) ->
    preview_agents(Client, Input, []).
preview_agents(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"PreviewAgents">>, Input, Options).

%% @doc Registers the IAM role that grants Amazon Inspector access to AWS
%% Services needed to
%% perform security assessments.
register_cross_account_access_role(Client, Input)
  when is_map(Client), is_map(Input) ->
    register_cross_account_access_role(Client, Input, []).
register_cross_account_access_role(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"RegisterCrossAccountAccessRole">>, Input, Options).

%% @doc Removes entire attributes (key and value pairs) from the findings
%% that are specified
%% by the ARNs of the findings where an attribute with the specified key
%% exists.
remove_attributes_from_findings(Client, Input)
  when is_map(Client), is_map(Input) ->
    remove_attributes_from_findings(Client, Input, []).
remove_attributes_from_findings(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"RemoveAttributesFromFindings">>, Input, Options).

%% @doc Sets tags (key and value pairs) to the assessment template that is
%% specified by the
%% ARN of the assessment template.
set_tags_for_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    set_tags_for_resource(Client, Input, []).
set_tags_for_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"SetTagsForResource">>, Input, Options).

%% @doc Starts the assessment run specified by the ARN of the assessment
%% template.
%%
%% For this
%% API to function properly, you must not exceed the limit of running up to
%% 500 concurrent
%% agents per AWS account.
start_assessment_run(Client, Input)
  when is_map(Client), is_map(Input) ->
    start_assessment_run(Client, Input, []).
start_assessment_run(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"StartAssessmentRun">>, Input, Options).

%% @doc Stops the assessment run that is specified by the ARN of the
%% assessment
%% run.
stop_assessment_run(Client, Input)
  when is_map(Client), is_map(Input) ->
    stop_assessment_run(Client, Input, []).
stop_assessment_run(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"StopAssessmentRun">>, Input, Options).

%% @doc Enables the process of sending Amazon Simple Notification Service
%% (SNS) notifications
%% about a specified event to a specified SNS topic.
subscribe_to_event(Client, Input)
  when is_map(Client), is_map(Input) ->
    subscribe_to_event(Client, Input, []).
subscribe_to_event(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"SubscribeToEvent">>, Input, Options).

%% @doc Disables the process of sending Amazon Simple Notification Service
%% (SNS)
%% notifications about a specified event to a specified SNS topic.
unsubscribe_from_event(Client, Input)
  when is_map(Client), is_map(Input) ->
    unsubscribe_from_event(Client, Input, []).
unsubscribe_from_event(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UnsubscribeFromEvent">>, Input, Options).

%% @doc Updates the assessment target that is specified by the ARN of the
%% assessment
%% target.
%%
%% If resourceGroupArn is not specified, all EC2 instances in the current AWS
%% account
%% and region are included in the assessment target.
update_assessment_target(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_assessment_target(Client, Input, []).
update_assessment_target(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateAssessmentTarget">>, Input, Options).

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
    Client1 = Client#{service => <<"inspector">>},
    Host = build_host(<<"inspector">>, Client1),
    URL = build_url(Host, Client1),
    Headers = [
        {<<"Host">>, Host},
        {<<"Content-Type">>, <<"application/x-amz-json-1.1">>},
        {<<"X-Amz-Target">>, <<"InspectorService.", Action/binary>>}
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
