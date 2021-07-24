package com.care.root;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
	@GetMapping(value="rest", produces="application/json;charset=utf-8")
	public String get() {
		return "{ \"execute\" : \"get 데이터 요청시 사용\" }";
	}
	@PostMapping(value="rest", produces="application/json;charset=utf-8")
	public String post() {
		return "{ \"execute\" : \"post 데이터 추가할 때 사용\" }";
	}
	@PutMapping(value="rest", produces="application/json;charset=utf-8")
	public String put() {
		return "{ \"execute\" : \"put 데이터 수정할 때 사용\" }";
	}
	@DeleteMapping(value="rest", produces="application/json;charset=utf-8")
	public String delete() {
		return "{ \"execute\" : \"delete 데이터 삭제할 때 사용\" }";
	}
	static int cnt = 0;
	static Map<String, InfoDTO> DBMap = new HashMap<String, InfoDTO>();
	@GetMapping(value="users", produces="application/json;charset=utf-8")
	public ArrayList<InfoDTO> users(){
		ArrayList<InfoDTO> list = new ArrayList<InfoDTO>();
		
		for(int i = cnt; i< cnt+10; i++) {
			InfoDTO dto = new InfoDTO();
			dto.setName("홍길동"+i); dto.setAge(10+i);
			list.add(dto); DBMap.put("홍길동"+i, dto);
		}
		
		cnt+=10;
		return list;
	}
	@GetMapping(value="user/{uId}", 
				produces="application/json;charset=utf-8")
	public InfoDTO user(@PathVariable String uId) {
		// 1. 서비스에 사용자가 입력한 아이디를 넘겨준다.
		// 2. mapper.xml에 접근하여 넘겨준 아이디와 같은 데이터를 얻어온다.
		// mapper.getUser(홍길동0) select * from table where id=#{uId}
		return DBMap.get(uId);
	}
	@PutMapping(value="modify", 
			produces="application/json;charset=utf-8")
	public InfoDTO modify(@RequestBody InfoDTO dto) {
		// dto의 내용을 디비에 저장되어 있는 내용을 변경하는 것이다.
		System.out.println(dto.getName());
		System.out.println(dto.getAge());
		DBMap.replace(dto.getName(), dto);
		return DBMap.get(dto.getName());
	}
	@PostMapping(value="membership", 
			produces="application/json;charset=utf-8")
	public String membership(@RequestBody Map<String, Object> member) {
		// 사용자가 넘겨준 데이터를 데이터 베이스에 저장하는 기능
		System.out.println("---- 회원 가입 ----");
		System.out.println("id : "+member.get("uId"));
		System.out.println("name : "+member.get("uName"));
		System.out.println("age : "+member.get("uAge"));
		System.out.println("addr : "+member.get("uAddr"));
		System.out.println("phone : "+member.get("uPhone"));
		return "{\"result\" : true}";
	}
}














