<?php

if(!defined('_PS_VERSION_')) {
    exit;
}

use PrestaShop\PrestaShop\Core\Module\WidgetInterface;


class mgmsliderdest extends Module implements WidgetInterface {
    public $controls = array();
    //put your code here
    public function __construct() {
        
        $this->name = "mgmsliderdest";
        
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Francisco Aular';
        $this->need_instance = 0;
        
        $this->bootstrap = true;
      
        parent::__construct(); 

        $this->displayName = $this->trans('mgmsliderdest', array(), 'Module.mymodule');
        
        $this->description = $this->trans('Módulo slider para destacar y responsive.', array(), 'Module.mymodule');
        
        $this->ps_versions_compliancy = array('min' => '1.7.0.0', 'max' => _PS_VERSION_);

    }
    
  
    public function install() {
        Configuration::updateValue('MYMODULE_URL_LINK', '');
        Configuration::updateValue('MYMODULE_URL_FILE1', '');
        Configuration::updateValue('MYMODULE_URL_FILE2', '');
        
        include(dirname(__FILE__).'/sql/install.php');
        
        return parent::install() &&
            $this->registerHook('header') &&
            $this->registerHook('footer') && 
            $this->registerHook('backOfficeHeader') &&
            $this->registerHook('displayHome') && 
            $this->registerHook('displayLeftColumn');
    }

    public function uninstall() { 
           Configuration::deleteByName('MYMODULE_URL_LINK');  
        Configuration::deleteByName('MYMODULE_URL_FILE1');
        return parent::uninstall();
        Configuration::deleteByName('MYMODULE_URL_FILE2');
    }

    
    
    public function getContent() {
        if((bool) Tools::isSubmit('submitMymodule')) {

            $this->postProcess(); 
            // $this->saveImage();
        }
        if((bool) Tools::isSubmit('id_delete')) {

            $this->delete_data();
            // $this->saveImage();
        }
        $data = $this->getData();
        $action_url = $this->context->link->getAdminLink('AdminModules', false)
        .'&configure='.$this->name.'&module_name='.$this->name.'&token='.Tools::getAdminTokenLite('AdminModules');
        $this->smarty->assign([ 
            'data' => $data,
            'action_url' => $action_url 
        ]);
        $customTpl = $this->display(__FILE__,'views/templates/admin/configure.tpl');
        $autoGenerateTpl = $this->renderForm();

        return $autoGenerateTpl . $customTpl;
    }
    protected function renderForm() {
        
        $helper = new HelperForm();
        
        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->module = $this;
        $helper->default_form_language = $this->context->language->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG', 0);
        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submitMymodule';
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false)
            .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->tpl_vars = array(
            'fields_value' => $this->getConfigFormValues(),
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id,
        );
        
        return $helper->generateForm(array($this->getConfigForm()));
        
    }


    protected function getConfigFormValues () {
        return array(
           'MYMODULE_URL_LINK' => Configuration::get('MYMODULE_URL_LINK', '#'),
           'MYMODULE_URL_FILE' => Configuration::get('MYMODULE_URL_FILE1'),
           'MYMODULE_URL_FILE2' => Configuration::get('MYMODULE_URL_FILE2'),

       );
   }
    
    protected function postProcess() {
        $MYMODULE_URL_LINK = Tools::getValue('MYMODULE_URL_LINK');
        $MYMODULE_URL_FILE = $this->uploadFiles('MYMODULE_URL_FILE1');
        $MYMODULE_URL_FILE2 = $this->uploadFiles('MYMODULE_URL_FILE2');

            Db::getInstance()->insert('mgmsliderdest_configuracion', array(
                'mgmd_image' => pSQL($MYMODULE_URL_FILE),
                'mgmd_url'      => pSQL($MYMODULE_URL_LINK),
                'mgmd_image_responsive'      => pSQL($MYMODULE_URL_FILE2),
            ));
    }

    protected function saveImage() {
        $result_file = $this->uploadFiles('MYMODULE_URL_FILE1');
    }


    protected function uploadFiles($field){
        $file = '';
        foreach($_FILES as $key => $value):
            if($key == $field){
                $ext    = $this->getFileExtension($_FILES[$key]['name']);
                $name   = md5(date("YmdHis").rand(1,55555)) . $ext;
                //$image  = (strpos($_FILES[$key]['type'], 'image') !== false) ? true : false;
                
                $folder = _PS_MODULE_DIR_.'mgmsliderdest/documents/';
                if(strpos($ext, 'php') === false):
                        if($this->uploadFile($folder, $_FILES[$key]['tmp_name'], $name)):
                                $file = _PS_BASE_URL_._MODULE_DIR_.'mgmsliderdest/documents/'.$name;
                        endif;
                endif;   
            }                 
        endforeach;
        if($file == ''){
            return false;
        }
        Configuration::updateValue($field, $file);
        return $file;
    }

    protected function getFileExtension($fileName)
    {
    $pos = strrpos($fileName, '.');
    if($pos != false)
        return strtolower(substr($fileName, $pos));
    else
        return false;
    }

    function uploadFile($path, $tempName, $name)
    {
    $fullName =  $path . $name;
    if (move_uploaded_file($tempName, $fullName)) 
        return true;
    else
        return false;
    }

    protected function getConfigForm() {
        return array(
            
            'form' => array(
                'legend' => array(
                'title' => $this->l('Configuracion'),
                'icon' => 'icon-cogs',
                ),
                'input' => array( 
                    array(
                        'col' => 6,
                        'type' => 'text',
                        'prefix' => '<i class="icon icon-envelope"></i>',
                        'desc' => $this->l('Introduce Link de Banner'),
                        'name' => 'MYMODULE_URL_LINK',
                        'label' => $this->l('Url'),
                    ),
                    array(
                        'col' => 6,
                        'type' => 'file',
                        'prefix' => '<i class="icon icon-envelope"></i>',
                        'name' => 'MYMODULE_URL_FILE1',
                        'id' => 'uploadwineoheaderimg',
                        'display_image' => true,
                        'desc' => $this->l('Introduce Imagen slider para desktop.'),
                        'label' => $this->l('Imagen slider para desktop'),
                    ),
                    array(
                        'col' => 6,
                        'type' => 'file',
                        'prefix' => '<i class="icon icon-envelope"></i>',
                        'name' => 'MYMODULE_URL_FILE2',
                        'id' => 'uploadwineoheaderimg2',
                        'display_image' => true,
                        'desc' => $this->l('Introduce Imagen slider para responsive.'),
                        'label' => $this->l('Imagen slider para responsive'),
                    ),
                ),
                'submit' => array(
                    'title' => $this->l('Save'),
                ),
            ),
        );
    }

    private function eraseOldImage()
    { 
    $dir = $this->local_path.'documents';
    
    $data =  $this->getImageDelete();
    $dirHandle = opendir($dir);
    $i = 0;
    while ($file = readdir($dirHandle)) {
        if(!in_array ($file, $data)) {
                   unlink($dir.'/'.$file);
        }
    }
    }
    private function last_word($sentence) {
        $link_array = explode('/',$sentence);
        $word = end($link_array);
        return $word;
    }
    
    public function hookHeader() {
     
            $this->context->controller->registerStylesheet(
                'module-modulename-style',
                $this->local_path.'views/css/mgmbannersdest.css',
                [
                  'media' => 'all',
                  'priority' => 200,
                ]
            );
    }

    public function hookActionFrontControllerSetMedia($params)
    {
        // Only on product page
        $this->context->controller->registerStylesheet(
                'module-modulename-style',
                'modules/'.$this->name.'/views/css/mgmbannersdest.css',
                [
                  'media' => 'all',
                  'priority' => 200,
                ]
            );

    }
    
    public function hookFooter() {
    
            // $this->context->controller->registerJavascript(
            //     'module-modulename-simple-lib',
            //     'modules/'.$this->name.'/js/lib/simple-lib.js',
            //     [
            //       'priority' => 200,
            //       'attribute' => 'async',
            //     ]
            // );
            $this->context->controller->registerStylesheet(
                'module-modulename-style',
                $this->local_path.'views/css/mgmbannersdest.css',
                [
                  'media' => 'all',
                  'priority' => 200,
                ]
            );
    }
    
    public function setMedia()
    {
        $this->context->controller->addCSS($this->local_path.'views/css/slick.css');
        $this->context->controller->addCSS($this->local_path.'views/css/slick-theme.css');
        $this->context->controller->addCSS($this->local_path.'views/css/mgmsliderdest.css');


        $this->context->controller->addJS($this->local_path.'views/js/slick.js');
        $this->context->controller->addJS($this->local_path.'views/js/mgmsliderdest.js');

    }
    
    public function hookBackOfficeHeader() {
        //echo Tools::getValue('module_name') .'=='. $this->name;
        //if (Tools::getValue('module_name') == $this->name) {
            $this->context->controller->addJS('https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js');
            $this->context->controller->addJS($this->local_path.'views/js/back.js');
        //}
    }

    public function getData() {
        $results = (Db::getInstance())->executeS((new DbQuery())
            ->select('*')
            ->from('mgmsliderdest_configuracion')
            ->where('1')
            ->orderBy('id DESC')
            ->limit(6)  
        );
        if ($results){
            return $results; 
        }else{
            return 0; 
        }
    }
    public function getImageDelete() {
        $sql = 'SELECT * FROM '._DB_PREFIX_. 'mgmsliderdest_configuracion WHERE 1 ORDER BY id DESC LIMIT 6';
        if ($results = Db::getInstance()->ExecuteS($sql)){
            $images = [];
            foreach ($results as $i) {
                array_push($images, $this->last_word($i.mgmd_image)); 
            }
            return $images; 
        }else{
            return 0; 
        }
    }
    public function delete_data(){
        $id = Tools::getValue('id_delete');
        Db::getInstance()->delete('mgmsliderdest_configuracion', 'id = '.$id, 1);
    }
    
    public function hookDisplayHome() {
        $this->setMedia();
        $data = $this->getData();

        $this->smarty->assign([ 
            'data' => $data,
        ]);
        return $this->display($this->local_path,'views/templates/hook/displayHome.tpl');
    }
    

    public function hookDisplayLeftColumn() {
        
    }
   
    public function renderWidget($hookName, array $configuration) {
        
    }
    
    public function getWidgetVariables($hookName, array $configuration) {
        
    }
}
