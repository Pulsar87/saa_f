import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/network/local/shared_prefrences_helper.dart';
import 'package:saa_f/features/teams/domain/bloc/teams-bloc.dart';
import 'package:saa_f/features/teams/domain/bloc/teams-event.dart';
import 'package:saa_f/features/teams/presentation/widgets/JoinRequests/team-person-list-item.dart';

import '../../../../../core/router/animation_route.dart';
import '../../screens/team-member-main-screen.dart';

class TeamMembersList extends StatelessWidget {
   TeamMembersList({
    super.key, required this.members, required this.teamId, required this.meIsTeamLeader, required this.meIsSupervisor,
  });
    List<dynamic> members;
    final int teamId;
   final bool meIsTeamLeader;
   final bool meIsSupervisor;

  @override
  Widget build(BuildContext context) {
    return

      ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context,index) =>
        // members[0][index]['member_id'] != SharedPreferencesHelper.getData(key: "userId")?
         TeamPesonListItem(
             name: members[0][index]['user_name'],
             email: members[0][index]['user_email'],
             phone: members[0][index]['phone_number'],
             userImageUrl: members[0][index]['img_url'],
             onTap:  () {
               Navigator.of(context).push(
                   MyAnimatedRoute
                 (page:  TeamMemberMainScreen(teamId: teamId,memberId: members[0][index]['member_id'], roleInTeam: members[0][index]['role_in_team'], meIsTeamLeader: meIsTeamLeader,meIsSupervisor: meIsSupervisor,)))
                   .then((value) =>
               {
                 context.read<TeamsBloc>().add(TeamsRefreshEvent())
               }
               );}
             ),
        // :
        //     SizedBox(),
        separatorBuilder: (context , index) => const SizedBox(height: 20,),
        itemCount: members[0].length);
  }
}
