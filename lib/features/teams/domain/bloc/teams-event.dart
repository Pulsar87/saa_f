import 'dart:io';

abstract class TeamsEvent {}
class TeamsRefreshEvent extends TeamsEvent {}

class InsertTeamsEvent extends TeamsEvent {
  final String description;
  final String name;
  final String type;
  InsertTeamsEvent({ required this.description, required this.name, required this.type,});
}


class AddCommonQuestionEvent extends TeamsEvent {
  final int id;
  final String question;
  final String answer;
  AddCommonQuestionEvent({ required this.question, required this.answer, required this.id});
}

class GetTeamsListEvent extends TeamsEvent {}

class ShowTeamInfoEvent extends TeamsEvent {
  final int id;

  ShowTeamInfoEvent(this.id);
}
class GetTeamCommonQuestionEvent extends TeamsEvent {
  final int id;

  GetTeamCommonQuestionEvent(this.id);
}

class JoinTeamRequestEvent extends TeamsEvent {
  final int id;
  JoinTeamRequestEvent({required this.id});
}

class ShowTeamJoinRequestEvent extends TeamsEvent {
  final int id;

  ShowTeamJoinRequestEvent(this.id);
}
class ShowMemberInfoJoinEvent extends TeamsEvent {
  final int id;

  ShowMemberInfoJoinEvent(this.id);
}

class AcceptJoinRequestEvent extends TeamsEvent {
  final int id;

  AcceptJoinRequestEvent(this.id);
}

class RefuseJoinRequestEvent extends TeamsEvent {
  final int id;

  RefuseJoinRequestEvent(this.id);
}
class MemberDeleteFromTeamEvent extends TeamsEvent {
  final int memberId;
  final int teamId;

  MemberDeleteFromTeamEvent({required this.memberId, required this.teamId});
}

class MemberAddToTeamEvent extends TeamsEvent {
  final int memberId;
  final int teamId;

  MemberAddToTeamEvent({required this.memberId, required this.teamId});
}
class SpecifyTeamLeaderEvent extends TeamsEvent {
  final int memberId;
  final int teamId;

  SpecifyTeamLeaderEvent({required this.memberId, required this.teamId});
}

class SpecifyTeamSupervisorEvent extends TeamsEvent {
  final int memberId;
  final int teamId;

  SpecifyTeamSupervisorEvent({required this.memberId, required this.teamId});
}
class RetreatFromTeamEvent extends TeamsEvent {
  final int id;

  RetreatFromTeamEvent({required this.id});
}
class AddRatingEvent extends TeamsEvent {
  final int teamId;
  final int memberId;
  final int rate;
  final String date;

  AddRatingEvent({required this.teamId,required this.memberId, required this.rate,required this.date,});
}
class ShowRatingEvent extends TeamsEvent {
  final int id;

  ShowRatingEvent({required this.id});
}

class ShowAdminMemberEvent extends TeamsEvent{}

class ShowAllTeamMemberEvent extends TeamsEvent {
  final int id;

  ShowAllTeamMemberEvent(this.id);

}