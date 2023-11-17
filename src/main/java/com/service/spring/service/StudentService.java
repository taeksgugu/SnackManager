package com.service.spring.service;

import com.service.spring.domain.*;

import java.util.List;

public interface StudentService {
    int registerMember(Member member) throws Exception;
    int deleteMember(String memberId) throws Exception;
    Member login(Member member) throws Exception;
    int updateMember(Member member) throws Exception;
    List<Snack> selectAll() throws Exception;
    int fetchSnack(Snack snack) throws Exception;
    List<HistoryWithSnackName> getHistory(Member member) throws Exception;
    int registerHistory(Snack snack) throws Exception;
    int voteSnack(Vote vote) throws Exception;
}