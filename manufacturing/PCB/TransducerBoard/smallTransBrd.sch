<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.1.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="5" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="projectLib">
<packages>
<package name="MA40S4S" urn="urn:adsk.eagle:footprint:5239/1" locally_modified="yes">
<description>&lt;b&gt;BUZZER&lt;/b&gt;</description>
<circle x="0" y="0" radius="5" width="0.2" layer="21"/>
<text x="3.449" y="4.445" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.556" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<pad name="1" x="-2.5" y="0" drill="0.9"/>
<pad name="2" x="2.5" y="0" drill="0.9"/>
<circle x="-3.25" y="1.75" radius="0.75" width="0.127" layer="21"/>
<wire x1="-3.25" y1="2.25" x2="-3.25" y2="1.75" width="0.127" layer="21"/>
<wire x1="-3.25" y1="1.25" x2="-3.25" y2="1.75" width="0.127" layer="21"/>
<wire x1="-3.25" y1="1.75" x2="-3.75" y2="1.75" width="0.127" layer="21"/>
<wire x1="-3.25" y1="1.75" x2="-2.75" y2="1.75" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="SPEAKER">
<pin name="1" x="0" y="5.08" visible="pad" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-5.08" visible="pad" length="short" direction="pas" swaplevel="1" rot="R90"/>
<wire x1="-1.27" y1="2.54" x2="-1.27" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-2.54" x2="1.27" y2="-2.54" width="0.254" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="2.54" width="0.254" layer="94"/>
<wire x1="1.27" y1="2.54" x2="-1.27" y2="2.54" width="0.254" layer="94"/>
<wire x1="1.27" y1="2.54" x2="3.81" y2="5.08" width="0.254" layer="94"/>
<wire x1="3.81" y1="5.08" x2="3.81" y2="-5.08" width="0.254" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="1.27" y2="-2.54" width="0.254" layer="94"/>
<text x="7.0104" y="3.7338" size="1.778" layer="95" rot="R270">&gt;NAME</text>
<text x="4.3434" y="4.4704" size="1.778" layer="96" rot="R270">&gt;VALUE</text>
<wire x1="-0.762" y1="4.318" x2="-1.778" y2="4.318" width="0.127" layer="94"/>
<wire x1="-1.27" y1="3.81" x2="-1.27" y2="4.826" width="0.127" layer="94"/>
<circle x="-1.27" y="4.318" radius="0.915809375" width="0.1778" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MA40S4S" prefix="G">
<gates>
<gate name="G$1" symbol="SPEAKER" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MA40S4S">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1" urn="urn:adsk.eagle:library:371">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND" urn="urn:adsk.eagle:symbol:26925/1" library_version="1">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" urn="urn:adsk.eagle:component:26954/1" prefix="GND" library_version="1">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-harting-ml" urn="urn:adsk.eagle:library:149">
<description>&lt;b&gt;Harting  &amp; 3M Connectors&lt;/b&gt;&lt;p&gt;
Low profile connectors, straight&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="ML16" urn="urn:adsk.eagle:footprint:6918/1" library_version="1">
<description>&lt;b&gt;HARTING&lt;/b&gt;</description>
<wire x1="-12.7" y1="3.175" x2="12.7" y2="3.175" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-3.175" x2="12.7" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="3.175" x2="-12.7" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-13.97" y1="4.445" x2="-12.7" y2="4.445" width="0.1524" layer="21"/>
<wire x1="13.97" y1="-4.445" x2="9.271" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="13.97" y1="-4.445" x2="13.97" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-13.97" y1="4.445" x2="-13.97" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-3.175" x2="8.382" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-2.413" x2="-2.032" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-3.175" x2="-2.032" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-3.175" x2="-4.318" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-2.413" x2="2.032" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-3.175" x2="2.032" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="12.7" y1="4.445" x2="12.7" y2="4.699" width="0.1524" layer="21"/>
<wire x1="12.7" y1="4.699" x2="11.43" y2="4.699" width="0.1524" layer="21"/>
<wire x1="11.43" y1="4.445" x2="11.43" y2="4.699" width="0.1524" layer="21"/>
<wire x1="12.7" y1="4.445" x2="13.97" y2="4.445" width="0.1524" layer="21"/>
<wire x1="0.635" y1="4.699" x2="-0.635" y2="4.699" width="0.1524" layer="21"/>
<wire x1="0.635" y1="4.699" x2="0.635" y2="4.445" width="0.1524" layer="21"/>
<wire x1="0.635" y1="4.445" x2="11.43" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="4.699" x2="-0.635" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="4.699" x2="-12.7" y2="4.699" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="4.699" x2="-12.7" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="4.699" x2="-11.43" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="4.445" x2="-0.635" y2="4.445" width="0.1524" layer="21"/>
<wire x1="5.969" y1="-4.445" x2="2.032" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-4.445" x2="-2.032" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="6.858" y1="-3.175" x2="6.858" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="6.858" y1="-3.175" x2="2.032" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="8.382" y1="-3.175" x2="8.382" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="8.382" y1="-3.175" x2="6.858" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="5.969" y1="-4.445" x2="6.35" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-3.937" x2="9.271" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-3.937" x2="8.382" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="6.858" y1="-3.429" x2="2.032" y2="-3.429" width="0.0508" layer="21"/>
<wire x1="2.032" y1="-3.429" x2="2.032" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="8.382" y1="-3.429" x2="12.954" y2="-3.429" width="0.0508" layer="21"/>
<wire x1="12.954" y1="-3.429" x2="12.954" y2="3.429" width="0.0508" layer="21"/>
<wire x1="12.954" y1="3.429" x2="-12.954" y2="3.429" width="0.0508" layer="21"/>
<wire x1="-12.954" y1="3.429" x2="-12.954" y2="-3.429" width="0.0508" layer="21"/>
<wire x1="-12.954" y1="-3.429" x2="-5.842" y2="-3.429" width="0.0508" layer="21"/>
<wire x1="-2.032" y1="-3.175" x2="-2.032" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-3.429" x2="-2.032" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="6.858" y1="-3.429" x2="6.858" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="6.858" y1="-3.937" x2="6.35" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="8.382" y1="-3.429" x2="8.382" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="8.382" y1="-3.937" x2="6.858" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-13.97" y1="-4.445" x2="-9.652" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-9.652" y1="-4.318" x2="-9.652" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-9.652" y1="-4.318" x2="-8.128" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-8.128" y1="-4.445" x2="-8.128" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-8.128" y1="-4.445" x2="-6.731" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="-3.429" x2="-5.842" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="-3.429" x2="-4.318" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="-3.429" x2="-2.032" y2="-3.429" width="0.0508" layer="21"/>
<wire x1="-5.842" y1="-3.175" x2="-5.842" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="-3.175" x2="-12.7" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="-3.175" x2="-4.318" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="-3.175" x2="-5.842" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="-3.937" x2="-5.842" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="-3.937" x2="-6.35" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="-4.445" x2="-6.35" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-3.937" x2="-3.429" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-4.445" x2="-2.032" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-3.937" x2="-4.318" y2="-3.937" width="0.1524" layer="21"/>
<pad name="1" x="-8.89" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="2" x="-8.89" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="3" x="-6.35" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="4" x="-6.35" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="5" x="-3.81" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="6" x="-3.81" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="7" x="-1.27" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="8" x="-1.27" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="9" x="1.27" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="10" x="1.27" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="11" x="3.81" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="12" x="3.81" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="13" x="6.35" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="14" x="6.35" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="15" x="8.89" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="16" x="8.89" y="1.27" drill="0.9144" shape="octagon"/>
<text x="-13.97" y="5.08" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="1.27" y="5.08" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-1.016" y="-4.064" size="1.27" layer="21" ratio="10">16</text>
<text x="-11.43" y="-1.905" size="1.27" layer="21" ratio="10">1</text>
<text x="-11.43" y="0.635" size="1.27" layer="21" ratio="10">2</text>
<rectangle x1="8.636" y1="1.016" x2="9.144" y2="1.524" layer="51"/>
<rectangle x1="8.636" y1="-1.524" x2="9.144" y2="-1.016" layer="51"/>
<rectangle x1="6.096" y1="1.016" x2="6.604" y2="1.524" layer="51"/>
<rectangle x1="3.556" y1="1.016" x2="4.064" y2="1.524" layer="51"/>
<rectangle x1="3.556" y1="-1.524" x2="4.064" y2="-1.016" layer="51"/>
<rectangle x1="6.096" y1="-1.524" x2="6.604" y2="-1.016" layer="51"/>
<rectangle x1="-6.604" y1="1.016" x2="-6.096" y2="1.524" layer="51"/>
<rectangle x1="-9.144" y1="1.016" x2="-8.636" y2="1.524" layer="51"/>
<rectangle x1="-4.064" y1="1.016" x2="-3.556" y2="1.524" layer="51"/>
<rectangle x1="1.016" y1="1.016" x2="1.524" y2="1.524" layer="51"/>
<rectangle x1="-1.524" y1="1.016" x2="-1.016" y2="1.524" layer="51"/>
<rectangle x1="-6.604" y1="-1.524" x2="-6.096" y2="-1.016" layer="51"/>
<rectangle x1="-9.144" y1="-1.524" x2="-8.636" y2="-1.016" layer="51"/>
<rectangle x1="-4.064" y1="-1.524" x2="-3.556" y2="-1.016" layer="51"/>
<rectangle x1="1.016" y1="-1.524" x2="1.524" y2="-1.016" layer="51"/>
<rectangle x1="-1.524" y1="-1.524" x2="-1.016" y2="-1.016" layer="51"/>
</package>
<package name="ML16L" urn="urn:adsk.eagle:footprint:6919/1" library_version="1">
<description>&lt;b&gt;HARTING&lt;/b&gt;</description>
<wire x1="-10.16" y1="10.16" x2="-7.62" y2="10.16" width="0.254" layer="21"/>
<wire x1="-7.62" y1="10.16" x2="-8.89" y2="7.62" width="0.254" layer="21"/>
<wire x1="-8.89" y1="7.62" x2="-10.16" y2="10.16" width="0.254" layer="21"/>
<wire x1="6.604" y1="9.906" x2="6.604" y2="10.922" width="0.1524" layer="21"/>
<wire x1="6.604" y1="9.906" x2="8.636" y2="9.906" width="0.1524" layer="21"/>
<wire x1="8.636" y1="10.922" x2="8.636" y2="9.906" width="0.1524" layer="21"/>
<wire x1="6.858" y1="5.969" x2="8.382" y2="5.969" width="0.1524" layer="21" curve="-180"/>
<wire x1="8.382" y1="5.969" x2="8.382" y2="4.445" width="0.1524" layer="21"/>
<wire x1="8.382" y1="3.683" x2="9.779" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="10.922" x2="-2.159" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="10.922" x2="2.159" y2="10.922" width="0.1524" layer="21"/>
<wire x1="2.159" y1="10.922" x2="2.159" y2="4.445" width="0.1524" layer="21"/>
<wire x1="2.159" y1="10.922" x2="5.461" y2="10.922" width="0.1524" layer="21"/>
<wire x1="2.159" y1="4.445" x2="-2.159" y2="4.445" width="0.1524" layer="21"/>
<wire x1="2.159" y1="3.429" x2="-2.159" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="4.445" x2="-2.159" y2="3.429" width="0.1524" layer="21"/>
<wire x1="2.159" y1="4.445" x2="2.159" y2="3.429" width="0.1524" layer="21"/>
<wire x1="6.858" y1="5.969" x2="6.858" y2="4.445" width="0.1524" layer="21"/>
<wire x1="6.858" y1="4.445" x2="6.858" y2="3.683" width="0.1524" layer="21"/>
<wire x1="6.858" y1="4.445" x2="8.382" y2="4.445" width="0.1524" layer="21"/>
<wire x1="8.382" y1="4.445" x2="8.382" y2="3.683" width="0.1524" layer="21"/>
<wire x1="9.779" y1="3.683" x2="9.779" y2="10.922" width="0.1524" layer="21"/>
<wire x1="9.779" y1="3.683" x2="9.779" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="2.032" x2="-8.255" y2="2.032" width="0.1524" layer="51"/>
<wire x1="-8.255" y1="2.032" x2="-7.239" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="2.032" x2="-5.715" y2="2.032" width="0.1524" layer="51"/>
<wire x1="-5.715" y1="2.032" x2="-4.445" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="2.032" x2="-3.175" y2="2.032" width="0.1524" layer="51"/>
<wire x1="-3.175" y1="2.032" x2="-2.921" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.032" x2="-0.635" y2="2.032" width="0.1524" layer="51"/>
<wire x1="-0.635" y1="2.032" x2="0.635" y2="2.032" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.032" x2="0.635" y2="2.032" width="0.1524" layer="51"/>
<wire x1="1.27" y1="10.033" x2="1.27" y2="10.287" width="0.508" layer="21"/>
<wire x1="10.541" y1="4.445" x2="13.335" y2="4.445" width="0.1524" layer="21"/>
<wire x1="13.335" y1="4.445" x2="13.335" y2="8.255" width="0.1524" layer="21"/>
<wire x1="10.541" y1="8.255" x2="13.335" y2="8.255" width="0.1524" layer="21"/>
<wire x1="10.541" y1="8.255" x2="10.541" y2="4.445" width="0.1524" layer="21"/>
<wire x1="5.461" y1="3.683" x2="6.858" y2="3.683" width="0.1524" layer="21"/>
<wire x1="5.461" y1="3.683" x2="5.461" y2="10.922" width="0.1524" layer="21"/>
<wire x1="5.461" y1="3.683" x2="5.461" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-7.239" y1="10.922" x2="-6.096" y2="10.922" width="0.1524" layer="21"/>
<wire x1="-7.239" y1="2.032" x2="-7.239" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-7.239" y1="3.683" x2="-7.239" y2="10.922" width="0.1524" layer="21"/>
<wire x1="-7.239" y1="3.683" x2="-5.842" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="4.445" x2="-5.842" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="3.683" x2="-2.921" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="3.683" x2="-2.921" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="4.445" x2="-4.318" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="4.445" x2="-4.318" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="5.969" x2="-5.842" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="5.969" x2="-4.318" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="5.969" x2="-4.318" y2="5.969" width="0.1524" layer="21" curve="-180"/>
<wire x1="-6.096" y1="9.906" x2="-6.096" y2="10.922" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="10.922" x2="-4.064" y2="10.922" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="9.906" x2="-4.064" y2="9.906" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="10.922" x2="-4.064" y2="9.906" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="10.922" x2="-2.921" y2="10.922" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="3.683" x2="-2.921" y2="10.922" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="10.922" x2="-2.159" y2="10.922" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="10.033" x2="-1.27" y2="10.287" width="0.508" layer="21"/>
<wire x1="4.445" y1="2.032" x2="3.175" y2="2.032" width="0.1524" layer="51"/>
<wire x1="1.905" y1="2.032" x2="3.175" y2="2.032" width="0.1524" layer="21"/>
<wire x1="4.445" y1="2.032" x2="5.461" y2="2.032" width="0.1524" layer="21"/>
<wire x1="6.985" y1="2.032" x2="8.255" y2="2.032" width="0.1524" layer="21"/>
<wire x1="6.985" y1="2.032" x2="5.715" y2="2.032" width="0.1524" layer="51"/>
<wire x1="9.525" y1="2.032" x2="8.255" y2="2.032" width="0.1524" layer="51"/>
<wire x1="5.461" y1="10.922" x2="13.97" y2="10.922" width="0.1524" layer="21"/>
<wire x1="13.97" y1="2.032" x2="13.97" y2="10.922" width="0.1524" layer="21"/>
<wire x1="13.97" y1="2.032" x2="12.827" y2="2.032" width="0.1524" layer="21"/>
<wire x1="12.827" y1="2.032" x2="11.811" y2="2.032" width="0.1524" layer="21"/>
<wire x1="11.811" y1="2.032" x2="9.779" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-7.239" y1="10.922" x2="-13.97" y2="10.922" width="0.1524" layer="21"/>
<wire x1="-13.97" y1="2.032" x2="-13.97" y2="10.922" width="0.1524" layer="21"/>
<wire x1="-13.97" y1="2.032" x2="-12.827" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-12.827" y1="2.032" x2="-11.811" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-11.811" y1="2.032" x2="-9.525" y2="2.032" width="0.1524" layer="21"/>
<wire x1="9.779" y1="2.032" x2="9.525" y2="2.032" width="0.1524" layer="21"/>
<wire x1="5.461" y1="2.032" x2="5.715" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="2.032" x2="-1.905" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-7.239" y1="2.032" x2="-6.985" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-12.827" y1="2.032" x2="-12.827" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-11.811" y1="1.397" x2="-12.827" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-11.811" y1="1.397" x2="-11.811" y2="2.032" width="0.1524" layer="21"/>
<wire x1="11.811" y1="2.032" x2="11.811" y2="1.397" width="0.1524" layer="21"/>
<wire x1="12.827" y1="1.397" x2="11.811" y2="1.397" width="0.1524" layer="21"/>
<wire x1="12.827" y1="1.397" x2="12.827" y2="2.032" width="0.1524" layer="21"/>
<pad name="1" x="-8.89" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="2" x="-8.89" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="3" x="-6.35" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="4" x="-6.35" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="5" x="-3.81" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="6" x="-3.81" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="7" x="-1.27" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="8" x="-1.27" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="9" x="1.27" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="10" x="1.27" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="11" x="3.81" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="12" x="3.81" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="13" x="6.35" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="14" x="6.35" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="15" x="8.89" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="16" x="8.89" y="1.27" drill="0.9144" shape="octagon"/>
<text x="-10.9728" y="-1.6764" size="1.27" layer="21" ratio="10">1</text>
<text x="-10.9982" y="0.4826" size="1.27" layer="21" ratio="10">2</text>
<text x="-13.9954" y="11.43" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.0254" y="11.43" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="12.7" y="5.08" size="1.524" layer="21" ratio="10" rot="R90">16</text>
<rectangle x1="1.016" y1="4.445" x2="1.524" y2="10.287" layer="21"/>
<rectangle x1="-10.033" y1="9.652" x2="-7.747" y2="10.16" layer="21"/>
<rectangle x1="-9.779" y1="9.144" x2="-8.001" y2="9.652" layer="21"/>
<rectangle x1="-9.525" y1="8.636" x2="-8.255" y2="9.144" layer="21"/>
<rectangle x1="-9.271" y1="8.128" x2="-8.509" y2="8.636" layer="21"/>
<rectangle x1="-9.017" y1="7.874" x2="-8.763" y2="8.128" layer="21"/>
<rectangle x1="-1.524" y1="4.445" x2="-1.016" y2="10.287" layer="21"/>
<rectangle x1="-9.144" y1="-0.381" x2="-8.636" y2="0.381" layer="21"/>
<rectangle x1="-9.144" y1="0.381" x2="-8.636" y2="2.032" layer="51"/>
<rectangle x1="-9.144" y1="-1.524" x2="-8.636" y2="-0.381" layer="51"/>
<rectangle x1="-6.604" y1="-0.381" x2="-6.096" y2="0.381" layer="21"/>
<rectangle x1="-6.604" y1="0.381" x2="-6.096" y2="2.032" layer="51"/>
<rectangle x1="-6.604" y1="-1.524" x2="-6.096" y2="-0.381" layer="51"/>
<rectangle x1="-4.064" y1="0.381" x2="-3.556" y2="2.032" layer="51"/>
<rectangle x1="-4.064" y1="-0.381" x2="-3.556" y2="0.381" layer="21"/>
<rectangle x1="-4.064" y1="-1.524" x2="-3.556" y2="-0.381" layer="51"/>
<rectangle x1="-1.524" y1="-0.381" x2="-1.016" y2="0.381" layer="21"/>
<rectangle x1="-1.524" y1="0.381" x2="-1.016" y2="2.032" layer="51"/>
<rectangle x1="-1.524" y1="-1.524" x2="-1.016" y2="-0.381" layer="51"/>
<rectangle x1="1.016" y1="0.381" x2="1.524" y2="2.032" layer="51"/>
<rectangle x1="1.016" y1="-0.381" x2="1.524" y2="0.381" layer="21"/>
<rectangle x1="1.016" y1="-1.524" x2="1.524" y2="-0.381" layer="51"/>
<rectangle x1="3.556" y1="0.381" x2="4.064" y2="2.032" layer="51"/>
<rectangle x1="3.556" y1="-0.381" x2="4.064" y2="0.381" layer="21"/>
<rectangle x1="3.556" y1="-1.524" x2="4.064" y2="-0.381" layer="51"/>
<rectangle x1="6.096" y1="0.381" x2="6.604" y2="2.032" layer="51"/>
<rectangle x1="6.096" y1="-0.381" x2="6.604" y2="0.381" layer="21"/>
<rectangle x1="6.096" y1="-1.524" x2="6.604" y2="-0.381" layer="51"/>
<rectangle x1="8.636" y1="0.381" x2="9.144" y2="2.032" layer="51"/>
<rectangle x1="8.636" y1="-0.381" x2="9.144" y2="0.381" layer="21"/>
<rectangle x1="8.636" y1="-1.524" x2="9.144" y2="-0.381" layer="51"/>
</package>
<package name="3M_16" urn="urn:adsk.eagle:footprint:6920/1" library_version="1">
<description>&lt;b&gt;3M&lt;/b&gt;</description>
<wire x1="19.685" y1="-4.2418" x2="19.685" y2="4.3" width="0.3048" layer="21"/>
<wire x1="-19.685" y1="4.3" x2="-19.685" y2="-4.2418" width="0.3048" layer="21"/>
<wire x1="-19.685" y1="-4.3" x2="-2.54" y2="-4.3" width="0.3048" layer="21"/>
<wire x1="-2.54" y1="-4.3" x2="-2.54" y2="-3.048" width="0.3048" layer="21"/>
<wire x1="2.54" y1="-3.048" x2="2.54" y2="-4.3" width="0.3048" layer="21"/>
<wire x1="2.54" y1="-4.3" x2="19.431" y2="-4.3" width="0.3048" layer="21"/>
<wire x1="19.685" y1="4.3" x2="-19.685" y2="4.3" width="0.3048" layer="21"/>
<wire x1="12.7" y1="-3" x2="2.54" y2="-3" width="0.3048" layer="21"/>
<wire x1="-2.54" y1="-3" x2="-12.7" y2="-3" width="0.3048" layer="21"/>
<wire x1="-12.7" y1="-3" x2="-12.7" y2="-1.27" width="0.3048" layer="21"/>
<wire x1="12.573" y1="3" x2="-12.7" y2="3" width="0.3048" layer="21"/>
<wire x1="-12.7" y1="1.27" x2="-12.7" y2="3" width="0.3048" layer="21"/>
<wire x1="-12.7" y1="-1.27" x2="-19.558" y2="-1.27" width="0.3048" layer="21"/>
<wire x1="-12.7" y1="1.27" x2="-19.558" y2="1.27" width="0.3048" layer="21"/>
<wire x1="-2.54" y1="-4.318" x2="2.54" y2="-4.318" width="0.3048" layer="21"/>
<wire x1="12.7" y1="-3" x2="12.7" y2="-1.27" width="0.3048" layer="21"/>
<wire x1="12.7" y1="1.27" x2="12.7" y2="3" width="0.3048" layer="21"/>
<wire x1="12.7" y1="-1.27" x2="19.558" y2="-1.27" width="0.3048" layer="21"/>
<wire x1="12.7" y1="1.27" x2="19.558" y2="1.27" width="0.3048" layer="21"/>
<pad name="1" x="-8.89" y="-1.27" drill="0.8128" shape="square"/>
<pad name="2" x="-8.89" y="1.27" drill="0.8128" shape="square"/>
<pad name="3" x="-6.35" y="-1.27" drill="0.8128" shape="square"/>
<pad name="4" x="-6.35" y="1.27" drill="0.8128" shape="square"/>
<pad name="5" x="-3.81" y="-1.27" drill="0.8128" shape="square"/>
<pad name="6" x="-3.81" y="1.27" drill="0.8128" shape="square"/>
<pad name="8" x="-1.27" y="1.27" drill="0.8128" shape="square"/>
<pad name="9" x="1.27" y="-1.27" drill="0.8128" shape="square"/>
<pad name="10" x="1.27" y="1.27" drill="0.8128" shape="square"/>
<pad name="11" x="3.81" y="-1.27" drill="0.8128" shape="square"/>
<pad name="12" x="3.81" y="1.27" drill="0.8128" shape="square"/>
<pad name="13" x="6.35" y="-1.27" drill="0.8128" shape="square"/>
<pad name="14" x="6.35" y="1.27" drill="0.8128" shape="square"/>
<pad name="15" x="8.89" y="-1.27" drill="0.8128" shape="square"/>
<pad name="16" x="8.89" y="1.27" drill="0.8128" shape="square"/>
<pad name="7" x="-1.27" y="-1.27" drill="0.8128" shape="square"/>
<text x="-19.05" y="5.08" size="2.54" layer="25">&gt;NAME</text>
<text x="5.08" y="5.08" size="2.54" layer="27">&gt;VALUE</text>
<polygon width="0.3048" layer="21">
<vertex x="-10.287" y="-4.826"/>
<vertex x="-7.493" y="-4.826"/>
<vertex x="-8.89" y="-5.969"/>
</polygon>
</package>
<package name="3M_16L" urn="urn:adsk.eagle:footprint:6921/1" library_version="1">
<description>&lt;b&gt;3M&lt;/b&gt;</description>
<wire x1="-19.685" y1="-6.0198" x2="-17.145" y2="-6.0198" width="0.3048" layer="21"/>
<wire x1="19.685" y1="-6.0198" x2="19.685" y2="2.54" width="0.3048" layer="21"/>
<wire x1="-19.685" y1="2.54" x2="-19.685" y2="-6.0198" width="0.3048" layer="21"/>
<wire x1="-17.145" y1="-6.0198" x2="-17.145" y2="-2.032" width="0.3048" layer="21"/>
<wire x1="-17.145" y1="-6.0198" x2="-12.4714" y2="-6.0198" width="0.3048" layer="21"/>
<wire x1="-17.145" y1="-2.032" x2="-14.8082" y2="-0.4572" width="0.3048" layer="21"/>
<wire x1="-14.8082" y1="-0.4572" x2="-12.4714" y2="-2.032" width="0.3048" layer="21"/>
<wire x1="-12.4714" y1="-2.032" x2="-12.4714" y2="-6.0198" width="0.3048" layer="21"/>
<wire x1="-12.4714" y1="-6.0198" x2="12.4714" y2="-6.0198" width="0.3048" layer="21"/>
<wire x1="12.4714" y1="-6.0198" x2="12.4714" y2="-2.0574" width="0.3048" layer="21"/>
<wire x1="12.4714" y1="-2.0574" x2="14.8082" y2="-0.4572" width="0.3048" layer="21"/>
<wire x1="14.8082" y1="-0.4572" x2="17.145" y2="-2.0574" width="0.3048" layer="21"/>
<wire x1="17.145" y1="-2.0574" x2="17.145" y2="-6.0198" width="0.3048" layer="21"/>
<wire x1="12.4714" y1="-6.0198" x2="17.145" y2="-6.0198" width="0.3048" layer="21"/>
<wire x1="17.145" y1="-6.0198" x2="19.685" y2="-6.0198" width="0.3048" layer="21"/>
<wire x1="-19.685" y1="2.54" x2="-16.8148" y2="10.9982" width="0.3048" layer="21"/>
<wire x1="19.685" y1="2.54" x2="16.8148" y2="10.9982" width="0.3048" layer="21"/>
<wire x1="-12.7" y1="10.9982" x2="-16.8148" y2="10.9982" width="0.3048" layer="21"/>
<wire x1="-12.7" y1="8.89" x2="-12.7" y2="10.9982" width="0.3048" layer="21"/>
<wire x1="2.54" y1="1.27" x2="-2.54" y2="1.27" width="0.3048" layer="21"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="6.6802" width="0.3048" layer="21"/>
<wire x1="-3.81" y1="7.874" x2="-2.54" y2="6.604" width="0.3048" layer="21" curve="-90"/>
<wire x1="-12.7" y1="8.89" x2="-11.684" y2="7.874" width="0.3048" layer="21" curve="90"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="6.6802" width="0.3048" layer="21"/>
<wire x1="2.54" y1="6.604" x2="3.81" y2="7.874" width="0.3048" layer="21" curve="-90"/>
<wire x1="-12.7" y1="1.27" x2="-12.7" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="5.08" x2="-12.7" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="1.27" x2="-10.16" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="1.27" x2="-5.08" y2="1.27" width="0.1524" layer="21"/>
<wire x1="12.7" y1="10.9982" x2="16.8148" y2="10.9982" width="0.3048" layer="21"/>
<wire x1="-11.684" y1="7.874" x2="11.684" y2="7.874" width="0.3048" layer="21"/>
<wire x1="12.7" y1="8.89" x2="12.7" y2="10.9982" width="0.3048" layer="21"/>
<wire x1="11.684" y1="7.874" x2="12.7" y2="8.89" width="0.3048" layer="21" curve="90"/>
<wire x1="0" y1="1.27" x2="2.54" y2="1.27" width="0.1524" layer="21"/>
<wire x1="12.7" y1="1.27" x2="12.7" y2="3.81" width="0.1524" layer="21"/>
<wire x1="12.7" y1="5.08" x2="12.7" y2="7.62" width="0.1524" layer="21"/>
<wire x1="12.7" y1="1.27" x2="10.16" y2="1.27" width="0.1524" layer="21"/>
<wire x1="7.62" y1="1.27" x2="5.08" y2="1.27" width="0.1524" layer="21"/>
<circle x="-15.5448" y="3.81" radius="0.9398" width="0.1524" layer="21"/>
<circle x="15.5448" y="3.81" radius="0.9398" width="0.1524" layer="21"/>
<circle x="-14.8082" y="-3.2766" radius="1.9304" width="0" layer="42"/>
<circle x="14.8082" y="-3.2766" radius="1.9304" width="0" layer="42"/>
<circle x="-14.8082" y="-3.2766" radius="1.9304" width="0" layer="41"/>
<circle x="14.8082" y="-3.2766" radius="1.9304" width="0" layer="41"/>
<pad name="1" x="-8.89" y="-5.08" drill="0.8128" shape="square"/>
<pad name="2" x="-8.89" y="-2.54" drill="0.8128" shape="square"/>
<pad name="3" x="-6.35" y="-5.08" drill="0.8128" shape="square"/>
<pad name="4" x="-6.35" y="-2.54" drill="0.8128" shape="square"/>
<pad name="5" x="-3.81" y="-5.08" drill="0.8128" shape="square"/>
<pad name="6" x="-3.81" y="-2.54" drill="0.8128" shape="square"/>
<pad name="8" x="-1.27" y="-2.54" drill="0.8128" shape="square"/>
<pad name="9" x="1.27" y="-5.08" drill="0.8128" shape="square"/>
<pad name="10" x="1.27" y="-2.54" drill="0.8128" shape="square"/>
<pad name="11" x="3.81" y="-5.08" drill="0.8128" shape="square"/>
<pad name="12" x="3.81" y="-2.54" drill="0.8128" shape="square"/>
<pad name="13" x="6.35" y="-5.08" drill="0.8128" shape="square"/>
<pad name="14" x="6.35" y="-2.54" drill="0.8128" shape="square"/>
<pad name="15" x="8.89" y="-5.08" drill="0.8128" shape="square"/>
<pad name="16" x="8.89" y="-2.54" drill="0.8128" shape="square"/>
<pad name="7" x="-1.27" y="-5.08" drill="0.8128" shape="square"/>
<text x="-19.05" y="-10.16" size="2.54" layer="25">&gt;NAME</text>
<text x="5.08" y="-10.16" size="2.54" layer="27">&gt;VALUE</text>
<hole x="-14.8082" y="-3.2766" drill="2.54"/>
<hole x="14.8082" y="-3.2766" drill="2.54"/>
<polygon width="0.3048" layer="21">
<vertex x="-10.16" y="6.35"/>
<vertex x="-7.62" y="6.35"/>
<vertex x="-8.89" y="3.81"/>
</polygon>
</package>
</packages>
<packages3d>
<package3d name="ML16" urn="urn:adsk.eagle:package:6969/1" type="box" library_version="1">
<description>HARTING</description>
<packageinstances>
<packageinstance name="ML16"/>
</packageinstances>
</package3d>
<package3d name="ML16L" urn="urn:adsk.eagle:package:6973/1" type="box" library_version="1">
<description>HARTING</description>
<packageinstances>
<packageinstance name="ML16L"/>
</packageinstances>
</package3d>
<package3d name="3M_16" urn="urn:adsk.eagle:package:6960/1" type="box" library_version="1">
<description>3M</description>
<packageinstances>
<packageinstance name="3M_16"/>
</packageinstances>
</package3d>
<package3d name="3M_16L" urn="urn:adsk.eagle:package:6968/1" type="box" library_version="1">
<description>3M</description>
<packageinstances>
<packageinstance name="3M_16L"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="16P" urn="urn:adsk.eagle:symbol:6917/1" library_version="1">
<wire x1="3.81" y1="-12.7" x2="-3.81" y2="-12.7" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="10.16" x2="-3.81" y2="-12.7" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="10.16" x2="3.81" y2="10.16" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-12.7" x2="3.81" y2="10.16" width="0.4064" layer="94"/>
<wire x1="2.54" y1="2.54" x2="3.175" y2="2.54" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="2.54" y2="-5.08" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-7.62" x2="2.54" y2="-7.62" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-10.16" x2="2.54" y2="-10.16" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-1.27" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-5.08" x2="-1.27" y2="-5.08" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-7.62" x2="-1.27" y2="-7.62" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-10.16" x2="-1.27" y2="-10.16" width="0.6096" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="5.08" x2="2.54" y2="5.08" width="0.6096" layer="94"/>
<wire x1="1.27" y1="7.62" x2="2.54" y2="7.62" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-1.27" y2="2.54" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="5.08" x2="-1.27" y2="5.08" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="7.62" x2="-1.27" y2="7.62" width="0.6096" layer="94"/>
<text x="-3.81" y="-15.24" size="1.778" layer="96">&gt;VALUE</text>
<text x="-3.81" y="10.922" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="7.62" y="-10.16" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="3" x="7.62" y="-7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="5" x="7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="7" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="9" x="7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="11" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="13" x="7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="15" x="7.62" y="7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="2" x="-7.62" y="-10.16" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="4" x="-7.62" y="-7.62" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="6" x="-7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="8" x="-7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="10" x="-7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="12" x="-7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="14" x="-7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="16" x="-7.62" y="7.62" visible="pad" length="middle" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ML16" urn="urn:adsk.eagle:component:7002/1" prefix="SV" uservalue="yes" library_version="1">
<description>&lt;b&gt;HARTING&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="16P" x="0" y="0"/>
</gates>
<devices>
<device name="" package="ML16">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="10" pad="10"/>
<connect gate="1" pin="11" pad="11"/>
<connect gate="1" pin="12" pad="12"/>
<connect gate="1" pin="13" pad="13"/>
<connect gate="1" pin="14" pad="14"/>
<connect gate="1" pin="15" pad="15"/>
<connect gate="1" pin="16" pad="16"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
<connect gate="1" pin="4" pad="4"/>
<connect gate="1" pin="5" pad="5"/>
<connect gate="1" pin="6" pad="6"/>
<connect gate="1" pin="7" pad="7"/>
<connect gate="1" pin="8" pad="8"/>
<connect gate="1" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:6969/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="L" package="ML16L">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="10" pad="10"/>
<connect gate="1" pin="11" pad="11"/>
<connect gate="1" pin="12" pad="12"/>
<connect gate="1" pin="13" pad="13"/>
<connect gate="1" pin="14" pad="14"/>
<connect gate="1" pin="15" pad="15"/>
<connect gate="1" pin="16" pad="16"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
<connect gate="1" pin="4" pad="4"/>
<connect gate="1" pin="5" pad="5"/>
<connect gate="1" pin="6" pad="6"/>
<connect gate="1" pin="7" pad="7"/>
<connect gate="1" pin="8" pad="8"/>
<connect gate="1" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:6973/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="3M" package="3M_16">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="10" pad="10"/>
<connect gate="1" pin="11" pad="11"/>
<connect gate="1" pin="12" pad="12"/>
<connect gate="1" pin="13" pad="13"/>
<connect gate="1" pin="14" pad="14"/>
<connect gate="1" pin="15" pad="15"/>
<connect gate="1" pin="16" pad="16"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
<connect gate="1" pin="4" pad="4"/>
<connect gate="1" pin="5" pad="5"/>
<connect gate="1" pin="6" pad="6"/>
<connect gate="1" pin="7" pad="7"/>
<connect gate="1" pin="8" pad="8"/>
<connect gate="1" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:6960/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="3ML" package="3M_16L">
<connects>
<connect gate="1" pin="1" pad="1"/>
<connect gate="1" pin="10" pad="10"/>
<connect gate="1" pin="11" pad="11"/>
<connect gate="1" pin="12" pad="12"/>
<connect gate="1" pin="13" pad="13"/>
<connect gate="1" pin="14" pad="14"/>
<connect gate="1" pin="15" pad="15"/>
<connect gate="1" pin="16" pad="16"/>
<connect gate="1" pin="2" pad="2"/>
<connect gate="1" pin="3" pad="3"/>
<connect gate="1" pin="4" pad="4"/>
<connect gate="1" pin="5" pad="5"/>
<connect gate="1" pin="6" pad="6"/>
<connect gate="1" pin="7" pad="7"/>
<connect gate="1" pin="8" pad="8"/>
<connect gate="1" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:6968/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="GND1" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="G1" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G2" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G3" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G4" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G5" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G6" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G7" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G8" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="GND2" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="G9" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G10" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G11" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G12" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G13" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G14" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G15" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G16" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="GND3" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="G17" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G18" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G19" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G20" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G21" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G22" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G23" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G24" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="GND4" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="G25" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G26" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G27" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G28" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G29" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G30" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G31" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G32" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="GND5" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="G33" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G34" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G35" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G36" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G37" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G38" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G39" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G40" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="GND6" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="G41" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G42" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G43" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G44" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G45" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G46" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G47" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G48" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="GND7" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="G49" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G50" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G51" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G52" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G53" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G54" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G55" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G56" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="GND8" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="G57" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G58" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G59" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G60" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G61" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G62" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G63" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="G64" library="projectLib" deviceset="MA40S4S" device=""/>
<part name="GND9" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="SV1" library="con-harting-ml" library_urn="urn:adsk.eagle:library:149" deviceset="ML16" device="" package3d_urn="urn:adsk.eagle:package:6969/1" value="CH0-CH7"/>
<part name="SV2" library="con-harting-ml" library_urn="urn:adsk.eagle:library:149" deviceset="ML16" device="" package3d_urn="urn:adsk.eagle:package:6969/1" value="CH7-CH15"/>
<part name="SV3" library="con-harting-ml" library_urn="urn:adsk.eagle:library:149" deviceset="ML16" device="" package3d_urn="urn:adsk.eagle:package:6969/1" value="CH16-CH23"/>
<part name="SV4" library="con-harting-ml" library_urn="urn:adsk.eagle:library:149" deviceset="ML16" device="" package3d_urn="urn:adsk.eagle:package:6969/1" value="CH24-CH31"/>
<part name="SV5" library="con-harting-ml" library_urn="urn:adsk.eagle:library:149" deviceset="ML16" device="" package3d_urn="urn:adsk.eagle:package:6969/1" value="CH32-CH39"/>
<part name="SV6" library="con-harting-ml" library_urn="urn:adsk.eagle:library:149" deviceset="ML16" device="" package3d_urn="urn:adsk.eagle:package:6969/1" value="CH40-CH47"/>
<part name="SV7" library="con-harting-ml" library_urn="urn:adsk.eagle:library:149" deviceset="ML16" device="" package3d_urn="urn:adsk.eagle:package:6969/1" value="CH48-CH55"/>
<part name="SV8" library="con-harting-ml" library_urn="urn:adsk.eagle:library:149" deviceset="ML16" device="" package3d_urn="urn:adsk.eagle:package:6969/1" value="CH56-CH63"/>
<part name="GND10" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND11" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND12" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND13" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND14" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND15" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND16" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="GND1" gate="1" x="-10.16" y="-7.62"/>
<instance part="G1" gate="G$1" x="43.18" y="96.52" rot="R90"/>
<instance part="G2" gate="G$1" x="43.18" y="83.82" rot="R90"/>
<instance part="G3" gate="G$1" x="43.18" y="71.12" rot="R90"/>
<instance part="G4" gate="G$1" x="43.18" y="58.42" rot="R90"/>
<instance part="G5" gate="G$1" x="43.18" y="45.72" rot="R90"/>
<instance part="G6" gate="G$1" x="43.18" y="33.02" rot="R90"/>
<instance part="G7" gate="G$1" x="43.18" y="20.32" rot="R90"/>
<instance part="G8" gate="G$1" x="43.18" y="7.62" rot="R90"/>
<instance part="GND2" gate="1" x="50.8" y="0"/>
<instance part="G9" gate="G$1" x="68.58" y="96.52" rot="R90"/>
<instance part="G10" gate="G$1" x="68.58" y="83.82" rot="R90"/>
<instance part="G11" gate="G$1" x="68.58" y="71.12" rot="R90"/>
<instance part="G12" gate="G$1" x="68.58" y="58.42" rot="R90"/>
<instance part="G13" gate="G$1" x="68.58" y="45.72" rot="R90"/>
<instance part="G14" gate="G$1" x="68.58" y="33.02" rot="R90"/>
<instance part="G15" gate="G$1" x="68.58" y="20.32" rot="R90"/>
<instance part="G16" gate="G$1" x="68.58" y="7.62" rot="R90"/>
<instance part="GND3" gate="1" x="76.2" y="0"/>
<instance part="G17" gate="G$1" x="93.98" y="96.52" rot="R90"/>
<instance part="G18" gate="G$1" x="93.98" y="83.82" rot="R90"/>
<instance part="G19" gate="G$1" x="93.98" y="71.12" rot="R90"/>
<instance part="G20" gate="G$1" x="93.98" y="58.42" rot="R90"/>
<instance part="G21" gate="G$1" x="93.98" y="45.72" rot="R90"/>
<instance part="G22" gate="G$1" x="93.98" y="33.02" rot="R90"/>
<instance part="G23" gate="G$1" x="93.98" y="20.32" rot="R90"/>
<instance part="G24" gate="G$1" x="93.98" y="7.62" rot="R90"/>
<instance part="GND4" gate="1" x="101.6" y="0"/>
<instance part="G25" gate="G$1" x="119.38" y="96.52" rot="R90"/>
<instance part="G26" gate="G$1" x="119.38" y="83.82" rot="R90"/>
<instance part="G27" gate="G$1" x="119.38" y="71.12" rot="R90"/>
<instance part="G28" gate="G$1" x="119.38" y="58.42" rot="R90"/>
<instance part="G29" gate="G$1" x="119.38" y="45.72" rot="R90"/>
<instance part="G30" gate="G$1" x="119.38" y="33.02" rot="R90"/>
<instance part="G31" gate="G$1" x="119.38" y="20.32" rot="R90"/>
<instance part="G32" gate="G$1" x="119.38" y="7.62" rot="R90"/>
<instance part="GND5" gate="1" x="127" y="0"/>
<instance part="G33" gate="G$1" x="144.78" y="96.52" rot="R90"/>
<instance part="G34" gate="G$1" x="144.78" y="83.82" rot="R90"/>
<instance part="G35" gate="G$1" x="144.78" y="71.12" rot="R90"/>
<instance part="G36" gate="G$1" x="144.78" y="58.42" rot="R90"/>
<instance part="G37" gate="G$1" x="144.78" y="45.72" rot="R90"/>
<instance part="G38" gate="G$1" x="144.78" y="33.02" rot="R90"/>
<instance part="G39" gate="G$1" x="144.78" y="20.32" rot="R90"/>
<instance part="G40" gate="G$1" x="144.78" y="7.62" rot="R90"/>
<instance part="GND6" gate="1" x="152.4" y="0"/>
<instance part="G41" gate="G$1" x="170.18" y="96.52" rot="R90"/>
<instance part="G42" gate="G$1" x="170.18" y="83.82" rot="R90"/>
<instance part="G43" gate="G$1" x="170.18" y="71.12" rot="R90"/>
<instance part="G44" gate="G$1" x="170.18" y="58.42" rot="R90"/>
<instance part="G45" gate="G$1" x="170.18" y="45.72" rot="R90"/>
<instance part="G46" gate="G$1" x="170.18" y="33.02" rot="R90"/>
<instance part="G47" gate="G$1" x="170.18" y="20.32" rot="R90"/>
<instance part="G48" gate="G$1" x="170.18" y="7.62" rot="R90"/>
<instance part="GND7" gate="1" x="177.8" y="0"/>
<instance part="G49" gate="G$1" x="195.58" y="96.52" rot="R90"/>
<instance part="G50" gate="G$1" x="195.58" y="83.82" rot="R90"/>
<instance part="G51" gate="G$1" x="195.58" y="71.12" rot="R90"/>
<instance part="G52" gate="G$1" x="195.58" y="58.42" rot="R90"/>
<instance part="G53" gate="G$1" x="195.58" y="45.72" rot="R90"/>
<instance part="G54" gate="G$1" x="195.58" y="33.02" rot="R90"/>
<instance part="G55" gate="G$1" x="195.58" y="20.32" rot="R90"/>
<instance part="G56" gate="G$1" x="195.58" y="7.62" rot="R90"/>
<instance part="GND8" gate="1" x="203.2" y="0"/>
<instance part="G57" gate="G$1" x="220.98" y="96.52" rot="R90"/>
<instance part="G58" gate="G$1" x="220.98" y="83.82" rot="R90"/>
<instance part="G59" gate="G$1" x="220.98" y="71.12" rot="R90"/>
<instance part="G60" gate="G$1" x="220.98" y="58.42" rot="R90"/>
<instance part="G61" gate="G$1" x="220.98" y="45.72" rot="R90"/>
<instance part="G62" gate="G$1" x="220.98" y="33.02" rot="R90"/>
<instance part="G63" gate="G$1" x="220.98" y="20.32" rot="R90"/>
<instance part="G64" gate="G$1" x="220.98" y="7.62" rot="R90"/>
<instance part="GND9" gate="1" x="228.6" y="0"/>
<instance part="SV1" gate="1" x="-30.48" y="88.9" rot="MR180"/>
<instance part="SV2" gate="1" x="-30.48" y="60.96" rot="MR180"/>
<instance part="SV3" gate="1" x="-30.48" y="33.02" rot="MR180"/>
<instance part="SV4" gate="1" x="-30.48" y="5.08" rot="MR180"/>
<instance part="SV5" gate="1" x="2.54" y="88.9" rot="MR180"/>
<instance part="SV6" gate="1" x="2.54" y="60.96" rot="MR180"/>
<instance part="SV7" gate="1" x="2.54" y="33.02" rot="MR180"/>
<instance part="SV8" gate="1" x="2.54" y="5.08" rot="MR180"/>
<instance part="GND10" gate="1" x="-43.18" y="-7.62"/>
<instance part="GND11" gate="1" x="-43.18" y="20.32"/>
<instance part="GND12" gate="1" x="-10.16" y="20.32"/>
<instance part="GND13" gate="1" x="-10.16" y="48.26"/>
<instance part="GND14" gate="1" x="-43.18" y="48.26"/>
<instance part="GND15" gate="1" x="-43.18" y="76.2"/>
<instance part="GND16" gate="1" x="-10.16" y="76.2"/>
</instances>
<busses>
</busses>
<nets>
<net name="CH0" class="0">
<segment>
<wire x1="-22.86" y1="99.06" x2="-15.24" y2="99.06" width="0.1524" layer="91"/>
<label x="-22.86" y="99.06" size="1.778" layer="95"/>
<pinref part="SV1" gate="1" pin="1"/>
</segment>
<segment>
<pinref part="G1" gate="G$1" pin="1"/>
<wire x1="30.48" y1="96.52" x2="38.1" y2="96.52" width="0.1524" layer="91"/>
<label x="30.48" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="CH1" class="0">
<segment>
<wire x1="-22.86" y1="96.52" x2="-15.24" y2="96.52" width="0.1524" layer="91"/>
<label x="-22.86" y="96.52" size="1.778" layer="95"/>
<pinref part="SV1" gate="1" pin="3"/>
</segment>
<segment>
<pinref part="G2" gate="G$1" pin="1"/>
<wire x1="30.48" y1="83.82" x2="38.1" y2="83.82" width="0.1524" layer="91"/>
<label x="30.48" y="83.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="CH2" class="0">
<segment>
<wire x1="-22.86" y1="93.98" x2="-15.24" y2="93.98" width="0.1524" layer="91"/>
<label x="-22.86" y="93.98" size="1.778" layer="95"/>
<pinref part="SV1" gate="1" pin="5"/>
</segment>
<segment>
<pinref part="G3" gate="G$1" pin="1"/>
<wire x1="30.48" y1="71.12" x2="38.1" y2="71.12" width="0.1524" layer="91"/>
<label x="30.48" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="CH3" class="0">
<segment>
<wire x1="-22.86" y1="91.44" x2="-15.24" y2="91.44" width="0.1524" layer="91"/>
<label x="-22.86" y="91.44" size="1.778" layer="95"/>
<pinref part="SV1" gate="1" pin="7"/>
</segment>
<segment>
<pinref part="G4" gate="G$1" pin="1"/>
<wire x1="30.48" y1="58.42" x2="38.1" y2="58.42" width="0.1524" layer="91"/>
<label x="30.48" y="58.42" size="1.778" layer="95"/>
</segment>
</net>
<net name="CH4" class="0">
<segment>
<wire x1="-22.86" y1="88.9" x2="-15.24" y2="88.9" width="0.1524" layer="91"/>
<label x="-22.86" y="88.9" size="1.778" layer="95"/>
<pinref part="SV1" gate="1" pin="9"/>
</segment>
<segment>
<pinref part="G5" gate="G$1" pin="1"/>
<wire x1="30.48" y1="45.72" x2="38.1" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH5" class="0">
<segment>
<wire x1="-22.86" y1="86.36" x2="-15.24" y2="86.36" width="0.1524" layer="91"/>
<label x="-22.86" y="86.36" size="1.778" layer="95"/>
<pinref part="SV1" gate="1" pin="11"/>
</segment>
<segment>
<pinref part="G6" gate="G$1" pin="1"/>
<wire x1="30.48" y1="33.02" x2="38.1" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH6" class="0">
<segment>
<wire x1="-22.86" y1="83.82" x2="-15.24" y2="83.82" width="0.1524" layer="91"/>
<label x="-22.86" y="83.82" size="1.778" layer="95"/>
<pinref part="SV1" gate="1" pin="13"/>
</segment>
<segment>
<pinref part="G7" gate="G$1" pin="1"/>
<wire x1="30.48" y1="20.32" x2="38.1" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH7" class="0">
<segment>
<wire x1="-22.86" y1="81.28" x2="-15.24" y2="81.28" width="0.1524" layer="91"/>
<label x="-22.86" y="81.28" size="1.778" layer="95"/>
<pinref part="SV1" gate="1" pin="15"/>
</segment>
<segment>
<pinref part="G8" gate="G$1" pin="1"/>
<wire x1="30.48" y1="7.62" x2="38.1" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH8" class="0">
<segment>
<wire x1="-22.86" y1="71.12" x2="-15.24" y2="71.12" width="0.1524" layer="91"/>
<label x="-22.86" y="71.12" size="1.778" layer="95"/>
<pinref part="SV2" gate="1" pin="1"/>
</segment>
<segment>
<pinref part="G9" gate="G$1" pin="1"/>
<wire x1="55.88" y1="96.52" x2="63.5" y2="96.52" width="0.1524" layer="91"/>
<label x="55.88" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="CH9" class="0">
<segment>
<wire x1="-22.86" y1="68.58" x2="-15.24" y2="68.58" width="0.1524" layer="91"/>
<label x="-22.86" y="68.58" size="1.778" layer="95"/>
<pinref part="SV2" gate="1" pin="3"/>
</segment>
<segment>
<pinref part="G10" gate="G$1" pin="1"/>
<wire x1="55.88" y1="83.82" x2="63.5" y2="83.82" width="0.1524" layer="91"/>
<label x="55.88" y="83.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="CH10" class="0">
<segment>
<wire x1="-22.86" y1="66.04" x2="-15.24" y2="66.04" width="0.1524" layer="91"/>
<label x="-22.86" y="66.04" size="1.778" layer="95"/>
<pinref part="SV2" gate="1" pin="5"/>
</segment>
<segment>
<pinref part="G11" gate="G$1" pin="1"/>
<wire x1="55.88" y1="71.12" x2="63.5" y2="71.12" width="0.1524" layer="91"/>
<label x="55.88" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="CH11" class="0">
<segment>
<wire x1="-22.86" y1="63.5" x2="-15.24" y2="63.5" width="0.1524" layer="91"/>
<label x="-22.86" y="63.5" size="1.778" layer="95"/>
<pinref part="SV2" gate="1" pin="7"/>
</segment>
<segment>
<pinref part="G12" gate="G$1" pin="1"/>
<wire x1="55.88" y1="58.42" x2="63.5" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH12" class="0">
<segment>
<wire x1="-22.86" y1="60.96" x2="-15.24" y2="60.96" width="0.1524" layer="91"/>
<label x="-22.86" y="60.96" size="1.778" layer="95"/>
<pinref part="SV2" gate="1" pin="9"/>
</segment>
<segment>
<pinref part="G13" gate="G$1" pin="1"/>
<wire x1="55.88" y1="45.72" x2="63.5" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH13" class="0">
<segment>
<wire x1="-22.86" y1="58.42" x2="-15.24" y2="58.42" width="0.1524" layer="91"/>
<label x="-22.86" y="58.42" size="1.778" layer="95"/>
<pinref part="SV2" gate="1" pin="11"/>
</segment>
<segment>
<pinref part="G14" gate="G$1" pin="1"/>
<wire x1="55.88" y1="33.02" x2="63.5" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH14" class="0">
<segment>
<wire x1="-22.86" y1="55.88" x2="-15.24" y2="55.88" width="0.1524" layer="91"/>
<label x="-22.86" y="55.88" size="1.778" layer="95"/>
<pinref part="SV2" gate="1" pin="13"/>
</segment>
<segment>
<pinref part="G15" gate="G$1" pin="1"/>
<wire x1="55.88" y1="20.32" x2="63.5" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH15" class="0">
<segment>
<wire x1="-22.86" y1="53.34" x2="-15.24" y2="53.34" width="0.1524" layer="91"/>
<label x="-22.86" y="53.34" size="1.778" layer="95"/>
<pinref part="SV2" gate="1" pin="15"/>
</segment>
<segment>
<pinref part="G16" gate="G$1" pin="1"/>
<wire x1="55.88" y1="7.62" x2="63.5" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH16" class="0">
<segment>
<wire x1="-22.86" y1="43.18" x2="-15.24" y2="43.18" width="0.1524" layer="91"/>
<label x="-22.86" y="43.18" size="1.778" layer="95"/>
<pinref part="SV3" gate="1" pin="1"/>
</segment>
<segment>
<pinref part="G17" gate="G$1" pin="1"/>
<wire x1="81.28" y1="96.52" x2="88.9" y2="96.52" width="0.1524" layer="91"/>
<label x="81.28" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="CH17" class="0">
<segment>
<wire x1="-22.86" y1="40.64" x2="-15.24" y2="40.64" width="0.1524" layer="91"/>
<label x="-22.86" y="40.64" size="1.778" layer="95"/>
<pinref part="SV3" gate="1" pin="3"/>
</segment>
<segment>
<pinref part="G18" gate="G$1" pin="1"/>
<wire x1="81.28" y1="83.82" x2="88.9" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH18" class="0">
<segment>
<wire x1="-22.86" y1="38.1" x2="-15.24" y2="38.1" width="0.1524" layer="91"/>
<label x="-22.86" y="38.1" size="1.778" layer="95"/>
<pinref part="SV3" gate="1" pin="5"/>
</segment>
<segment>
<pinref part="G19" gate="G$1" pin="1"/>
<wire x1="81.28" y1="71.12" x2="88.9" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH19" class="0">
<segment>
<wire x1="-22.86" y1="35.56" x2="-15.24" y2="35.56" width="0.1524" layer="91"/>
<label x="-22.86" y="35.56" size="1.778" layer="95"/>
<pinref part="SV3" gate="1" pin="7"/>
</segment>
<segment>
<pinref part="G20" gate="G$1" pin="1"/>
<wire x1="81.28" y1="58.42" x2="88.9" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH20" class="0">
<segment>
<wire x1="-22.86" y1="33.02" x2="-15.24" y2="33.02" width="0.1524" layer="91"/>
<label x="-22.86" y="33.02" size="1.778" layer="95"/>
<pinref part="SV3" gate="1" pin="9"/>
</segment>
<segment>
<pinref part="G21" gate="G$1" pin="1"/>
<wire x1="81.28" y1="45.72" x2="88.9" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH21" class="0">
<segment>
<wire x1="-22.86" y1="30.48" x2="-15.24" y2="30.48" width="0.1524" layer="91"/>
<label x="-22.86" y="30.48" size="1.778" layer="95"/>
<pinref part="SV3" gate="1" pin="11"/>
</segment>
<segment>
<pinref part="G22" gate="G$1" pin="1"/>
<wire x1="81.28" y1="33.02" x2="88.9" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH22" class="0">
<segment>
<wire x1="-22.86" y1="27.94" x2="-15.24" y2="27.94" width="0.1524" layer="91"/>
<label x="-22.86" y="27.94" size="1.778" layer="95"/>
<pinref part="SV3" gate="1" pin="13"/>
</segment>
<segment>
<pinref part="G23" gate="G$1" pin="1"/>
<wire x1="81.28" y1="20.32" x2="88.9" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH23" class="0">
<segment>
<wire x1="-22.86" y1="25.4" x2="-15.24" y2="25.4" width="0.1524" layer="91"/>
<label x="-22.86" y="25.4" size="1.778" layer="95"/>
<pinref part="SV3" gate="1" pin="15"/>
</segment>
<segment>
<pinref part="G24" gate="G$1" pin="1"/>
<wire x1="81.28" y1="7.62" x2="88.9" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH24" class="0">
<segment>
<wire x1="-22.86" y1="15.24" x2="-15.24" y2="15.24" width="0.1524" layer="91"/>
<label x="-22.86" y="15.24" size="1.778" layer="95"/>
<pinref part="SV4" gate="1" pin="1"/>
</segment>
<segment>
<pinref part="G25" gate="G$1" pin="1"/>
<wire x1="106.68" y1="96.52" x2="114.3" y2="96.52" width="0.1524" layer="91"/>
<label x="106.68" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="CH25" class="0">
<segment>
<wire x1="-22.86" y1="12.7" x2="-15.24" y2="12.7" width="0.1524" layer="91"/>
<label x="-22.86" y="12.7" size="1.778" layer="95"/>
<pinref part="SV4" gate="1" pin="3"/>
</segment>
<segment>
<pinref part="G26" gate="G$1" pin="1"/>
<wire x1="106.68" y1="83.82" x2="114.3" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH26" class="0">
<segment>
<wire x1="-22.86" y1="10.16" x2="-15.24" y2="10.16" width="0.1524" layer="91"/>
<label x="-22.86" y="10.16" size="1.778" layer="95"/>
<pinref part="SV4" gate="1" pin="5"/>
</segment>
<segment>
<pinref part="G27" gate="G$1" pin="1"/>
<wire x1="106.68" y1="71.12" x2="114.3" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH27" class="0">
<segment>
<wire x1="-22.86" y1="7.62" x2="-15.24" y2="7.62" width="0.1524" layer="91"/>
<label x="-22.86" y="7.62" size="1.778" layer="95"/>
<pinref part="SV4" gate="1" pin="7"/>
</segment>
<segment>
<pinref part="G28" gate="G$1" pin="1"/>
<wire x1="106.68" y1="58.42" x2="114.3" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH28" class="0">
<segment>
<wire x1="-22.86" y1="5.08" x2="-15.24" y2="5.08" width="0.1524" layer="91"/>
<label x="-22.86" y="5.08" size="1.778" layer="95"/>
<pinref part="SV4" gate="1" pin="9"/>
</segment>
<segment>
<pinref part="G29" gate="G$1" pin="1"/>
<wire x1="106.68" y1="45.72" x2="114.3" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH29" class="0">
<segment>
<wire x1="-22.86" y1="2.54" x2="-15.24" y2="2.54" width="0.1524" layer="91"/>
<label x="-22.86" y="2.54" size="1.778" layer="95"/>
<pinref part="SV4" gate="1" pin="11"/>
</segment>
<segment>
<pinref part="G30" gate="G$1" pin="1"/>
<wire x1="106.68" y1="33.02" x2="114.3" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH30" class="0">
<segment>
<wire x1="-22.86" y1="0" x2="-15.24" y2="0" width="0.1524" layer="91"/>
<label x="-22.86" y="0" size="1.778" layer="95"/>
<pinref part="SV4" gate="1" pin="13"/>
</segment>
<segment>
<pinref part="G31" gate="G$1" pin="1"/>
<wire x1="106.68" y1="20.32" x2="114.3" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH31" class="0">
<segment>
<wire x1="-22.86" y1="-2.54" x2="-15.24" y2="-2.54" width="0.1524" layer="91"/>
<label x="-22.86" y="-2.54" size="1.778" layer="95"/>
<pinref part="SV4" gate="1" pin="15"/>
</segment>
<segment>
<pinref part="G32" gate="G$1" pin="1"/>
<wire x1="106.68" y1="7.62" x2="114.3" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH32" class="0">
<segment>
<wire x1="10.16" y1="99.06" x2="17.78" y2="99.06" width="0.1524" layer="91"/>
<label x="10.16" y="99.06" size="1.778" layer="95"/>
<pinref part="SV5" gate="1" pin="1"/>
</segment>
<segment>
<pinref part="G33" gate="G$1" pin="1"/>
<wire x1="132.08" y1="96.52" x2="139.7" y2="96.52" width="0.1524" layer="91"/>
<label x="132.08" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="CH33" class="0">
<segment>
<wire x1="10.16" y1="96.52" x2="17.78" y2="96.52" width="0.1524" layer="91"/>
<label x="10.16" y="96.52" size="1.778" layer="95"/>
<pinref part="SV5" gate="1" pin="3"/>
</segment>
<segment>
<pinref part="G34" gate="G$1" pin="1"/>
<wire x1="132.08" y1="83.82" x2="139.7" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH34" class="0">
<segment>
<wire x1="10.16" y1="93.98" x2="17.78" y2="93.98" width="0.1524" layer="91"/>
<label x="10.16" y="93.98" size="1.778" layer="95"/>
<pinref part="SV5" gate="1" pin="5"/>
</segment>
<segment>
<pinref part="G35" gate="G$1" pin="1"/>
<wire x1="132.08" y1="71.12" x2="139.7" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH35" class="0">
<segment>
<wire x1="10.16" y1="91.44" x2="17.78" y2="91.44" width="0.1524" layer="91"/>
<label x="10.16" y="91.44" size="1.778" layer="95"/>
<pinref part="SV5" gate="1" pin="7"/>
</segment>
<segment>
<pinref part="G36" gate="G$1" pin="1"/>
<wire x1="132.08" y1="58.42" x2="139.7" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH36" class="0">
<segment>
<wire x1="10.16" y1="88.9" x2="17.78" y2="88.9" width="0.1524" layer="91"/>
<label x="10.16" y="88.9" size="1.778" layer="95"/>
<pinref part="SV5" gate="1" pin="9"/>
</segment>
<segment>
<pinref part="G37" gate="G$1" pin="1"/>
<wire x1="132.08" y1="45.72" x2="139.7" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH37" class="0">
<segment>
<wire x1="10.16" y1="86.36" x2="17.78" y2="86.36" width="0.1524" layer="91"/>
<label x="10.16" y="86.36" size="1.778" layer="95"/>
<pinref part="SV5" gate="1" pin="11"/>
</segment>
<segment>
<pinref part="G38" gate="G$1" pin="1"/>
<wire x1="132.08" y1="33.02" x2="139.7" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH38" class="0">
<segment>
<wire x1="10.16" y1="83.82" x2="17.78" y2="83.82" width="0.1524" layer="91"/>
<label x="10.16" y="83.82" size="1.778" layer="95"/>
<pinref part="SV5" gate="1" pin="13"/>
</segment>
<segment>
<pinref part="G39" gate="G$1" pin="1"/>
<wire x1="132.08" y1="20.32" x2="139.7" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH39" class="0">
<segment>
<wire x1="10.16" y1="81.28" x2="17.78" y2="81.28" width="0.1524" layer="91"/>
<label x="10.16" y="81.28" size="1.778" layer="95"/>
<pinref part="SV5" gate="1" pin="15"/>
</segment>
<segment>
<pinref part="G40" gate="G$1" pin="1"/>
<wire x1="132.08" y1="7.62" x2="139.7" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH40" class="0">
<segment>
<wire x1="10.16" y1="71.12" x2="17.78" y2="71.12" width="0.1524" layer="91"/>
<label x="10.16" y="71.12" size="1.778" layer="95"/>
<pinref part="SV6" gate="1" pin="1"/>
</segment>
<segment>
<pinref part="G41" gate="G$1" pin="1"/>
<wire x1="157.48" y1="96.52" x2="165.1" y2="96.52" width="0.1524" layer="91"/>
<label x="157.48" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="CH41" class="0">
<segment>
<wire x1="10.16" y1="68.58" x2="17.78" y2="68.58" width="0.1524" layer="91"/>
<label x="10.16" y="68.58" size="1.778" layer="95"/>
<pinref part="SV6" gate="1" pin="3"/>
</segment>
<segment>
<pinref part="G42" gate="G$1" pin="1"/>
<wire x1="157.48" y1="83.82" x2="165.1" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH42" class="0">
<segment>
<wire x1="10.16" y1="66.04" x2="17.78" y2="66.04" width="0.1524" layer="91"/>
<label x="10.16" y="66.04" size="1.778" layer="95"/>
<pinref part="SV6" gate="1" pin="5"/>
</segment>
<segment>
<pinref part="G43" gate="G$1" pin="1"/>
<wire x1="157.48" y1="71.12" x2="165.1" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH43" class="0">
<segment>
<wire x1="10.16" y1="63.5" x2="17.78" y2="63.5" width="0.1524" layer="91"/>
<label x="10.16" y="63.5" size="1.778" layer="95"/>
<pinref part="SV6" gate="1" pin="7"/>
</segment>
<segment>
<pinref part="G44" gate="G$1" pin="1"/>
<wire x1="157.48" y1="58.42" x2="165.1" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH44" class="0">
<segment>
<wire x1="10.16" y1="60.96" x2="17.78" y2="60.96" width="0.1524" layer="91"/>
<label x="10.16" y="60.96" size="1.778" layer="95"/>
<pinref part="SV6" gate="1" pin="9"/>
</segment>
<segment>
<pinref part="G45" gate="G$1" pin="1"/>
<wire x1="157.48" y1="45.72" x2="165.1" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH45" class="0">
<segment>
<wire x1="10.16" y1="58.42" x2="17.78" y2="58.42" width="0.1524" layer="91"/>
<label x="10.16" y="58.42" size="1.778" layer="95"/>
<pinref part="SV6" gate="1" pin="11"/>
</segment>
<segment>
<pinref part="G46" gate="G$1" pin="1"/>
<wire x1="157.48" y1="33.02" x2="165.1" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH46" class="0">
<segment>
<wire x1="10.16" y1="55.88" x2="17.78" y2="55.88" width="0.1524" layer="91"/>
<label x="10.16" y="55.88" size="1.778" layer="95"/>
<pinref part="SV6" gate="1" pin="13"/>
</segment>
<segment>
<pinref part="G47" gate="G$1" pin="1"/>
<wire x1="157.48" y1="20.32" x2="165.1" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH47" class="0">
<segment>
<wire x1="10.16" y1="53.34" x2="17.78" y2="53.34" width="0.1524" layer="91"/>
<label x="10.16" y="53.34" size="1.778" layer="95"/>
<pinref part="SV6" gate="1" pin="15"/>
</segment>
<segment>
<pinref part="G48" gate="G$1" pin="1"/>
<wire x1="157.48" y1="7.62" x2="165.1" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH48" class="0">
<segment>
<wire x1="10.16" y1="43.18" x2="17.78" y2="43.18" width="0.1524" layer="91"/>
<label x="10.16" y="43.18" size="1.778" layer="95"/>
<pinref part="SV7" gate="1" pin="1"/>
</segment>
<segment>
<pinref part="G49" gate="G$1" pin="1"/>
<wire x1="182.88" y1="96.52" x2="190.5" y2="96.52" width="0.1524" layer="91"/>
<label x="182.88" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="CH49" class="0">
<segment>
<wire x1="10.16" y1="40.64" x2="17.78" y2="40.64" width="0.1524" layer="91"/>
<label x="10.16" y="40.64" size="1.778" layer="95"/>
<pinref part="SV7" gate="1" pin="3"/>
</segment>
<segment>
<pinref part="G50" gate="G$1" pin="1"/>
<wire x1="182.88" y1="83.82" x2="190.5" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH50" class="0">
<segment>
<wire x1="10.16" y1="38.1" x2="17.78" y2="38.1" width="0.1524" layer="91"/>
<label x="10.16" y="38.1" size="1.778" layer="95"/>
<pinref part="SV7" gate="1" pin="5"/>
</segment>
<segment>
<pinref part="G51" gate="G$1" pin="1"/>
<wire x1="182.88" y1="71.12" x2="190.5" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH51" class="0">
<segment>
<wire x1="10.16" y1="35.56" x2="17.78" y2="35.56" width="0.1524" layer="91"/>
<label x="10.16" y="35.56" size="1.778" layer="95"/>
<pinref part="SV7" gate="1" pin="7"/>
</segment>
<segment>
<pinref part="G52" gate="G$1" pin="1"/>
<wire x1="182.88" y1="58.42" x2="190.5" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH52" class="0">
<segment>
<wire x1="10.16" y1="33.02" x2="17.78" y2="33.02" width="0.1524" layer="91"/>
<label x="10.16" y="33.02" size="1.778" layer="95"/>
<pinref part="SV7" gate="1" pin="9"/>
</segment>
<segment>
<pinref part="G53" gate="G$1" pin="1"/>
<wire x1="182.88" y1="45.72" x2="190.5" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH53" class="0">
<segment>
<wire x1="10.16" y1="30.48" x2="17.78" y2="30.48" width="0.1524" layer="91"/>
<label x="10.16" y="30.48" size="1.778" layer="95"/>
<pinref part="SV7" gate="1" pin="11"/>
</segment>
<segment>
<pinref part="G54" gate="G$1" pin="1"/>
<wire x1="182.88" y1="33.02" x2="190.5" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH54" class="0">
<segment>
<wire x1="10.16" y1="27.94" x2="17.78" y2="27.94" width="0.1524" layer="91"/>
<label x="10.16" y="27.94" size="1.778" layer="95"/>
<pinref part="SV7" gate="1" pin="13"/>
</segment>
<segment>
<pinref part="G55" gate="G$1" pin="1"/>
<wire x1="182.88" y1="20.32" x2="190.5" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH55" class="0">
<segment>
<wire x1="10.16" y1="25.4" x2="17.78" y2="25.4" width="0.1524" layer="91"/>
<label x="10.16" y="25.4" size="1.778" layer="95"/>
<pinref part="SV7" gate="1" pin="15"/>
</segment>
<segment>
<pinref part="G56" gate="G$1" pin="1"/>
<wire x1="182.88" y1="7.62" x2="190.5" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH56" class="0">
<segment>
<wire x1="10.16" y1="15.24" x2="17.78" y2="15.24" width="0.1524" layer="91"/>
<label x="10.16" y="15.24" size="1.778" layer="95"/>
<pinref part="SV8" gate="1" pin="1"/>
</segment>
<segment>
<pinref part="G57" gate="G$1" pin="1"/>
<wire x1="208.28" y1="96.52" x2="215.9" y2="96.52" width="0.1524" layer="91"/>
<label x="208.28" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="CH57" class="0">
<segment>
<wire x1="10.16" y1="12.7" x2="17.78" y2="12.7" width="0.1524" layer="91"/>
<label x="10.16" y="12.7" size="1.778" layer="95"/>
<pinref part="SV8" gate="1" pin="3"/>
</segment>
<segment>
<pinref part="G58" gate="G$1" pin="1"/>
<wire x1="208.28" y1="83.82" x2="215.9" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH58" class="0">
<segment>
<wire x1="10.16" y1="10.16" x2="17.78" y2="10.16" width="0.1524" layer="91"/>
<label x="10.16" y="10.16" size="1.778" layer="95"/>
<pinref part="SV8" gate="1" pin="5"/>
</segment>
<segment>
<pinref part="G59" gate="G$1" pin="1"/>
<wire x1="208.28" y1="71.12" x2="215.9" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH59" class="0">
<segment>
<wire x1="10.16" y1="7.62" x2="17.78" y2="7.62" width="0.1524" layer="91"/>
<label x="10.16" y="7.62" size="1.778" layer="95"/>
<pinref part="SV8" gate="1" pin="7"/>
</segment>
<segment>
<pinref part="G60" gate="G$1" pin="1"/>
<wire x1="208.28" y1="58.42" x2="215.9" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH60" class="0">
<segment>
<wire x1="10.16" y1="5.08" x2="17.78" y2="5.08" width="0.1524" layer="91"/>
<label x="10.16" y="5.08" size="1.778" layer="95"/>
<pinref part="SV8" gate="1" pin="9"/>
</segment>
<segment>
<pinref part="G61" gate="G$1" pin="1"/>
<wire x1="208.28" y1="45.72" x2="215.9" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH61" class="0">
<segment>
<wire x1="10.16" y1="2.54" x2="17.78" y2="2.54" width="0.1524" layer="91"/>
<label x="10.16" y="2.54" size="1.778" layer="95"/>
<pinref part="SV8" gate="1" pin="11"/>
</segment>
<segment>
<pinref part="G62" gate="G$1" pin="1"/>
<wire x1="208.28" y1="33.02" x2="215.9" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH62" class="0">
<segment>
<wire x1="10.16" y1="0" x2="17.78" y2="0" width="0.1524" layer="91"/>
<label x="10.16" y="0" size="1.778" layer="95"/>
<pinref part="SV8" gate="1" pin="13"/>
</segment>
<segment>
<pinref part="G63" gate="G$1" pin="1"/>
<wire x1="208.28" y1="20.32" x2="215.9" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CH63" class="0">
<segment>
<wire x1="10.16" y1="-2.54" x2="17.78" y2="-2.54" width="0.1524" layer="91"/>
<label x="10.16" y="-2.54" size="1.778" layer="95"/>
<pinref part="SV8" gate="1" pin="15"/>
</segment>
<segment>
<pinref part="G64" gate="G$1" pin="1"/>
<wire x1="208.28" y1="7.62" x2="215.9" y2="7.62" width="0.1524" layer="91"/>
<label x="208.28" y="7.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<wire x1="-5.08" y1="0" x2="-10.16" y2="0" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="0" x2="-10.16" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="-2.54" x2="-10.16" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="5.08" x2="-10.16" y2="5.08" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="5.08" x2="-10.16" y2="2.54" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="2.54" x2="-10.16" y2="2.54" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="10.16" x2="-10.16" y2="10.16" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="10.16" x2="-10.16" y2="7.62" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="7.62" x2="-10.16" y2="7.62" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="15.24" x2="-10.16" y2="15.24" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="15.24" x2="-10.16" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="12.7" x2="-10.16" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="10.16" x2="-10.16" y2="12.7" width="0.1524" layer="91"/>
<junction x="-10.16" y="10.16"/>
<junction x="-10.16" y="12.7"/>
<wire x1="-10.16" y1="5.08" x2="-10.16" y2="7.62" width="0.1524" layer="91"/>
<junction x="-10.16" y="5.08"/>
<junction x="-10.16" y="7.62"/>
<wire x1="-10.16" y1="0" x2="-10.16" y2="2.54" width="0.1524" layer="91"/>
<junction x="-10.16" y="0"/>
<junction x="-10.16" y="2.54"/>
<wire x1="-10.16" y1="-2.54" x2="-10.16" y2="-5.08" width="0.1524" layer="91"/>
<junction x="-10.16" y="-2.54"/>
<pinref part="GND1" gate="1" pin="GND"/>
<pinref part="SV8" gate="1" pin="2"/>
<pinref part="SV8" gate="1" pin="4"/>
<pinref part="SV8" gate="1" pin="6"/>
<pinref part="SV8" gate="1" pin="8"/>
<pinref part="SV8" gate="1" pin="10"/>
<pinref part="SV8" gate="1" pin="12"/>
<pinref part="SV8" gate="1" pin="14"/>
<pinref part="SV8" gate="1" pin="16"/>
</segment>
<segment>
<pinref part="G1" gate="G$1" pin="2"/>
<wire x1="48.26" y1="96.52" x2="50.8" y2="96.52" width="0.1524" layer="91"/>
<wire x1="50.8" y1="96.52" x2="50.8" y2="83.82" width="0.1524" layer="91"/>
<pinref part="G2" gate="G$1" pin="2"/>
<wire x1="50.8" y1="83.82" x2="48.26" y2="83.82" width="0.1524" layer="91"/>
<wire x1="50.8" y1="83.82" x2="50.8" y2="71.12" width="0.1524" layer="91"/>
<junction x="50.8" y="83.82"/>
<pinref part="G3" gate="G$1" pin="2"/>
<wire x1="50.8" y1="71.12" x2="48.26" y2="71.12" width="0.1524" layer="91"/>
<wire x1="50.8" y1="71.12" x2="50.8" y2="58.42" width="0.1524" layer="91"/>
<junction x="50.8" y="71.12"/>
<pinref part="G4" gate="G$1" pin="2"/>
<wire x1="50.8" y1="58.42" x2="48.26" y2="58.42" width="0.1524" layer="91"/>
<wire x1="50.8" y1="58.42" x2="50.8" y2="45.72" width="0.1524" layer="91"/>
<junction x="50.8" y="58.42"/>
<pinref part="G5" gate="G$1" pin="2"/>
<wire x1="50.8" y1="45.72" x2="48.26" y2="45.72" width="0.1524" layer="91"/>
<wire x1="50.8" y1="45.72" x2="50.8" y2="33.02" width="0.1524" layer="91"/>
<junction x="50.8" y="45.72"/>
<pinref part="G6" gate="G$1" pin="2"/>
<wire x1="50.8" y1="33.02" x2="48.26" y2="33.02" width="0.1524" layer="91"/>
<wire x1="50.8" y1="33.02" x2="50.8" y2="20.32" width="0.1524" layer="91"/>
<junction x="50.8" y="33.02"/>
<pinref part="G7" gate="G$1" pin="2"/>
<wire x1="50.8" y1="20.32" x2="48.26" y2="20.32" width="0.1524" layer="91"/>
<wire x1="50.8" y1="20.32" x2="50.8" y2="7.62" width="0.1524" layer="91"/>
<junction x="50.8" y="20.32"/>
<pinref part="G8" gate="G$1" pin="2"/>
<wire x1="50.8" y1="7.62" x2="48.26" y2="7.62" width="0.1524" layer="91"/>
<wire x1="50.8" y1="7.62" x2="50.8" y2="2.54" width="0.1524" layer="91"/>
<junction x="50.8" y="7.62"/>
<pinref part="GND2" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="G9" gate="G$1" pin="2"/>
<wire x1="73.66" y1="96.52" x2="76.2" y2="96.52" width="0.1524" layer="91"/>
<wire x1="76.2" y1="96.52" x2="76.2" y2="83.82" width="0.1524" layer="91"/>
<pinref part="G10" gate="G$1" pin="2"/>
<wire x1="76.2" y1="83.82" x2="73.66" y2="83.82" width="0.1524" layer="91"/>
<wire x1="76.2" y1="83.82" x2="76.2" y2="71.12" width="0.1524" layer="91"/>
<junction x="76.2" y="83.82"/>
<pinref part="G11" gate="G$1" pin="2"/>
<wire x1="76.2" y1="71.12" x2="73.66" y2="71.12" width="0.1524" layer="91"/>
<wire x1="76.2" y1="71.12" x2="76.2" y2="58.42" width="0.1524" layer="91"/>
<junction x="76.2" y="71.12"/>
<pinref part="G12" gate="G$1" pin="2"/>
<wire x1="76.2" y1="58.42" x2="73.66" y2="58.42" width="0.1524" layer="91"/>
<wire x1="76.2" y1="58.42" x2="76.2" y2="45.72" width="0.1524" layer="91"/>
<junction x="76.2" y="58.42"/>
<pinref part="G13" gate="G$1" pin="2"/>
<wire x1="76.2" y1="45.72" x2="73.66" y2="45.72" width="0.1524" layer="91"/>
<wire x1="76.2" y1="45.72" x2="76.2" y2="33.02" width="0.1524" layer="91"/>
<junction x="76.2" y="45.72"/>
<pinref part="G14" gate="G$1" pin="2"/>
<wire x1="76.2" y1="33.02" x2="73.66" y2="33.02" width="0.1524" layer="91"/>
<wire x1="76.2" y1="33.02" x2="76.2" y2="20.32" width="0.1524" layer="91"/>
<junction x="76.2" y="33.02"/>
<pinref part="G15" gate="G$1" pin="2"/>
<wire x1="76.2" y1="20.32" x2="73.66" y2="20.32" width="0.1524" layer="91"/>
<wire x1="76.2" y1="20.32" x2="76.2" y2="7.62" width="0.1524" layer="91"/>
<junction x="76.2" y="20.32"/>
<pinref part="G16" gate="G$1" pin="2"/>
<wire x1="76.2" y1="7.62" x2="73.66" y2="7.62" width="0.1524" layer="91"/>
<wire x1="76.2" y1="7.62" x2="76.2" y2="2.54" width="0.1524" layer="91"/>
<junction x="76.2" y="7.62"/>
<pinref part="GND3" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="G17" gate="G$1" pin="2"/>
<wire x1="99.06" y1="96.52" x2="101.6" y2="96.52" width="0.1524" layer="91"/>
<wire x1="101.6" y1="96.52" x2="101.6" y2="83.82" width="0.1524" layer="91"/>
<pinref part="G18" gate="G$1" pin="2"/>
<wire x1="101.6" y1="83.82" x2="99.06" y2="83.82" width="0.1524" layer="91"/>
<wire x1="101.6" y1="83.82" x2="101.6" y2="71.12" width="0.1524" layer="91"/>
<junction x="101.6" y="83.82"/>
<pinref part="G19" gate="G$1" pin="2"/>
<wire x1="101.6" y1="71.12" x2="99.06" y2="71.12" width="0.1524" layer="91"/>
<wire x1="101.6" y1="71.12" x2="101.6" y2="58.42" width="0.1524" layer="91"/>
<junction x="101.6" y="71.12"/>
<pinref part="G20" gate="G$1" pin="2"/>
<wire x1="101.6" y1="58.42" x2="99.06" y2="58.42" width="0.1524" layer="91"/>
<wire x1="101.6" y1="58.42" x2="101.6" y2="45.72" width="0.1524" layer="91"/>
<junction x="101.6" y="58.42"/>
<pinref part="G21" gate="G$1" pin="2"/>
<wire x1="101.6" y1="45.72" x2="99.06" y2="45.72" width="0.1524" layer="91"/>
<wire x1="101.6" y1="45.72" x2="101.6" y2="33.02" width="0.1524" layer="91"/>
<junction x="101.6" y="45.72"/>
<pinref part="G22" gate="G$1" pin="2"/>
<wire x1="101.6" y1="33.02" x2="99.06" y2="33.02" width="0.1524" layer="91"/>
<wire x1="101.6" y1="33.02" x2="101.6" y2="20.32" width="0.1524" layer="91"/>
<junction x="101.6" y="33.02"/>
<pinref part="G23" gate="G$1" pin="2"/>
<wire x1="101.6" y1="20.32" x2="99.06" y2="20.32" width="0.1524" layer="91"/>
<wire x1="101.6" y1="20.32" x2="101.6" y2="7.62" width="0.1524" layer="91"/>
<junction x="101.6" y="20.32"/>
<pinref part="G24" gate="G$1" pin="2"/>
<wire x1="101.6" y1="7.62" x2="99.06" y2="7.62" width="0.1524" layer="91"/>
<wire x1="101.6" y1="7.62" x2="101.6" y2="2.54" width="0.1524" layer="91"/>
<junction x="101.6" y="7.62"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="G25" gate="G$1" pin="2"/>
<wire x1="124.46" y1="96.52" x2="127" y2="96.52" width="0.1524" layer="91"/>
<wire x1="127" y1="96.52" x2="127" y2="83.82" width="0.1524" layer="91"/>
<pinref part="G26" gate="G$1" pin="2"/>
<wire x1="127" y1="83.82" x2="124.46" y2="83.82" width="0.1524" layer="91"/>
<wire x1="127" y1="83.82" x2="127" y2="71.12" width="0.1524" layer="91"/>
<junction x="127" y="83.82"/>
<pinref part="G27" gate="G$1" pin="2"/>
<wire x1="127" y1="71.12" x2="124.46" y2="71.12" width="0.1524" layer="91"/>
<wire x1="127" y1="71.12" x2="127" y2="58.42" width="0.1524" layer="91"/>
<junction x="127" y="71.12"/>
<pinref part="G28" gate="G$1" pin="2"/>
<wire x1="127" y1="58.42" x2="124.46" y2="58.42" width="0.1524" layer="91"/>
<wire x1="127" y1="58.42" x2="127" y2="45.72" width="0.1524" layer="91"/>
<junction x="127" y="58.42"/>
<pinref part="G29" gate="G$1" pin="2"/>
<wire x1="127" y1="45.72" x2="124.46" y2="45.72" width="0.1524" layer="91"/>
<wire x1="127" y1="45.72" x2="127" y2="33.02" width="0.1524" layer="91"/>
<junction x="127" y="45.72"/>
<pinref part="G30" gate="G$1" pin="2"/>
<wire x1="127" y1="33.02" x2="124.46" y2="33.02" width="0.1524" layer="91"/>
<wire x1="127" y1="33.02" x2="127" y2="20.32" width="0.1524" layer="91"/>
<junction x="127" y="33.02"/>
<pinref part="G31" gate="G$1" pin="2"/>
<wire x1="127" y1="20.32" x2="124.46" y2="20.32" width="0.1524" layer="91"/>
<wire x1="127" y1="20.32" x2="127" y2="7.62" width="0.1524" layer="91"/>
<junction x="127" y="20.32"/>
<pinref part="G32" gate="G$1" pin="2"/>
<wire x1="127" y1="7.62" x2="124.46" y2="7.62" width="0.1524" layer="91"/>
<wire x1="127" y1="7.62" x2="127" y2="2.54" width="0.1524" layer="91"/>
<junction x="127" y="7.62"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="G33" gate="G$1" pin="2"/>
<wire x1="149.86" y1="96.52" x2="152.4" y2="96.52" width="0.1524" layer="91"/>
<wire x1="152.4" y1="96.52" x2="152.4" y2="83.82" width="0.1524" layer="91"/>
<pinref part="G34" gate="G$1" pin="2"/>
<wire x1="152.4" y1="83.82" x2="149.86" y2="83.82" width="0.1524" layer="91"/>
<wire x1="152.4" y1="83.82" x2="152.4" y2="71.12" width="0.1524" layer="91"/>
<junction x="152.4" y="83.82"/>
<pinref part="G35" gate="G$1" pin="2"/>
<wire x1="152.4" y1="71.12" x2="149.86" y2="71.12" width="0.1524" layer="91"/>
<wire x1="152.4" y1="71.12" x2="152.4" y2="58.42" width="0.1524" layer="91"/>
<junction x="152.4" y="71.12"/>
<pinref part="G36" gate="G$1" pin="2"/>
<wire x1="152.4" y1="58.42" x2="149.86" y2="58.42" width="0.1524" layer="91"/>
<wire x1="152.4" y1="58.42" x2="152.4" y2="45.72" width="0.1524" layer="91"/>
<junction x="152.4" y="58.42"/>
<pinref part="G37" gate="G$1" pin="2"/>
<wire x1="152.4" y1="45.72" x2="149.86" y2="45.72" width="0.1524" layer="91"/>
<wire x1="152.4" y1="45.72" x2="152.4" y2="33.02" width="0.1524" layer="91"/>
<junction x="152.4" y="45.72"/>
<pinref part="G38" gate="G$1" pin="2"/>
<wire x1="152.4" y1="33.02" x2="149.86" y2="33.02" width="0.1524" layer="91"/>
<wire x1="152.4" y1="33.02" x2="152.4" y2="20.32" width="0.1524" layer="91"/>
<junction x="152.4" y="33.02"/>
<pinref part="G39" gate="G$1" pin="2"/>
<wire x1="152.4" y1="20.32" x2="149.86" y2="20.32" width="0.1524" layer="91"/>
<wire x1="152.4" y1="20.32" x2="152.4" y2="7.62" width="0.1524" layer="91"/>
<junction x="152.4" y="20.32"/>
<pinref part="G40" gate="G$1" pin="2"/>
<wire x1="152.4" y1="7.62" x2="149.86" y2="7.62" width="0.1524" layer="91"/>
<wire x1="152.4" y1="7.62" x2="152.4" y2="2.54" width="0.1524" layer="91"/>
<junction x="152.4" y="7.62"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="G41" gate="G$1" pin="2"/>
<wire x1="175.26" y1="96.52" x2="177.8" y2="96.52" width="0.1524" layer="91"/>
<wire x1="177.8" y1="96.52" x2="177.8" y2="83.82" width="0.1524" layer="91"/>
<pinref part="G42" gate="G$1" pin="2"/>
<wire x1="177.8" y1="83.82" x2="175.26" y2="83.82" width="0.1524" layer="91"/>
<wire x1="177.8" y1="83.82" x2="177.8" y2="71.12" width="0.1524" layer="91"/>
<junction x="177.8" y="83.82"/>
<pinref part="G43" gate="G$1" pin="2"/>
<wire x1="177.8" y1="71.12" x2="175.26" y2="71.12" width="0.1524" layer="91"/>
<wire x1="177.8" y1="71.12" x2="177.8" y2="58.42" width="0.1524" layer="91"/>
<junction x="177.8" y="71.12"/>
<pinref part="G44" gate="G$1" pin="2"/>
<wire x1="177.8" y1="58.42" x2="175.26" y2="58.42" width="0.1524" layer="91"/>
<wire x1="177.8" y1="58.42" x2="177.8" y2="45.72" width="0.1524" layer="91"/>
<junction x="177.8" y="58.42"/>
<pinref part="G45" gate="G$1" pin="2"/>
<wire x1="177.8" y1="45.72" x2="175.26" y2="45.72" width="0.1524" layer="91"/>
<wire x1="177.8" y1="45.72" x2="177.8" y2="33.02" width="0.1524" layer="91"/>
<junction x="177.8" y="45.72"/>
<pinref part="G46" gate="G$1" pin="2"/>
<wire x1="177.8" y1="33.02" x2="175.26" y2="33.02" width="0.1524" layer="91"/>
<wire x1="177.8" y1="33.02" x2="177.8" y2="20.32" width="0.1524" layer="91"/>
<junction x="177.8" y="33.02"/>
<pinref part="G47" gate="G$1" pin="2"/>
<wire x1="177.8" y1="20.32" x2="175.26" y2="20.32" width="0.1524" layer="91"/>
<wire x1="177.8" y1="20.32" x2="177.8" y2="7.62" width="0.1524" layer="91"/>
<junction x="177.8" y="20.32"/>
<pinref part="G48" gate="G$1" pin="2"/>
<wire x1="177.8" y1="7.62" x2="175.26" y2="7.62" width="0.1524" layer="91"/>
<wire x1="177.8" y1="7.62" x2="177.8" y2="2.54" width="0.1524" layer="91"/>
<junction x="177.8" y="7.62"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="G49" gate="G$1" pin="2"/>
<wire x1="200.66" y1="96.52" x2="203.2" y2="96.52" width="0.1524" layer="91"/>
<wire x1="203.2" y1="96.52" x2="203.2" y2="83.82" width="0.1524" layer="91"/>
<pinref part="G50" gate="G$1" pin="2"/>
<wire x1="203.2" y1="83.82" x2="200.66" y2="83.82" width="0.1524" layer="91"/>
<wire x1="203.2" y1="83.82" x2="203.2" y2="71.12" width="0.1524" layer="91"/>
<junction x="203.2" y="83.82"/>
<pinref part="G51" gate="G$1" pin="2"/>
<wire x1="203.2" y1="71.12" x2="200.66" y2="71.12" width="0.1524" layer="91"/>
<wire x1="203.2" y1="71.12" x2="203.2" y2="58.42" width="0.1524" layer="91"/>
<junction x="203.2" y="71.12"/>
<pinref part="G52" gate="G$1" pin="2"/>
<wire x1="203.2" y1="58.42" x2="200.66" y2="58.42" width="0.1524" layer="91"/>
<wire x1="203.2" y1="58.42" x2="203.2" y2="45.72" width="0.1524" layer="91"/>
<junction x="203.2" y="58.42"/>
<pinref part="G53" gate="G$1" pin="2"/>
<wire x1="203.2" y1="45.72" x2="200.66" y2="45.72" width="0.1524" layer="91"/>
<wire x1="203.2" y1="45.72" x2="203.2" y2="33.02" width="0.1524" layer="91"/>
<junction x="203.2" y="45.72"/>
<pinref part="G54" gate="G$1" pin="2"/>
<wire x1="203.2" y1="33.02" x2="200.66" y2="33.02" width="0.1524" layer="91"/>
<wire x1="203.2" y1="33.02" x2="203.2" y2="20.32" width="0.1524" layer="91"/>
<junction x="203.2" y="33.02"/>
<pinref part="G55" gate="G$1" pin="2"/>
<wire x1="203.2" y1="20.32" x2="200.66" y2="20.32" width="0.1524" layer="91"/>
<wire x1="203.2" y1="20.32" x2="203.2" y2="7.62" width="0.1524" layer="91"/>
<junction x="203.2" y="20.32"/>
<pinref part="G56" gate="G$1" pin="2"/>
<wire x1="203.2" y1="7.62" x2="200.66" y2="7.62" width="0.1524" layer="91"/>
<wire x1="203.2" y1="7.62" x2="203.2" y2="2.54" width="0.1524" layer="91"/>
<junction x="203.2" y="7.62"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="G57" gate="G$1" pin="2"/>
<wire x1="226.06" y1="96.52" x2="228.6" y2="96.52" width="0.1524" layer="91"/>
<wire x1="228.6" y1="96.52" x2="228.6" y2="83.82" width="0.1524" layer="91"/>
<pinref part="G58" gate="G$1" pin="2"/>
<wire x1="228.6" y1="83.82" x2="226.06" y2="83.82" width="0.1524" layer="91"/>
<wire x1="228.6" y1="83.82" x2="228.6" y2="71.12" width="0.1524" layer="91"/>
<junction x="228.6" y="83.82"/>
<pinref part="G59" gate="G$1" pin="2"/>
<wire x1="228.6" y1="71.12" x2="226.06" y2="71.12" width="0.1524" layer="91"/>
<wire x1="228.6" y1="71.12" x2="228.6" y2="58.42" width="0.1524" layer="91"/>
<junction x="228.6" y="71.12"/>
<pinref part="G60" gate="G$1" pin="2"/>
<wire x1="228.6" y1="58.42" x2="226.06" y2="58.42" width="0.1524" layer="91"/>
<wire x1="228.6" y1="58.42" x2="228.6" y2="45.72" width="0.1524" layer="91"/>
<junction x="228.6" y="58.42"/>
<pinref part="G61" gate="G$1" pin="2"/>
<wire x1="228.6" y1="45.72" x2="226.06" y2="45.72" width="0.1524" layer="91"/>
<wire x1="228.6" y1="45.72" x2="228.6" y2="33.02" width="0.1524" layer="91"/>
<junction x="228.6" y="45.72"/>
<pinref part="G62" gate="G$1" pin="2"/>
<wire x1="228.6" y1="33.02" x2="226.06" y2="33.02" width="0.1524" layer="91"/>
<wire x1="228.6" y1="33.02" x2="228.6" y2="20.32" width="0.1524" layer="91"/>
<junction x="228.6" y="33.02"/>
<pinref part="G63" gate="G$1" pin="2"/>
<wire x1="228.6" y1="20.32" x2="226.06" y2="20.32" width="0.1524" layer="91"/>
<wire x1="228.6" y1="20.32" x2="228.6" y2="7.62" width="0.1524" layer="91"/>
<junction x="228.6" y="20.32"/>
<pinref part="G64" gate="G$1" pin="2"/>
<wire x1="228.6" y1="7.62" x2="226.06" y2="7.62" width="0.1524" layer="91"/>
<wire x1="228.6" y1="7.62" x2="228.6" y2="2.54" width="0.1524" layer="91"/>
<junction x="228.6" y="7.62"/>
<pinref part="GND9" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="-38.1" y1="99.06" x2="-43.18" y2="99.06" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="99.06" x2="-43.18" y2="96.52" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="96.52" x2="-43.18" y2="96.52" width="0.1524" layer="91"/>
<junction x="-43.18" y="96.52"/>
<wire x1="-38.1" y1="93.98" x2="-43.18" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="93.98" x2="-43.18" y2="96.52" width="0.1524" layer="91"/>
<junction x="-43.18" y="93.98"/>
<wire x1="-43.18" y1="93.98" x2="-43.18" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="91.44" x2="-43.18" y2="91.44" width="0.1524" layer="91"/>
<junction x="-43.18" y="91.44"/>
<wire x1="-38.1" y1="88.9" x2="-43.18" y2="88.9" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="88.9" x2="-43.18" y2="91.44" width="0.1524" layer="91"/>
<junction x="-43.18" y="88.9"/>
<wire x1="-43.18" y1="88.9" x2="-43.18" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="86.36" x2="-43.18" y2="86.36" width="0.1524" layer="91"/>
<junction x="-43.18" y="86.36"/>
<wire x1="-38.1" y1="83.82" x2="-43.18" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="83.82" x2="-43.18" y2="86.36" width="0.1524" layer="91"/>
<junction x="-43.18" y="83.82"/>
<wire x1="-43.18" y1="83.82" x2="-43.18" y2="81.28" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="81.28" x2="-43.18" y2="81.28" width="0.1524" layer="91"/>
<pinref part="SV1" gate="1" pin="2"/>
<pinref part="SV1" gate="1" pin="4"/>
<pinref part="SV1" gate="1" pin="6"/>
<pinref part="SV1" gate="1" pin="8"/>
<pinref part="SV1" gate="1" pin="10"/>
<pinref part="SV1" gate="1" pin="12"/>
<pinref part="SV1" gate="1" pin="14"/>
<pinref part="SV1" gate="1" pin="16"/>
<pinref part="GND15" gate="1" pin="GND"/>
<wire x1="-43.18" y1="78.74" x2="-43.18" y2="81.28" width="0.1524" layer="91"/>
<junction x="-43.18" y="81.28"/>
</segment>
<segment>
<pinref part="SV5" gate="1" pin="4"/>
<wire x1="-5.08" y1="96.52" x2="-10.16" y2="96.52" width="0.1524" layer="91"/>
<pinref part="SV5" gate="1" pin="8"/>
<wire x1="-5.08" y1="91.44" x2="-10.16" y2="91.44" width="0.1524" layer="91"/>
<pinref part="SV5" gate="1" pin="12"/>
<wire x1="-5.08" y1="86.36" x2="-10.16" y2="86.36" width="0.1524" layer="91"/>
<pinref part="SV5" gate="1" pin="16"/>
<wire x1="-5.08" y1="81.28" x2="-10.16" y2="81.28" width="0.1524" layer="91"/>
<pinref part="SV5" gate="1" pin="14"/>
<wire x1="-5.08" y1="83.82" x2="-10.16" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="83.82" x2="-10.16" y2="81.28" width="0.1524" layer="91"/>
<junction x="-10.16" y="83.82"/>
<wire x1="-10.16" y1="83.82" x2="-10.16" y2="86.36" width="0.1524" layer="91"/>
<junction x="-10.16" y="86.36"/>
<pinref part="SV5" gate="1" pin="10"/>
<wire x1="-5.08" y1="88.9" x2="-10.16" y2="88.9" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="88.9" x2="-10.16" y2="86.36" width="0.1524" layer="91"/>
<junction x="-10.16" y="88.9"/>
<wire x1="-10.16" y1="88.9" x2="-10.16" y2="91.44" width="0.1524" layer="91"/>
<junction x="-10.16" y="91.44"/>
<pinref part="SV5" gate="1" pin="6"/>
<wire x1="-5.08" y1="93.98" x2="-10.16" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="93.98" x2="-10.16" y2="91.44" width="0.1524" layer="91"/>
<junction x="-10.16" y="93.98"/>
<wire x1="-10.16" y1="93.98" x2="-10.16" y2="96.52" width="0.1524" layer="91"/>
<junction x="-10.16" y="96.52"/>
<wire x1="-10.16" y1="99.06" x2="-10.16" y2="96.52" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="99.06" x2="-10.16" y2="99.06" width="0.1524" layer="91"/>
<pinref part="SV5" gate="1" pin="2"/>
<pinref part="GND16" gate="1" pin="GND"/>
<wire x1="-10.16" y1="78.74" x2="-10.16" y2="81.28" width="0.1524" layer="91"/>
<junction x="-10.16" y="81.28"/>
</segment>
<segment>
<wire x1="-5.08" y1="68.58" x2="-10.16" y2="68.58" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="63.5" x2="-10.16" y2="63.5" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="58.42" x2="-10.16" y2="58.42" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="53.34" x2="-10.16" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="55.88" x2="-10.16" y2="55.88" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="55.88" x2="-10.16" y2="53.34" width="0.1524" layer="91"/>
<junction x="-10.16" y="55.88"/>
<wire x1="-10.16" y1="55.88" x2="-10.16" y2="58.42" width="0.1524" layer="91"/>
<junction x="-10.16" y="58.42"/>
<wire x1="-5.08" y1="60.96" x2="-10.16" y2="60.96" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="60.96" x2="-10.16" y2="58.42" width="0.1524" layer="91"/>
<junction x="-10.16" y="60.96"/>
<wire x1="-10.16" y1="60.96" x2="-10.16" y2="63.5" width="0.1524" layer="91"/>
<junction x="-10.16" y="63.5"/>
<wire x1="-5.08" y1="66.04" x2="-10.16" y2="66.04" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="66.04" x2="-10.16" y2="63.5" width="0.1524" layer="91"/>
<junction x="-10.16" y="66.04"/>
<wire x1="-10.16" y1="66.04" x2="-10.16" y2="68.58" width="0.1524" layer="91"/>
<junction x="-10.16" y="68.58"/>
<wire x1="-5.08" y1="71.12" x2="-10.16" y2="71.12" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="71.12" x2="-10.16" y2="68.58" width="0.1524" layer="91"/>
<pinref part="SV6" gate="1" pin="2"/>
<pinref part="SV6" gate="1" pin="4"/>
<pinref part="SV6" gate="1" pin="6"/>
<pinref part="SV6" gate="1" pin="8"/>
<pinref part="SV6" gate="1" pin="10"/>
<pinref part="SV6" gate="1" pin="12"/>
<pinref part="SV6" gate="1" pin="14"/>
<pinref part="SV6" gate="1" pin="16"/>
<pinref part="GND13" gate="1" pin="GND"/>
<wire x1="-10.16" y1="50.8" x2="-10.16" y2="53.34" width="0.1524" layer="91"/>
<junction x="-10.16" y="53.34"/>
</segment>
<segment>
<wire x1="-38.1" y1="71.12" x2="-43.18" y2="71.12" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="71.12" x2="-43.18" y2="68.58" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="68.58" x2="-43.18" y2="68.58" width="0.1524" layer="91"/>
<junction x="-43.18" y="68.58"/>
<wire x1="-38.1" y1="66.04" x2="-43.18" y2="66.04" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="66.04" x2="-43.18" y2="68.58" width="0.1524" layer="91"/>
<junction x="-43.18" y="66.04"/>
<wire x1="-43.18" y1="66.04" x2="-43.18" y2="63.5" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="63.5" x2="-43.18" y2="63.5" width="0.1524" layer="91"/>
<junction x="-43.18" y="63.5"/>
<wire x1="-38.1" y1="60.96" x2="-43.18" y2="60.96" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="60.96" x2="-43.18" y2="63.5" width="0.1524" layer="91"/>
<junction x="-43.18" y="60.96"/>
<wire x1="-43.18" y1="60.96" x2="-43.18" y2="58.42" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="58.42" x2="-43.18" y2="58.42" width="0.1524" layer="91"/>
<junction x="-43.18" y="58.42"/>
<wire x1="-38.1" y1="55.88" x2="-43.18" y2="55.88" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="55.88" x2="-43.18" y2="58.42" width="0.1524" layer="91"/>
<junction x="-43.18" y="55.88"/>
<wire x1="-43.18" y1="55.88" x2="-43.18" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="53.34" x2="-43.18" y2="53.34" width="0.1524" layer="91"/>
<pinref part="SV2" gate="1" pin="2"/>
<pinref part="SV2" gate="1" pin="4"/>
<pinref part="SV2" gate="1" pin="6"/>
<pinref part="SV2" gate="1" pin="8"/>
<pinref part="SV2" gate="1" pin="10"/>
<pinref part="SV2" gate="1" pin="12"/>
<pinref part="SV2" gate="1" pin="14"/>
<pinref part="SV2" gate="1" pin="16"/>
<pinref part="GND14" gate="1" pin="GND"/>
<wire x1="-43.18" y1="50.8" x2="-43.18" y2="53.34" width="0.1524" layer="91"/>
<junction x="-43.18" y="53.34"/>
</segment>
<segment>
<wire x1="-38.1" y1="43.18" x2="-43.18" y2="43.18" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="43.18" x2="-43.18" y2="40.64" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="40.64" x2="-43.18" y2="40.64" width="0.1524" layer="91"/>
<junction x="-43.18" y="40.64"/>
<wire x1="-38.1" y1="38.1" x2="-43.18" y2="38.1" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="38.1" x2="-43.18" y2="40.64" width="0.1524" layer="91"/>
<junction x="-43.18" y="38.1"/>
<wire x1="-43.18" y1="38.1" x2="-43.18" y2="35.56" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="35.56" x2="-43.18" y2="35.56" width="0.1524" layer="91"/>
<junction x="-43.18" y="35.56"/>
<wire x1="-38.1" y1="33.02" x2="-43.18" y2="33.02" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="33.02" x2="-43.18" y2="35.56" width="0.1524" layer="91"/>
<junction x="-43.18" y="33.02"/>
<wire x1="-43.18" y1="33.02" x2="-43.18" y2="30.48" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="30.48" x2="-43.18" y2="30.48" width="0.1524" layer="91"/>
<junction x="-43.18" y="30.48"/>
<wire x1="-38.1" y1="27.94" x2="-43.18" y2="27.94" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="27.94" x2="-43.18" y2="30.48" width="0.1524" layer="91"/>
<junction x="-43.18" y="27.94"/>
<wire x1="-43.18" y1="27.94" x2="-43.18" y2="25.4" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="25.4" x2="-43.18" y2="25.4" width="0.1524" layer="91"/>
<pinref part="SV3" gate="1" pin="2"/>
<pinref part="SV3" gate="1" pin="4"/>
<pinref part="SV3" gate="1" pin="6"/>
<pinref part="SV3" gate="1" pin="8"/>
<pinref part="SV3" gate="1" pin="10"/>
<pinref part="SV3" gate="1" pin="12"/>
<pinref part="SV3" gate="1" pin="14"/>
<pinref part="SV3" gate="1" pin="16"/>
<pinref part="GND11" gate="1" pin="GND"/>
<wire x1="-43.18" y1="22.86" x2="-43.18" y2="25.4" width="0.1524" layer="91"/>
<junction x="-43.18" y="25.4"/>
</segment>
<segment>
<pinref part="SV7" gate="1" pin="4"/>
<wire x1="-5.08" y1="40.64" x2="-10.16" y2="40.64" width="0.1524" layer="91"/>
<pinref part="SV7" gate="1" pin="8"/>
<wire x1="-5.08" y1="35.56" x2="-10.16" y2="35.56" width="0.1524" layer="91"/>
<pinref part="SV7" gate="1" pin="12"/>
<wire x1="-5.08" y1="30.48" x2="-10.16" y2="30.48" width="0.1524" layer="91"/>
<pinref part="SV7" gate="1" pin="16"/>
<wire x1="-5.08" y1="25.4" x2="-10.16" y2="25.4" width="0.1524" layer="91"/>
<pinref part="SV7" gate="1" pin="14"/>
<wire x1="-5.08" y1="27.94" x2="-10.16" y2="27.94" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="27.94" x2="-10.16" y2="25.4" width="0.1524" layer="91"/>
<junction x="-10.16" y="27.94"/>
<wire x1="-10.16" y1="27.94" x2="-10.16" y2="30.48" width="0.1524" layer="91"/>
<junction x="-10.16" y="30.48"/>
<pinref part="SV7" gate="1" pin="10"/>
<wire x1="-5.08" y1="33.02" x2="-10.16" y2="33.02" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="33.02" x2="-10.16" y2="30.48" width="0.1524" layer="91"/>
<junction x="-10.16" y="33.02"/>
<wire x1="-10.16" y1="33.02" x2="-10.16" y2="35.56" width="0.1524" layer="91"/>
<junction x="-10.16" y="35.56"/>
<pinref part="SV7" gate="1" pin="6"/>
<wire x1="-5.08" y1="38.1" x2="-10.16" y2="38.1" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="38.1" x2="-10.16" y2="35.56" width="0.1524" layer="91"/>
<junction x="-10.16" y="38.1"/>
<wire x1="-10.16" y1="38.1" x2="-10.16" y2="40.64" width="0.1524" layer="91"/>
<junction x="-10.16" y="40.64"/>
<wire x1="-10.16" y1="43.18" x2="-10.16" y2="40.64" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="43.18" x2="-10.16" y2="43.18" width="0.1524" layer="91"/>
<pinref part="SV7" gate="1" pin="2"/>
<pinref part="GND12" gate="1" pin="GND"/>
<wire x1="-10.16" y1="22.86" x2="-10.16" y2="25.4" width="0.1524" layer="91"/>
<junction x="-10.16" y="25.4"/>
</segment>
<segment>
<wire x1="-38.1" y1="15.24" x2="-43.18" y2="15.24" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="15.24" x2="-43.18" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="12.7" x2="-43.18" y2="12.7" width="0.1524" layer="91"/>
<junction x="-43.18" y="12.7"/>
<wire x1="-38.1" y1="10.16" x2="-43.18" y2="10.16" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="10.16" x2="-43.18" y2="12.7" width="0.1524" layer="91"/>
<junction x="-43.18" y="10.16"/>
<wire x1="-43.18" y1="10.16" x2="-43.18" y2="7.62" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="7.62" x2="-43.18" y2="7.62" width="0.1524" layer="91"/>
<junction x="-43.18" y="7.62"/>
<wire x1="-38.1" y1="5.08" x2="-43.18" y2="5.08" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="5.08" x2="-43.18" y2="7.62" width="0.1524" layer="91"/>
<junction x="-43.18" y="5.08"/>
<wire x1="-43.18" y1="5.08" x2="-43.18" y2="2.54" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="2.54" x2="-43.18" y2="2.54" width="0.1524" layer="91"/>
<junction x="-43.18" y="2.54"/>
<wire x1="-38.1" y1="-2.54" x2="-43.18" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="0" x2="-43.18" y2="0" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="0" x2="-43.18" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="0" x2="-43.18" y2="2.54" width="0.1524" layer="91"/>
<junction x="-43.18" y="0"/>
<pinref part="SV4" gate="1" pin="2"/>
<pinref part="SV4" gate="1" pin="4"/>
<pinref part="SV4" gate="1" pin="6"/>
<pinref part="SV4" gate="1" pin="8"/>
<pinref part="SV4" gate="1" pin="10"/>
<pinref part="SV4" gate="1" pin="12"/>
<pinref part="SV4" gate="1" pin="14"/>
<pinref part="SV4" gate="1" pin="16"/>
<pinref part="GND10" gate="1" pin="GND"/>
<wire x1="-43.18" y1="-5.08" x2="-43.18" y2="-2.54" width="0.1524" layer="91"/>
<junction x="-43.18" y="-2.54"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
