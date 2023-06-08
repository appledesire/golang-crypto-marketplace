package util

import (
	"errors"
	"image"
	"image/jpeg"
	"image/png"
	"io"
	"os"
	"path/filepath"
	"strconv"
	"strings"

	"github.com/gocraft/web"
	"github.com/nfnt/resize"
)

func DeleteImagesWithPrefix(prefix string) error {
	pathS := "./data/images/"
	filepath.Walk(pathS, func(path string, f os.FileInfo, _ error) error {
		if !f.IsDir() {
			if strings.Contains(f.Name(), prefix) {
				err := os.Remove(path)
				if err != nil {
					return err
				}
			}
		}

		return nil
	})

	return nil
}

func SaveImage(r *web.Request, field string, maxWidth uint, uuid string) error {
	file, handler, _ := r.FormFile(field)
	if file == nil {
		return errors.New("No file provided")
	}
	defer file.Close()
	var image image.Image
	mimeType := handler.Header["Content-Type"][0]
	switch mimeType {
	case "image/jpeg", "image/jpg":
		image, _ = jpeg.Decode(file)
	case "image/png":
		image, _ = png.Decode(file)
	default:
		return errors.New("Wrong image extension")
	}
	DeleteImagesWithPrefix(uuid)
	out, _ := os.Create("./data/images/" + uuid + ".jpeg")
	defer out.Close()
	resized := resize.Resize(maxWidth, 0, image, resize.Bilinear)
	jpeg.Encode(out, resized, nil)
	return nil
}

func ResizeImage(infilename, outfilename string, size string) error {

	file, err := os.Open(infilename)
	defer file.Close()
	if err != nil {
		return err
	}

	image, err := jpeg.Decode(file)
	if err != nil {
		return err
	}

	out, err := os.Create(outfilename)
	defer out.Close()
	if err != nil {
		return err
	}

	switch size {
	case "small":
		resized := resize.Resize(32, 32, image, resize.Bilinear)
		jpeg.Encode(out, resized, nil)
	case "728x90":
		resized := resize.Resize(728, 0, image, resize.Bilinear)
		jpeg.Encode(out, resized, nil)
	case "200x200":
		resized := resize.Resize(200, 0, image, resize.Bilinear)
		jpeg.Encode(out, resized, nil)
	case "230x230":
		resized := resize.Resize(230, 230, image, resize.Bilinear)
		jpeg.Encode(out, resized, nil)
	case "300x300":
		resized := resize.Resize(300, 0, image, resize.Bilinear)
		jpeg.Encode(out, resized, nil)
	}

	return nil
}

func ServeImage(filename, size string, w web.ResponseWriter, r *web.Request) error {
	w.Header().Set("Content-type", "image/jpeg")
	w.Header().Set("Cache-control", "public, max-age=259200")

	originalFilename := "./data/images/" + filename + ".jpeg"
	resizedFilename := "./data/images/" + filename + "_" + size + ".jpeg"

	file := &os.File{}

	switch size {

	case "normal":
		f, err := os.Open(originalFilename)
		defer f.Close()
		if err != nil {
			return err
		}
		file = f

	case "200x200", "728x90", "small", "300x300", "230x230":
		resizedFile, err := os.Open(resizedFilename)
		defer resizedFile.Close()

		if err != nil { // image does not exist. resize
			ResizeImage(originalFilename, resizedFilename, size)

			newlyResizedFile, err := os.Open(resizedFilename)
			defer newlyResizedFile.Close()
			if err != nil {
				return err
			}

			file = newlyResizedFile
		} else {
			file = resizedFile
		}

	}

	fi, err := file.Stat()
	if err != nil {
		return err
	}
	w.Header().Set("Content-Length", strconv.FormatInt(fi.Size(), 10))
	io.Copy(w, file)

	return nil

}
