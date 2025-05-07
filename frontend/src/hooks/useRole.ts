import { ref, onMounted } from 'vue';
import { getRoleList } from '@/api/role';
import { Role, RoleListResponse } from '@/types/role';
import { ElMessage } from 'element-plus';

export function useRole() {
  const roles = ref<Role[]>([]);

  const fetchRoles = async () => {
    try {
      const res: RoleListResponse = await getRoleList();
      if (res.code === 200) {
        roles.value = res.data;
      } else {
        ElMessage.error(res.message);
      }
    } catch (error) {
      ElMessage.error('获取角色列表失败');
    }
  };

  // 自动加载角色列表
  onMounted(() => {
    fetchRoles();
  });

  return {
    roles,
    fetchRoles,
  };
}
