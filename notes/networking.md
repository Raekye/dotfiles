## Networking
Hmmm...

### Open Systems Interconnection/OSI Model
- <https://en.wikipedia.org/wiki/OSI_model>

Notes:

- While IP addresses are defined at layer 3, "ports" such as `80` in `ncat 127.0.0.1 80` (or `ncat --udp 127.0.0.1 80`) are part of TCP (and similarly UDP) in layer 4.

<table>
	<thead>
		<tr>
			<th colspan="2">Layer</th>
			<th>Unit of Data</th>
			<th>Function</th>
			<th>Example Usage</th>
			<th>Example Protocols</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>7</td>
			<td>Application</td>
			<td>Arbitrary data.</td>
			<td>Protocols implemented in user-space programs.</td>
			<td>World wide web, email, remote access.</td>
			<td>HTTP, SSH, DNS.</td>
		</tr>
		<tr>
			<td>6</td>
			<td>Presentation</td>
			<td>Arbitrary data.</td>
			<td>Translation between a networking service and an application, e.g. character encoding, compression, encryption, and byte ordering (endian-ness).</td>
			<td>Encryption, character encoding, compression, byte ordering (network order to host/application endianness).</td>
			<td>TLS/SSL (affects application semantics in 7), Base64, gzip.</td>
		</tr>
		<tr>
			<td>5</td>
			<td>Session</td>
			<td>Arbitrary data.</td>
			<td>Managing continuous communication "channels".</td>
			<td>n/a</td>
			<td>TLS session resumption, NetBIOS, SQL connections.</td>
		</tr>
		<tr>
			<td>4</td>
			<td>Transport</td>
			<td>Segment</td>
			<td>Reliable transmission.</td>
			<td>Segmentation, acknowledgment, multiplexing.</td>
			<td>TCP, UDP, QUIC (sits partly in 5 and 6), SCTP.</td>
		</tr>
		<tr>
			<td>3</td>
			<td>Network</td>
			<td>Packet, Datagram</td>
			<td>Managing a multi-node network.</td>
			<td>Addressing, routing, traffic control.</td>
			<td>IPv4, IPv6, ICMP, IPsec, OSPF, BGP, RIP.</td>
		</tr>
		<tr>
			<td>2</td>
			<td>Data Link</td>
			<td>Frame</td>
			<td>Transmission of frames between two physically connected nodes.</td>
			<td>Switches.</td>
			<td>Ethernet (MAC addresses), Wi-Fi (MAC addresses, association/authentication), VLAN, ARP.</td>
		</tr>
		<tr>
			<td>1</td>
			<td>Physical</td>
			<td>Bit, Symbol</td>
			<td>Transmission of raw bits over a physical medium.</td>
			<td>Electrical/optical/radio signaling.</td>
			<td>Ethernet (cabling), Wi-Fi (PHY radio), fiber optics.</td>
		</tr>
	</tbody>
</table>
