package com.fh.lw.pojo.smallcoment;

public class PicUploadResult {

	// 上传成功的标识，0-成功，1-失败
	private String error;

	// 上传成功的图片访问路径
	private String url;

	private String width;

	private String height;

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

}
