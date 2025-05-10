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
            "select a.id, a.name, a.code, c.`name` as type, " +
            "b.name as department_name, a.location, " +
            "a.`status`, FROM_UNIXTIME(a.purchase_date/1000, '%Y-%m-%d') as purchase_date, " +
            "a.purchase_price, a.count from h_asset a " +
            "left join h_department b on a.department_id=b.id " +
            "left join h_asset_type c on a.type = c.id " +
            "where a.deleted = 0 and b.deleted=0 and c.deleted=0" +
            "<if test='name != null and name != \"\"'> " +
            "and a.name like CONCAT('%', #{name}, '%') " +
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
            "left join h_asset_type c on a.type = c.id " +
            "where a.deleted = 0 and b.deleted=0 and c.deleted=0" +
            "<if test='name != null and name != \"\"'> " +
            "and a.name like CONCAT('%', #{name}, '%') " +
            "</if>" +
            "</script>")
    Long countAssets(@Param("name") String name);

    @Select("select count(*) from h_asset where code = #{code} and deleted = 0")
    boolean checkAssetCodeExists(@Param("code") String code);

    @Select("select count(*) from h_asset where name = #{name} and deleted = 0")
    boolean checkAssetNameExists(@Param("name")String name);
}
