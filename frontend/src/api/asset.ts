import { AxiosRequestConfig } from "axios";
import loki from "./loki";
import {
  Asset,
  AssetDTO,
  AssetListResponse,
  AssetNamesResponse,
  AssetTypeListResponse,
  AssetSummaryResponse,
  AssetTypeSummaryListResponse,
  DepartmentSummaryResponse
} from "~/types/asset";
import { BorrowAssetParams, AssetBorrowListResponse } from "~/types/asset";

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
export const getAssetTypeSummaryList = async (): Promise<AssetTypeSummaryListResponse> => {
  return await loki.request({
    url: "/at/summary",
    method: "POST",
  } as AxiosRequestConfig);
};
// 添加资产类型
export const addAssetType = async (name: string): Promise<AssetTypeListResponse> => {
  return await loki.request({
    url: "/at/create",
    method: "POST",
    data: { name },
  } as AxiosRequestConfig);
};

// 更新资产类型
export const updateAssetType = async (id: string, name: string): Promise<AssetTypeListResponse> => {
  return await loki.request({
    url: "/at/update",
    method: "POST",
    data: { id, name, status },
  } as AxiosRequestConfig);
};

// 删除资产类型
export const deleteAssetType = async (id: string): Promise<AssetTypeListResponse> => {
  return await loki.request({
    url: "/at/delete/" + id,
    method: "DELETE",
  } as AxiosRequestConfig);
};

export const borrowAsset = (data: BorrowAssetParams) => {
  return loki.request({
    url: '/asset/borrow',
    method: 'post',
    data
  })
}

// 获取资产领用记录
export const getAssetBorrowRecords = (params: {
  name?: string
  status?: string
  pageIndex: number
  pageSize: number
}) => {
  return loki.request<AssetBorrowListResponse>({
    url: '/asset/borrow/records',
    method: 'get',
    params
  })
}

// 归还资产
export const returnAsset = (data: {
  borrowId: string
  returnDate: string
  returnNote?: string
}) => {
  return loki.request<{ code: number; message: string }>({
    url: '/asset/return',
    method: 'post',
    data
  })
}

export const getAssetSummary = async (): Promise<AssetSummaryResponse> => {
  return await loki.request({
    url: '/asset/summary',
    method: 'post'
  } as AxiosRequestConfig);
}

export const getDepartmentSummary = async (): Promise<DepartmentSummaryResponse> => {
  return await loki.request({
    url: '/asset/dp',
    method: 'post'
  } as AxiosRequestConfig);
}
