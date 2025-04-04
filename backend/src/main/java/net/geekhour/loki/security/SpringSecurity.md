# SpringSecurity

## 用户认证信息

### UserDetails
UserDetails 是一个核心接口，它是框架中的用户信息模型，用于封装认证信息。
它包含了用户名、密码、权限等信息。
我们可以通过实现 UserDetails 接口来创建自定义的用户认证信息。


### UserDetailsService
UserDetailsService 是一个核心接口，它是框架中用于获取用户认证信息的接口。


## 主要的类和接口

* SecurityContextHolder : 用于获取当前用户的安全上下文，是SpringSecurity存储已认证用户详细信息的地方
* SecurityContext : 当前用户的安全上下文
* Authentication : 当前用户的认证信息
* Principal : 代表了当前用户的信息
* Credentials : 代表了当前用户的凭证
* Authorities : 代表了当前用户的权限

```java

public class IndexController{
    
    @GetMapping("/index")
    public void index(){
        // 获取当前用户的安全上下文
        SecurityContext context = SecurityContextHolder.getContext();
        // 获取当前用户的认证信息
        Authentication authentication = context.getAuthentication();
        // 获取当前用户的信息
        Principal principal = (Principal) authentication.getPrincipal();
        // 获取当前用户的凭证
        Credentials credentials = (Credentials) authentication.getCredentials();
        // 获取当前用户的权限
//        Authorities authorities = (Authorities) authentication.getAuthorities();
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        
        String username = authentication.getName();
    }
    
}
```



