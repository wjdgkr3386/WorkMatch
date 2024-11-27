package com.naver.aak;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public class Util {

    public static Map<String, Integer> getPagingMap(int searchResultCount, int rowCnt, int selectPageNo) {
        Map<String, Integer> pagingMap = new HashMap<>();
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
            return new HashMap<>();
        }
    }


	//파일 재입력 메소드
	public static int saveFileToDirectory(LoginDTO loginDTO) {
		int access=0;
		String mid = loginDTO.getMid();
		//파일을 저장할 경로
        String folderPath = "C:/Users/wjdgk/git/WorkMatch/workmatch/src/main/resources/static/img/" + mid;

        file_nameInput(loginDTO);

        fileDelete( folderPath );

        MultipartFile img = loginDTO.getImg();
        if(img!=null && !img.isEmpty()) {
        	access=fileCreate( folderPath, loginDTO );
        }else {
        	access=1;
        }
        return access;
	}



	//파일 불러와 파일이름을 DTO에 저장
	public static void file_nameInput( LoginDTO loginDTO ) {
		MultipartFile img = loginDTO.getImg();
		String img_name;
		if( img != null && !img.isEmpty() ) {
			String originalfileName = img.getOriginalFilename();
			img_name = originalfileName;
			loginDTO.setImg_name(img_name);
		}
	}

	//경로에 있는 폴더 삭제 메소드
	public static void fileDelete(String folderPath) {
	    File folder = new File(folderPath);
	    File[] files = folder.listFiles();

	    //폴더 안의 파일들 삭제
	    if( files != null  && files.length > 0 ) {
	        for( File file : files ) {
                if( file.isDirectory() ) {
                    fileDelete(file.getAbsolutePath());
                } else {
                    file.delete();
                }
	        }
	    }
	    //폴더 삭제
	    if( folder.exists() ) { folder.delete(); }
	}

	//지정된 경로에 파일 저장하는 메소드
	public static int fileCreate( String folderPath, LoginDTO loginDTO ) {
		MultipartFile img = loginDTO.getImg();

		if( img!=null && !img.isEmpty() ) {
			//지정되지 않은 확장자면 리턴
			String originalFileName = img.getOriginalFilename();
            if(extensionCheck(originalFileName)==-13) { return -13; }

			//폴더가 없으면 생성
			File folder = new File(folderPath);
			if ( !folder.exists() ) { folder.mkdirs(); }

            //업로드된 파일을 지정된 경로에 저장
            String filePath = folderPath + "/" + originalFileName;
            File dest = new File( filePath );

            try {
            	//파일을 지정된 위치에 저장
            	img.transferTo(dest);
            }catch(IOException e) {
    	        System.err.println("Exception occurred at: " + e.getStackTrace()[0]);
    	        e.printStackTrace();
            }
		}
		return 1;
	}

	//확장자 확인 메서드
	public static int extensionCheck( String originalFileName) {

		String[] allowedExtensions = {"jpg", "jpeg", "jfif", "png"};
		String extension = "";

        //확장자 확인
        if (originalFileName != null && originalFileName.lastIndexOf(".") != -1) {
        	extension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
        }
        //지정한 확장자가 아닐경우 -13 리턴
		boolean checkExtension = Arrays.asList(allowedExtensions).contains(extension.toLowerCase());
        if(!checkExtension) {
        	return -13;
        }
		return 1;
	}


	//폴더 생성해서 기본 이미지 복사해 넣기
	public static void copyImg( LoginDTO loginDTO) {
		//폴더 생성
		String mid = loginDTO.getMid();
		String folderPath = "C:/Users/wjdgk/git/WorkMatch/workmatch/src/main/resources/static/img/" + mid;
        fileDelete( folderPath );
		File folder = new File(folderPath);
		if ( !folder.exists() ) { folder.mkdirs(); }

	    // 원본 파일 경로
	    Path sourcePath = Paths.get("C:/Users/wjdgk/git/WorkMatch/workmatch/src/main/resources/static/sys_img/none_img.png");
	    // 복사할 대상 경로
	    Path destinationPath = Paths.get("C:/Users/wjdgk/git/WorkMatch/workmatch/src/main/resources/static/img/"+mid+"/none_img.png");
	    try {
	    	//원본 파일을 지정된 경로에 복사해 넣기
		    Files.copy(sourcePath, destinationPath);
		    loginDTO.setImg_name("none_img.png");
	    }catch(Exception e) {
	        System.out.println("Exception occurred at: " + e.getStackTrace()[0]);
	        e.printStackTrace();
	    }
	}

	//맵을 받아서 안에 있는 내용 중에 < , > , <br> 을 html에서 사용할 수 있게 변환하여 저장하고 반환
	public static Map<String, Object> convertAngleBracketsMap(Map<String, Object> convertMap, String keyword){
		if(keyword.equals("<br>")) {
	        for (Map.Entry<String, Object> entry : convertMap.entrySet()) {
	            Object value = entry.getValue();
	            if (value != null) {
	                String sanitizedValue = value.toString()
	                    .replaceAll("<", "&lt;")
	                    .replaceAll(">", "&gt;")
	                    .replaceAll("\n", "<br>");
	                entry.setValue(sanitizedValue);
	            }
	        }
		}else if(keyword.equals("\n")) {
	        for (Map.Entry<String, Object> entry : convertMap.entrySet()) {
	            Object value = entry.getValue();
	            if (value != null) {
	                String sanitizedValue = value.toString()
	                    .replaceAll("<", "&lt;")
	                    .replaceAll(">", "&gt;")
	                    .replaceAll("<br>", "\n");
	                entry.setValue(sanitizedValue);
	            }
	        }
		}
		return convertMap;
	}
	//맵리스트을 받아서 안에 있는 내용 중에 < , > , <br> 을 html에서 사용할 수 있게 변환하여 저장하고 반환
	public static List<Map<String, Object>> convertAngleBracketsMapList(List<Map<String, Object>> convertMapList, String keyword){
		if(keyword.equals("<br>")) {
	        for(Map<String, Object> map : convertMapList) {
	            for (Map.Entry<String, Object> entry : map.entrySet()) {
	                Object value = entry.getValue();
	                if (value != null) {
	                    String sanitizedValue = value.toString()
	                        .replaceAll("<", "&lt;")
	                        .replaceAll(">", "&gt;")
	                        .replaceAll("\n", "<br>");
	                    entry.setValue(sanitizedValue);
	                }
	            }
	        }
		}else if(keyword.equals("\n")) {
	        for(Map<String, Object> map : convertMapList) {
	            for (Map.Entry<String, Object> entry : map.entrySet()) {
	                Object value = entry.getValue();
	                if (value != null) {
	                    String sanitizedValue = value.toString()
	                        .replaceAll("<", "&lt;")
	                        .replaceAll(">", "&gt;")
	                        .replaceAll("<br>", "\n");
	                    entry.setValue(sanitizedValue);
	                }
	            }
	        }
		}
		return convertMapList;
	}
	
}
