import { ref, onMounted } from 'vue';
import { getTeamList } from '@/api/team';
import { Team, TeamListResponse } from '@/types/team';
import { ElMessage } from 'element-plus';

export function useTeam() {
  const teams = ref<Team[]>([]);

  const fetchTeams = async () => {
    try {
      const res: TeamListResponse = await getTeamList();
      if (res.code === 200) {
        teams.value = res.data;
      } else {
        ElMessage.error(res.message);
      }
    } catch (error) {
      ElMessage.error(error instanceof Error ? error.message : '获取团队列表失败')
    }
  };

  // 自动加载团队列表
  onMounted(() => {
    fetchTeams();
  });

  return {
    teams,
    fetchTeams,
  };
}
