import { AxiosRequestConfig } from "axios";
import loki from "./loki";
import { Team, TeamListResponse } from "~/types/team";

// 获取团队列表
export const getTeamList = async (): Promise<TeamListResponse> => {
  return await loki.request({
    url: "/team/list",
    method: "POST",
  } as AxiosRequestConfig);
};


// 按照团队ID获取团队信息
export const getTeamById = async (
  id: string
): Promise<Team> => {
  return await loki.request({
    url: "/team/get",
    method: "POST",
    data: { id },
  } as AxiosRequestConfig);
};

// 添加团队
export const addTeam = async (
  Team: Team
): Promise<Team> => {
  return await loki.request({
    url: "/team/add",
    method: "POST",
    data: { ...Team },
  } as AxiosRequestConfig);
};

// 更新团队信息
export const updateTeamById = async (
  Team: Team
): Promise<Team> => {
  return await loki.request({
    url: "/team/update",
    method: "POST",
    data: { ...Team },
  } as AxiosRequestConfig);
};

// 按照团队ID删除团队
export const deleteTeamById = async (
  id: string
): Promise<Team> => {
  return await loki.request({
    url: "/team/delete/" + id,
    method: "DELETE",
  } as AxiosRequestConfig);
};

// 批量删除团队
export const deleteTeams = async (
  ids: string[]
): Promise<Team> => {
  return await loki.request({
    url: "/team/delete/batch",
    method: "POST",
    data: { ids },
  } as AxiosRequestConfig);
};
