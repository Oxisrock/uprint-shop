<?php
if(!defined('_PS_VERSION_')) {
    exit;
}
use PrestaShop\PrestaShop\Core\Module\WidgetInterface;
class mgmservices extends Module implements WidgetInterface {
     
    //put your code here
    public function __construct() {
        
        $this->name = "mgmservices";
        
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Francisco Aular';
        $this->need_instance = 0;
        
        $this->bootstrap = true;
      
        parent::__construct(); 
        $this->displayName = $this->trans('Frontend servicios', array(), 'Module.mymodule');
        $this->description = $this->trans('Modulo para servicios.', array(), 'Module.mymodule');
        $this->ps_versions_compliancy = array('min' => '1.7.0.0', 'max' => _PS_VERSION_);
        
    }
    
    public function install() {
        // Configuration::updateValue('MGM_URL_IMAGE', 'https://olimpica.vteximg.com.br/arquivos/ids/188349/PRINCIPAL-MOBILE-CELULARES_26mayo.png?v=636944955313100000');
        // Configuration::updateValue('MGM_URL_LINK', 'http://bonaparte.test/223-home_default/ambientador-aroma-black-ice-shich-fresh.jpg');
        
        return parent::install() &&
            $this->registerHook('header') &&
            $this->registerHook('footer') && 
            $this->registerHook('backOfficeHeader') &&
            $this->registerHook('displayHome') ;
    }
    public function uninstall() {
               
        // return parent::uninstall();
    }
    
    public function getContent() {
        // $this->context->smarty->assign($this->name, array(
        //     'path' => $this->_path
        // ));
        // $this->context->smarty->fetch($this->local_path.'views/templates/admin/configure.tpl');
        return $this->display(__FILE__,'views/templates/admin/configure.tpl');
    }
    
    public function hookHeader() {
        
    }
    
    public function hookFooter() {
        
    }
    
    public function hookBackOfficeHeader() {
        
    }
    
    public function hookDisplayHome() {
         $this->setMedia();
        $this->smarty->assign([
            'path' => $this->path
        ]);
        return $this->display($this->local_path,'views/templates/hook/displayHome.tpl');
    }
    
    public function hookDisplayLeftColumn() {
        
    }

    public function get_path() {
        return $this->local_path;
    }
    
    public function setMedia()
    {
        // $this->context->controller->addCSS($this->local_path.'views/css/slick.css');
        // $this->context->controller->addCSS($this->local_path.'views/css/slick-theme.css');
        $this->context->controller->addCSS($this->local_path.'views/css/services.css');
        $this->context->controller->addCSS('https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');
        $this->context->controller->addJS($this->local_path.'views/js/services.js');
        // $this->context->controller->addJS($this->local_path.'views/js/mgmsliderdest.js');

    }
   
    public function renderWidget($hookName, array $configuration) {
        
    }
    
    public function getWidgetVariables($hookName, array $configuration) {
        
    }
}