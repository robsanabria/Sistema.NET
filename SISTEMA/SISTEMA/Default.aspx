<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="SISTEMA._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sistema</title>
    <style>
        #form1{
        width: 767px;
        height: 886px;
        margin: auto auto;
        margin-top: auto;
        margin-bottom: auto;
        }
    </style>
</head>
<body bgcolor="#ffffff">
    <form id="form1" runat="server">
        <asp:Panel ID ="pPortada" runat="server" Height="350px" Width="765px">
            <asp:ImageButton ID="bPortada" runat="server"
               ImageAlign="Middle" ImageUrl="~/imagenes/portada.jpg" 
                />


          <asp:Panel ID="pLogin" runat="server" Height="350px" Width="765px" Font-Bold="true" ForeColor="Blue" Font-Size="Large" BorderStyle="Solid" Visible="False">

            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:label ID="lVersion" text="Versión" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="#999999"/>
                    </td>                     
                </tr>
                <tr>
                    <td align="center">
                        <asp:label ID="Label104" text="Ingresá tu Usuario y Clave, y oprimí ENTRAR!" runat="server" Font-Bold="true" Font-Size="X-Large"/>
                    </td>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </tr>
                </table>

                <table style="width:100%;">
                <tr>
                    <td>
                        <asp:label ID="lUsuario" text="Usuario:" runat="server" Font-Bold="true" Font-Size="XX-Large" ForeColor="blue"/>
                    </td>
                    <td>
                        <asp:TextBox ID="tUsuario" runat="server" MaxLength="10" BackColor="#372C57" Height="35px" ForeColor="White" Font-Size="XX-Large" Width="150px" />
                    </td>
                    <td></td>
                    <td>
                        <asp:label ID="lClave" text="Clave:" runat="server" Font-Bold="true" Font-Size="XX-Large" ForeColor="blue"/>
                    </td>
                    <td>
                        <asp:TextBox ID="tClave" runat="server" MaxLength="10" TextMode="Password" BackColor="#372C57" Height="35px" Width="160px" ForeColor="White" Font-Size="XX-Large" />
                    </td>
                    <td>
                        <asp:ImageButton ID="ImageButton1" ImageUrl="~/imagenes/entrar.png" runat="server" Width="137px" />
                    </td>
               </tr>               
            </table>

            <table style="width:100%;">
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:label ID="lOlvidasteClave" text="lErrorLogin" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Visible="False"/>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:imagebutton ID="bRecuperarClave" Width="570px" Height="68px" imageurl="~/imagenes/reenviarclave.png" runat="server" CssClass="auto-style1"/>
                    </td>
                    <td>
                        &nbsp;&nbsp;
                        <asp:label ID="lReenviarClave" text="[lReenviarClave]" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="blue" Visible="false"/>
                    </td>
                </tr>
            </table>

            <table style="width:100%;">
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:imagebutton ID="bVolverLogin" Width="259px" Height="68px" imageurl="~/imagenes/terminarvolver.png" runat="server"/>
                    </td>
                    <td>
                    </td>
               </tr>

            </table>

        </asp:Panel>
             <asp:Panel ID="pLoginMenu" runat="server" Height="392px" Font-Bold="True" ForeColor="Blue" Width="757px" Font-Size="Large" BorderStyle="Solid" Visible="false">
            <table style="width:100%;">
                <tr>
                    <td align="center">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/imagenes/registrate.png" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="bRegistrarse" runat="server" ImageUrl="~/imagenes/registrateaqui.png" Width="753px" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="bAlogin" runat="server" ImageUrl="~/imagenes/yaregistrado.png" Width="753px" />
                    </td>
                </tr>
                <tr>
                   <td align="center">
                        <asp:ImageButton ID="bRegistrarseVolverLoginU13" runat="server" ImageUrl="~/imagenes/terminarvolver.png" Width="281px" Height="82px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
            <asp:Panel ID="pRegistrarse" runat="server" BorderColor="#66CCFF" Height="780px" Visible="false" ForeColor="#372C57" style="margin-right: 0px" Font-Size="Large">
            <table style="width:100%;">
                <tr>
                    <td align="center" colspan="2">
                        <asp:Image ID="iRegistrate" runat="server" ImageUrl="~/imagenes/registrarsetitulo.png" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">Para poder registrarte debés ser mayor de 18 años, residir en Argentina y contar con documento válido en Argentina que acredite tu identidad.
                        <br />
                        Sólo se puede hacer un registro por documento. Los datos deben ser reales, correctos y vigentes.<br /> Todos los datos a continuación (menos Origen) son obligatorios:</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style13">Tu/s Nombre/s:</td>
                                <td class="auto-style16">
                                    <asp:TextBox ID="tNombreU" runat="server" BackColor="#666699" ForeColor="White" Height="25px" MaxLength="20" Width="256px"></asp:TextBox>
                                </td>
                                <td class="auto-style10">
                                    <asp:Label ID="lENombreU" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="ENombreU" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style12">Apellido/s:</td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="tApellidoU" runat="server" BackColor="#666699" ForeColor="White" Height="25px" MaxLength="20" Width="256px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lEApellidoU" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="EApellidoU" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style17">Tipo Doc.:</td>
                                <td class="auto-style18">
                                    <asp:DropDownList ID="dTDocU" runat="server" BackColor="#666699" Font-Size="Large" ForeColor="#E8E8E8" Height="89px" Width="262px">
                                        <asp:ListItem Value="DNI">Doc. Nacional de Identidad</asp:ListItem>
                                        <asp:ListItem Value="LC">Libreta Cívica</asp:ListItem>
                                        <asp:ListItem Value="LE">Libreta de Enrolamiento</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style19"></td>
                            </tr>
                            <tr>
                                <td class="auto-style12">N° de Doc. (sin puntos ni espacios):</td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="tDocU" runat="server" BackColor="#666699" ForeColor="White" Height="25px" MaxLength="8" Width="256px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lEDocU" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="IEDocU" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style12">Fecha Nac.: (ddmmaa)</td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="tF_Nac" runat="server" BackColor="#666699" ForeColor="White" Height="25px" MaxLength="8" Width="166px"></asp:TextBox>
                                    <asp:Label ID="lEdad" runat="server" Text="0"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lEFNac" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="IEFNac" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style12">Email válido para notificaciones:</td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="tEmailU" runat="server" BackColor="#666699" ForeColor="White" Height="48px" MaxLength="70" Rows="2" TextMode="MultiLine" Width="256px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lEEmailU" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="IEEmailU" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style12">Provincia:</td>
                                <td class="auto-style15">
                                    <asp:DropDownList ID="didProvU" runat="server" BackColor="#666699" Font-Size="Large" ForeColor="#E8E8E8" Height="89px" Width="262px">
                                        <asp:ListItem>Buenos Aires</asp:ListItem>
                                        <asp:ListItem>CABA</asp:ListItem>
                                        <asp:ListItem>Catamarca</asp:ListItem>
                                        <asp:ListItem>Chaco</asp:ListItem>
                                        <asp:ListItem>Chubut</asp:ListItem>
                                        <asp:ListItem>Córdoba</asp:ListItem>
                                        <asp:ListItem>Corrientes</asp:ListItem>
                                        <asp:ListItem>Entre Ríos</asp:ListItem>
                                        <asp:ListItem>Formosa</asp:ListItem>
                                        <asp:ListItem>Jujuy</asp:ListItem>
                                        <asp:ListItem>La Pampa</asp:ListItem>
                                        <asp:ListItem>La Rioja</asp:ListItem>
                                        <asp:ListItem>Mendoza</asp:ListItem>
                                        <asp:ListItem>Misiones</asp:ListItem>
                                        <asp:ListItem>Neuquén</asp:ListItem>
                                        <asp:ListItem>Río Negro</asp:ListItem>
                                        <asp:ListItem>Salta</asp:ListItem>
                                        <asp:ListItem>San Juan</asp:ListItem>
                                        <asp:ListItem>San Luis</asp:ListItem>
                                        <asp:ListItem>Santa Cruz</asp:ListItem>
                                        <asp:ListItem>Santa Fe</asp:ListItem>
                                        <asp:ListItem>Santiago del Estero</asp:ListItem>
                                        <asp:ListItem>Tierra del Fuego</asp:ListItem>
                                        <asp:ListItem>Tucumán</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style12">Localidad:</td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="tLocalidadU" runat="server" BackColor="#666699" ForeColor="White" Height="25px" MaxLength="20" Width="256px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lELocalidadU" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="IELocalidadU" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style12">Dirección:</td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="tDireccionU" runat="server" BackColor="#666699" ForeColor="White" Height="48px" MaxLength="100" Rows="2" TextMode="MultiLine" Width="256px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lEDireccionU" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="IEDireccionU" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style12">Teléfono (agregue característica):</td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="tTelefonosU" runat="server" BackColor="#666699" ForeColor="White" Height="25px" MaxLength="20" Width="256px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lETelefonosU" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="IETelefonosU" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style12">Usuario:</td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="tUsuarioU" runat="server" BackColor="#666699" ForeColor="White" Height="25px" MaxLength="20" Width="256px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lEUsuarioU" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="IEUsuarioU" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style12">Clave:</td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="tPassU" runat="server" BackColor="#666699" ForeColor="White" Height="25px" MaxLength="10" Width="256px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lEPassU" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="IEPassU" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style12">Repetir Clave:</td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="tPass2U" runat="server" BackColor="#666699" ForeColor="White" Height="25px" MaxLength="10" Width="256px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lEPass2U" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="IEPass2U"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style13">
                                    <asp:Label ID="lErroresU" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="lErroresU" Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="bRegistrarseU" runat="server" ImageUrl="~/imagenes/registrarse.png" Height="76px" Width="246px" />
                    </td>
                    <td align="center">
                        <asp:ImageButton ID="bRegistrarseU0" runat="server" ImageUrl="~/imagenes/cancelarvolver.png" Height="79px" Width="246px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
            <asp:Panel ID="pBienvenido" runat="server" BorderColor="#66CCFF" Height="535px" ForeColor="#372C57" Font-Size="Large" Visible="false">
            <table style="width:100%;">
                <tr>
                    <td align="center">
                        <asp:Label ID="lBienvenido" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Bienvenido/a!!"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Ya estás anotado en los cursos de ASP .Net!<br /> Nos alegra mucho que estés con nosotros.
                        <br />
                        &nbsp; -El Equipo de Robert.</td>
                </tr>
                <tr>
                    <td align="center">
                        
                        <asp:ImageButton ID="bRegistrarseVolverLoginU" runat="server" ImageUrl="~/imagenes/todook.png" Height="90px" Width="287px"/>
                        
                    </td>
                </tr>
            </table>

        </asp:Panel>

              <asp:Panel ID="pAreaUsuario"  runat="server" Height="450px" Width="765px" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="center">
                        <asp:Label ID="lBienvenidoAreaU" runat="server" Font-Bold="True" Font-Names="CityBlueprint" Font-Size="XX-Large" Text="Bienvenido/a !!"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="bAhoraQueHago" ImageUrl="~/imagenes/ahora_que_hago.png" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label106" runat="server" Text="Desde acá vas a poder hacer varias cosas relacionadas con tu cuenta en ASP.NET"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width:100%;">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="bHacerPedido" runat="server" ImageUrl="~/imagenes/hacerpedido.png" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="bVerHistorico" runat="server"  ImageUrl="~/imagenes/vertodosmov.png" />
                    </td>
                </tr>
            </table>
            <table class="auto-style8">
                <tr>
                    <td align="center" class="auto-style9">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="bModificarDatos" runat="server"  ImageUrl="~/imagenes/modificardatos.png" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="bVolverLoginU1" runat="server"  ImageUrl="~/imagenes/terminarvolver.png"/>
                    </td>
                </tr>
            </table>
            
        </asp:Panel>

             <asp:Panel ID="pAhoraQueHago"  runat="server" Height="150px" Width="765px" Visible="False">
             <table style="width:100%;">
                 <tr>
                     <td align="center">
                         <asp:Label ID="Label107" runat="server" Text="Te cuento un poco!"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td>&nbsp;</td>
                 </tr>
                 <tr>
                     <td align="center">
                         <asp:Label ID="Label108" runat="server" Text="Hola si estas interesado en nuestros cursos GRATUITOS de Transfromación y Marketing Digital te invito a que llenes el formulario"></asp:Label>
                     </td>
                 </tr>
             </table>
             <table style="width:100%;">
                 <tr>
                     <td align="center">
                         <asp:ImageButton ID="bVolverLoginU2" runat="server" ImageUrl="~/imagenes/terminarvolver.png"/>
                     </td>
                 </tr>
             </table>
             </asp:Panel>
            <asp:Panel ID="pCambiarDatosPersonales"  runat="server" Height="600px" Width="765px" Visible="False" ForeColor="#372C57" BackImageUrl="~/imagenes/datospersonales.jpg" Font-Bold="True">
            <table style="width:100%;">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label109" runat="server" Text="Cambiar tus datos personales"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style25">
                        <asp:Label ID="Label110" runat="server" Text="Email válido para notificaciones:"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        <asp:TextBox ID="tEmailU0" runat="server" BackColor="#372C57" Font-Size="X-Large" ForeColor="White" MaxLength="70" Rows="2" TextMode="MultiLine" Width="282px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lEEmailU0" runat="server" ForeColor="Red" Text="lEEmailU" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:Label ID="Label111" runat="server" Text="Provincia:"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        <asp:DropDownList ID="didProvU0" runat="server" BackColor="#372C57" Font-Size="X-Large" ForeColor="White" Height="30px" Width="287px">
                            <asp:ListItem Value="1">Buenos Aires</asp:ListItem>
                            <asp:ListItem Value="2">Catamarca</asp:ListItem>
                            <asp:ListItem Value="3">Chaco</asp:ListItem>
                            <asp:ListItem Value="4">Chubut</asp:ListItem>
                            <asp:ListItem Value="5">CABA</asp:ListItem>
                            <asp:ListItem Value="6">Córdoba</asp:ListItem>
                            <asp:ListItem Value="7">Corrientes</asp:ListItem>
                            <asp:ListItem Value="8">Entre Ríos</asp:ListItem>
                            <asp:ListItem Value="9">Formosa</asp:ListItem>
                            <asp:ListItem Value="10">Jujuy</asp:ListItem>
                            <asp:ListItem Value="11">La Pampa</asp:ListItem>
                            <asp:ListItem Value="12">La Rioja</asp:ListItem>
                            <asp:ListItem Value="13">Mendoza</asp:ListItem>
                            <asp:ListItem Value="14">Misiones</asp:ListItem>
                            <asp:ListItem Value="15">Neuquén</asp:ListItem>
                            <asp:ListItem Value="16">Río Negro</asp:ListItem>
                            <asp:ListItem Value="17">Salta</asp:ListItem>
                            <asp:ListItem Value="18">San Juan</asp:ListItem>
                            <asp:ListItem Value="19">San Luis</asp:ListItem>
                            <asp:ListItem Value="20">Santa Cruz</asp:ListItem>
                            <asp:ListItem Value="21">Santa Fe</asp:ListItem>
                            <asp:ListItem Value="22">Santiago del Estero</asp:ListItem>
                            <asp:ListItem Value="23">Tucumán</asp:ListItem>
                            <asp:ListItem Value="24">Tierra del Fuego</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:Label ID="Label112" runat="server" Text="Localidad:"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        <asp:TextBox ID="tLocalidadU0" runat="server" BackColor="#372C57" Font-Size="X-Large" ForeColor="White" MaxLength="25" Width="282px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lELocalidadU0" runat="server" ForeColor="Red" Text="lELocalidadU" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style20">
                        <asp:Label ID="Label113" runat="server" Text="Dirección:"></asp:Label>
                    </td>
                    <td class="auto-style21">
                        <asp:TextBox ID="tDireccionU0" runat="server" BackColor="#372C57" Font-Size="X-Large" ForeColor="White" MaxLength="100" Rows="2" TextMode="MultiLine" Width="282px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lEDireccionU0" runat="server" ForeColor="Red" Text="lEDireccionU" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style20">
                        <asp:Label ID="Label114" runat="server" Text="Teléfono (agregue característica):"></asp:Label>
                    </td>
                    <td class="auto-style21">
                        <asp:TextBox ID="tTelefonosU0" runat="server" BackColor="#372C57" Font-Size="X-Large" ForeColor="White" MaxLength="25" Width="282px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lETelefonosU0" runat="server" ForeColor="Red" Text="lETelefonosU" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style20">
                        <asp:Label ID="Label115" runat="server" Text="Usuario:"></asp:Label>
                    </td>
                    <td class="auto-style21">
                        <asp:TextBox ID="tUsuarioU0" runat="server" BackColor="#372C57" Font-Size="X-Large" ForeColor="White" MaxLength="10" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lEUsuarioU0" runat="server" ForeColor="Red" Text="lEUsuarioU" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style24">
                        <asp:Label ID="Label116" runat="server" Text="Clave:"></asp:Label>
                    </td>
                    <td class="auto-style19">
                        <asp:TextBox ID="tPassU0" runat="server" BackColor="#372C57" CssClass="auto-style14" Font-Size="X-Large" ForeColor="White" MaxLength="10" TextMode="Password" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lEPassU0" runat="server" ForeColor="Red" Text="lEPassU" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>

            <table style="width:100%;">
                <tr>
                    <td align="center">
                        <asp:Label ID="lErroresU0" runat="server" ForeColor="Red" Text="lErroresU" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="auto-style22">
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="bCambiar" runat="server" ImageUrl="~/imagenes/cambiarlosdatos.png" />
                    </td>
                    <td align="center">
                        <asp:ImageButton ID="bVolverU4" runat="server" ImageUrl="~/imagenes/cancelarvolver.png" />
                    </td>
                </tr>
            </table>

            </asp:Panel>

              <asp:Panel ID="pDatosModi"  runat="server" Height="300px" Width="765px" Visible="False" ForeColor="#372C57" BackImageUrl="~/imagenes/datospersonales.jpg" Font-Bold="True">
            <table style="width:100%;">
                <tr>
                    <td align="center">
                        <asp:Label ID="Label117" runat="server" Text="Tus datos han cambiado correctamente!"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="bVolverAreaUsuario" runat="server" ImageUrl="~/imagenes/volveratuarea.png" />
                    </td>
                </tr>
            </table>
            
        </asp:Panel>
        
        </asp:Panel>



       
        

        
    </form>
</body>
</html>
