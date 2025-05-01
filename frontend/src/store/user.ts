// 调用顺序：Vue组件 -> Pinia存储模块(store/user.ts) -> API模块(api/user.ts) -> Axios
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import { getUserList } from '~/api/user'

export const useUserStore = defineStore('user', () => {
  // state
  const name = ref<string>('')
  const username = ref<string>('')
  const email = ref<string>('')
  const password = ref<string>('')
  const gender = ref<number>(0)
  const idCard = ref<string>('')
  const phone = ref<string>('')
  const avatar = ref<string>('')
  const age = ref<number>(0)
  const status = ref<number>(0)
  const version = ref<number>(0)

  // getters
  const getName = computed(() => name.value || null)
  const getUsername = computed(() => username.value)
  const getEmail = computed(() => email.value || null)
  const getPassword = computed(() => password.value || null)
  const getGender = computed(() => gender.value || null)
  const getIdCard = computed(() => idCard.value || null)
  const getPhone = computed(() => phone.value || null)
  const getAvatar = computed(() => avatar.value || null)
  const getAge = computed(() => age.value || null)
  const getStatus = computed(() => status.value || null)
  const getVersion = computed(() => version.value || null)

  // actions
  // 获取用户信息列表
  const getUserList = async () => {
    console.log('get user list ::::: ')

    const response = await getUserList()
    console.log('get user list ::::: ', response)
  }


  return {
    // state
    name,
    username,
    email,
    password,
    gender,
    idCard,
    phone,
    avatar,
    age,
    status,
    version,

    // getters
    getName,
    getUsername,
    getEmail,
    getPassword,
    getGender,
    getIdCard,
    getPhone,
    getAvatar,
    getAge,
    getStatus,
    getVersion,

    // actions
    getUserList,
  }
})
