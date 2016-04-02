/**
 * 
 */
package com.unicrom.babycare.service.security;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unicrom.babycare.dao.security.UserDao;
import com.unicrom.babycare.domain.security.Role;
import com.unicrom.babycare.service.parent.EntityService;


/**
 * @author Georman
 *
 */
@Component
@Transactional
@Service("UserDetailServiceImpl")
public class UserDetailServiceImpl  extends EntityService<com.unicrom.babycare.domain.security.User> implements UserDao, UserDetailsService {
	
protected final Log logger = LogFactory.getLog(getClass());


	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		com.unicrom.babycare.domain.security.User user=null;
		
		logger.info("loadUserByUsername username="+username);
		
		User userdetail=null;
		try {
			user=this.getUserByLogin(username);
			if(user==null){
				throw new UsernameNotFoundException("user name not found");
			}
			
			List<GrantedAuthority> authorities = 
                    buildUserAuthority(user.getRoles());

			userdetail= buildUserForAuthentication(user, authorities);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UsernameNotFoundException("database error ");
		}
		return userdetail;
	}


	
	
	// Converts com.mkyong.users.model.User user to
		// org.springframework.security.core.userdetails.User
		private User buildUserForAuthentication(com.unicrom.babycare.domain.security.User user, 
			List<GrantedAuthority> authorities) {
			return new User(user.getName(), user.getPassword(), 
				user.getEnabled(), true, true, true, authorities);
		}

		private List<GrantedAuthority> buildUserAuthority(Set<Role> userRoles) {

			Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

			// Build user's authorities
			for (Role userRole : userRoles) {
				setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
			}

			List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);

			return Result;
		}
		
		

		
		public com.unicrom.babycare.domain.security.User getUserByLogin(
				String login) throws Exception {
			com.unicrom.babycare.domain.security.User loginUser=null;
			List<com.unicrom.babycare.domain.security.User> users=this.findByProperty("name", login);
			if(users!=null && !users.isEmpty()){
				loginUser=users.get(0);
			}
			
			return loginUser;
			
		}
	
	

}
