package net.geekhour.loki.mapper;

import net.geekhour.loki.entity.AssetType;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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
}
