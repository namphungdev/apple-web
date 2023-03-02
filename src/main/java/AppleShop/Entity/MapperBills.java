package AppleShop.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperBills implements RowMapper<Bills> {

	public Bills mapRow(ResultSet rs, int rowNum) throws SQLException {
		Bills bill = new Bills();
		bill.setId(rs.getLong("id"));
		bill.setUsername(rs.getString("username"));
		bill.setPhone(rs.getString("phone"));
		bill.setDisplay_name(rs.getString("display_name"));
		bill.setAddress(rs.getString("address"));
		bill.setTotal(rs.getDouble("total"));
		bill.setQuanty(rs.getInt("quanty"));
		bill.setNote(rs.getString("note"));	
		bill.setNgaymua(rs.getString("ngaymua"));
		bill.setTrangthai(rs.getInt("trangthai"));
		bill.setVanchuyen(rs.getInt("vanchuyen"));
		return bill;
	}
}
