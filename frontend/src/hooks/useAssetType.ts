import { ref, onMounted } from 'vue';
import { getAssetTypeList, getAssetTypeSummaryList } from '@/api/asset';
import { AssetType, AssetTypeSummary, AssetTypeListResponse, AssetTypeSummaryListResponse } from '@/types/asset';
import { ElMessage } from 'element-plus';

interface UseAssetTypeReturn {
  assetTypes: ReturnType<typeof ref<AssetType[]>>;
  assetTypeSummary: ReturnType<typeof ref<AssetTypeSummary[]>>;
  fetchAssetTypes: () => Promise<void>;
  fetchAssetTypeSummary: () => Promise<void>;
  isLoading: ReturnType<typeof ref<boolean>>;
}

export function useAssetType(): UseAssetTypeReturn {
  const assetTypes = ref<AssetType[]>([]);
  const assetTypeSummary = ref<AssetTypeSummary[]>([]);
  const isLoading = ref(false);

  const handleError = (error: unknown, message: string) => {
    console.error(message, error);
    ElMessage.error(message);
  };

  const fetchAssetTypes = async () => {
    isLoading.value = true;
    try {
      const res: AssetTypeListResponse = await getAssetTypeList();
      if (res.code === 200) {
        assetTypes.value = res.data;
      } else {
        ElMessage.error(res.message || '获取资产类型失败');
      }
    } catch (error) {
      handleError(error, '获取资产类型失败');
    } finally {
      isLoading.value = false;
    }
  };

  const fetchAssetTypeSummary = async () => {
    isLoading.value = true;
    try {
      const res: AssetTypeSummaryListResponse = await getAssetTypeSummaryList();
      if (res.code === 200) {
        assetTypeSummary.value = res.data;
      } else {
        ElMessage.error(res.message || '获取资产类型失败');
      }
    } catch (error) {
      handleError(error, '获取资产类型失败');
    } finally {
      isLoading.value = false;
    }
  };

  // 自动加载资产类型列表
  onMounted(() => {
    fetchAssetTypes();
    fetchAssetTypeSummary();
  });

  return {
    assetTypes,
    assetTypeSummary,
    fetchAssetTypes,
    fetchAssetTypeSummary,
    isLoading
  };
}
