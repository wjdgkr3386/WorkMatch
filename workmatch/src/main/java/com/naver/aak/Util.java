package com.naver.aak;

import java.util.HashMap;
import java.util.Map;

public class Util {

    public static Map<String, Integer> getPagingMap(int searchResultCount, int rowCnt, int selectPageNo) {
        Map<String, Integer> pagingMap = new HashMap<String, Integer>();
        try {
            if (rowCnt <= 0) { 
                rowCnt = 10; // 기본 행 수
            }
            if (selectPageNo <= 0) { 
                selectPageNo = 1; // 기본 선택 페이지 번호
            }

            int pageNoCntPerPage = 10; // 한 번에 보여줄 페이지 번호의 개수
            int last_pageNo = 0; // 전체 페이지 수
            int remainder = 0; // 마지막 페이지의 남은 행 수

            if (searchResultCount == 0) {
                // 검색 결과가 없는 경우
                pagingMap.put("searchResultCount", searchResultCount);
                pagingMap.put("rowCnt", rowCnt);
                pagingMap.put("selectPageNo", selectPageNo);
                pagingMap.put("pageNoCntPerPage", pageNoCntPerPage);
                pagingMap.put("last_pageNo", last_pageNo);
                pagingMap.put("remainder", remainder);
                pagingMap.put("begin_rowNo", 0);
                pagingMap.put("end_rowNo", 0);
                pagingMap.put("begin_pageNo", 0);
                pagingMap.put("end_pageNo", 0);
                pagingMap.put("serialNo_asc", 0);
                pagingMap.put("serialNo_desc", 0);
                return pagingMap;
            }

            // 전체 페이지 수 계산
            last_pageNo = searchResultCount / rowCnt;
            remainder = searchResultCount % rowCnt;
            if (remainder > 0) { 
                last_pageNo++; 
            }
            if (last_pageNo < selectPageNo) { 
                selectPageNo = last_pageNo; 
            }

            // 현재 페이지의 시작 및 끝 행 번호 계산
            int end_rowNo = selectPageNo * rowCnt;
            int begin_rowNo = end_rowNo - rowCnt + 1;
            if (end_rowNo > searchResultCount) { 
                end_rowNo = searchResultCount; 
            }

            // 현재 페이지 그룹의 시작 및 끝 페이지 번호 계산
            int begin_pageNo = (int) Math.floor((selectPageNo - 1) / pageNoCntPerPage) * pageNoCntPerPage + 1;
            int end_pageNo = begin_pageNo + pageNoCntPerPage - 1;
            if (end_pageNo > last_pageNo) { 
                end_pageNo = last_pageNo; 
            }

            // 결과 맵에 값 설정
            pagingMap.put("searchResultCount", searchResultCount);
            pagingMap.put("rowCnt", rowCnt);
            pagingMap.put("selectPageNo", selectPageNo);
            pagingMap.put("pageNoCntPerPage", pageNoCntPerPage);
            pagingMap.put("last_pageNo", last_pageNo);
            pagingMap.put("remainder", remainder);
            pagingMap.put("begin_rowNo", begin_rowNo);
            pagingMap.put("end_rowNo", end_rowNo);
            pagingMap.put("begin_pageNo", begin_pageNo);
            pagingMap.put("end_pageNo", end_pageNo);
            pagingMap.put("serialNo_asc", begin_rowNo);
            pagingMap.put("serialNo_desc", searchResultCount - begin_rowNo + 1);

            return pagingMap;

        } catch (Exception ex) {
            // 예외 발생 시 빈 맵 반환
            return new HashMap<String, Integer>();
        }
    }

}
