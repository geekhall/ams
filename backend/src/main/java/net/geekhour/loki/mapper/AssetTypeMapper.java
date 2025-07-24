package net.geekhour.loki.mapper;

import net.geekhour.loki.entity.AssetType;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.geekhour.loki.entity.dto.AssetTypeSummaryDTO;
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
public interface AssetTypeMapper extends BaseMapper<AssetType> {

    @Select("SELECT id FROM h_asset_type WHERE name = #{name} AND deleted = 0")
    Long getIdByName(@Param("name") String name);

    @Select("select x.id, x.name, COALESCE(y.asset_count, 0) as asset_count, x.status as status from h_asset_type x " +
            "left join ( " +
            "  select b.id as id , b.name as name , count(a.id) as asset_count, b.status  from h_asset a " +
            "  left join h_asset_type b on a.type = b.id " +
            "  group by b.id, b.name) y " +
            "on x.id = y.id " +
            "where x.deleted = 0 " +
            "order by x.id ")
    List<AssetTypeSummaryDTO> getSummary();
}
