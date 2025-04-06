import loki from "./loki";
import { Asset, AssetListResponse } from "~/types/asset";

// 获取资产列表
export const getAssetList = async (): Promise<AssetListResponse> => {
  return await loki.request({
    url: "/asset/list",
    method: "POST",
  });
};

// 获取资产列表
export const getAssetListByPage = async (
  page: number,
  size: number
): Promise<AssetListResponse> => {
  return await loki.request({
    url: "/asset/list",
    method: "POST",
    data: {
      page,
      size,
    },
  });
};
// 按照资产名称获取资产列表
export const getAssetListByName = async (
  assetName: string
): Promise<AssetListResponse> => {
  return await loki.request({
    url: "/asset/list",
    method: "POST",
    data: {
      assetName,
    },
  });
};

// 按照资产ID更新资产信息
export const updateAssetById = async (
  asset: Asset
): Promise<AssetListResponse> => {
  return await loki.request({
    url: "/asset/update",
    method: "POST",
    data: {
      ...asset,
    },
  });
};
// 按照资产ID删除资产
export const deleteAssetById = async (
  id: string
): Promise<AssetListResponse> => {
  return await loki.request({
    url: "/asset/delete",
    method: "POST",
    data: {
      id,
    },
  });
};
// 按照资产ID获取资产信息
export const getAssetById = async (
  id: string
): Promise<AssetListResponse> => {
  return await loki.request({
    url: "/asset/get",
    method: "POST",
    data: {
      id,
    },
  });
};
