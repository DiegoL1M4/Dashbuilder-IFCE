<%--

    Copyright (C) 2012 Red Hat, Inc. and/or its affiliates.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

          http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

--%>

<%@ page import="java.util.ResourceBundle" %>
<%@ page import="org.jboss.dashboard.LocaleManager" %>
<%@ page import="org.jboss.dashboard.ui.controller.requestChain.SessionInitializer" %>
<%@ page import="java.util.Locale" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Central de Estagios</title>
    <meta charset="utf-8" />
    <style type="text/css">
        * {
            font-family: Helvetica, Arial, sans-serif;
        }

        body {
            margin: 0;
            pading: 0;
            color: #fff;
            background: repeat #00621E;
            font-size: 14px;
            text-shadow: #050505 0 -1px 0;

        }

        li {
            list-style: none;
        }

        #dummy {
            position: absolute;
            top: 0;
            left: 0;
            border-bottom: solid 3px #777973;
            height: 450px;
            width: 100%;
            background: #FFFFFF;
            z-index: 1;
        }

        #dummy2 {
            position: absolute;
            top: 0;
            left: 0;
            border-bottom: solid 2px #545551;
            height: 452px;
            width: 100%;
            background: transparent;
            z-index: 1;
        }

        #login-wrapper {
            margin: 125px 0 0 150px;
            width: 320px;
            text-align: left;
            z-index: 2;
            position: absolute;
            top: 0;
            right: 10%;
        }

        #login-top {
            height: 120px;
            width: 201px;
            padding-top: 20px;
            text-align: center;
        }

        #login-content {
            margin-top: 120px;
        }

        #barra{
            background: #00621E;
            position: absolute;
            top:0;
            left: 0;
            z-index: 3;
            width: 100%;
            height: 130px;
            border-bottom: ridge 2px #777973;
        }

        #logo{
            position: absolute;
            left: 3px;
            top: 15px;
            z-index: 3;
        }

        #imagem{
            position: absolute;
            left: 20px;
            top: 167px;
            z-index: 3;
        }

        input.text-input {
            width: 130px;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
            background: #fff;
            border: solid 1px transparent;
            color: #555;
            padding: 4px 8px;
            font-size: 15px;
            margin: 5px;
        }

        input.text-oculto {
            width: 0;
            height: 0;
            border:1px solid #FFF;
            background: #FFF;
            font-size: 0;
        }

        input.button {
            padding: 20px;
            color: #fff;
            font-size: 20px;
            font-weight: bold;
            background: #00621E; /* Non CSS3 browsers. */
            background: linear-gradient(top, #00621E 0%,#069D06 100%); /* W3C */
            background: -webkit-gradient(linear, left top, left bottom, from(#00621E), to(#069D06)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top, #00621E 0%,#069D06 100%); /* Chrome10+,Safari5.1+ */
            background: -moz-linear-gradient(top,  #00621E,  #069D06); /* FF */
            background: -o-linear-gradient(top, #00621E 0%,#069D06 100%); /* Opera11.10+ */
            filter: progid:DXImageTransform.Microsoft.Gradient(endColorstr='#00621E', startColorstr='#069D06', gradientType='0'); /* IE6-9 */
            background: -ms-linear-gradient(top, #00621E 0%,#069D06 100%); /* IE10+ */
            text-shadow: #050505 1px 1px 0;
            background-color: #00621E;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
            border: solid 1px transparent;
            cursor: pointer;
            letter-spacing: 1px;
        }

        input.button:hover {
            background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#a4d04a), to(#a4d04a), color-stop(80%, #76b226));
            text-shadow: #050505 0 -1px 2px;
            background-color: #E22434;
            color: #fff;
        }

        div.error {
            padding: 8px;
            background: rgba(52, 4, 0, 0.4);
            -moz-border-radius: 8px;
            -webkit-border-radius: 8px;
            border-radius: 8px;
            border: solid 1px transparent;
            margin: 6px 0;
        }

        
    </style>
</head>

<body id="login">

    <div id="barra">
        <div style="float: right; margin-right: 50px; margin-top: 30px;">
            <form action="j_security_check" method="POST">
                <p>
                    <input name="j_username" class="text-input" type="text"  placeholder="Login" />
                
                    <input name="j_password" class="text-input" type="password" placeholder="Senha" />

                    <input style="font-size: 14px; font-weight: bold; margin-left: 8px;" type="submit" value="Login"/>
                </p>
            </form>
        </div>
    </div>

    <div id="logo">
        <img src="https://1.bp.blogspot.com/-owXCcb_zyvU/WcPC6bS8l-I/AAAAAAAAAoA/qIRDtKoQCFI8MLWd3gicG2z9x3emJTM9wCLcBGAs/s1600/General_Logo.png" />
    </div>

    <div id="imagem">
        <img style="width: 510px;" src="http://www.educatu.com.br/images/imagens/atemporais/estagio.png" />
    </div>

    <div id="login-wrapper" class="png_bg">
        <div id="login-content">
            <%
                LocaleManager localeManager = LocaleManager.lookup();
                Locale currentLocale =  localeManager.getCurrentLocale();
                SessionInitializer.PreferredLocale preferredLocale =  SessionInitializer.getPreferredLocale(request);
                if (preferredLocale != null) currentLocale = preferredLocale.asLocale();
                ResourceBundle i18nBundle = LocaleManager.lookup().getBundle("org.jboss.dashboard.login.messages", currentLocale);

                String messageKey = (String) request.getSession().getAttribute("login.message");
                if (messageKey == null) messageKey = "login.hint";
            %>

            <form action="j_security_check" method="POST">
                <p>
                    <center>
                        <input class="button" type="submit" value="Acessar Central de Estagios"/></center></br>

                        <input value="usuario" name="j_password" class="text-oculto"/>

                        <input value="usuario" name="j_username" class="text-oculto"/>
                    </center>
                </p>
            </form>
        </div>
    </div>

    <div id="dummy"></div>
    <div id="dummy2"></div>

</body>
</html>