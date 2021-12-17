﻿using System;
using System.Drawing;//added for Image and Bitmap
using System.Drawing.Drawing2D;//added for CompositingQuality
using System.Drawing.Imaging;//added for PixelFormat
using System.IO;//added for FileInfo

namespace SAT_Pair_Project.Utilities
{
    public class ImageUtility
    {


        public static void ResizeImage(string savePath, string fileName, Image image, int maxImgSize, int maxThumbSize)
        {
            //Get new proportional image dimensions based off current image size and maxImgSize
            int[] newImageSizes = GetNewSize(image.Width, image.Height, maxImgSize);
            //Resize the image to new dimensions returned from above
            Bitmap newImage = DoResizeImage(newImageSizes[0], newImageSizes[1], image);
            //save new image to path w/ filename
            newImage.Save(savePath + fileName);//calculate proportional size for thumbnail based on maxThumbSize
            int[] newThumbSizes = GetNewSize(newImage.Width, newImage.Height, maxThumbSize);
            //Create thumbnail image
            Bitmap newThumb = DoResizeImage(newThumbSizes[0], newThumbSizes[1], image);
            //Save it with t_ prefix
            newThumb.Save(savePath + "t_" + fileName);
            //Clean up service
            newImage.Dispose(); newThumb.Dispose(); image.Dispose();
        }

        public static int[] GetNewSize(int imgWidth, int imgHeight, int maxImgSize)
        {

            float ratioX = (float)maxImgSize / (float)imgWidth;
            float ratioY = (float)maxImgSize / (float)imgHeight;
            float ratio = Math.Min(ratioX, ratioY);

            int[] newImgSizes = new int[2];
            newImgSizes[0] = (int)(imgWidth * ratio);
            newImgSizes[1] = (int)(imgHeight * ratio);
            // Return the new porportional image sizes
            return newImgSizes;
        }


        public static Bitmap DoResizeImage(int imgWidth, int imgHeight, Image image)
        {
            // Convert other formats (including CMYK) to RGB.
            Bitmap newImage = new Bitmap(imgWidth, imgHeight, PixelFormat.Format24bppRgb);
            // If the image format supports transparency apply transparency
            newImage.MakeTransparent();// Set image to screen resolution of 72 dpi (the resolution of monitors)
            newImage.SetResolution(72, 72);
            // Do the resize
            using (Graphics graphics = Graphics.FromImage(newImage))
            {
                graphics.CompositingQuality = CompositingQuality.HighQuality;
                graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphics.SmoothingMode = SmoothingMode.HighQuality;
                graphics.DrawImage(image, 0, 0, imgWidth, imgHeight);
            }
            // Return the resized image
            return newImage;
        }


        public static void Delete(string path, string fileName)
        {
            //Skip this action if targeted file is the "default image".
            if (fileName.ToLower() == "noimage.png")
            {
                return;
            }

            //Create FileInfo objects for different versions of the file: full (and thumbnail in case it's an image)
            FileInfo baseFile = new FileInfo(path + fileName);
            FileInfo thumbImg = new FileInfo(path + "t_" + fileName);

            //Check if designated file exists and, if so, delete it
            if (baseFile.Exists)
            {
                baseFile.Delete();
            }

            //Check if a thumbnail version exists for the file and, if so, delete it
            if (thumbImg.Exists)
            {
                thumbImg.Delete();
            }
        }
    }
}