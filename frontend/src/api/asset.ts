import loki from "./loki";
import { Asset, AssetListResponse } from "~/types/asset";

// 获取资产列表
export const getAssetList = async (): Promise<AssetListResponse> => {
  return await loki.request({
    url: "/asset/list",
    method: "POST",
  });
};
