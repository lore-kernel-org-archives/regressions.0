Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch [185.125.25.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B26168BF
	for <regressions@lists.linux.dev>; Sat, 30 Sep 2023 17:06:52 +0000 (UTC)
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4RyYCN43x8zMq5nN;
	Sat, 30 Sep 2023 16:51:44 +0000 (UTC)
Received: from unknown by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4RyYCN0BNLzMpnPj;
	Sat, 30 Sep 2023 18:51:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=delahaye.me;
	s=20230709; t=1696092704;
	bh=BXS5iiqd4VGHYYHOAIWoL93F4pael3QF8CrkMzfCHLw=;
	h=Subject:From:To:Cc:Date:From;
	b=ZFq5+tzN+/ZVKdQLWNBvLerYJoOyjNZr4Xs34oq/CUBEEpPpwUCPUK8TqczlWu86p
	 cpGSx7bQMi1Cqcq1Of6dBsKPjNx0OF/1mhAN+Dk7nzvdi6Dqyun2TnXdz2w0LpK2LR
	 nljYtBojcTgB4kfIQwkPCGIOLpLu5xCrED1EwemBXbkjqq/wA+NFNpqC6jIt8gAIcP
	 zD0arDnL3ZyzWwxuO7DtMs42FPtFFP+o10+/MmdqP+NzuKXetCx4mT0RLyMKxOtfor
	 1f0JuG8rdfTmMu6UckBWIExi/BCrcJKTlDBqdcuDGrbT/TEOPwD9v+Z6piGIsc/AoW
	 pYo1kBbEm81GA==
Message-ID: <28df26a419a041f3c4f44c5e2a6697adbaee83f3.camel@delahaye.me>
Subject: [Kernel 6.5] Important read()/write() performance regression
From: Florent DELAHAYE <florent@delahaye.me>
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Date: Sat, 30 Sep 2023 18:51:43 +0200
Autocrypt: addr=florent@delahaye.me; prefer-encrypt=mutual;
 keydata=mQINBFiOKngBEADTLMfJdCgTqe1aHNZ09D3kFyMXx9UvKP25RbQUhzZdC7Z2YzRJImp/KXeuLtqRYONxzrmdVRnX4YvnohdE8NgvFnp4O6Jqn2VnkGj2ezl7tQgaVyMbl+frPQn39PgdeWWuhMrvYcVRSPAdKBulLp9W3zUshyVks6pVYImZfaqojCazuCj1kA1FVwt0VGbVUS4M1SER2EbCufbwIHbxFQVbHEGc6LTyOTJAPr44rEGapkQTdIC90gXFk7wO33vbJUaTi8wkMYLSiY4K2vAtYeqrmrauEn8plgV97gwuWx5DxIKp0J/Fgs5GsgbLFAssnNOxkatvlx+qWL8XYMlQ6dRpJdsAQ6C585vIfljvE6sI1WfvBM0jI9oPWxIK4Py4Nrq7SMRGGv9pyz7zxNgoW5aFiivxTvnESIW2ZAqr+G6AGVir3dj5HoQ05Rm+Y87tuqkFu1Vp8poiC33JUP/DvfgLxCryH6UTAU2QmTzVGBMxz3eSVS5qa5Y/ySLj11PG47LqN68nXjR/NcpkpYQXLZzz9JtVhppp8o5arQL1hK0u8rAlRUlddb6Whd0ErKRAnIE6JNyxWZAsftimkx/2hWCmoM9kM5RTQgwA0H1OZn/2zszWC3pXsuEKe9SzdAiOAQhwDbSh4b3aR6+O8EHpTz37EJLxZ079SeCNGvuID7jwfwARAQABtCZGbG9yZW50IERFTEFIQVlFIDxmbG9yZW50QGRlbGFoYXllLm1lPokCVAQTAQoAPhYhBCEQSCRTDLM0FBnp770r9ueawshnBQJdimV+AhsBBQkOYjwRBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEL0r9ueawshn6uQQAM6JERU6CC70AiFv7nz9PmDCYF7lRxS15EKI30HfXeRp+RriQMYeNsk6/pUqJRReYcCgz9zyEj4JE+E8B52mtX+CtvLRmRmbwurGs38G9CnrkWZkhQXoO
	e5F+woA0SX8+rBpixPbXrlBHv1PV4tYCet+P1lBFkcSPyWmskRbbpYiJV13MVxrFaEfQvGXIgdE9wzKtJIwEXOLZm7gUW6uLHHDtNZgo4CwJL371XD3vKwrEFOh4ptyMGaxYqN6nlWvc0+u9Zfnqo+0sCumP8DydNrAZ4KyTfzgo8YfChQE6/DHN9PTfNSREKhcUCar6GHAaI++v91EhkAsuvlP7Uiia4oH5ZPOBBKD7aDnWwIlZMjFt8AGJf0gDPmcg+yIS8MzF2GBMRt3zIS9hamRxF/+x8zBVK2DTIqt4zmKVde5pAWLV4N98m59HfvJKgiwXNoWc4Na61FA0FN39uqD+PTo9dm9a37JcnFrSXfoAjTQJ/aupwyS8z5FuWdDuLuqE0sLzvLC2Mu6HOh7aSEUaxQWWlBm3rvAa2n1YtYZ6yFxfyrlVnqjZsTTJp0DLBKUXfRQ2bXv42oC7WbooX1X0wU649DWPVODfWJScIsGh3i/unl8HEb/3aiKpeJa4frHunZzlrFq7Lmuybpoyx0E2lOqeF6XbqxPQOQdpeNsaQmbS+nV
Content-Type: multipart/mixed; boundary="=-DrlHVkYcn2cW/tGRM+JQ"
User-Agent: Evolution 3.50.0-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Infomaniak-Routing: alpha

--=-DrlHVkYcn2cW/tGRM+JQ
Content-Type: multipart/alternative; boundary="=-JJGbiRLkDVIoDmRiIMDR"

--=-JJGbiRLkDVIoDmRiIMDR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello guys,

During the last few months, I felt a performance regression when using
read() and write() on my high-speed Nvme SSD (about 7GB/s).

To get more precise information about it I quickly developed benchmark
tool basically running read() or write() in a loop to simulate a
sequential file read or write. The tool also measures the real time
consumed by the loop. Finally, the tool can call open() with or without
O_DIRECT.

I ran the tests on EXT4 and Exfat with following settings (buffer
values have been set for best result):
- Write settings: buffer 400mb * 100
- Read settings: buffer 200mb
- Drop caches before non-direct read/write test

With this hardware:
- CPU AMD Ryzen 7600X
- RAM DDR5 5200 32GB
- SSD Kingston Fury Renegade 4TB with 4K LBA


Here are some results I got with last upstream kernels (default
config):

~42GB O_DIRECT Linux 6.2.0 Linux 6.3.0 Linux 6.4.0 Linux 6.5.0 Linux
6.5.5=20
Ext4 (sector 4k)=20

Read no 7.2s (5800MB/s) 7.1s (5890MB/s) 8.3s (5050MB/s) 13.2s
(3180MB/s) 13.2s (3180MB/s)=20
Write no 12.0s (3500MB/s) 12.6s (3340MB/s) 12.2s (3440MB/s) 28.9s
(1450MB/s) 28.9s (1450MB/s)=20
Read yes 6.0s (7000MB/s) 6.0s (7020MB/s) 5.9s (7170MB/s) 5.9s
(7100MB/s) 5.9s (7100MB/s)=20
Write yes 6.7s (6220MB/s) 6.7s (6290MB/s) 6.9s (6080MB/s) 6.9s
(6080MB/s) 6.9s (6970MB/s)=20
Exfat=C2=A0(sector ?)=20

Read no 7.3s (5770MB/s) 7.2s (5830MB/s) 9s (4620MB/s) 13.3s (3150MB/s)
13.2s (3180MB/s)=20
Write no 8.3s (5040MB/s) 8.9s (4750MB/s) 8.3s (5040MB/s) 18.3s
(2290MB/s) 18.5s (2260MB/s)=20
Read yes 6.2s (6760MB/s) 6.1s (6870MB/s) 6.0s (6980MB/s) 6.5s
(6440MB/s) 6.6s (6320MB/s)=20
Write yes 16.1s (2610MB/s) 16.0s (2620MB/s) 18.7s (2240MB/s) 34.1s
(1230MB/s) 34.5s (1220MB/s)=20


Please note that I rounded some values to clarify readiness. Small
variations (lower than 2%) are likely margin error.

Ext4 results: cached reads/writes time have increased of almost 100%
from 6.2.0 to 6.5.0 with a first increase with 6.4.0. Direct access
times have stayed similar though.
Exfat results: performance decrease too with and without direct access
this time.

I realize there are thousands of commits between, plus the issue can
come from multiple kernel parts such as the page cache, the file system
implementation (especially for Exfat), the IO engine, a driver, etc.
The results also showed that there is not only a specific version
impacted. Anyway, at the end the performance have highly decreased.

You can find the opendocument spreadsheet attached in case the email is
not displayed correctly. If you want to verify my benchmark tool source
code, please ask.

Regards

Florent DELAHAYE

--=-JJGbiRLkDVIoDmRiIMDR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode:=
 space; line-break: after-white-space;"><div>Hello guys,</div><div><br></di=
v><div>During the last few months, I felt a performance regression when usi=
ng read() and write() on my high-speed Nvme SSD (about 7GB/s).</div><div><b=
r></div><div>To get more precise information about it I quickly developed b=
enchmark tool basically running read() or write() in a loop to simulate a s=
equential file read or write. The tool also measures the real time consumed=
 by the loop. Finally, the tool can call open() with or without O_DIRECT.</=
div><div><br></div><div>I ran the tests on EXT4 and Exfat with following se=
ttings (buffer values have been set for best result):</div><div>- Write set=
tings: buffer 400mb * 100</div><div>- Read settings: buffer 200mb</div><div=
>- Drop caches before non-direct read/write test</div><div><br></div><div>W=
ith this hardware:</div><div>- CPU AMD Ryzen 7600X</div><div>- RAM DDR5 520=
0 32GB</div><div>- SSD Kingston Fury Renegade 4TB with 4K LBA</div><div><br=
></div><div><br></div><div>Here are some results I got with last upstream k=
ernels (default config):</div><div><br></div><div><div>



=09
=09
=09
=09
=09
=09



<table cellspacing=3D"0" border=3D"0">
	<colgroup width=3D"137"></colgroup>
	<colgroup width=3D"85"></colgroup>
	<colgroup width=3D"177"></colgroup>
	<colgroup span=3D"4" width=3D"167"></colgroup>
	<tbody><tr>
		<td height=3D"17" align=3D"center"><b>~42GB</b></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center" bgcolor=3D"#CCCCCC"><b>O_DIRECT</b></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center" bgcolor=3D"#CCCCCC" sdnum=3D"1036;0;JJ/MM/AA"><b>Linux 6.2.0</b=
></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center" bgcolor=3D"#CCCCCC" sdnum=3D"1036;0;JJ/MM/AA"><b>Linux 6.3.0</b=
></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center" bgcolor=3D"#CCCCCC" sdnum=3D"1036;0;JJ/MM/AA"><b>Linux 6.4.0</b=
></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center" bgcolor=3D"#CCCCCC" sdnum=3D"1036;0;JJ/MM/AA"><b>Linux 6.5.0</b=
></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center" bgcolor=3D"#CCCCCC" sdnum=3D"1036;0;JJ/MM/AA"><b>Linux 6.5.5</b=
></td>
	</tr>
	<tr>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" colsp=
an=3D"2" height=3D"17" align=3D"center" bgcolor=3D"#CCCCCC"><b>Ext4 (sector=
 4k)</b></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" colsp=
an=3D"7" align=3D"center" sdnum=3D"1036;0;JJ/MM/AA"><br></td>
		</tr>
	<tr>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" heigh=
t=3D"17" align=3D"left" bgcolor=3D"#CCCCCC"><b>Read</b></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"left" bgcolor=3D"#CCCCCC"><font color=3D"#C9211E">no</font></td>
		<td align=3D"center">7.2s (5800MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">7.1s (5890MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">8.3s (5050MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">13.2s (3180MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">13.2s (3180MB/s)</td>
	</tr>
	<tr>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" heigh=
t=3D"17" align=3D"left" bgcolor=3D"#CCCCCC"><b>Write</b></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"left" bgcolor=3D"#CCCCCC"><font color=3D"#C9211E">no</font></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">12.0s (3500MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">12.6s (3340MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">12.2s (3440MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">28.9s (1450MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">28.9s (1450MB/s)</td>
	</tr>
	<tr>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" heigh=
t=3D"17" align=3D"left" bgcolor=3D"#CCCCCC"><b>Read</b></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"left" bgcolor=3D"#CCCCCC"><font color=3D"#00A933">yes</font></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">6.0s (7000MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">6.0s (7020MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">5.9s (7170MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">5.9s (7100MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">5.9s (7100MB/s)</td>
	</tr>
	<tr>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" heigh=
t=3D"17" align=3D"left" bgcolor=3D"#CCCCCC"><b>Write</b></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"left" bgcolor=3D"#CCCCCC"><font color=3D"#00A933">yes</font></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">6.7s (6220MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">6.7s (6290MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">6.9s (6080MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">6.9s (6080MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">6.9s (6970MB/s)</td>
	</tr>
	<tr>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" colsp=
an=3D"2" height=3D"17" align=3D"center" bgcolor=3D"#CCCCCC"><b>Exfat&nbsp;(=
sector ?)</b></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" colsp=
an=3D"7" align=3D"center"><br></td>
		</tr>
	<tr>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" heigh=
t=3D"17" align=3D"left" bgcolor=3D"#CCCCCC"><b>Read</b></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"left" bgcolor=3D"#CCCCCC"><font color=3D"#C9211E">no</font></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">7.3s (5770MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">7.2s (5830MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">9s (4620MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">13.3s (3150MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">13.2s (3180MB/s)</td>
	</tr>
	<tr>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" heigh=
t=3D"17" align=3D"left" bgcolor=3D"#CCCCCC"><b>Write</b></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"left" bgcolor=3D"#CCCCCC"><font color=3D"#C9211E">no</font></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">8.3s (5040MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">8.9s (4750MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">8.3s (5040MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">18.3s (2290MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">18.5s (2260MB/s)</td>
	</tr>
	<tr>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" heigh=
t=3D"17" align=3D"left" bgcolor=3D"#CCCCCC"><b>Read</b></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"left" bgcolor=3D"#CCCCCC"><font color=3D"#00A933">yes</font></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">6.2s (6760MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">6.1s (6870MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">6.0s (6980MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">6.5s (6440MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">6.6s (6320MB/s)</td>
	</tr>
	<tr>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" heigh=
t=3D"17" align=3D"left" bgcolor=3D"#CCCCCC"><b>Write</b></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"left" bgcolor=3D"#CCCCCC"><font color=3D"#00A933">yes</font></td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">16.1s (2610MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">16.0s (2620MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">18.7s (2240MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">34.1s (1230MB/s)</td>
		<td style=3D"border-top: 1px solid #000000; border-bottom: 1px solid #000=
000; border-left: 1px solid #000000; border-right: 1px solid #000000" align=
=3D"center">34.5s (1220MB/s)</td>
	</tr>
</tbody></table><br></div></div><div>Please note that I rounded some values=
 to clarify readiness. Small variations (lower than 2%) are likely margin e=
rror.</div><div><br></div><div><b>Ext4 results</b>: cached reads/writes tim=
e have increased of almost 100% from 6.2.0 to 6.5.0 with a first increase w=
ith 6.4.0. Direct access times have stayed similar though.</div><div><b>Exf=
at results</b>: performance decrease too with and without direct access thi=
s time.</div><div><br></div><div>I realize there are thousands of commits b=
etween, plus the issue can come from multiple kernel parts such as the page=
 cache, the file system implementation (especially for Exfat), the IO engin=
e, a driver, etc. The results also showed that there is not only a specific=
 version impacted. Anyway, at the end the performance have highly decreased=
.</div><div><br></div><div>You can find the opendocument spreadsheet attach=
ed in case the email is not displayed correctly. If you want to verify my b=
enchmark tool source code, please ask.</div><div><br></div><div>Regards</di=
v><div><br></div><div>Florent DELAHAYE</div><div><span></span></div></body>=
</html>

--=-JJGbiRLkDVIoDmRiIMDR--

--=-DrlHVkYcn2cW/tGRM+JQ
Content-Type: application/vnd.oasis.opendocument.spreadsheet; name="bench.ods"
Content-Disposition: attachment; filename="bench.ods"
Content-Transfer-Encoding: base64

UEsDBBQAAAgAAOmBPleFbDmKLgAAAC4AAAAIAAAAbWltZXR5cGVhcHBsaWNhdGlvbi92bmQub2Fz
aXMub3BlbmRvY3VtZW50LnNwcmVhZHNoZWV0UEsDBBQAAAgAAOmBPlcAAAAAAAAAAAAAAAAaAAAA
Q29uZmlndXJhdGlvbnMyL3Rvb2xwYW5lbC9QSwMEFAAACAAA6YE+VwAAAAAAAAAAAAAAAB8AAABD
b25maWd1cmF0aW9uczIvaW1hZ2VzL0JpdG1hcHMvUEsDBBQAAAgAAOmBPlcAAAAAAAAAAAAAAAAc
AAAAQ29uZmlndXJhdGlvbnMyL3Byb2dyZXNzYmFyL1BLAwQUAAAIAADpgT5XAAAAAAAAAAAAAAAA
GgAAAENvbmZpZ3VyYXRpb25zMi9wb3B1cG1lbnUvUEsDBBQAAAgAAOmBPlcAAAAAAAAAAAAAAAAY
AAAAQ29uZmlndXJhdGlvbnMyL2Zsb2F0ZXIvUEsDBBQAAAgAAOmBPlcAAAAAAAAAAAAAAAAaAAAA
Q29uZmlndXJhdGlvbnMyL3N0YXR1c2Jhci9QSwMEFAAACAAA6YE+VwAAAAAAAAAAAAAAABgAAABD
b25maWd1cmF0aW9uczIvdG9vbGJhci9QSwMEFAAACAAA6YE+VwAAAAAAAAAAAAAAABgAAABDb25m
aWd1cmF0aW9uczIvbWVudWJhci9QSwMEFAAACAAA6YE+VwAAAAAAAAAAAAAAABwAAABDb25maWd1
cmF0aW9uczIvYWNjZWxlcmF0b3IvUEsDBBQACAgIAOmBPlcAAAAAAAAAAAAAAAAMAAAAbWFuaWZl
c3QucmRmzZPNboMwEITvPIVlzthALwUFcijKuWqfwDWGWAUv8poS3r6Ok1ZRpKrqn9TjrkYz3460
m+1hHMiLsqjBVDRjKSXKSGi16Ss6uy65pds62ti2Kx+aHfFqg6WfKrp3bio5X5aFLTcMbM+zoih4
mvM8T7wiwdU4cUgMxrSOCAkejUJp9eR8GjnO4glmV1F066CQefcgPYvdOqmgsgphtlK9h7YgkYFA
jQlMyoR0gxy6TkvFM5bzUTnBoe3ix2C904OiPGDwK47P2N6IDKblXuC9sO5cg998lWh67mN6ddPF
8d8jlGCcMu5P6rs7ef/n/i7P/xnir7R2RGxAzqNn+pDntPIfVUevUEsHCLT3aNIFAQAAgwMAAFBL
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
VlpaWlphWF5jV2BjY2Nra2t0dHR7e3sApCAEpy8EqTQLpzcLqTkSqjsVq0AZq0EirUstr1MrsFMy
sFUysFg6s14+s2FFs2RJtGdKtGpRtm5Wt3NYtnJbuHdeuHhkuHtsuoN0vIdyvIl6vY5+vpF6yo92
ypDFIBzIIR7FJSHGKyjIJSLIKSfIKynIMC3IOjjIRUPJSUbITErJVFLJWFbJXFrHa2rJY2HJbWzJ
cG7JcnDKeHfKe3mDg4OLi4uTk5Obm5uNrJeOrZiDvpOIv5ijo6Orq6u2tra3uLi6trm6urqMwJyR
wJyVwaGawqaf1rCixKymxbCsxbOwxre0xrm2yLu7yL69yMHHjozJgYDKjIzKkpHKnZzKoJ/Ko6LL
qKfKqqrKurrDw8PCycTKxcXLy8vLz9DO0M7L09PL2dnQzc7TzNHazdbcztjR0dHR2tTc1NTa2trM
4uLiz9zk0N7nz+Dn3uTr0OPs3+nk5OTn6Ofp6enz8/P+/v4AAAD////6x3gHAAAgAElEQVR42u29
C5fsxnUeWgCM4OlgGY9cMTLpKzkyLa1Y1rWtkFpJbEu2bDl43CsDOEQkRZG4LDuWZQpkkcMz55RY
5IoZGKg/ffeuAvoxjzP9mj5zNFXd043Go7qnPuy9q+qrvTcRujykQnQTaDx00XhoPHTReGg8dNF4
aDx00XhoPHTReOii8dB46KLx0HjoovHQeOii8dB46KLxuL8yibF8qT+AthoPWcIcwMg8wbzxlpZi
N+2NLNu2rfiWSks8asfj7rdD4l+rYhwdrMU2W4rVed2jwMNNhCgMdntLRcVN+52YUdrzW67KLE5Z
ZwW7/4z0Ch7cNLiAbzAK1k8NoZTGxvAY8PASUSIcPBY86wMXWp9HbtHk8Ob5pagMpxQs8oJWTGkf
u/Gk8MgVXDFAUpYib8Is7WFHIu/i1MXX1hixkqBbX1n5XgpvJexMmaCh58NFQ+gWsb86KIufOgj2
ZDbw2piweyD9o5CPrDUpvPeGYCTsKtIK16c5CYUbsdrsBiPmkxWzEprDcuveTOVltsJjMODaMBS+
lbIgAuUGdzXqPwcPVgacB1fCOfOVJegeNxQNqTufMGEkPIO73vXhnBBuC3lQltwfTYmH0UB1jYEY
2tNjwMO3iYfvvTlxAo3rlAOBlvACYYGojKOwQUZMOAGa24Q9s6J3vSLL035CPKIITxct3MWpUlGZ
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
ofHQReOh8dBF46Hx0EXjoYvGQ+Ohi8ZD46GLxkPjoYvGQ+Ohi8ZDF42HxkMXjYfGQxeNh8ZDF42H
xkMXjYfGQxeNhy4aD42HLhoPjYcuGg+Nhy4aD42HLhoPXTQeGg9dNB4aD100HhoPXTQeGg9dNB4a
D100HrpoPDQeumg8NB66aDw0HrpoPDQeumg8dNF4aDx00XhoPHTReGg8dNF4aDx00XhoPHTReOii
8dB46KLx0HjoovHQeOii8dB46KLx0EXjofHQRePx6pX/H73UyZ3b/r6ZAAAAAElFTkSuQmCCUEsD
BBQACAgIAOmBPlcAAAAAAAAAAAAAAAAVAAAATUVUQS1JTkYvbWFuaWZlc3QueG1srZNBbsMgEEX3
OYXFtjKk7aZCcbKo1BOkB6BmcJDwgGCIktsXW3HiqooUS9mBGb/3ZxCb3al31RFish4b9srXrAJs
vbbYNex7/1V/sN12tekVWgOJ5LSoyn+YrtuG5YjSq2STRNVDktRKHwC1b3MPSPJvvRxN190swDu7
oJ2H08SNnZxAxmfUikr1RQSnANEOR8pJb4xtQc4Io2m7qm4tGOugLuXxfAtgsnN1UHRomLib6zYE
0FbVdA7QMBWCs+0YSBxR83EGfN46TyGC0ukAQEwsifLp0dgux5Ge3sSDEVJGXibAs+XtnLBMPn3j
UZsHxKXqpUgXOoDUEPUOn8r9icXQ0jMNY382N9HZQXo+FojKa3s+eH/I/Q8q65KgackDdncktlcd
iOG8WDbi34vf/gJQSwcI+FuAITEBAAAsBAAAUEsBAhQAFAAACAAA6YE+V4VsOYouAAAALgAAAAgA
AAAAAAAAAAAAAAAAAAAAAG1pbWV0eXBlUEsBAhQAFAAACAAA6YE+VwAAAAAAAAAAAAAAABoAAAAA
AAAAAAAAAAAAVAAAAENvbmZpZ3VyYXRpb25zMi90b29scGFuZWwvUEsBAhQAFAAACAAA6YE+VwAA
AAAAAAAAAAAAAB8AAAAAAAAAAAAAAAAAjAAAAENvbmZpZ3VyYXRpb25zMi9pbWFnZXMvQml0bWFw
cy9QSwECFAAUAAAIAADpgT5XAAAAAAAAAAAAAAAAHAAAAAAAAAAAAAAAAADJAAAAQ29uZmlndXJh
dGlvbnMyL3Byb2dyZXNzYmFyL1BLAQIUABQAAAgAAOmBPlcAAAAAAAAAAAAAAAAaAAAAAAAAAAAA
AAAAAAMBAABDb25maWd1cmF0aW9uczIvcG9wdXBtZW51L1BLAQIUABQAAAgAAOmBPlcAAAAAAAAA
AAAAAAAYAAAAAAAAAAAAAAAAADsBAABDb25maWd1cmF0aW9uczIvZmxvYXRlci9QSwECFAAUAAAI
AADpgT5XAAAAAAAAAAAAAAAAGgAAAAAAAAAAAAAAAABxAQAAQ29uZmlndXJhdGlvbnMyL3N0YXR1
c2Jhci9QSwECFAAUAAAIAADpgT5XAAAAAAAAAAAAAAAAGAAAAAAAAAAAAAAAAACpAQAAQ29uZmln
dXJhdGlvbnMyL3Rvb2xiYXIvUEsBAhQAFAAACAAA6YE+VwAAAAAAAAAAAAAAABgAAAAAAAAAAAAA
AAAA3wEAAENvbmZpZ3VyYXRpb25zMi9tZW51YmFyL1BLAQIUABQAAAgAAOmBPlcAAAAAAAAAAAAA
AAAcAAAAAAAAAAAAAAAAABUCAABDb25maWd1cmF0aW9uczIvYWNjZWxlcmF0b3IvUEsBAhQAFAAI
CAgA6YE+V7T3aNIFAQAAgwMAAAwAAAAAAAAAAAAAAAAATwIAAG1hbmlmZXN0LnJkZlBLAQIUABQA
CAgIAOmBPle4Bcw9pAEAAE0DAAAIAAAAAAAAAAAAAAAAAI4DAABtZXRhLnhtbFBLAQIUABQACAgI
AOmBPlcztvJGEwkAABtfAAALAAAAAAAAAAAAAAAAAGgFAABjb250ZW50LnhtbFBLAQIUABQACAgI
AOmBPldlyiLq9wYAAAwnAAAKAAAAAAAAAAAAAAAAALQOAABzdHlsZXMueG1sUEsBAhQAFAAICAgA
6YE+VxUEkfTZBQAA7SQAAAwAAAAAAAAAAAAAAAAA4xUAAHNldHRpbmdzLnhtbFBLAQIUABQAAAgA
AOmBPlfwTZ1sVUEAAFVBAAAYAAAAAAAAAAAAAAAAAPYbAABUaHVtYm5haWxzL3RodW1ibmFpbC5w
bmdQSwECFAAUAAgICADpgT5X+FuAITEBAAAsBAAAFQAAAAAAAAAAAAAAAACBXQAATUVUQS1JTkYv
bWFuaWZlc3QueG1sUEsFBgAAAAARABEAZQQAAPVeAAAAAA==


--=-DrlHVkYcn2cW/tGRM+JQ--
