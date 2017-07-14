<aside class="app-sidebar" id="sidebar">
    <div class="sidebar-header"> <a class="sidebar-brand" href="#"><span class="highlight">Menú</span> Calificaciones</a>
        <button type="button" class="sidebar-toggle"> <i class="fa fa-times"></i> </button>
    </div>
    <div class="sidebar-menu">        
        <ul class="sidebar-nav">
            <?php menu::menuEmpMenj($quien,$nivel); ?>           
        </ul>
    </div>
</aside>
<script type="text/ng-template" id="sidebar-dropdown.tpl.html">
    <div class="dropdown-background">
        <div class="bg"></div>
    </div>
    <div class="dropdown-container"> {{list}} </div>
</script>