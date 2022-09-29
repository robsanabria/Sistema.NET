Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Net.Mail

Public Class _Default
    Inherits System.Web.UI.Page

    Public x As Integer
    Public connectionstring As String = ConfigurationManager.ConnectionStrings(ConfigurationManager.AppSettings("Conexion")).ToString()
    Public EmailActivo As String = ConfigurationManager.AppSettings("EmailActivo")
    Public Email As String = ConfigurationManager.AppSettings(EmailActivo)
    Public EmailPass As String = ConfigurationManager.AppSettings(EmailActivo & "Pass")

    Dim con As New SqlConnection(connectionstring)
    Dim ar As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub bPortada_Click(sender As Object, e As ImageClickEventArgs)
        pPortada.Visible = False
        pLoginMenu.Visible = True
    End Sub

    Protected Sub bPortada_Click1(sender As Object, e As ImageClickEventArgs) Handles bPortada.Click
        bPortada.Visible = False
        pLogin.Visible = True
        pLoginMenu.Visible = True
    End Sub

    Protected Sub bVolverLogin_Click(sender As Object, e As ImageClickEventArgs) Handles bVolverLogin.Click
        bPortada.Visible = True
        pLogin.Visible = False
        pLoginMenu.Visible = False
    End Sub

    Protected Sub bRegistrarse_Click(sender As Object, e As ImageClickEventArgs) Handles bRegistrarse.Click
        pLoginMenu.Visible = False
        pLogin.Visible = False
        pRegistrarse.Visible = True
    End Sub

    Protected Sub bRegistrarseVolverLoginU_Click(sender As Object, e As ImageClickEventArgs) Handles bRegistrarseVolverLoginU.Click
        pBienvenido.Visible = False
        pLogin.Visible = True
    End Sub

    Protected Sub bRegistrarseU0_Click(sender As Object, e As ImageClickEventArgs) Handles bRegistrarseU0.Click
        pLoginMenu.Visible = True
        pRegistrarse.Visible = False
    End Sub

    Protected Sub bRegistrarseVolverLoginU13_Click(sender As Object, e As ImageClickEventArgs) Handles bRegistrarseVolverLoginU13.Click
        bPortada.Visible = True
        pLogin.Visible = False
        pLoginMenu.Visible = False
    End Sub

    Protected Sub bAlogin_Click(sender As Object, e As ImageClickEventArgs) Handles bAlogin.Click
        pLoginMenu.Visible = False
        pLogin.Visible = True
    End Sub
    Sub ArreglarCampo(ByRef campo As TextBox)
        campo.Text = campo.Text.Trim.Replace("'", "").Replace("""",
       "").Replace("*", "").Replace("+", "").Replace("-", "").Replace("/",
       "").Replace(":", "").Replace("`", "").Replace("<", "").Replace(">",
       "").Replace("=", "").Replace("&", "")
    End Sub

    Function comprobar(ByRef user As String) As Boolean
        If user Is System.DBNull.Value Then
            Return False
        Else
            Dim aux As Boolean = True
            Dim listaNegra, x As String
            listaNegra = "'*+-/:;`><&" & """"
            If user <> "" Then
                For Each x In user
                    If aux = True Then
                        If InStr(1, listaNegra, x) > 0 Then
                            aux = False
                        Else
                            aux = True
                        End If
                    Else
                        Return False
                    End If
                Next
                If aux = True Then
                    Return True
                End If
            Else
                Return False
            End If
        End If
    End Function

    Sub LimpiarErroresRegistroU()
        lErroresU.Text = ""
        lErroresU.Visible = False
        lEFNac.Text = ""
        lENombreU.Text = ""
        lEApellidoU.Text = ""
        lEDocU.Text = ""
        lEEmailU.Text = ""
        lELocalidadU.Text = ""
        lEDireccionU.Text = ""
        lETelefonosU.Text = ""
        lEUsuarioU.Text = ""
        lEPassU.Text = ""
        lEPass2U.Text = ""
        lENombreU.Visible = False
        lEApellidoU.Visible = False
        lEDocU.Visible = False
        lEEmailU.Visible = False
        lELocalidadU.Visible = False
        lEDireccionU.Visible = False
        lETelefonosU.Visible = False
        lEUsuarioU.Visible = False
        lEPassU.Visible = False
        lEPass2U.Visible = False

    End Sub

    Sub LimpiarRegistroU()
        LimpiarErroresRegistroU()
        pRegistrarse.Visible = False
        tNombreU.Text = ""
        tApellidoU.Text = ""
        dTDocU.SelectedIndex = 0
        tDocU.Text = ""
        tEmailU.Text = ""
        didProvU.SelectedIndex = 0
        tLocalidadU.Text = ""
        tDireccionU.Text = ""
        tTelefonosU.Text = ""
        tUsuarioU.Text = ""
        tPassU.Text = ""
        tPass2U.Text = ""
    End Sub

    Public Function ValidateEmail(ByVal email As String) As Boolean
        Dim emailRegex As New System.Text.RegularExpressions.Regex("^(?<user>[^@]+)@(?<host>.+)$")
        Dim emailMatch As System.Text.RegularExpressions.Match = emailRegex.Match(email)
        Return emailMatch.Success
    End Function


    Sub SoloNumeros(ByRef campo As TextBox)
        Dim cam As String = campo.Text.Trim, salida As String = "", c As String
        For Each c In cam
            If IsNumeric(c) Then salida &= c
        Next
        campo.Text = salida
    End Sub

    Protected Sub bRegistrarseU_Click(sender As Object, e As ImageClickEventArgs) Handles bRegistrarseU.Click
        Dim ok As Boolean = True

        LimpiarErroresRegistroU()

        tNombreU.Text = tNombreU.Text.Trim.ToUpper
        If comprobar(tNombreU.Text) = False Then
            ArreglarCampo(tNombreU)
            ok = False
            lENombreU.Text = "El nombre contenía caracteres inválidos, fueron quitados."
            lENombreU.Visible = True
        End If

        tApellidoU.Text = tApellidoU.Text.Trim.ToUpper
        If comprobar(tApellidoU.Text) = False Then
            ArreglarCampo(tApellidoU)
            ok = False
            lEApellidoU.Text = "El apellido contenía caracteres inválidos, fueron quitados."
            lEApellidoU.Visible = True
        End If

        tDocU.Text = tDocU.Text.Trim
        If comprobar(tDocU.Text) = False Or Not IsNumeric(tDocU.Text) Then
            SoloNumeros(tDocU)
            ok = False
            lENombreU.Text = "El documento no era válido, se ajusto a número."
            lENombreU.Visible = True
        End If

        ArreglarCampo(tEmailU)
        If ValidateEmail(tEmailU.Text) = False Then
            ok = False
            lEEmailU.Text = "El email no es válido."
            lEEmailU.Visible = True
        End If

        tLocalidadU.Text = tLocalidadU.Text.Trim.ToUpper
        If comprobar(tLocalidadU.Text) = False Then
            ArreglarCampo(tLocalidadU)
            ok = False
            lELocalidadU.Text = "La localidad contenía caracteres inválidos, fueron quitados."
            lELocalidadU.Visible = True
        End If

        tDireccionU.Text = tDireccionU.Text.Trim.ToUpper
        If comprobar(tDireccionU.Text) = False Then
            ArreglarCampo(tDireccionU)
            ok = False
            lEDireccionU.Text = "La dirección contenía caracteres inválidos, fueron quitados."
            lEDireccionU.Visible = True
        End If

        tTelefonosU.Text = tTelefonosU.Text.Trim.ToUpper
        If comprobar(tTelefonosU.Text) = False Then
            ArreglarCampo(tTelefonosU)
            ok = False
            lETelefonosU.Text = "El télefono contenía caracteres inválidos, fueron quitados."
            lETelefonosU.Visible = True
        End If

        Dim FechaNacimiento As Date
        ControlDeNacimiento(tF_Nac, ok, lEFNac, lEdad, True, FechaNacimiento)

        tUsuarioU.Text = tUsuarioU.Text.Trim.ToUpper
        If comprobar(tUsuarioU.Text) = False Or tUsuarioU.Text.IndexOf(" ") > -1 Then
            tUsuarioU.Text = tUsuarioU.Text.Replace(" ", "")
            ArreglarCampo(tUsuarioU)
            ok = False
            lEUsuarioU.Text = "El usuario contenía caracteres inválidos, fueron quitados."
            lEUsuarioU.Visible = True
        End If
        If tUsuarioU.Text.Length < 5 Then
            ok = False
            lEUsuarioU.Text = "El usuario debe contener de 5 a 10 caracteres, letras y/o números."
            lEUsuarioU.Visible = True
        End If

        tPassU.Text = tPassU.Text.Trim
        If comprobar(tPassU.Text) = False Or tPassU.Text.IndexOf(" ") > -1 Then
            tPassU.Text = tPassU.Text.Replace(" ", "")
            ArreglarCampo(tPassU)
            ok = False
            lEPassU.Text = "La clave contenía caracteres inválidos. Itente con letras y números"
            lEPassU.Visible = True
        End If
        If tPassU.Text.Length < 5 Then
            ok = False
            lEPassU.Text = "La clave debe contener de 5 a 10 caracteres, letras y/o números."
            lEPassU.Visible = True
        End If

        tPass2U.Text = tPass2U.Text.Trim
        If comprobar(tPass2U.Text) = False Or tPass2U.Text.IndexOf(" ") > -1 Then
            tPass2U.Text = tPass2U.Text.Replace(" ", "")
            ArreglarCampo(tPass2U)
            ok = False
            lEPass2U.Text = "La segunda clave contenía caracteres inválidos. Intente con letras y números"
            lEPass2U.Visible = True
        End If

        If ok = False Then
            lErroresU.Text = "Revise los datosingresados e intente nuevamente."
            lErroresU.Visible = True
            Exit Sub
        End If

        If tPassU.Text <> tPass2U.Text Then
            ok = False
            lEPass2U.Text = "Las claves no coinciden. Revise los datos ingresados."
            lEPass2U.Visible = True
        End If
        ''Seguimos desde aca
        Session("Usuario") = tUsuarioU.Text
        Session("Password") = tPassU.Text
        Session("TipoDocumento") = dTDocU.SelectedValue.Trim
        Session("Documento") = tDocU.Text.Trim
        If YaExisteSQL("select idusuario from usuarios where usuario='" & Session("Usuario") & "'") Then
            ok = False
            lEUsuarioU.Text = "El usuario elegido ya existe. Pruebe con otro."
            lEUsuarioU.Visible = True
        End If
        If YaExisteSQL("select idusuario from usuarios where doc='" & Session("Documento") & "' and tdoc='" & Session("TipoDocumento") & "'") Then
            ok = False
            lEDocU.Text = "Ya existew el " & Session("TipoDocumento") & " " & Session("Documento") & "."
            lEDocU.Visible = True
        End If
        If ok = False Then
            lErroresU.Text = "Solo se permite una inscripción por persona."
            lErroresU.Visible = True
            Exit Sub
        End If
        Session("Usuario") = tUsuarioU.Text.ToLower
        Session("Password") = tPassU.Text
        Session("TipoDocumento") = dTDocU.SelectedValue.Trim
        Session("Documento") = tDocU.Text.Trim
        Session("ApellidoYNombre") = tNombreU.Text.Trim & " " & tApellidoU.Text.Trim
        Session("Email") = tEmailU.Text.Trim
        LimpiarErroresRegistroU()
        If SQL_Accion("insert into Usuarios (Apellido,Nombre,tDoc,Doc,Usuario,Pass,Email,idProv,Localidad,Direccion,Telefonos,fNacimiento) values('" & tApellidoU.Text.Trim & "','" & tNombreU.Text.Trim & "','" & Session("TipoDocumento") & "','" & Session("Documento") & "','" & Session("Usuario") & "','" & Session("Password") & "','" & Session("Email") & "','" & didProvU.SelectedValue & "','" & tLocalidadU.Text.Trim & "','" & tDireccionU.Text.Trim & "','" & tTelefonosU.Text.Trim & "','" & FechaNacimiento.ToString("yyyy-MM-dd") & "')") = False Then
            lErroresU.Text = " Se ha producido un error al querer guardar tus datos..."
            lErroresU.Visible = True
            Exit Sub
        End If
        Session("idUsuario") = VNum(LeeUnCampo("select top 1 idUsuario from usuarios where Usuario='" & Session("Usuario") & "' and Pass='" & Session("Password") & "' ", "idUsuario"))
        lBienvenido.Text = "Bienvenido " & Session("ApellidoYNombre") & "!"

        Dim mensaje As String, xusuario As String = Session("ApellidoYNombre"),
            en As String = Chr(13) & Chr(10)
        mensaje = "Bienvenido " & xusuario & " a los cursos de ASP .NET!." & en & en &
            "Te damos una cordial bienvenida a la comunidad de ASP .Net!." & en & en &
            "Tu usuario es " & """" & Session("Usuario") & """" & en & en &
            "Tu clave es " & """" & Session("Password") & """" & en & en &
            "Ya podes loguearte para ver tus datos!!." & en & en
        LimpiarErroresRegistroU()
        bRegistrarseVolverLoginU13.Focus()
    End Sub


    Function VNum(ByVal NTexto As String) As Decimal
        Return CDec(Val(NTexto.Trim.Replace(",", ".")))
    End Function
    Function NumSQL(ByVal numero As String) As String
        Return CStr(VNum(numero)).Trim.Replace(",", ".")
    End Function
    Function RellenaNum(ByVal numero As Integer, ByVal cantidad As Integer) As String
        Dim snum As String = CStr(numero).Trim
        Return "00000000000000000000".Substring(0, cantidad - snum.Length) & snum
    End Function
    Function FechaSQL(ByVal fecha As Date) As String
        Return "'" & RellenaNum(Year(fecha), 4) & RellenaNum(Month(fecha), 2) & RellenaNum(fecha.Day, 2) & "'"
    End Function
    Public Function AñoMes(ByVal fecha As Date) As String
        Return RellenaNum(Year(fecha), 4) & "-" & RellenaNum(Month(fecha), 2)
    End Function
    Public Function Vstr(ByVal cosa As Object) As String
        If IsDBNull(cosa) Then Return "" Else Return CStr(cosa)
    End Function
    Function CalcularEdad(ByVal FechaNac As Date) As Integer
        Dim edad As Integer = DateTime.Today.AddTicks(-FechaNac.Ticks).Year - 1
        Return edad
    End Function
    Sub ControlDeNacimiento(ByRef xtF_nac As TextBox, ByRef ok As Boolean, ByRef xlEFNac As Label, ByRef xlEdad As Label, ByVal Valida18 As Boolean, ByRef FechaNacimiento As Date)
        ArreglarCampo(xtF_nac)
        xlEFNac.Visible = False
        If xtF_nac.Text.Length < 6 Then
            ok = False
            xlEFNac.Text &= "El campo fecha de nacimiento debe tener 6 números"
            xlEdad.Text = "0"
            xlEFNac.Visible = True
        Else
            Dim FechaX As String = xtF_nac.Text
            Dim Añox As Integer = VNum(FechaX.Substring(4, 2))
            If Añox + 2000 > Date.Today.Year Then Añox += 1900 Else Añox += 2000
            FechaX = Añox.ToString.Trim & "-" & FechaX.Substring(2, 2) & "-" & FechaX.Substring(0, 2)
            If Not IsDate(FechaX) Then
                ok = False
                xlEFNac.Text &= "El campo fecha de nacimiento, es una fecha inválida."
                xlEdad.Text = "0"
                xlEFNac.Visible = True
            Else
                Dim dFechax As Date
                dFechax = CDate(FechaX)
                FechaNacimiento = dFechax
                If dFechax > Date.Today Then
                    ok = False
                    xlEFNac.Text &= "Nació en el futuro...."
                    xlEdad.Text = "0"
                    xlEFNac.Visible = True
                Else
                    Dim Edad As Integer = CalcularEdad(dFechax)
                    xlEdad.Text = Edad
                    If Edad < 18 And Valida18 Then
                        ok = False
                        xlEFNac.Text &= "Debe ser mayor de edad (18 años)."
                        xlEdad.Text = "@"
                        xlEFNac.Visible = True
                    End If
                End If
            End If
        End If
    End Sub

    ''nombre del server SQL server PC\SQLEXPRESS 
    Public Function SQL_Accion(ByVal Sql_de_accion As String) As Boolean
        Dim adapter As New SqlDataAdapter, salida As Boolean = True
        Try
            If con.State = ConnectionState.Closed Then con.Open()
            If Sql_de_accion.ToUpper.IndexOf("INSERT") Then
                adapter.InsertCommand = New SqlCommand(Sql_de_accion, con)
                adapter.InsertCommand.ExecuteNonQuery()
            Else
                If Sql_de_accion.ToUpper.IndexOf("UPDATE") Then
                    adapter.UpdateCommand = New SqlCommand(Sql_de_accion, con)
                    adapter.UpdateCommand.ExecuteNonQuery()
                Else
                    If Sql_de_accion.ToUpper.IndexOf("DELETE") Then
                        adapter.DeleteCommand = New SqlCommand(Sql_de_accion, con)
                        adapter.DeleteCommand.ExecuteNonQuery()
                    Else
                        salida = False
                    End If
                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        Return salida
    End Function
    Function LeeUnCampo(ByVal sql As String, ByVal campo As String) As Object
        Dim da1 As New SqlDataAdapter(sql, con)
        Dim ds1 As New DataSet
        Try
            If con.State = ConnectionState.Closed Then con.Open()
            da1.Fill(ds1, "datos")
            If ds1.Tables("datos").Rows.Count < 1 Then
                Return "**NADA**"
            Else
                Return ds1.Tables("datos").Rows(0)(campo)
            End If
        Catch ex As Exception
            Return "**ERRRO**"
        End Try
    End Function
    Public Function YaExisteSQL(ByVal sql As String) As Boolean
        Dim con As New SqlConnection(connectionstring)
        Dim da1 As New SqlDataAdapter(sql, con)
        Dim ds1 As New DataSet
        da1.Fill(ds1, "afidesc")
        If ds1.Tables("afidesc").Rows.Count < 1 Then
            Return False
        Else
            Return True
        End If
    End Function

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        Session("QueEs") = "Usuarios"
        Loguea()
    End Sub
    Sub Loguea()
        Dim usu As String = tUsuario.Text.Trim.ToUpper, pass As String = tClave.Text.Trim
        If comprobar(tUsuario.Text.Trim) = False Or comprobar(tClave.Text.Trim) = False Then
            lOlvidasteClave.Text = "El usuario o la clave son incorrectos. Revise por favor."
            lOlvidasteClave.Visible = True
            Exit Sub
        End If
        Dim da1 As New SqlDataAdapter("select * from " & Session("QueEs") &
                                      " where upper (ltrim(rtrim(usuario)))='" & usu & "' and ltrim(rtrim(pass))='" & pass & "'", con)
        Dim ds1 As New DataSet
        da1.Fill(ds1, "Login")
        If ds1.Tables("Login").Rows.Count = 0 Then
            lOlvidasteClave.Text = "El usuario o la clave son incorrectos. Revise por favor."
            lOlvidasteClave.Visible = True
            Exit Sub
        End If
        Select Case Session("QueEs")
            Case "Usuarios"
                Session("idUsuario") = ds1.Tables("Login").Rows(0)("idUsuario")
                Session("Usuario") = usu
                Session("Password") = pass
                Session("TipoDocumento") = ds1.Tables("Login").Rows(0)("tDoc")
                Session("Documento") = ds1.Tables("Login").Rows(0)("Doc").ToString.Trim
                Session("ApellidoYNombre") = ds1.Tables("Login").Rows(0)("Nombre").ToString.Trim & " " & ds1.Tables("Login").Rows(0)("Apellido").ToString.Trim
                Session("Email") = ds1.Tables("Login").Rows(0)("Email").ToString.Trim
                Session("idprov") = ds1.Tables("Login").Rows(0)("idprov").ToString.Trim
                Session("Localidad") = ds1.Tables("Login").Rows(0)("Localidad").ToString.Trim
                Session("Direccion") = ds1.Tables("Login").Rows(0)("Direccion").ToString.Trim
                Session("Telefonos") = ds1.Tables("Login").Rows(0)("Telefonos").ToString.Trim
                lBienvenidoAreaU.Text = "Bienvenido " & Session("ApellidoYNombre") & ", a tu Área de Usuario."
                LimpiarRegistroU()
                pLogin.Visible = False
                pAreaUsuario.Visible = True
        End Select
    End Sub

    Protected Sub bAhoraQueHago_Click(sender As Object, e As ImageClickEventArgs) Handles bAhoraQueHago.Click
        pAreaUsuario.Visible = False
        pAhoraQueHago.Visible = True
    End Sub
    Sub LimpiarLogin()
        lOlvidasteClave.Text = ""
        lOlvidasteClave.Visible = False
        tUsuario.Text = ""
        tClave.Text = ""
        pRegistrarse.Visible = False
    End Sub

    Protected Sub bVolverLoginU1_Click(sender As Object, e As ImageClickEventArgs) Handles bVolverLoginU1.Click
        LimpiarLogin()
        LimpiarRegistroU()
        lReenviarClave.Text = ""
        pLogin.Visible = True
        pAreaUsuario.Visible = False
        tUsuario.Text = Session("Usuario")
        tClave.Text = Session("Password")
    End Sub

    Protected Sub bVolverLoginU2_Click(sender As Object, e As ImageClickEventArgs) Handles bVolverLoginU2.Click
        pAhoraQueHago.Visible = False
        pAreaUsuario.Visible = True
    End Sub

    Protected Sub bModificarDatos_Click(sender As Object, e As ImageClickEventArgs) Handles bModificarDatos.Click
        pAreaUsuario.Visible = False
        pCambiarDatosPersonales.Visible = True
    End Sub

    Protected Sub bCambiar_Click(sender As Object, e As ImageClickEventArgs) Handles bCambiar.Click
        Dim ok As Boolean = True

        LimpiarErroresRegistroU()

        ArreglarCampo(tEmailU0)
        If ValidateEmail(tEmailU0.Text) = False Then
            ok = False
            lEEmailU0.Text = "El email no es válido."
            lEEmailU0.Visible = True
        End If

        tLocalidadU0.Text = tLocalidadU0.Text.Trim.ToUpper
        If comprobar(tLocalidadU0.Text) = False Then
            ArreglarCampo(tLocalidadU0)
            ok = False
            lELocalidadU0.Text = "La localidad contenía caracteres inválidos, fueron quitados."
            lELocalidadU0.Visible = True
        End If

        tDireccionU0.Text = tDireccionU0.Text.Trim.ToUpper
        If comprobar(tDireccionU0.Text) = False Then
            ArreglarCampo(tDireccionU0)
            ok = False
            lEDireccionU0.Text = "La dirección contenía caracteres inválidos, fueron quitados."
            lEDireccionU0.Visible = True
        End If

        tTelefonosU0.Text = tTelefonosU0.Text.Trim.ToUpper
        If comprobar(tTelefonosU0.Text) = False Then
            ArreglarCampo(tTelefonosU0)
            ok = False
            lETelefonosU0.Text = "El télefono contenía caracteres inválidos, fueron quitados."
            lETelefonosU0.Visible = True
        End If

        tUsuarioU0.Text = tUsuarioU0.Text.Trim.ToUpper
        If comprobar(tUsuarioU0.Text) = False Or tUsuarioU0.Text.IndexOf(" ") > -1 Then
            tUsuarioU0.Text = tUsuarioU0.Text.Replace(" ", "")
            ArreglarCampo(tUsuarioU0)
            ok = False
            lEUsuarioU0.Text = "El usuario contenía caracteres inválidos, fueron quitados."
            lEUsuarioU0.Visible = True
        End If
        If tUsuarioU0.Text.Length < 5 Then
            ok = False
            lEUsuarioU0.Text = "El usuario debe contener de 5 a 10 caracteres, letras y/o números."
            lEUsuarioU0.Visible = True
        End If

        tPassU.Text = tPassU0.Text.Trim
        If comprobar(tPassU0.Text) = False Or tPassU0.Text.IndexOf(" ") > -1 Then
            tPassU0.Text = tPassU.Text.Replace(" ", "")
            ArreglarCampo(tPassU0)
            ok = False
            lEPassU0.Text = "La clave contenía caracteres inválidos. Itente con letras y números"
            lEPassU0.Visible = True
        End If
        If tPassU0.Text.Length < 5 Then
            ok = False
            lEPassU0.Text = "La clave debe contener de 5 a 10 caracteres, letras y/o números."
            lEPassU0.Visible = True
        End If

        If ok = False Then
            lErroresU0.Text = "Revise los errores e intente nuevamente."
            lErroresU0.Visible = True
            Exit Sub
        End If


        Session("Usuario") = tUsuarioU0.Text.ToLower
        Session("Password") = tPassU0.Text
        Session("Email") = tEmailU0.Text.Trim
        LimpiarErroresRegistroU()
        If SQL_Accion("update Usuarios set Email='" & Session("Email") & "', idProv ='" & didProvU.SelectedValue & "', Localidad = '" & tLocalidadU0.Text.Trim & "', Direccion = '" & tDireccionU0.Text.Trim & "', Telefonos = '" & tTelefonosU0.Text.Trim & "', Usuario='" & Session("Usuario") & "', Pass='" & Session("Password") & "' where Doc = '" & Session("Documento") & "'") Then
            lErroresU0.Text = " Se ha producido un error al querer guardar tus datos..."
            lErroresU0.Visible = True
        End If
        LimpiarRegistroU()
        pCambiarDatosPersonales.Visible = False
        pDatosModi.Visible = True
    End Sub

    Protected Sub bVolverU4_Click(sender As Object, e As ImageClickEventArgs) Handles bVolverU4.Click
        pCambiarDatosPersonales.Visible = False
        pAreaUsuario.Visible = True
    End Sub

    Protected Sub bVolverAreaUsuario_Click(sender As Object, e As ImageClickEventArgs) Handles bVolverAreaUsuario.Click
        pDatosModi.Visible = False
        pAreaUsuario.Visible = True
    End Sub
End Class