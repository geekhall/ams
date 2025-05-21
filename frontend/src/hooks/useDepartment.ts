import { ref, onMounted } from 'vue';
import { getDepartmentList } from '@/api/department';
import { Department, DepartmentListResponse } from '@/types/department';
import { ElMessage } from 'element-plus';

export function useDepartment() {
  const departments = ref<Department[]>([]);

  const fetchDepartments = async () => {
    try {
      const res: DepartmentListResponse = await getDepartmentList();
      if (res.code === 200) {
        departments.value = res.data;
      } else {
        ElMessage.error(res.message);
      }
    } catch (error) {
      ElMessage.error(error instanceof Error ? error.message : '获取部门列表失败')
    }
  };

  // 自动加载部门列表
  onMounted(() => {
    fetchDepartments();
  });

  return {
    departments,
    fetchDepartments,
  };
}
