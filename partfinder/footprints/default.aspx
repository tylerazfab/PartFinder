﻿<%@ Page Title="Footprints" Language="C#" MasterPageFile="~/MasterPage.master" %>


<script runat="server">
    public string CheckImage(string inval)
    {
        if (inval.Trim().Length > 0)
        {
            return "<img src=\"" + inval + "\" class=\"img-fluid\" style=\"height: 50px;\" />";
        }
        else
        {
            return "";
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
   <li class="breadcrumb-item active" aria-current="page">Footprints</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <div class="row mb-3">
    <div class="col-12 ">
    <div class="card mb-4">
              <div class="card-header d-flex flex-row align-items-center justify-content-between">
                  <h4 class="card-title">Footprints</h4>
                    <div>
                    <a href="/admin/footprints/add.aspx" class="ml-auto" title="Add new"><i class="fas fa-plus"></i></a>
                        </div>
                </div>
                <div class="card-body">
                    <!-- start content -->
                    <div class="table-responsive">
                    <table class="table border-bottom tablelinks">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <LayoutTemplate>
            <tr>
<th><asp:LinkButton runat="server" ID="PCName" CommandName="Sort"
                     CommandArgument="FootprintName">Name</asp:LinkButton></th>
                <th><asp:LinkButton runat="server" ID="SortByPrice" CommandName="Sort"
                     CommandArgument="FCName">Category</asp:LinkButton></th>
                 <th><asp:LinkButton runat="server" ID="LinkButton1" CommandName="Sort"
                     CommandArgument="FootprintImage">Image</asp:LinkButton></th>
                <th class="text-right"></th>
            </tr>
         <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
   </LayoutTemplate>
        <ItemTemplate>
           <tr>
                <td><%#Eval("FootprintName") %></td>
                <td><%#Eval("FCName") %></td>
               <td><%# CheckImage(Eval("FootprintImage").ToString()) %></td>
               
               <td class="text-right"><a href="/parts/listbyfootprint.aspx?id=<%#Eval("FootprintPkey") %>" ><i class="fa fa-list text-primary fa-1x "></i> View Parts</a></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    </table>
    </div>
    <div class="row">
        <div class="col-12 text-center">
    <asp:DataPager ID="it" runat="server" PagedControlID="ListView1" PageSize="15" class="btn-group btn-group-sm">
        <Fields>
            <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="btn btn-primary rounded-0"  RenderNonBreakingSpacesBetweenControls="false"
                NumericButtonCssClass="btn btn-outline-primary rounded-0" ButtonCount="10" NextPageText="..." NextPreviousButtonCssClass="btn btn-default rounded-0" />
        </Fields>
    </asp:DataPager>
</div>
</div>
                    <!-- end content -->
                    </div>
        </div>
          </div>
          </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MainConn %>" SelectCommand="SELECT * FROM [View_FootprintsCats] ORDER BY [FootprintName]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterScripts" Runat="Server">

    <script>
        $(document).ready(function () {

            $('.table tr').click(function () {
                var href = $(this).find("a").attr("href");
                if (href) {
                    window.location = href;
                }
            });

        });
    </script>
</asp:Content>