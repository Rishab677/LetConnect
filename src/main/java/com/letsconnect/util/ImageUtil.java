package com.letsconnect.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class ImageUtil {

    /**
     * Extracts the file name from the given {@link Part} object.
     *
     * @param part the uploaded file part
     * @return the extracted file name or "download.png" if not found
     */
    public String getImageNameFromPart(Part part) {
        if (part == null) {
            System.out.println("⚠️ Part is null in getImageNameFromPart");
            return "download.png";
        }

        String contentDisp = part.getHeader("content-disposition");
        if (contentDisp == null) {
            System.out.println("⚠️ content-disposition header is null");
            return "download.png";
        }

        for (String item : contentDisp.split(";")) {
            if (item.trim().startsWith("filename")) {
                String imageName = item.substring(item.indexOf('=') + 2, item.length() - 1);
                if (!imageName.isEmpty()) {
                    return Paths.get(imageName).getFileName().toString(); // Ensures only filename is returned
                }
            }
        }

        return "download.png";
    }

    /**
     * Uploads the image to the specified folder under webapp/Resources/Image/profile/
     *
     * @param part       the uploaded file part
     * @param saveFolder the folder name (e.g., "profile", "products", etc.)
     * @param request    the HTTP servlet request
     * @return true if upload succeeded, false otherwise
     */
    public boolean uploadImage(Part part, String saveFolder, HttpServletRequest request) {
        if (part == null) {
            System.out.println("⚠️ Cannot upload image: Part is null.");
            return false;
        }

        String uploadDir = getSavePath(saveFolder);
        File fileSaveDir = new File(uploadDir);

        // Create directory if it doesn't exist
        if (!fileSaveDir.exists()) {
            if (!fileSaveDir.mkdirs()) {
                System.out.println("❌ Failed to create directory: " + uploadDir);
                return false;
            }
        }

        try {
            String imageName = getImageNameFromPart(part);
            String filePath = uploadDir + File.separator + imageName;
            part.write(filePath);
            System.out.println("✅ Image uploaded to: " + filePath);
            return true;
        } catch (IOException e) {
            System.out.println("❌ IOException while uploading image:");
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Constructs the full path to the save folder.
     *
     * @param saveFolder the folder name (like "profile", "products", etc.)
     * @return full system path to the folder
     */
    public String getSavePath(String saveFolder) {
        return "Resources/Image/profile" + saveFolder;
    }
}
