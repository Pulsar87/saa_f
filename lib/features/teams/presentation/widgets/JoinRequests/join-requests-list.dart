import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/features/teams/domain/bloc/teams-bloc.dart';
import 'package:saa_f/features/teams/domain/bloc/teams-event.dart';
import 'package:saa_f/features/teams/presentation/widgets/JoinRequests/team-person-list-item.dart';

import '../../../../../core/router/animation_route.dart';
import '../../screens/team-join-member-info.dart';

class JoinRequestsList extends StatelessWidget {
   JoinRequestsList({
    super.key, required this.joinList,
  });
  final List <dynamic> joinList ;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => TeamPesonListItem(
          onTap: () {

            Navigator.of(context).push(MyAnimatedRoute(page: TeamJoinMemberInfo(memberId: joinList[index]['member_id'],
              joinRequestId: joinList[index]['team_member_request_id'],)))
                .then((value) =>
            {
              context.read<TeamsBloc>().add(TeamsRefreshEvent())
            }
            );
          },
            listType: "join",
            name: joinList[index]["english_name"],
            email: joinList[index]["email"],phone: joinList[index]['phone_number'],
            userImageUrl: joinList[index]['img_url']),
        separatorBuilder: (context , index) => const SizedBox(height: 20,),
        itemCount: joinList.length);
  }
}
