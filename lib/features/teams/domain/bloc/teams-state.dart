
import '../models/article_info_model.dart';
import '../models/rating-member-model.dart';
import '../models/team-info_model.dart';
import '../models/team-list-model.dart';
import '../models/team-member-info_model.dart';
import '../models/team-member-list-model.dart';
import '../models/team-member-model.dart';

abstract class TeamsState {}

class TeamsInitState extends TeamsState {}
class TeamsRefreshState extends TeamsState {}

//insert Team
class InsertTeamsLoadingState extends TeamsState {}
class InsertTeamsErrorState extends TeamsState {
  final String error;
  InsertTeamsErrorState(this.error);
}
class InsertTeamsSuccessState extends TeamsState {}


//add AddComminQuestions
class AddCommonQuestionLoadingState extends TeamsState {}
class AddCommonQuestionErrorState extends TeamsState {
  final String error;
  AddCommonQuestionErrorState(this.error);
}
class AddCommonQuestionSuccessState extends TeamsState {}

//get teams
class GetTeamsListLoadingState extends TeamsState {}
class GetTeamsListErrorState extends TeamsState {
  final String error;
  GetTeamsListErrorState(this.error);
}
class GetTeamsListSuccessState extends TeamsState {
  TeamListModel teamListModel;
  GetTeamsListSuccessState ({required this.teamListModel});
}

//get common
class GetTeamsCommonQuestionLoadingState extends TeamsState {}
class GetTeamsCommonQuestionErrorState extends TeamsState {
  final String error;
  GetTeamsCommonQuestionErrorState(this.error);
}
class GetTeamsCommonQuestionSuccessState extends TeamsState {
  TeamListModel teamsCommonQuestion;
  GetTeamsCommonQuestionSuccessState ({required this.teamsCommonQuestion});
}

class ShowTeamInfoLoadingState extends TeamsState {}
class ShowTeamInfoErrorState extends TeamsState {
  final String error;
  ShowTeamInfoErrorState(this.error);
}
class ShowTeamInfoSuccessState extends TeamsState {
   TeamInfoModel teamInfoModel ;
  ShowTeamInfoSuccessState ({required this.teamInfoModel});
}

//join team
class JoinTeamRequestLoadingState extends TeamsState {}
class JoinTeamRequestErrorState extends TeamsState {
  final String error;
  JoinTeamRequestErrorState(this.error);
}
class JoinTeamRequestSuccessState extends TeamsState {}


class ShowTeamJoinRequestLoadingState extends TeamsState {}
class ShowTeamJoinRequestErrorState extends TeamsState {
  final String error;
  ShowTeamJoinRequestErrorState(this.error);
}
class ShowTeamJoinRequestSuccessState extends TeamsState {
  TeamMembersListModel teamMembersListModel;
  ShowTeamJoinRequestSuccessState ({required this.teamMembersListModel});
}

class ShowAdminMemberLoadingState extends TeamsState {}
class ShowAdminMemberErrorState extends TeamsState {
  final String error;
  ShowAdminMemberErrorState(this.error);
}
class ShowAdminMemberSuccessState extends TeamsState {
  TeamListModel teamListModel;
  ShowAdminMemberSuccessState ({required this.teamListModel});
}

class AcceptJoinRequestLoadingState extends TeamsState {}
class AcceptJoinRequestErrorState extends TeamsState {
  final String error;
  AcceptJoinRequestErrorState(this.error);
}
class AcceptJoinRequestSuccessState extends TeamsState {}

class RefuseJoinRequestLoadingState extends TeamsState {}
class RefuseJoinRequestErrorState extends TeamsState {
  final String error;
  RefuseJoinRequestErrorState(this.error);
}
class RefuseJoinRequestSuccessState extends TeamsState {}


class MemberDeleteFromTeamLoadingState extends TeamsState {}
class MemberDeleteFromTeamErrorState extends TeamsState {
  final String error;
  MemberDeleteFromTeamErrorState(this.error);
}
class MemberDeleteFromTeamSuccessState extends TeamsState {}



class MemberAddToTeamLoadingState extends TeamsState {}
class MemberAddToTeamErrorState extends TeamsState {
  final String error;
  MemberAddToTeamErrorState(this.error);
}
class MemberAddToTeamSuccessState extends TeamsState {}

class SpecifyTeamLeaderLoadingState extends TeamsState {}
class SpecifyTeamLeaderErrorState extends TeamsState {
  final String error;
  SpecifyTeamLeaderErrorState(this.error);
}
class SpecifyTeamLeaderSuccessState extends TeamsState {}


class SpecifyTeamSupervisorLoadingState extends TeamsState {}
class SpecifyTeamSupervisorErrorState extends TeamsState {
  final String error;
  SpecifyTeamSupervisorErrorState(this.error);
}
class SpecifyTeamSupervisorSuccessState extends TeamsState {}



class RetreatFromTeamLoadingState extends TeamsState {}
class RetreatFromTeamErrorState extends TeamsState {
  final String error;
  RetreatFromTeamErrorState(this.error);
}
class RetreatFromTeamSuccessState extends TeamsState {}



class AddRatingLoadingState extends TeamsState {}
class AddRatingErrorState extends TeamsState {
  final String error;
  AddRatingErrorState(this.error);
}
class AddRatingSuccessState extends TeamsState {}



class ShowRatingLoadingState extends TeamsState {}
class ShowRatingErrorState extends TeamsState {
  final String error;
  ShowRatingErrorState(this.error);
}
class ShowRatingSuccessState extends TeamsState {
  final RatingMemberModel ratingMemberModel;

  ShowRatingSuccessState({required this.ratingMemberModel});
}



class ShowMemberInfoJoinLoadingState extends TeamsState {}
class ShowMemberInfoJointErrorState extends TeamsState {
  final String error;
  ShowMemberInfoJointErrorState(this.error);
}
class ShowMemberInfoJointSuccessState extends TeamsState {
  TeamMemberInfoModel teamMemberInfoModel;
  ShowMemberInfoJointSuccessState ({required this.teamMemberInfoModel});
}

class ShowAllTeamMemberLoadingState extends TeamsState {}
class ShowAllTeamMemberErrorState extends TeamsState {
  final String error;
  ShowAllTeamMemberErrorState(this.error);
}
class ShowAllTeamMemberSuccessState extends TeamsState {
  TeamMemberListModel teamMemberListModel;
  ShowAllTeamMemberSuccessState ({required this.teamMemberListModel});
}

