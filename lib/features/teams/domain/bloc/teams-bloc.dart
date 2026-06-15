import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/features/teams/domain/bloc/teams-event.dart';
import 'package:saa_f/features/teams/domain/bloc/teams-state.dart';

import '../../data/repository/team_repo.dart';

class TeamsBloc extends Bloc<TeamsEvent,TeamsState> {
  final TeamsRepo teamsRepo;
  TeamsBloc({required this.teamsRepo }) : super (TeamsInitState()) {
    on<InsertTeamsEvent> (_insertTeam);
    on<GetTeamsListEvent> (_getTeamsList);
    on<JoinTeamRequestEvent> (_joinTeamRequest);
    on<ShowTeamInfoEvent> (_showTeamInfo);
    on<RetreatFromTeamEvent> (_retreatFromTeam);
    on<ShowTeamJoinRequestEvent> (_showJoinRequest);
    on<AddCommonQuestionEvent> (_addCommonQuedtion);
    on<GetTeamCommonQuestionEvent> (_getCommonQuedtion);
    on<SpecifyTeamSupervisorEvent> (_specifyTeamSupervisor);
    on<SpecifyTeamLeaderEvent> (_specifyTeamLeader);
    on<ShowAdminMemberEvent> (_showAdminMember);
    on<RefuseJoinRequestEvent> (_refuseJoinRequest);
    on<AcceptJoinRequestEvent> (_acceptJoinRequest);
    on<ShowMemberInfoJoinEvent> (_showMemberTeamInfo);
    on<MemberDeleteFromTeamEvent> (_deleteMemberFromTeam);
    on<AddRatingEvent> (_addRating);
    on<ShowRatingEvent> (_showRating);
    on<ShowAllTeamMemberEvent> (_showTeamMember);
    on<TeamsRefreshEvent> (_refresh);
  }


  Future<FutureOr<void>> _insertTeam(InsertTeamsEvent event, Emitter<TeamsState> emit)
  async {
    emit(InsertTeamsLoadingState());
    try {
      var response = await teamsRepo.insertTeam(
          description: event.description,
          name: event.name,
          type: event.type);
      if (response) {
        emit(InsertTeamsSuccessState());
        print("Insert Success");
      } else {
        emit(InsertTeamsErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(InsertTeamsErrorState(e.toString()));
    }
  }


  FutureOr<void> _getTeamsList(GetTeamsListEvent event, Emitter<TeamsState> emit)
  async {
    emit(GetTeamsListLoadingState());
    try {
        var response = await teamsRepo.getTeamsList();
      if (response.success) {
        emit(GetTeamsListSuccessState(teamListModel: response));
        print("get team Success");
      } else {
        emit(GetTeamsListErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(GetTeamsListErrorState(e.toString()));
    }
  }


  Future<FutureOr<void>> _joinTeamRequest(JoinTeamRequestEvent event, Emitter<TeamsState> emit)
  async {
    emit(JoinTeamRequestLoadingState());
    try {
      var response = await teamsRepo.joinTeamRequest(event.id);
      if (response) {
        emit(JoinTeamRequestSuccessState());
        print("join request Success");
      } else {
        emit(JoinTeamRequestErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(JoinTeamRequestErrorState(e.toString()));
    }
  }

  FutureOr<void> _showTeamInfo(ShowTeamInfoEvent event, Emitter<TeamsState> emit)
  async {
    emit(ShowTeamInfoLoadingState());
    try {
      var response = await teamsRepo.showTeamInfo(event.id);
      if (response.success) {
        emit(ShowTeamInfoSuccessState(teamInfoModel: response));
        print("get team Success");
      } else {
        emit(ShowTeamInfoErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ShowTeamInfoErrorState(e.toString()));
    }
  }


  FutureOr<void> _retreatFromTeam(RetreatFromTeamEvent event, Emitter<TeamsState> emit)
  async {
    emit(RetreatFromTeamLoadingState());
    try {
      var response = await teamsRepo.retreatFromTeam(event.id);
      if (response) {
        emit(RetreatFromTeamSuccessState());
        print("join request Success");
      } else {
        emit(RetreatFromTeamErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(RetreatFromTeamErrorState(e.toString()));
    }
  }


  FutureOr<void> _showJoinRequest(ShowTeamJoinRequestEvent event, Emitter<TeamsState> emit)
  async {
    emit(ShowTeamJoinRequestLoadingState());
    try {
      var response = await teamsRepo.showTeamJoinRequest(event.id);
      if (response.sucesss) {
        emit(ShowTeamJoinRequestSuccessState(teamMembersListModel: response));
        print("get oinRequest Success");
      } else {
        print("get oinRequest false");

        emit(ShowTeamJoinRequestErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ShowTeamJoinRequestErrorState(e.toString()));
    }
  }


  FutureOr<void> _addCommonQuedtion(AddCommonQuestionEvent event, Emitter<TeamsState> emit)
  async {
    emit(AddCommonQuestionLoadingState());
    try {
      var response = await teamsRepo.addCommonQuestion(
      answer: event.answer,
        question: event.question,
        id: event.id
      );
      if (response) {
        emit(AddCommonQuestionSuccessState());
        print("Insert Success");
      } else {
        emit(AddCommonQuestionErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(AddCommonQuestionErrorState(e.toString()));
    }
  }


  FutureOr<void> _getCommonQuedtion(GetTeamCommonQuestionEvent event, Emitter<TeamsState> emit)
  async {
    emit(GetTeamsCommonQuestionLoadingState());
    try {
      var response = await teamsRepo.getTeamCommonQuestion(event.id);
      if (response.success) {
        emit(GetTeamsCommonQuestionSuccessState(teamsCommonQuestion: response));
        print("gGetTeamsCommonQuestion Success");
      } else {
        emit(GetTeamsCommonQuestionErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(GetTeamsCommonQuestionErrorState(e.toString()));
    }
  }


  FutureOr<void> _specifyTeamSupervisor(SpecifyTeamSupervisorEvent event, Emitter<TeamsState> emit)
  async {
    emit(SpecifyTeamSupervisorLoadingState());
    try {
      var response = await teamsRepo.specifyTeamSupervisor(
        memberId: event.memberId,
        teamId: event.teamId
      );
      if (response) {
        emit(SpecifyTeamSupervisorSuccessState());
        print("Specify super Success State");
      } else {
        emit(SpecifyTeamSupervisorErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(SpecifyTeamSupervisorErrorState(e.toString()));
    }
  }

  FutureOr<void> _specifyTeamLeader(SpecifyTeamLeaderEvent event, Emitter<TeamsState> emit)
  async {
    emit(SpecifyTeamLeaderLoadingState());
    try {
      var response = await teamsRepo.specifyTeamLeader(
          memberId: event.memberId,
          teamId: event.teamId
      );
      if (response) {
        emit(SpecifyTeamLeaderSuccessState());
        print("Specify leader Success State");
      } else {
        emit(SpecifyTeamLeaderErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(SpecifyTeamLeaderErrorState(e.toString()));
    }
  }

  FutureOr<void> _showAdminMember(ShowAdminMemberEvent event, Emitter<TeamsState> emit)
  async {
    emit(ShowAdminMemberLoadingState());
    try {
      var response = await teamsRepo.showAdmin();
      if (response.success) {
        emit(ShowAdminMemberSuccessState(teamListModel: response));
        print("Insert Success");
      } else {
        emit(ShowAdminMemberErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ShowAdminMemberErrorState(e.toString()));
    }
  }


  FutureOr<void> _refuseJoinRequest(RefuseJoinRequestEvent event, Emitter<TeamsState> emit)
  async {
    emit(RefuseJoinRequestLoadingState());
    try {
      var response = await teamsRepo.refuseJoinRequest(event.id);
      if (response) {
        emit(RefuseJoinRequestSuccessState());
        print("REFUSE Success");
      } else {
        emit(RefuseJoinRequestErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(RefuseJoinRequestErrorState(e.toString()));
    }
  }


  FutureOr<void> _acceptJoinRequest(AcceptJoinRequestEvent event, Emitter<TeamsState> emit)
  async {
    emit(AcceptJoinRequestLoadingState());
    try {
      var response = await teamsRepo.acceptJoinRequest(event.id);
      if (response) {
        emit(AcceptJoinRequestSuccessState());
        print("ACCEPT Success");
      } else {
        emit(AcceptJoinRequestErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(AcceptJoinRequestErrorState(e.toString()));
    }
  }


  FutureOr<void> _showMemberTeamInfo(ShowMemberInfoJoinEvent event, Emitter<TeamsState> emit)
  async {
    print("objectobjectobjectobjectobject");
    print (event.id);

    emit(ShowMemberInfoJoinLoadingState());
    try {
      var response = await teamsRepo.showTeamMemberInfo(event.id);
      if (response.success) {
        emit(ShowMemberInfoJointSuccessState(teamMemberInfoModel: response));
        print("show member Success");
      } else {
        emit(ShowMemberInfoJointErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ShowMemberInfoJointErrorState(e.toString()));
    }
  }


  FutureOr<void> _deleteMemberFromTeam(MemberDeleteFromTeamEvent event, Emitter<TeamsState> emit)
  async {
    emit(MemberDeleteFromTeamLoadingState());
    try {
      var response = await teamsRepo.memberDeleteFromTeam(
          memberId: event.memberId,
          teamId: event.teamId
      );
      if (response) {
        emit(MemberDeleteFromTeamSuccessState());
        print("MemberDeleteFromTeamSuccessState");
      } else {
        emit(MemberDeleteFromTeamErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(MemberDeleteFromTeamErrorState(e.toString()));
    }
  }


  FutureOr<void> _addRating(AddRatingEvent event, Emitter<TeamsState> emit)
  async {
    emit(AddRatingLoadingState());
    try {
      var response = await teamsRepo.addRating(
          memberId: event.memberId,
          teamId: event.teamId,
        rate: event.rate,
        date: event.date
      );
      if (response == "true") {
        emit(AddRatingSuccessState());
        print("AddRatingSuccessState");
      } else {
        emit(AddRatingErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(AddRatingErrorState(e.toString()));
    }
  }


  FutureOr<void> _showRating(ShowRatingEvent event, Emitter<TeamsState> emit)
  async {
    emit(ShowRatingLoadingState());
    try {
      var response = await teamsRepo.showRating(event.id);
      if (response.success) {
        emit(ShowRatingSuccessState(ratingMemberModel: response));
        print("show rating team Success");
      } else {
        emit(ShowRatingErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ShowRatingErrorState(e.toString()));
    }
  }


  FutureOr<void> _showTeamMember(ShowAllTeamMemberEvent event, Emitter<TeamsState> emit)
  async {
    emit(ShowAllTeamMemberLoadingState());
    try {
      var response = await teamsRepo.showTeamMember(event.id);
      if (response.success) {
        emit(ShowAllTeamMemberSuccessState(teamMemberListModel: response));
        print("show rating team Success");
      } else {
        emit(ShowAllTeamMemberErrorState(response.toString()));
      }
    } catch (e) {
      log(e.toString());
      emit(ShowAllTeamMemberErrorState(e.toString()));
    }
  }


  FutureOr<void> _refresh(TeamsRefreshEvent event, Emitter<TeamsState> emit) {
 print("TeamsRefreshState");
  emit (TeamsRefreshState());
  }
}
