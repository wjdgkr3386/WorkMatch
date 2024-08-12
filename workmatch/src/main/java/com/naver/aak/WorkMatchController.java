package com.naver.aak;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WorkMatchController {

	@Autowired
	WorkMatchService workMatchService;

	@Autowired
	WorkMatchDAO workMatchDAO;

	@Autowired
	LoginService loginService;
	
	@Autowired
	LoginDAO loginDAO;
	

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @ResponseBody
    @RequestMapping( value="/main.do")
    public ModelAndView main(
			SearchDTO searchDTO,
    		HttpSession session
            ){
        ModelAndView mav = new ModelAndView();
		Map<String,Object> searchMap = getSearchResultMap(searchDTO);
		
    	String mid = (String) session.getAttribute("mid");
    	if(mid!=null) {
    		mav.addObject("mid", mid);
            Map<String,Object> imgMap = loginDAO.getImg(mid);
            mav.addObject("imgMap", imgMap);
    	}

        mav.addObject("searchMap", searchMap);
        mav.setViewName( "main.jsp" );
        return mav;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    private Map<String,Object> getSearchResultMap(SearchDTO searchDTO){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		int searchResultCount = this.workMatchDAO.searchResultCount(searchDTO);
		int searchAllCount = this.workMatchDAO.searchAllCount(searchDTO);

		// 여기까지 행개수-> 0개
		Map<String,Integer> pagingMap = Util.getPagingMap( searchResultCount, searchDTO.getRowCnt(), searchDTO.getSelectPageNo() );

		searchDTO.setSelectPageNo(			(int)pagingMap.get("selectPageNo")  );
		searchDTO.setRowCnt( 					(int)pagingMap.get("rowCnt") );
		searchDTO.setBegin_rowNo(   			(int)pagingMap.get("begin_rowNo")   );  // 테이블에서 검색 시 시작행 번호 저장하기
		searchDTO.setEnd_rowNo(			 	(int)pagingMap.get("end_rowNo")     );  // 테이블에서 검색 시 끝행 번호 저장하기
		// 여기서부터 행개수가 기본 10개가 된다. 그래서 순서를 잘 줘야함.

		
		List<Map<String,Object>> postList = this.workMatchDAO.search(searchDTO);

		resultMap.put(	"postList"						, postList);														//검색결과물
		resultMap.put(	"searchAllCount"		, pagingMap.get("searchAllCount"));				//모든 데이터의 개수
		resultMap.put(	"searchResultCount"		, pagingMap.get("searchResultCount"));		//검색결과물의 개수
		resultMap.put(	"rowCnt"							, pagingMap.get("rowCnt"));					//행보기 수
		resultMap.put(	"searchDTO"  					, searchDTO);										//searchDTO 객체

		resultMap.put(	"pageNoCntPerPage"	, pagingMap.get("pageNoCntPerPage"));		//한 화면에 보여줄 페이지번호
		resultMap.put(  "begin_pageNo"				, pagingMap.get("begin_pageNo")        );		//한 화면에 보여줄 시작페이지번호
		resultMap.put(  "end_pageNo"				, pagingMap.get("end_pageNo")          );		//한 화면에 보여줄 끝페이지번호
		resultMap.put(	"selectPageNo"				, pagingMap.get("selectPageNo"));				//선택한페이지번호
		resultMap.put(	"last_pageNo"				, pagingMap.get("last_pageNo"));					//마지막 페이지번호
		resultMap.put(	"remainder"					, pagingMap.get("remainder"));						//마지막 페이지에 보여줄 행의 나머지개수
		resultMap.put(  "begin_serialNo_asc"		, pagingMap.get("begin_serialNo_asc")  );
		resultMap.put(  "begin_serialNo_desc"	, pagingMap.get("begin_serialNo_desc") );
		
		return resultMap;
	}
    //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @RequestMapping( value="/posting.do")
    public ModelAndView posting(
    		HttpSession session,
    		String r_code
            ){         
        ModelAndView mav = new ModelAndView();
        Map<String,Object> postMap = new HashMap();
        
        if(r_code!=null) {
        	try {
        		postMap = workMatchDAO.getPost(r_code);
        	}catch(Exception e) {
    	        System.out.println("Exception occurred at: " + e.getStackTrace()[0]);
    	        e.printStackTrace();
        	}
        }
        
    	String mid = (String) session.getAttribute("mid");
    	if(mid!=null) {
    		mav.addObject("mid", mid);
    	}

		mav.addObject("postMap", postMap);
        mav.setViewName( "posting.jsp" );
        return mav;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @ResponseBody
    @RequestMapping( value="/postingProc.do")
    public Map<String,Object> postingProc(
    		HttpSession session,
    		WorkMatchDTO workMatchDTO
            ){         
    	Map<String,Object> map = new HashMap<String,Object>();

    	//줄바꿈을 <br>로 고쳐서 저장하기
		String job = workMatchDTO.getJob().replaceAll("\n", "<br>");
		String condition = workMatchDTO.getCondition().replaceAll("\n", "<br>");
		workMatchDTO.setJob(job);
		workMatchDTO.setCondition(condition);
		
    	try {
    		int a = workMatchDAO.getPostCnt(workMatchDTO);
    		if(a>0) {
    			int postCnt = workMatchService.updatePost(workMatchDTO);
    	    	map.put("postCnt", postCnt);
    		}else {
    			int postCnt = workMatchService.insertPost(workMatchDTO);
    	    	map.put("postCnt", postCnt);
    		}
    	}catch(Exception e) {
	        System.out.println("Exception occurred at: " + e.getStackTrace()[0]);
	        e.printStackTrace();
    	}
        return map;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @RequestMapping( value="/details.do")
    public ModelAndView details(
    		HttpSession session,
    		@RequestParam("r_code") String r_code
            ){         
        ModelAndView mav = new ModelAndView();

        Map<String,Object> postMap = workMatchDAO.getPost(r_code);
        
        String mid = (String) session.getAttribute("mid");
        mav.addObject("mid", mid);
        mav.addObject("postMap", postMap);
        mav.setViewName( "details.jsp" );
        return mav;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @ResponseBody
    @RequestMapping( value="/deletePostProc.do")
    public Map<String, Integer> deletePostProc(
    		HttpSession session,
    		WorkMatchDTO workMatchDTO
            ){         
        Map<String, Integer> postMap = new HashMap<String, Integer>();

        try {
        	String r_code = workMatchDTO.getR_code();
        	System.out.println(r_code);
            int deleteCnt = workMatchService.deletePost(r_code);
            postMap.put("deleteCnt", deleteCnt);
        }catch(Exception e) {
	        System.out.println("Exception occurred at: " + e.getStackTrace()[0]);
	        e.printStackTrace();
        }
        return postMap;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @ResponseBody
    @RequestMapping( value="/myInfoPage.do")
    public ModelAndView myInfoPage(
    		HttpSession session
            ){         
        ModelAndView mav = new ModelAndView();
        String mid = (String) session.getAttribute("mid");
        
        
        Map<String, Object> userInfoMap = loginDAO.getInfo(mid);
    	List<Map<String,Object>> userMyPostMapList = workMatchDAO.getMyPost(mid);

    	mav.addObject("mid" , mid);
    	mav.addObject("userInfoMap" , userInfoMap);
    	mav.addObject("userMyPostMapList" , userMyPostMapList);
        mav.setViewName( "myInfoPage.jsp" );
        return mav;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @RequestMapping( value="/imgUpdate.do")
    public ModelAndView imgUpdate(
    		HttpSession session
            ){         
        ModelAndView mav = new ModelAndView();
        String mid = (String) session.getAttribute("mid");
        Map<String, Object> imgMap = loginDAO.getImg(mid);

        mav.addObject("mid", mid);
        mav.addObject("imgMap", imgMap);
        mav.setViewName( "imgUpdate.jsp" );
        return mav;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @ResponseBody
    @RequestMapping( value="/imgUpdateProc.do")
    public Map<String, Integer> imgUpdateProc(
    		HttpSession session,
    		LoginDTO loginDTO 
            ){
    	Map<String, Integer> map = new HashMap<String, Integer>();
    	int updateCnt=0;

		try {
			updateCnt=loginService.imgUpdate(loginDTO);
			map.put("updateCnt", updateCnt);
		}catch(Exception e) {
	        System.out.println("Exception occurred at: " + e.getStackTrace()[0]);
	        e.printStackTrace();
		}
    	
        return map;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    
    
    
    

}
