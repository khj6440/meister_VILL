package kr.or.meister.project.contoroller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;

import kr.or.meister.employ.model.vo.EmployVO;
import kr.or.meister.member.model.vo.MemberVO;
import kr.or.meister.project.model.service.ProjectService;
import kr.or.meister.project.model.vo.ProjectChatVO;
import kr.or.meister.project.model.vo.ProjectFileVO;

@Controller
@RequestMapping("/meister/project")
public class ProjectController {

	@Autowired
	@Qualifier("projectService")
	private ProjectService service;


	@RequestMapping(value = "/home.do")
	public String home(Model model, int projectNo) {
		EmployVO e = service.getProjectIntro(projectNo);
		model.addAttribute("project", e);
		return "project/pIntro";
	}

	@RequestMapping(value = "/chat.do")
	public String chat(Model model, int projectNo) {
		EmployVO e = service.getProjectIntro(projectNo);

		ArrayList<MemberVO> members = service.seletProjectMember(e.getProjectMembers());
		ArrayList<ProjectChatVO> chats = service.selectProjectChat(projectNo);
		model.addAttribute("projectNo", projectNo);
		model.addAttribute("chats", chats);
		model.addAttribute("members", members);
		return "project/pChat";
	}

	@RequestMapping(value = "/todo.do")
	public String todo() {
		return "project/pTodo";
	}

	@RequestMapping(value = "/schedule.do")
	public String schedule() {
		return "project/pSchedule";
	}

	@RequestMapping(value = "/files.do")
	public String files(Model model,int projectNo) {
		ArrayList<ProjectFileVO> files = service.selectProjectFile(projectNo);
		model.addAttribute("files",files);
		model.addAttribute("projectNo",projectNo);
		return "project/pFiles";
	}

	@ResponseBody
	@Transactional
	@RequestMapping(value = "/uploadProjectFile.do", produces = "text/html;charset=utf-8")
	public String uploadProjectFile(HttpServletRequest request, MultipartHttpServletRequest mtfRequest,ProjectFileVO pf) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file[]");
		ArrayList<String> resultList = new ArrayList<String>();
		int result = 0;
		if (!fileList.isEmpty()) {
			for (MultipartFile file : fileList) {
				String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/project/file/");
				// 업로드한 파일의 실제 파일명
				String originalFilename = file.getOriginalFilename();
				// 확장자를 제외한 파일명 ->text
				String onlyFilename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
				// 확장자 ->.txt
				String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
				String filepath = onlyFilename + "_" + Calendar.getInstance().getTimeInMillis() + extension;
				String fullpath = savePath + filepath;
				
				ProjectFileVO newFile =  new ProjectFileVO();
				newFile.setPFilename(originalFilename);
				newFile.setPFilepath(filepath);
				newFile.setProjectNo(pf.getProjectNo());
				newFile.setPFileWriter(pf.getPFileWriter());
				
				result +=service.insertProjectFile(newFile);
				
				resultList.add(originalFilename + ":" + filepath);

				try {
					byte[] bytes = file.getBytes();
					BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
					bos.write(bytes);
					bos.close();
					System.out.println("프로젝트파일 업로드 완료");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return new Gson().toJson(resultList);
	}
	
	@RequestMapping(value = "/projectFileDownload.do", produces = "application/octet-stream;charset=utf-8")
	public void chatFileDownload(String filename, String filepath, HttpServletRequest request,
			HttpServletResponse response) {
		//hyeokjin
		String resFilename=null;
		try {
			resFilename = new String(filename.getBytes("UTF-8"),"ISO-8859-1");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setHeader("Content-Disposition", "attachment;filename=" + resFilename);
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/project/file/");

		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			bis = new BufferedInputStream(new FileInputStream(saveDir + filepath));
			bos = new BufferedOutputStream(response.getOutputStream());
			int read = -1;
			while ((read = bis.read()) != -1) {
				bos.write(read);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				bos.close();
				bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}

	}
	
}
