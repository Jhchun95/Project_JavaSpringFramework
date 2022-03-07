package lifeShare.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LikesMapper {
	public int addLike(@Param("uid") String uid,@Param("bid") int bid);
	public int deleteLike(@Param("uid")String uid,@Param("bid") int bid);
	public int findLike(@Param("uid") String uid,@Param("bid") int bid);
	public int updateLike(@Param("bid") int bid);
}
