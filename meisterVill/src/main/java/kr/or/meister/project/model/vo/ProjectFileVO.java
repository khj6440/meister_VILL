package kr.or.meister.project.model.vo;

import lombok.Data;

@Data
public class ProjectFileVO {
	private int pFileNo;
	private int projectNo;
	private String pFileWriter;
	private String pFilename;
	private String pFilepath;
	private String pFileTime;
}
