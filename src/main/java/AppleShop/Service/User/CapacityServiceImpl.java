package AppleShop.Service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import AppleShop.Dao.CapacityDao;
import AppleShop.Entity.Capacitys;
import AppleShop.Entity.MapperCapacitys;
@Service
public class CapacityServiceImpl implements ICapacityService {
	@Autowired
	 private CapacityDao capacityDao;
	
	@Override
	  public List<Capacitys> findAll() {
	    return capacityDao.findAll();
	  } 
	  
	  @Override
	  public void save(Capacitys capacity) {
	     capacityDao.save(capacity);
	  }
	  @Override
	  public void update(Capacitys capacity) {
		  capacityDao.update(capacity);
		  } 
	  @Override
		  public Capacitys findById(int id) {
		  return  capacityDao.findById(id);
		  }
	  @Override
	  public void delete(int id) {
	     capacityDao.delete(id);
	  }
}
