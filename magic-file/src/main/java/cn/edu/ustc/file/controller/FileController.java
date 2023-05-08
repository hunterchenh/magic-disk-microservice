package cn.edu.ustc.file.controller;

import cn.edu.ustc.common.result.Result;
import cn.edu.ustc.file.pojo.dto.UploadFileDTO;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.io.IOException;

@RestController
@RequestMapping("/file")
public class FileController {

    /**
     * 上传文件
     * @param uploadFileDTO
     * @return
     */
    @PostMapping("/upload")
    public Result uploadFile(@Valid @RequestBody UploadFileDTO uploadFileDTO){
        try {
            fileService.saveChunk(file.getInputStream(), chunkNumber, totalChunks, identifier);
            return Result.success();
        } catch (IOException e) {
            e.printStackTrace();
            return Result.failed("文件分片上传失败！");
        }
    }

}
