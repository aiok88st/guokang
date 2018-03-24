<?php

/*组装sql语句*/
class Model{
    public $table;
    public $where;
    public $order;
    public $sql;
    public $limit;
    public $field="*";

    public function cache_rm()
    {
        $this->where='';
        $this->order='';
        $this->limit='';
        $this->field='*';
        return $this;
    }

    public function getLastSql(){
        return $this->sql;
    }
    public function table($table){
        $this->table=$table;
        return $this;
    }
    public function where($where){
        $this->where=$where;

        return $this;
    }
    public function order($order){
        $this->order=$order;

        return $this;
    }
    public function limit($limit){
        $this->limit=$limit;
        return $this;
    }
    public function field($field){
        $this->field=$field;
        return $this;
    }
    public function del(){
        $sql="DELETE FROM ".$this->table." WHERE ".$this->where;
        $this->sql=$sql;
        $res=$GLOBALS['db']->query($sql);
        $this->cache_rm();
        return $res;
    }

    public function insert($data=[]){
        $keys="";
        $values="";
        foreach ($data as $key=>$value){
            $keys .='`'.$key.'`'.',';
            $values .="'$value'".',';
        }


        $keys=trim($keys,',');
        $values=trim($values,',');


        $sql="INSERT INTO ". $this->table ." ($keys)"." VALUES ($values)";
        $this->sql=$sql;
        $res=$GLOBALS['db']->query($sql);
        $this->cache_rm();
        return $res;
    }
    public function update($data=[]){
        $set="";
        foreach ($data as $key=>$value){
            $set .="`$key`='$value',";

        }
        $set=trim($set,',');
        $sql="UPDATE ". $this->table ." SET ".$set." WHERE $this->where";
        $this->sql=$sql;
        $res=$GLOBALS['db']->query($sql);
        $this->cache_rm();
        return $res;
    }
    public function find(){
        $sql="SELECT ".$this->field." FROM ".$this->table;
        if($this->where){
            $sql .=" WHERE ".$this->where;
        }
        if($this->order){
            $sql .=" ORDER BY ".$this->order;
        }
        $sql .=" LIMIT 1";


        $this->sql=$sql;
        $res=$GLOBALS['db']->getRow($sql);
        $this->cache_rm();
        return $res;
    }
    public function value($field){
        $sql="SELECT ".$field." FROM ".$this->table;
        if($this->where){
            $sql .=" WHERE ".$this->where;
        }
        if($this->order){
            $sql .=" ORDER BY ".$this->order;
        }
        $sql .=" LIMIT 1";
        $this->sql=$sql;
        $res=$GLOBALS['db']->getRow($sql);

        $this->cache_rm();

        return $res[$field];
    }
    public function select(){
        $sql="SELECT ".$this->field." FROM ".$this->table;
        if($this->where){
            $sql .=" WHERE ".$this->where;
        }
        if($this->order){

            $sql .=" ORDER BY ".$this->order;
        }
        if($this->limit){
            $sql .=" LIMIT ".$this->limit;
        }
        $this->sql=$sql;
        $res=$GLOBALS['db']->getAll($sql);
        $this->cache_rm();
        return $res;
    }
    public function count(){

        $sql="SELECT count(*) as num FROM ".$this->table;
        if($this->where){
            $sql .=" WHERE ".$this->where;
        }
        $res=$GLOBALS['db']->getRow($sql);
        $this->sql=$sql;

        return $res['num'];
    }
    public function paginate($size = 10,$url,$param=[]){

        $page = isset($_REQUEST['page']) && intval($_REQUEST['page']) > 0 ? intval($_REQUEST['page'])  : 1;

        $record_count=$this->count();

        $sql="SELECT ".$this->field." FROM ".$this->table;
        if($this->where){
            $sql .=" WHERE ".$this->where;
        }
        if($this->order){
            $sql .=" ORDER BY ".$this->order;
        }
        $start=($page-1)*$size;
        $sql .=" LIMIT ".$start.','.$size;
        $this->sql=$sql;

        $lists=$GLOBALS['db']->getAll($sql);
        $this->cache_rm();

        $size =intval($size);//每页显示几条记录
        if($size<1){ //如果每页显示的记录小于1的话
            $size = 10;//将每页显示记录条数设置为10
        }
        $page = intval($page);///当前页码
        if ($page < 1) ///如果当前页码小于1的话
        {
            $page = 1;///将当前页码默认设置为1
        }
        $record_count = intval($record_count);///记录总数量

        $page_count = $record_count > 0 ? intval(ceil($record_count / $size)) : 1; ///总页数
        if ($page > $page_count) ///如果当前页码大于总页数
        {
            $page = $page_count;///则将总页数赋值给当前页码
        }

        $page_prev  = ($page > 1) ? $page - 1 : 1; ///前一页
        $page_next  = ($page < $page_count) ? $page + 1 : $page_count; ///后一页
         /* 将参数合成url字串 */
        $param_url = '?';  ///参数组成的url字符串 如："?act=list"
        foreach ($param AS $key => $value) ///键值对数组参数
        {
            $param_url .= $key . '=' . $value . '&'; ///"?号后面的参数"
        }

        $pager['url']          = $url; ///个参数，是一个文件名 如：get_comment.php
        $pager['start']        = ($page -1) * $size; ///查询时的起始位置
        $pager['page']         = $page; ///当前页
        $pager['size']         = $size; ///每页显示的记录条数
        $pager['record_count'] = $record_count;  ///记录总数
        $pager['page_count']   = $page_count; ///总页数

            $_pagenum = 10;     // 显示的页码
            $_offset = 2;       // 当前页偏移值
            $_from = $_to = 0;  // 开始页, 结束页

        if($_pagenum > $page_count) ///如果显示的页码 大于 总页数，如：显示10页 总页数为8 则显示1-8
        {
            $_from = 1; ///从1开始
            $_to = $page_count; ///到 总页数 为止
        }
        else ///如果 显示的页码 小于 总页码，如：显示10页 总页数为15
        {///(1)假如当前页为2,则$_from为0，$_to为9   (2)假如当前页为6，则$_from为4,$_to为13
            $_from = $page - $_offset;    ;///(1)$_from为0 (2)$_from为4 当前页-当前页偏移量，如： 1-10、2-11、3-12、4-13、5-14、6-15、不会出现7-16、8-17，因为总页数是15 //www.zuimoban.com
            $_to = $_from + $_pagenum - 1; ///(1)$_to为9 (2)$_to为13
            if($_from < 1)
            {
                $_to = $page + 1 - $_from; ///(1)则$_to为3
                $_from = 1; ///(1)$_from重新复制为1
                if($_to - $_from < $_pagenum) //(1)3-1 小于 要显示的页码数
                {
                    $_to = $_pagenum; ///(1)则$_to重新复制为10
                }
            }
            elseif($_to > $page_count) //(2)如果13 大于 10的话           如果14 大于 10的话
            {
                $_from = $page_count - $_pagenum + 1; ///(2)$_from为起始页数：15-10+1=6
                $_to = $page_count; //(2)$_to为总页数：15
            }
        }
        $url_format = $url . $param_url . 'page=';
        $pager['page_first'] = $url_format . 1;
        $pager['page_prev']  = ($page > 1) ? $url_format . $page_prev : '';
        $pager['page_next']  = ($page < $page_count) ? $url_format . $page_next : '';
        $pager['page_last']  =  $url_format . $page_count ;
        $pager['page_number'] = array();
        for ($i=$_from;$i<=$_to;++$i)
        {
            $pager['page_number'][$i] = $url_format . $i;
        }
        $pager['lists']=$lists;

        return $pager;
     }
    public function paginate2($size = 10,$url,$param=[]){

        $page = isset($_REQUEST['page']) && intval($_REQUEST['page']) > 0 ? intval($_REQUEST['page'])  : 1;

        $record_count=$this->count();

        $sql="SELECT ".$this->field." FROM ".$this->table;
        if($this->where){
            $sql .=" WHERE ".$this->where;
        }
        if($this->order){
            $sql .=" ORDER BY ".$this->order;
        }

        $start=($page-1)*$size;
        $sql .=" LIMIT ".$start.','.$size;

        $this->sql=$sql;

        $lists=$GLOBALS['db']->getAll($sql);
        $this->cache_rm();

        $size =intval($size);//每页显示几条记录
        if($size<1){ //如果每页显示的记录小于1的话
            $size = 10;//将每页显示记录条数设置为10
        }
        $page = intval($page);///当前页码
        if ($page < 1) ///如果当前页码小于1的话
        {
            $page = 1;///将当前页码默认设置为1
        }
        $record_count = intval($record_count);///记录总数量

        $page_count = $record_count > 0 ? intval(ceil($record_count / $size)) : 1; ///总页数
        if ($page > $page_count) ///如果当前页码大于总页数
        {
            $page = $page_count;///则将总页数赋值给当前页码
        }

        $page_prev  = ($page > 1) ? $page - 1 : 1; ///前一页
        $page_next  = ($page < $page_count) ? $page + 1 : $page_count; ///后一页
        /* 将参数合成url字串 */
        $param_url = '-';  ///参数组成的url字符串 如："?act=list"
        foreach ($param AS $key => $value) ///键值对数组参数
        {
            $param_url .=  $value . '-'; ///"?号后面的参数"
        }

        $pager['url']          = $url; ///个参数，是一个文件名 如：get_comment.php
        $pager['start']        = ($page -1) * $size; ///查询时的起始位置
        $pager['page']         = $page; ///当前页
        $pager['size']         = $size; ///每页显示的记录条数
        $pager['record_count'] = $record_count;  ///记录总数
        $pager['page_count']   = $page_count; ///总页数

        $_pagenum = 10;     // 显示的页码
        $_offset = 2;       // 当前页偏移值
        $_from = $_to = 0;  // 开始页, 结束页

        if($_pagenum > $page_count) ///如果显示的页码 大于 总页数，如：显示10页 总页数为8 则显示1-8
        {
            $_from = 1; ///从1开始
            $_to = $page_count; ///到 总页数 为止
        }
        else ///如果 显示的页码 小于 总页码，如：显示10页 总页数为15
        {///(1)假如当前页为2,则$_from为0，$_to为9   (2)假如当前页为6，则$_from为4,$_to为13
            $_from = $page - $_offset;    ;///(1)$_from为0 (2)$_from为4 当前页-当前页偏移量，如： 1-10、2-11、3-12、4-13、5-14、6-15、不会出现7-16、8-17，因为总页数是15 //www.zuimoban.com
            $_to = $_from + $_pagenum - 1; ///(1)$_to为9 (2)$_to为13
            if($_from < 1)
            {
                $_to = $page + 1 - $_from; ///(1)则$_to为3
                $_from = 1; ///(1)$_from重新复制为1
                if($_to - $_from < $_pagenum) //(1)3-1 小于 要显示的页码数
                {
                    $_to = $_pagenum; ///(1)则$_to重新复制为10
                }
            }
            elseif($_to > $page_count) //(2)如果13 大于 10的话           如果14 大于 10的话
            {
                $_from = $page_count - $_pagenum + 1; ///(2)$_from为起始页数：15-10+1=6
                $_to = $page_count; //(2)$_to为总页数：15
            }
        }
        $url_format = $url . $param_url . 'p';
        $pager['page_first'] = $url_format . '1.html';
        $pager['page_prev']  = ($page > 1) ? $url_format . $page_prev.'.html' : '';
        $pager['page_next']  = ($page < $page_count) ? $url_format . $page_next.'.html' : '';
        $pager['page_last']  =  $url_format . $page_count .'.html';
        $pager['page_number'] = array();
        for ($i=$_from;$i<=$_to;++$i)
        {
            $pager['page_number'][$i] = $url_format . $i.'.html';
        }
        $pager['lists']=$lists;

        return $pager;
    }
}

?>