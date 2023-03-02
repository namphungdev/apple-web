package AppleShop.Service.User;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import AppleShop.Entity.Capacitys;
@Service

public interface ICapacityService {

	public List<Capacitys> findAll();

	public void save(Capacitys capacity);

	public void update(Capacitys capacity);

	public Capacitys findById(int id);

	public void delete(int id);

}
