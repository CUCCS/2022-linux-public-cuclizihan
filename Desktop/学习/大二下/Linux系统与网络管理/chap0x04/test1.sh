#!/bin/env bash
#对jpeg格式图片进行图片质量压缩

function compressQuality{
    for file in *.jpeg;do 
    if [ stat --printf="%s" $file -gt 1000000 ]
    then
        echo $file
        mogrify -resize 50% $file
    fi
    done

    echo "test1 Done"
}


# 压缩图片分辨率

function compressResolution{
    for i in *; do
    to_middle_file="${file%.*}_m.${file##*.}"; //文件名加后缀
    to_small_file="${file%.*}_s.${file##*.}";
    convert ${img} -resize 300x180! ${to_middle_file};
    ls ${to_middle_file};
    convert ${img} -resize 100x60! ${to_small_file};
    ls ${to_small_file};
    done

    echo "test2 Done"
}


# 对图片批量添加自定义文本水印

function textmark{
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "jpeg" && ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
        convert "${i}" -pointsize "$1" -fill black -gravity center -draw "text 10,10 '$2'" "${i}"
        echo "${i} is watermarked with $2."
    done

    echo "test3 Done"
}

# 批量重命名

# 前缀
function prefix {
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "jpeg" && ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
        mv "${i}" "$1""${i}"
        echo "test3-1 done"
    done
}

# 后缀
function postfix {
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "jpeg" && ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
        filename=${i%.*}$1"."${type}
        mv "${i}" "${filename}"
        echo "test3-2 done"
    done
}

# 将png/svg图片统一转换为jpg格式图片

function transform{
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
        filename=${i%.*}".jpg"
        convert "${i}" "${filename}"
   	echo "test4 done"
    done
}