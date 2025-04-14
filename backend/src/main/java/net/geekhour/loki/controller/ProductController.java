package net.geekhour.loki.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net.geekhour.loki.entity.Product;
import net.geekhour.loki.mapper.ProductMapper;
import net.geekhour.loki.service.impl.ProductServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@CrossOrigin()
@RestController
@RequestMapping("/api/product")
public class ProductController {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProductServiceImpl productService;

    @RequestMapping("/user")
    @PreAuthorize("hasAuthority('ROLE_USER')")
    public ResponseEntity<?> userResource() {
        return ResponseEntity.ok(Map.of(
                "code", 200,
                "message", "User Resource accessed"));
    }

    @RequestMapping("/admin")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public ResponseEntity<?> adminResource() {
        return ResponseEntity.ok(Map.of(
                "code", 200,
                "message", "Admin Resource accessed"));
    }

    @ResponseBody
    @RequestMapping("/all")
    public List<Product> all() {
        return productService.list();
    }

    @ResponseBody
    @RequestMapping("/{id}")
    public Product getProduct(@PathVariable("id") Long id) {
        Product product = productMapper.selectById(id);
        System.out.println(product);
        return product;
    }

    @ResponseBody
    @RequestMapping("/random")
    public Product randomLike() {
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("brand", "Apple")
                .between("price", 5000.00, 10000.00);
        List<Product> list = productMapper.selectList(queryWrapper);
        list.forEach(System.out::println);
        int index = (int) (Math.random() * list.size());
        return list.get(index);
    }

    /**
     * 
     * @return
     */
    @ResponseBody
    @RequestMapping("/order")
    public List<Product> testOrder() {
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("price")
                .orderByAsc("brand");
        List<Product> list = productMapper.selectList(queryWrapper);
        list.forEach(System.out::println);
        return list;
    }

    /**
     * delete product by id.
     */
    @RequestMapping("/del/{id}")
    public void delProduct(@PathVariable("id") Long id) {
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        Product product = new Product();
        product.setId(id);
        queryWrapper.setEntity(product);
        int delete = productMapper.delete(queryWrapper);
    }

    /**
     * 将 （品牌为苹果，并且价格大于等于8000）, 或者品牌为华为 的产品 描述修改为打折啦。
     */
    @RequestMapping("/bargain")
    public void bargain() {
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("brand", "Apple")
                .ge("price", 8000)
                .or()
                .like("brand", "Huawei");
        Product product = new Product();
        product.setDescription("打折啦");
    }

    /**
     * select * from h_product where brand like '%App%' and (price > 5000 or
     * description is null)
     * 条件的优先级，lambda中的条件优先执行。
     */
    @RequestMapping("/update")
    public void updateProduct() {
        QueryWrapper<Product> productQueryWrapper = new QueryWrapper<>();
        productQueryWrapper.like("brand", "App")
                .and(i -> i.gt("price", 5000).or().isNull("description"));
        Product product = new Product();
        product.setDescription("大甩卖！");
        productMapper.update(product, productQueryWrapper);
    }

    /**
     * 查询指定列
     * http://localhost:8080/product/getmap/Apple
     */
    @ResponseBody
    @RequestMapping("/getmap/{brand}")
    public List<Map<String, Object>> getMap(@PathVariable("brand") String brand) {
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("name", "brand", "price");
        queryWrapper.eq("brand", brand);
        List<Map<String, Object>> products = productMapper.selectMaps(queryWrapper);
        products.forEach(System.out::println);
        return products;
    }

    /**
     */
    @ResponseBody
    @RequestMapping("/pricegt/{price}")
    public List<Product> priceGt(@PathVariable("price") BigDecimal price) {
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        // String sql = String.format("select id from t_product where price >= %d",
        // price);
        queryWrapper.inSql("id", "select id from h_product where price >= 10000");
        List<Product> products = productMapper.selectList(queryWrapper);
        products.forEach(System.out::println);
        return products;
    }

    @ResponseBody
    @RequestMapping("/name/{name}")
    public List<Product> test09(@PathVariable("name") String name) {
        Integer priceBegin = 5000;
        Integer priceEnd = 10000;
        QueryWrapper<Product> productQueryWrapper = new QueryWrapper<>();
        if (StringUtils.isNotBlank(name)) {
            productQueryWrapper.like("name", name);
        }
        if (priceBegin != null) {
            productQueryWrapper.ge("price", priceBegin);
        }

        if (priceEnd != null) {
            productQueryWrapper.le("price", priceEnd);
        }
        List<Product> products = productMapper.selectList(productQueryWrapper);
        products.forEach(System.out::println);
        return products;
    }
}
