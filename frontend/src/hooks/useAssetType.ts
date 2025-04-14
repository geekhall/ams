import { ref, onMounted } from 'vue';
import { getAssetTypeList } from '@/api/asset';
import { AssetType, AssetTypeListResponse } from '@/types/asset';
import { ElMessage } from 'element-plus';

export function useAssetType() {
  const assetTypes = ref<AssetType[]>([]);

  const fetchAssetTypes = async () => {
    try {
      const res: AssetTypeListResponse = await getAssetTypeList();
      if (res.code === 200) {
        assetTypes.value = res.data;
      } else {
        ElMessage.error(res.message);
      }
    } catch (error) {
      ElMessage.error('获取资产类型失败');
    }
  };

  // 自动加载资产类型列表
  onMounted(() => {
    fetchAssetTypes();
  });

  return {
    assetTypes,
    fetchAssetTypes,
  };
}
