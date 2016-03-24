package com.sips.webmvc.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

public final class FileSystemUtil {
	
	private static Logger LOG = Logger.getLogger(FileSystemUtil.class);
	
	static String IMAGE_FOLDER_PATH = "D:\\xampp\\htdocs\\tuvanhoatuoi";
	

	public static String getPath(String dataFolderPath, String parentUrl, String fsName){
		String fsPath = dataFolderPath;
		if(File.separator.equals("\\")){
			fsPath += parentUrl.replaceAll("/", "\\\\");
		}else{
			fsPath += parentUrl;
		}
		fsPath += File.separator + StringUtil.convertToAscii(fsName);
		return fsPath;
	}
	
	public static String getPath(String dataFolderPath, String parentUrl){
		String fsPath = dataFolderPath;
		if(File.separator.equals("\\")){
			fsPath += parentUrl.replaceAll("/", "\\\\");
		}else{
			fsPath += parentUrl;
		}
		return fsPath;
	}
	
	public static void createFolder(String folderPath) throws IOException{
		Path path = FileSystems.getDefault().getPath(folderPath);
		Files.createDirectory(path);
	}
	
	public static void createFile(String filePath, byte[] bytes) throws IOException{
		Path path = FileSystems.getDefault().getPath(filePath);
		Files.createFile(path);
	}
	
	public static void deleteFileSystem(String fsPath) throws IOException{
		Path path = FileSystems.getDefault().getPath(fsPath);
		if(path.toFile().isDirectory()){
			FileUtils.deleteDirectory(path.toFile());
		}else{
			Files.delete(path);
		}
	}
	
	public static void renameFileSystem(String oldPath, String newPath) throws IOException{
		Path oldP = FileSystems.getDefault().getPath(oldPath);
		Path newP = FileSystems.getDefault().getPath(newPath);
		oldP.toFile().renameTo(newP.toFile());
	}
	
	public static boolean isExistedFileSystem(String fsPath) throws IOException{
		Path path = FileSystems.getDefault().getPath(fsPath);
		return path.toFile().exists();
	}
	
	public static String getFileExtension(String name) throws IOException{
		String names[] = name.split("\\.");
		return names[names.length-1];
	}
	
	public static String getExtensionWhenRenameFile(String oldPath, String newPath) throws IOException{
		String oldExtension = getFileExtension(oldPath);
		String newExtension = getFileExtension(newPath);
		if(!oldExtension.equals(newExtension)){
			return oldExtension;
		}
		return "";
	}
	
}
