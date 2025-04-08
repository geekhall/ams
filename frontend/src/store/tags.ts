import { defineStore } from 'pinia';
import { ref, computed } from 'vue';

interface ListItem {
  name: string;
  path: string;
  title: string;
}

export const useTagsStore = defineStore('tags', () => {
  // state
  const list = ref<ListItem[]>([]);

  // getters
  const show = computed(() => list.value.length > 0);
  const nameList = computed(() => list.value.map(item => item.name));

  // actions
  const delTagsItem = (index: number) => {
    list.value.splice(index, 1);
  };

  const setTagsItem = (data: ListItem) => {
    list.value.push(data);
  };

  const clearTags = () => {
    list.value = [];
  };

  const closeTagsOther = (data: ListItem[]) => {
    list.value = data;
  };

  const closeCurrentTag = (data: any) => {
    for (let i = 0, len = list.value.length; i < len; i++) {
      const item = list.value[i];
      if (item.path === data.$route.fullPath) {
        if (i < len - 1) {
          data.$router.push(list.value[i + 1].path);
        } else if (i > 0) {
          data.$router.push(list.value[i - 1].path);
        } else {
          data.$router.push('/');
        }
        list.value.splice(i, 1);
        break;
      }
    }
  };

  return {
    // state
    list,

    // getters
    show,
    nameList,

    // actions
    delTagsItem,
    setTagsItem,
    clearTags,
    closeTagsOther,
    closeCurrentTag,
  };
});
