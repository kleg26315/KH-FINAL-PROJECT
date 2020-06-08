package com.kh.bubblebee.host.model.service;

import com.kh.bubblebee.host.model.vo.Host;
import com.kh.bubblebee.member.model.vo.Member;

public interface HostService {

	// 호스트 등록시에 입력한 정보로 업데이트
	int updateMemberInfo(Member m);

	// 호스트 정보 추가하기
	int enrollHost(Host h);

}
