import { AxiosRequestConfig } from "axios";
import loki from "./loki";
import { Asset, AssetDTO, AssetListResponse, AssetNamesResponse, AssetTypeListResponse } from "~/types/asset";


// 获取资产列表（支持分页和按名称查询）
export const getAssetList = async (
  params?: { pageIndex?: number; pageSize?: number; name?: string }
): Promise<AssetListResponse> => {

  return await loki.request({
    url: "/asset/list",
    method: "POST",
    data: params || {}, // 如果没有参数，传递空对象
  } as AxiosRequestConfig);

};
// 添加资产
export const addAsset = async (
  asset: AssetDTO
): Promise<AssetListResponse> => {
  return await loki.request({
    url: "/asset/create",
    method: "POST",
    data: {
      ...asset,
    },
  } as AxiosRequestConfig);
};

// 更新资产信息
export const updateAsset = async (
  asset: Asset
): Promise<AssetListResponse> => {
  return await loki.request({
    url: "/asset/update",
    method: "POST",
    data: {
      ...asset,
    },
  } as AxiosRequestConfig);
};
// 按照资产ID删除资产
export const deleteAssetById = async (
  id: string
): Promise<AssetListResponse> => {
  return await loki.request({
    url: "/asset/delete/" + id,
    method: "DELETE",
  } as AxiosRequestConfig);
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
  } as AxiosRequestConfig);
};


// 批量删除资产
export const deleteAssets = async (
  ids: string[]
): Promise<AssetListResponse> => {
  return await loki.request({
    url: "/asset/delete/batch",
    method: "POST",
    data: {
      ids,
    },
  } as AxiosRequestConfig);
};

// 批量更新资产
export const updateAssets = async (
  assets: Asset[]
): Promise<AssetListResponse> => {
  return await loki.request({
    url: "/asset/update/batch",
    method: "POST",
    data: {
      assets,
    },
  } as AxiosRequestConfig);
};

// 获取资产类型名
export const getAssetNames = async (): Promise<AssetNamesResponse> => {
  return await loki.request({
    url: "/at/names",
    method: "POST",
  } as AxiosRequestConfig);
};

// 获取资产类型列表
export const getAssetTypeList = async (): Promise<AssetTypeListResponse> => {
  return await loki.request({
    url: "/at/list",
    method: "POST",
  } as AxiosRequestConfig);
};
