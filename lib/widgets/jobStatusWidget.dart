// import 'package:flutter/material.dart';

// import '../controllers/jobscontroller.dart';

// class JobStatusWidget extends StatelessWidget {
//   const JobStatusWidget({
//     Key? key,
//     required this.jobsController,
//   }) : super(key: key);

//   final JobsController jobsController;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: jobsController.fetchJobStatus(),
//       builder:
//           (BuildContext context, AsyncSnapshot<dynamic> snapshotJobStatus) {
//         if (snapshotJobStatus.hasData) {
//           return Text(
//               '${snapshotJobStatus.data!.queryResult!.entities!.backupJobSessions!.backupJobSession!.state!.empty}');
//         } else if (snapshotJobStatus.hasError) {
//           return Text('${snapshotJobStatus.error}');
//         } else {
//           return const CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation(Color(0xff328208)),
//           );
//         }
//       },
//     );
//   }
// }
