import { ref, onMounted } from 'vue';
import { getBudgetCategoryList } from '@/api/budget';
import { BudgetCategory, BudgetCategoryListResponse } from '@/types/budget';
import { ElMessage } from 'element-plus';

export function useBudgetCategory() {
  const budgetCategories = ref<BudgetCategory[]>([]);

  const fetchBudgetCategories = async () => {
    try {
      const res: BudgetCategoryListResponse = await getBudgetCategoryList();
      if (res.code === 200) {
        budgetCategories.value = res.data;
      } else {
        ElMessage.error(res.message);
      }
    } catch (error) {
      ElMessage.error('获取预算性质失败');
    }
  };

  // 自动加载预算性质列表
  onMounted(() => {
    fetchBudgetCategories();
  });

  return {
    budgetCategories,
    fetchBudgetCategories,
  };
}
