package kr.or.meister.fileupload.model.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileUploadVO {

	private String attachPath;
    private String Filename; 
    private MultipartFile upload;
    private String CKEditorFuncNum; 
}
