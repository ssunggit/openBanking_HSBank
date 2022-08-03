package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import model.qnaBoard.vo.QnABoardVO;
import service.QnABoardService;

public class boardListProcessController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QnABoardService service = new QnABoardService();
		
		List<QnABoardVO> boardList = service.boardList();
		
		Gson gson = new GsonBuilder()
                .setPrettyPrinting()
                .serializeNulls()
                .setFieldNamingPolicy(FieldNamingPolicy.UPPER_CAMEL_CASE)
                .create();
		
		String jsonString = gson.toJson(boardList);
		System.out.println(jsonString);
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("jsonString", jsonString);
		
		return "/jsp/board/list.jsp";
	}

}
