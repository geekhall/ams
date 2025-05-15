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

    @Select("select b.id, b.name, count(a.id) as total_count, b.status  from h_asset a \n" +
            "left join h_asset_type b on a.type = b.id \n" +
            "group by b.id, b.name\n" +
            "order by b.id, b.name")
    List<AssetTypeSummaryDTO> getSummary();
}
