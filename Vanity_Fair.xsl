<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.filemaker.com/fmpxmlresult" xmlns:date="java:java.util.Date"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">
    <xsl:output byte-order-mark="no" encoding="UTF-8" media-type="text/xml" xml:space="default"
        indent="yes"/>
    <xsl:output method="text"/>
    <xsl:output method="xml" indent="yes" name="xml"/>


    <xsl:template match="/">
        <xsl:for-each select="/ss:Workbook/ss:Worksheet[1]/ss:Table[1]/ss:Row/ss:Cell[3]/ss:Data">
            <xsl:variable name="filename" select="concat(normalize-space(./text()),'.mods','.xml')"/>
            <xsl:value-of select="$filename"/>
            <!-- Creating  -->
            <xsl:result-document href="{$filename}" format="xml">
                <mods xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                    xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-3.xsd"
                    xmlns:mods="http://www.loc.gov/mods/v3" xmlns="http://www.loc.gov/mods/v3">
                    <!-- hand off processing of row to another template -->
                    <xsl:apply-templates select="./ancestor::ss:Row"/>
                </mods>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="ss:Row">
        <xsl:call-template name="title"/>
        <xsl:call-template name="name"/>
        <xsl:call-template name="typeOfResource"/>
        <xsl:call-template name="genre"/>
        <xsl:call-template name="originInfo"/>
        <xsl:call-template name="physicalDescription"/>
        <xsl:call-template name="abstract"/>
        <xsl:call-template name="subject"/>
        <xsl:call-template name="relatedItem"/>
        <xsl:call-template name="identifier"/>
        <xsl:call-template name="location"/>
        <xsl:call-template name="recordInfo"/>
    </xsl:template>

    <xsl:template name="title">
        <xsl:for-each select="ss:Cell[5]/ss:Data">
            <xsl:element name="titleInfo" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:element name="title" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                    <xsl:value-of select="text()"/>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="name">
        <xsl:for-each select="ss:Cell[13]/ss:Data"> 
        <xsl:element name="name" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:variable name="dates">
                <xsl:if test="../../ss:Cell[14]/ss:Data[1]/text() and ../../ss:Cell[15]/ss:Data[1]/text()">
                <xsl:value-of select="concat(', ',../../ss:Cell[14]/ss:Data[1]/text(),' - ',../../ss:Cell[15]/ss:Data[1]/text())"/>
                </xsl:if>
            </xsl:variable>
            <xsl:attribute name="authority">
                <xsl:value-of>naf</xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="type">
                <xsl:value-of>personal</xsl:value-of>
            </xsl:attribute>
            <xsl:element name="namePart" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:value-of select="concat(text(),$dates)"/>
            </xsl:element>
            <xsl:element name="role" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:element name="roleTerm" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">
                        <xsl:value-of>code</xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="authority">
                        <xsl:value-of>marcrelator</xsl:value-of>
                    </xsl:attribute>
                    <xsl:value-of>art</xsl:value-of>
                </xsl:element>
                <xsl:element name="roleTerm" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">
                        <xsl:value-of>text</xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="authority">
                        <xsl:value-of>marcrelator</xsl:value-of>
                    </xsl:attribute>
                    <xsl:value-of>Artist</xsl:value-of>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="typeOfResource">
        <xsl:element name="typeOfResource" inherit-namespaces="no"
            xmlns="http://www.loc.gov/mods/v3">
            <xsl:value-of>still image</xsl:value-of>
        </xsl:element>
    </xsl:template>

    <xsl:template name="genre">
        <xsl:element name="genre" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="authority">
                <xsl:value-of>marcgt</xsl:value-of>
            </xsl:attribute>
            <xsl:value-of>art reproduction</xsl:value-of>
        </xsl:element>
    </xsl:template>

    <xsl:template name="originInfo">
        <xsl:element name="originInfo" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="dateCreated" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="encoding">
                    <xsl:value-of>w3cdtf</xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="keyDate">
                    <xsl:value-of>yes</xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="ss:Cell[4]/ss:Data/text()"/>
            </xsl:element>

        </xsl:element>
    </xsl:template>

    <xsl:template name="physicalDescription">
        <xsl:element name="physicalDescription" inherit-namespaces="no"
            xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="form" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="type">
                    <xsl:value-of>technique</xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="authority">
                    <xsl:value-of>aat</xsl:value-of>
                </xsl:attribute>
                <xsl:value-of>chromolithographs</xsl:value-of>
            </xsl:element>
            <xsl:element name="internetMediaType" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:value-of>image/tiff</xsl:value-of>
            </xsl:element>
            <xsl:element name="digitalOrigin" inherit-namespaces="no"
                xmlns="http://www.loc.gov/mods/v3">
                <xsl:value-of>reformatted digital</xsl:value-of>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="abstract">
        <xsl:element name="abstract" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="displayLabel">
                <xsl:value-of>Description</xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="ss:Cell[6]/ss:Data/text()"/>
        </xsl:element>
    </xsl:template>


    <xsl:template name="subject">
        <xsl:element name="subject" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="authority">
                <xsl:value-of>lcsh</xsl:value-of>
            </xsl:attribute>
            <xsl:element name="topic">
                <xsl:value-of>Chromolithography</xsl:value-of>
            </xsl:element>
        </xsl:element>
    </xsl:template>

        





    <xsl:template name="relatedItem">
        <xsl:element name="relatedItem" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">
                <xsl:value-of>series</xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="displayLabel">
                <xsl:value-of>Part of</xsl:value-of>
            </xsl:attribute>
            <xsl:element name="titleInfo">
                <xsl:element name="nonSort">
                    <xsl:value-of>The</xsl:value-of>
                </xsl:element>
                <xsl:element name="title">
                    <xsl:value-of>Vanity Fair Collection</xsl:value-of>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        
            <xsl:element name="originInfo">
                <xsl:element name="dateCreated">
                    <xsl:attribute name="keyDate">
                        <xsl:value-of>yes</xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="encoding">
                        <xsl:value-of>w3cdtf</xsl:value-of>
                    </xsl:attribute>
                    <xsl:value-of select="ss:Cell[6]/text()"/>
                </xsl:element>
                
        </xsl:element>
    </xsl:template>

    <xsl:template name="identifier">
        
        <xsl:element name="identifier" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">
                <xsl:value-of>local</xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="displayLabel">
                <xsl:value-of>Legacy ID</xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="ss:Cell[2]/ss:Data[1]/text()"/>
        </xsl:element>
        <xsl:element name="identifier" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">
                <xsl:value-of>local</xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="displayLabel">
                <xsl:value-of>pid</xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="ss:Cell[1]/ss:Data[1]/text()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="location">
        <xsl:element name="location" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="physicalLocation">
                <xsl:value-of>Small Special Collections Library</xsl:value-of>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="recordInfo">
        <xsl:element name="recordInfo" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="recordContentSource">
                <xsl:attribute name="authority">
                    <xsl:value-of>marcorg</xsl:value-of>
                </xsl:attribute>
                <xsl:value-of>viu</xsl:value-of>
            </xsl:element>
            <xsl:element name="recordOrigin">
                <xsl:value-of>Created programmatically by Digital Content Management &amp; Dissemination, University of Virginia Library.</xsl:value-of>
            </xsl:element>
            <xsl:element name="languageOfCataloging">
                <xsl:element name="languageTerm">
                    <xsl:attribute name="type">
                        <xsl:value-of>code</xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="authority">
                        <xsl:value-of>iso639-2b</xsl:value-of>
                    </xsl:attribute>
                    <xsl:value-of>eng</xsl:value-of>
                </xsl:element>
            </xsl:element>
            <xsl:element name="recordCreationDate">
                <xsl:attribute name="encoding">
                    <xsl:value-of>w3cdtf</xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="current-dateTime()"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
        


</xsl:stylesheet>
