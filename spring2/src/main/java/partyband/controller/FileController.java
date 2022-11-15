package partyband.controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileController {
	@RequestMapping("/fileDown.do")
    public ModelAndView download(@RequestParam("filecol") String filecol){
		
        //System.out.println("controller 파일 다운로드 시작");
		
        String fullPath = filecol;
         
        File file = new File(fullPath);
        
        //System.out.println("controller 파일 다운로드 끝");
         
        return new ModelAndView("download", "downloadFile", file);
    }

}
