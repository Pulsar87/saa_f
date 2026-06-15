import '../../../core/constant/app-const.dart';

//------------------- AUTH ----------------

const String sinupUrl = '${AppConst.baseUrl}/register';
const String loginUrl = '${AppConst.baseUrl}/login';
const String profileShowUrl = '${AppConst.baseUrl}/profile';
const String sendEmailToResetPasswordUrl = '${AppConst.baseUrl}/password/email';
const String checkCodeToResetPasswordUrl = '${AppConst.baseUrl}/password/code/check';
const String sendEmailUrl = '${AppConst.baseUrl}/verify-email';
const String resetPasswordUrl = '${AppConst.baseUrl}/password/reset';
const String listUserUrl = '${AppConst.baseUrl}/superadmin/index_all_users/';
const String activeUserUrl = '${AppConst.baseUrl}/superadmin/verify_Account/';
const String listActiveMemberUrl = '${AppConst.baseUrl}/Show_Active_member';
const String showActiveMemberUrl =
    '${AppConst.baseUrl}/show_Active_member_info/';
const String listSeparateMemberUrl =
    '${AppConst.baseUrl}/separation_members_index';
const String separateMemberUrl = '${AppConst.baseUrl}/separate';
const String unSeparateMemberUrl = '${AppConst.baseUrl}/unSeparate';

const String getProfileUrl = '${AppConst.baseUrl}/profile';
const String updateProfileUrl = '${AppConst.baseUrl}/update/profile';
const String addJoinRequestUrl = '${AppConst.baseUrl}/Membership_request';
const String resetPasswordUser = '${AppConst.baseUrl}/reset_password';
const String anActivities = '${AppConst.baseUrl}/index_announced_Activities';
const String addActivityUrl = '${AppConst.baseUrl}/add_Activity';
const String editActivityUrl = '${AppConst.baseUrl}/update_Activity/';
const String confirmActivityUrl = '${AppConst.baseUrl}/confirm_Activity';
const String getAnnouncedActivitiesUrl = '${AppConst.baseUrl}/index_announced_Activities';
const String showActivityUrl = '${AppConst.baseUrl}/show_Activity/';
const String deleteActivityUrl = '${AppConst.baseUrl}/delete_Activity/ ';
//الأنشطة الحديثة
const String getConfirmedActivities = '${AppConst.baseUrl}/index_confirimed_Activities';

const String getAdminMemberUrl =
    '${AppConst.baseUrl}/admin_member/index_Admin_Member';
const String getResponsibleActivitiesUrl =
    '${AppConst.baseUrl}/responsible_activities';
const String myActivitiesUrl = '${AppConst.baseUrl}/member/My_Activities';
const String cancelActivityUrl = '${AppConst.baseUrl}/cancel_Activity/';
const String joinActivityUrl = '${AppConst.baseUrl}/member/';
const String allMemberActivityUrl =
    '${AppConst.baseUrl}/admin_member/index_Participants/';
const String allActivityMemberUrl =
    '${AppConst.baseUrl}/admin_member/index_member_activity/';
const String removeMemberUrl = '${AppConst.baseUrl}/remove_participant/';
const String showStoresUrl = '${AppConst.baseUrl}/stores_show';
const String addStoresUrl = '${AppConst.baseUrl}/store_add';

//------------------- Membership ----------------
const String membership_index = '${AppConst.baseUrl}/membership_index';
const String membershipInfo = '${AppConst.baseUrl}/show_member_request';
const String membershipAccept = '${AppConst.baseUrl}/accept';
const String membershipRefuse = '${AppConst.baseUrl}/refuse';

//------------------- Publish ----------------
const String insertImageUrl = '${AppConst.baseUrl}/insert_image';
const String insertVideoUrl = '${AppConst.baseUrl}/insert_video';
const String imagesIndexUrl = '${AppConst.baseUrl}/images_index';
const String videoRequestIndexUrl = '${AppConst.baseUrl}/videos_index';
const String imageShowUrl = '${AppConst.baseUrl}/image_show';
const String videoShowUrl = '${AppConst.baseUrl}/video_show';
const String imageAcceptUrl = '${AppConst.baseUrl}/image_accept';
const String videoAcceptUrl = '${AppConst.baseUrl}/video_accept';
const String imageRefuseUrl = '${AppConst.baseUrl}/image_refuse';
const String videoRefuseUrl = '${AppConst.baseUrl}/video_refuse';
const String imageShowListUrl = '${AppConst.baseUrl}/imagesShow';
const String videoShowListUrl = '${AppConst.baseUrl}/videosShow';
const String imageLikeUrl = '${AppConst.baseUrl}/imageLike';
const String videoLikeUrl = '${AppConst.baseUrl}/videoLike';
const String postShowListUrl = '${AppConst.baseUrl}/Main/getMedia';

//------------------- Article ----------------
const String insertArticleUrl = '${AppConst.baseUrl}/article_insert';
const String articleIndexUrl = '${AppConst.baseUrl}/articles_index';
const String articleShowUrl = '${AppConst.baseUrl}/article_show';
const String articleAcceptUrl = '${AppConst.baseUrl}/article_accept';
const String articleRefuseUrl = '${AppConst.baseUrl}/article_refuse';
const String articleLikeUrl = '${AppConst.baseUrl}/articleLike';

//------------------- Teams ----------------
const String insertTeamUrl = '${AppConst.baseUrl}/team_insert';
const String addCommonQuestionUrl = '${AppConst.baseUrl}/add_question';
const String showTeams = '${AppConst.baseUrl}/index_all_teams';
const String getCommonQuestionUrl = '${AppConst.baseUrl}/common_questions_show';
const String joinTeamRequestUrl = '${AppConst.baseUrl}/member_team_request';
const String showTeamInfoUrl = '${AppConst.baseUrl}/show_team_info';
const String showAdminUrl = '${AppConst.baseUrl}/all_admin_member';
const String showTeamMemberUrl = '${AppConst.baseUrl}/members_team_show';
const String showTeamJoinRequestUrl =
    '${AppConst.baseUrl}/member_team_requests_show';
const String showTeamMemberInfoUrl =
      '${AppConst.baseUrl}/show_team_member_info';
const String acceptJoinRequestUrl = '${AppConst.baseUrl}/accept_member_in_team';
const String refuseJoinRequestUrl = '${AppConst.baseUrl}/refuse_member_in_team';
const String memberDeleteFromTeamUrl = '${AppConst.baseUrl}/member_delete';
const String memberAddToTeamUrl = '${AppConst.baseUrl}/member_delete';
const String specifyTeamLeaderUrl = '${AppConst.baseUrl}/specify_team_leader';
const String specifyTeamSupervisorUrl =
    '${AppConst.baseUrl}/specify_team_supervisor';
const String retreatFromTeamUrl = '${AppConst.baseUrl}/retreat_from_team';
const String addRatingUrl = '${AppConst.baseUrl}/add_ratings';
const String showRatingUrl = '${AppConst.baseUrl}/show_my_ratings';

////////////////resources///////////////////////////

const String addStoreUrl = '${AppConst.baseUrl}/store_add';
const String listStoreUrl = '${AppConst.baseUrl}/stores_show';
const String listTelescopeUrl =
    '${AppConst.baseUrl}/resources_show?resource_type=تلسكوبات&store_id=';
const String listLensUrl =
    '${AppConst.baseUrl}/api/resources_show?resource_type=عدسات&store_id=';
const String listGToolUrl =
    '${AppConst.baseUrl}/resources_show?resource_type=أدوات عامة&store_id=';
const String listAToolUrl =
    '${AppConst.baseUrl}/resources_show?resource_type=أدوات فلكية&store_id=';
const String addTelescopeUrl =
    '${AppConst.baseUrl}/resource_add?resource_type=تلسكوبات';
const String addAstronomyToolUrl =
    '${AppConst.baseUrl}/resource_type=أدوات فلكية';
const String addLensUrl = '${AppConst.baseUrl}/resource_type=عدسات';
const String addGeneralToolUrl =
    '${AppConst.baseUrl}/resource_add?resource_type=أدوات عامة';
