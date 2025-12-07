## Cable (and similar) Specifications

### USB
- https://en.wikipedia.org/wiki/USB_hardware

#### "Type" (A, B, C)
#### "Connector" (Standard, Micro, Mini)
#### Motherboard Headers

### HDMI
### DisplayPort
### HDR

### Ethernet
#### Ethernet Over Twisted-Pair Categories
- <https://en.wikipedia.org/wiki/Telecommunications_Industry_Association>
- <https://en.wikipedia.org/wiki/International_Organization_for_Standardization>
- <https://en.wikipedia.org/wiki/International_Electrotechnical_Commission>

Notes:

- Categories 5 and below are old and deprecated.
- Cat5e, Cat6, Cat6a, and Cat8 are standardized by the TIA.
- Category 7 and Category 8 are standardized by the ISO/IEC (Category 8.1/Category 8 Class I is compatible with the TIA's Cat8).

<table>
	<thead>
		<tr>
			<th>Category</th>
			<th>Minimum Supported Speed (up to length)</th>
			<th>Bandwidth</th>
			<th>Ratified in Year</th>
			<th>Notes</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Cat5e</td>
			<td>1Gbps (100m)</td>
			<td>100MHz</td>
			<td>2000</td>
			<td>Shielding not required.</td>
		</tr>
		<tr>
			<td>Cat6</td>
			<td>1Gbps (55m) / 10Gbps (100m)</td>
			<td>250MHz</td>
			<td>2002</td>
			<td>While not explicitly required, Cat6 and above will generally be shielded to meet speed and bandwidth requirements.</td>
		</tr>
		<tr>
			<td>Cat6a</td>
			<td>10Gbps (100m)</td>
			<td>500MHz</td>
			<td>2009</td>
			<td>n/a</td>
		</tr>
		<tr>
			<td>Cat7</td>
			<td>10Gbps (100m)</td>
			<td>600MHz</td>
			<td>2002</td>
			<td>Physically compatible with Ethernet 8P8C, but requires special connector for increased bandwidth/reduced noise. Shielding mandated.</td>
		</tr>
		<tr>
			<td>Cat8</td>
			<td>40Gbps (30m)</td>
			<td>2000MHz</td>
			<td>2016</td>
			<td>n/a</td>
		</tr>
	</tbody>
</table>

#### T568A versus T568B
- <https://en.wikipedia.org/wiki/ANSI/TIA-568#T568A_and_T568B_termination>
- <https://en.wikipedia.org/wiki/Ethernet_over_twisted_pair>
- T568A and T568B are wiring standards; i.e. which wire (by colour) goes to which pin (by order).
- They differ only by the layout/assignment of the green and orange pairs (on pins 1, 2, 3, and 6).
- For most purposes, it is only necessary that a cable uses the same layout on both ends, in which case T568A and T568B cables can be mixed interchangeably.
- T568A is more common in Europe and Australia.
- T568B is more common in North America and Asia.

#### RJ45 versus 8P8C
- <https://en.wikipedia.org/wiki/Modular_connector#8P8C>
- <https://en.wikipedia.org/wiki/Registered_jack#Similar_jacks_and_unofficial_names>
- Today, colloquially, RJ45 refers to the physical form factor of the Ethernet port.
- However, RJ45 originally referred to a specific wiring configuration of an 8P8C female port.
- 8P8C (8 position 8 contact) is the "proper" term for the physical form factor of an Ethernet port - consisting of a male plug and a female jack.

With the RJ45/8P8C jack pins facing up (clip down) and pointed away, numbering them 1 to 8 from left to right:

<table>
	<thead>
		<tr>
			<th>Standard</th>
			<th>Pin</th>
			<th>Colour</th>
			<th>Pair</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td rowspan="8">T568A</td>
			<td>1</td>
			<td>White/Green</td>
			<td>3</td>
		</tr>
		<tr>
			<td>2</td>
			<td>Green</td>
			<td>3</td>
		</tr>
		<tr>
			<td>3</td>
			<td>White/Orange</td>
			<td>2</td>
		</tr>
		<tr>
			<td>4</td>
			<td>Blue</td>
			<td>1</td>
		</tr>
		<tr>
			<td>5</td>
			<td>White/Blue</td>
			<td>1</td>
		</tr>
		<tr>
			<td>6</td>
			<td>Orange</td>
			<td>2</td>
		</tr>
		<tr>
			<td>7</td>
			<td>White/Brown</td>
			<td>4</td>
		</tr>
		<tr>
			<td>8</td>
			<td>Brown</td>
			<td>4</td>
		</tr>
		<tr>
			<td rowspan="8">T568B</td>
			<td>1</td>
			<td>White/Orange</td>
			<td>2</td>
		</tr>
		<tr>
			<td>2</td>
			<td>Orange</td>
			<td>2</td>
		</tr>
		<tr>
			<td>3</td>
			<td>White/Green</td>
			<td>3</td>
		</tr>
		<tr>
			<td>4</td>
			<td>Blue</td>
			<td>1</td>
		</tr>
		<tr>
			<td>5</td>
			<td>White/Blue</td>
			<td>1</td>
		</tr>
		<tr>
			<td>6</td>
			<td>Green</td>
			<td>3</td>
		</tr>
		<tr>
			<td>7</td>
			<td>White/Brown</td>
			<td>4</td>
		</tr>
		<tr>
			<td>8</td>
			<td>Brown</td>
			<td>4</td>
		</tr>
	</tbody>
</table>

### Wi-Fi
<table>
	<thead>
		<tr>
			<th>Generation</th>
			<th>IEEE Standard</th>
			<th>Year Adopted</th>
			<th>Frequency Bands (GHz)</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Wi-Fi 4</td>
			<td>802.11n</td>
			<td>2009</td>
			<td>2.4, 5</td>
		</tr>
		<tr>
			<td>Wi-Fi 5</td>
			<td>802.11ac</td>
			<td>2013</td>
			<td>5</td>
		</tr>
		<tr>
			<td>Wi-Fi 6</td>
			<td rowspan="2">802.11ax</td>
			<td rowspan="2">2021</td>
			<td>2.4, 5</td>
		</tr>
		<tr>
			<td>Wi-Fi 6e</td>
			<td>2.4, 5, 6</td>
		</tr>
		<tr>
			<td>Wi-Fi 7</td>
			<td>802.11be</td>
			<td>2024</td>
			<td>2.4, 5, 6</td>
		</tr>
	</tbody>
</table>

### NVMe (interface; e.g. versus SATA)
### M.2 (form factor; e.g. versus 2.5" SSD, 3.5" HDD)
### SATA (6.0, 2.5", 3.5"), IDE

### Qi Wireless Charging
