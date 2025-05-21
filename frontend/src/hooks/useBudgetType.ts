import { ref, onMounted } from 'vue';
import { getBudgetTypeList } from '@/api/budget';
import { BudgetType, BudgetTypeListResponse } from '@/types/budget';
import { ElMessage } from 'element-plus';

export function useBudgetType() {
  const budgetTypes = ref<BudgetType[]>([]);

  const fetchBudgetTypes = async () => {
    try {
      const res: BudgetTypeListResponse = await getBudgetTypeList();
      if (res.code === 200) {
        budgetTypes.value = res.data;
      } else {
        ElMessage.error(res.message);
      }
    } catch (error) {
      ElMessage.error(error instanceof Error ? error.message : '获取预算类型失败')
    }
  };

  // 自动加载预算类型列表
  onMounted(() => {
    fetchBudgetTypes();
  });

  return {
    budgetTypes,
    fetchBudgetTypes,
  };
}
