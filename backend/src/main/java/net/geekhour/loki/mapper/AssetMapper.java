package net.geekhour.loki.mapper;

import jakarta.validation.constraints.NotBlank;
import net.geekhour.loki.entity.Asset;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.geekhour.loki.entity.dto.AssetDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-05
 */
@Mapper
public interface AssetMapper extends BaseMapper<Asset> {

    @Select("<script>" +
            "select a.id, a.asset_name, a.asset_code, c.`name` as asset_type, " +
            "b.name as department_name, a.location, " +
            "CASE WHEN a.`status` = 0 THEN '正常' WHEN a.`status` = 1 THEN '报废' WHEN a.`status` = 2 THEN '维修' END as status, " +
            "FROM_UNIXTIME(a.purchase_date/1000, '%Y-%m-%d') as purchase_date, " +
            "a.purchase_price, a.count from h_asset a " +
            "left join h_department b on a.department_id=b.id " +
            "left join h_asset_type c on a.asset_type = c.id " +
            "where a.deleted = 0 and b.deleted=0 and c.deleted=0" +
            "<if test='name != null and name != \"\"'> " +
            "and a.asset_name like CONCAT('%', #{name}, '%') " +
            "</if>" +
            "order by a.id " +
            "limit #{offset}, #{pageSize}" +
            "</script>")
    List<AssetDTO> getAssetList(@Param("offset") Integer offset,
                                @Param("pageSize") Integer pageSize,
                                @Param("name") String name);

    @Select("<script>" +
            "select count(*) from h_asset a " +
            "left join h_department b on a.department_id=b.id " +
            "left join h_asset_type c on a.asset_type = c.id " +
            "where a.deleted = 0 and b.deleted=0 and c.deleted=0" +
            "<if test='name != null and name != \"\"'> " +
            "and a.asset_name like CONCAT('%', #{name}, '%') " +
            "</if>" +
            "</script>")
    int countAssets(@Param("name") String name);
}
