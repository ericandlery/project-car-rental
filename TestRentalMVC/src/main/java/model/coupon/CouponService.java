package model.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;


@Service
@Scope(value="prototype")
@Lazy(value=true)
public class CouponService {
	@Autowired
	private CouponDAO cdao;
	@Autowired
	private CouponBean cb;
	public List selectAll() {
		return cdao.selectAll();
	}
	public CouponBean selectByName(String name) {
		return cdao.selectByName(name);
	}
	public CouponBean insertOrUpdateCoupon(CouponBean cb) {
		return cdao.insertOrUpdate(cb);
	}
	public boolean delete(String name) {
		return cdao.delete(name);
	}
}
