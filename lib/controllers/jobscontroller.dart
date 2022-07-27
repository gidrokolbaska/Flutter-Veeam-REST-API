import 'package:get/get.dart';
import 'package:veeam_mobile_operator/models/jobsStatusModel.dart';
import 'package:veeam_mobile_operator/models/jobs_model.dart';
import 'package:veeam_mobile_operator/services/REST_services.dart';

class JobsController extends GetxController {
  RestServices restServices = RestServices();
  late JobsModel? jobs;
  JobStatus? jobStatus;
  List<JobStatus?> jobsStatuses = <JobStatus>[].obs;
  Future<JobsModel?> fetchJobs() async {
    jobs = (await restServices.fetchJobs())!;
    jobsStatuses.clear();
    jobsStatuses.length = 0;
    if (jobs != null) {
      for (var i = 0; i < jobs!.jobs!.job!.length; i++) {
        jobsStatuses.add(await fetchJobStatus(jobs!.jobs!.job![i].name));
      }

      return jobs;
    } else {
      return null;
    }
  }

  Future<JobStatus?> fetchJobStatus(String? jobName) async {
    jobStatus = await restServices.fetchJobStatus(jobName!);

    if (jobStatus != null) {
      return jobStatus;
    } else {
      return null;
    }
  }
}
