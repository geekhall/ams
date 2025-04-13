import { AxiosRequestConfig } from "axios";
import loki from "./loki";
import { Department, DepartmentListResponse } from "~/types/department";


// 获取部门列表
export const getDepartmentList = async (): Promise<DepartmentListResponse> => {
  return await loki.request({
    url: "/department/list",
    method: "POST",
  } as AxiosRequestConfig);
};


// 按照部门ID获取部门信息
export const getDepartmentById = async (
  id: string
): Promise<Department> => {
  return await loki.request({
    url: "/department/get",
    method: "POST",
    data: { id },
  } as AxiosRequestConfig);
};

// 添加部门
export const addDepartment = async (
  department: Department
): Promise<Department> => {
  return await loki.request({
    url: "/department/add",
    method: "POST",
    data: { ...department },
  } as AxiosRequestConfig);
};

// 更新部门信息
export const updateDepartmentById = async (
  department: Department
): Promise<Department> => {
  return await loki.request({
    url: "/department/update",
    method: "POST",
    data: { ...department },
  } as AxiosRequestConfig);
};

// 按照部门ID删除部门
export const deleteDepartmentById = async (
  id: string
): Promise<Department> => {
  return await loki.request({
    url: "/department/delete/" + id,
    method: "DELETE",
  } as AxiosRequestConfig);
};

// 批量删除部门
export const deleteDepartments = async (
  ids: string[]
): Promise<Department> => {
  return await loki.request({
    url: "/department/delete/batch",
    method: "POST",
    data: { ids },
  } as AxiosRequestConfig);
};
