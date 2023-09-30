Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B94156C9
	for <regressions@lists.linux.dev>; Sat, 30 Sep 2023 19:27:31 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4RyYY75kYHzMq3Zr;
	Sat, 30 Sep 2023 17:07:07 +0000 (UTC)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4RyYY72HStz3W;
	Sat, 30 Sep 2023 19:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=delahaye.me;
	s=20230709; t=1696093627;
	bh=WyCaWu6be0MHjELghEbFNkmXm0SlJ0xwr8J9ahhdlEA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UMSSo3Xlx52gVf1WN9RvHbMW6li6/rNMi47vEGmylVTsqh/UFddq9/7Qn/A+b9OfA
	 nFc2OwbXRKKgyh+LQcqrMRilwSN76Xmnjb9vCibg5E+3dEZ9iCD6N5RF1iLDB9Wp50
	 6c5+66diL1cvcw6NvzUx2zJJKlHXmBY9F+i1TywYkPBs1ECnN4na/4cdPqRfRKaOPY
	 sLgrxC1oQSnUi9maPptMA43rGZKq89VQlDDuEnyEQNNu6qs5Rl189Pnkcg83l2dNvx
	 ISiA6FWRuEM9j6zXhxwyiRuXBEPOv34VmidnVlU7tdOyfpTKW2E9GIIc6cgCGv/DMg
	 DlIjSN4i8ysMQ==
Message-ID: <94a7f9171b60c0d2430106632db84276f516d454.camel@delahaye.me>
Subject: [Kernel 6.5] Important read()/write() performance regression
From: Florent DELAHAYE <florent@delahaye.me>
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Date: Sat, 30 Sep 2023 19:07:06 +0200
In-Reply-To: <28df26a419a041f3c4f44c5e2a6697adbaee83f3.camel@delahaye.me>
References: <28df26a419a041f3c4f44c5e2a6697adbaee83f3.camel@delahaye.me>
Autocrypt: addr=florent@delahaye.me; prefer-encrypt=mutual;
 keydata=mQINBFiOKngBEADTLMfJdCgTqe1aHNZ09D3kFyMXx9UvKP25RbQUhzZdC7Z2YzRJImp/KXeuLtqRYONxzrmdVRnX4YvnohdE8NgvFnp4O6Jqn2VnkGj2ezl7tQgaVyMbl+frPQn39PgdeWWuhMrvYcVRSPAdKBulLp9W3zUshyVks6pVYImZfaqojCazuCj1kA1FVwt0VGbVUS4M1SER2EbCufbwIHbxFQVbHEGc6LTyOTJAPr44rEGapkQTdIC90gXFk7wO33vbJUaTi8wkMYLSiY4K2vAtYeqrmrauEn8plgV97gwuWx5DxIKp0J/Fgs5GsgbLFAssnNOxkatvlx+qWL8XYMlQ6dRpJdsAQ6C585vIfljvE6sI1WfvBM0jI9oPWxIK4Py4Nrq7SMRGGv9pyz7zxNgoW5aFiivxTvnESIW2ZAqr+G6AGVir3dj5HoQ05Rm+Y87tuqkFu1Vp8poiC33JUP/DvfgLxCryH6UTAU2QmTzVGBMxz3eSVS5qa5Y/ySLj11PG47LqN68nXjR/NcpkpYQXLZzz9JtVhppp8o5arQL1hK0u8rAlRUlddb6Whd0ErKRAnIE6JNyxWZAsftimkx/2hWCmoM9kM5RTQgwA0H1OZn/2zszWC3pXsuEKe9SzdAiOAQhwDbSh4b3aR6+O8EHpTz37EJLxZ079SeCNGvuID7jwfwARAQABtCZGbG9yZW50IERFTEFIQVlFIDxmbG9yZW50QGRlbGFoYXllLm1lPokCVAQTAQoAPhYhBCEQSCRTDLM0FBnp770r9ueawshnBQJdimV+AhsBBQkOYjwRBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEL0r9ueawshn6uQQAM6JERU6CC70AiFv7nz9PmDCYF7lRxS15EKI30HfXeRp+RriQMYeNsk6/pUqJRReYcCgz9zyEj4JE+E8B52mtX+CtvLRmRmbwurGs38G9CnrkWZkhQXoO
	e5F+woA0SX8+rBpixPbXrlBHv1PV4tYCet+P1lBFkcSPyWmskRbbpYiJV13MVxrFaEfQvGXIgdE9wzKtJIwEXOLZm7gUW6uLHHDtNZgo4CwJL371XD3vKwrEFOh4ptyMGaxYqN6nlWvc0+u9Zfnqo+0sCumP8DydNrAZ4KyTfzgo8YfChQE6/DHN9PTfNSREKhcUCar6GHAaI++v91EhkAsuvlP7Uiia4oH5ZPOBBKD7aDnWwIlZMjFt8AGJf0gDPmcg+yIS8MzF2GBMRt3zIS9hamRxF/+x8zBVK2DTIqt4zmKVde5pAWLV4N98m59HfvJKgiwXNoWc4Na61FA0FN39uqD+PTo9dm9a37JcnFrSXfoAjTQJ/aupwyS8z5FuWdDuLuqE0sLzvLC2Mu6HOh7aSEUaxQWWlBm3rvAa2n1YtYZ6yFxfyrlVnqjZsTTJp0DLBKUXfRQ2bXv42oC7WbooX1X0wU649DWPVODfWJScIsGh3i/unl8HEb/3aiKpeJa4frHunZzlrFq7Lmuybpoyx0E2lOqeF6XbqxPQOQdpeNsaQmbS+nV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Infomaniak-Routing: alpha

Hello guys,

During the last few months, I felt a performance regression when using
read() and write() on my high-speed Nvme SSD (about 7GB/s).

To get more precise information about it I quickly developed benchmark
tool basically running read() or write() in a loop to simulate a
sequential file read or write. The tool also measures the real time
consumed by the loop. Finally, the tool can call open() with or without
O_DIRECT.

I ran the tests on EXT4 and Exfat with following settings (buffer
values have been set for best result): =20
- Write settings: buffer 400mb * 100 =20
- Read settings: buffer 200mb =20
- Drop caches before non-direct read/write test

With this hardware: =20
- CPU AMD Ryzen 7600X =20
- RAM DDR5 5200 32GB =20
- SSD Kingston Fury Renegade 4TB with 4K LBA


Here are some results I got with last upstream kernels (default
config):
+------------------+----------+------------------+------------------+--
----------------+------------------+------------------+
| ~42GB            | O_DIRECT | Linux 6.2.0      | Linux 6.3.0      |
Linux 6.4.0      | Linux 6.5.0      | Linux 6.5.5      |
+------------------+----------+------------------+------------------+--
----------------+------------------+------------------+
| Ext4 (sector 4k) |          |                  |                  |=20
|                  |                  |
| Read             | no       | 7.2s (5800MB/s)  | 7.1s (5890MB/s)  |
8.3s (5050MB/s)  | 13.2s (3180MB/s) | 13.2s (3180MB/s) |
| Write            | no       | 12.0s (3500MB/s) | 12.6s (3340MB/s) |
12.2s (3440MB/s) | 28.9s (1450MB/s) | 28.9s (1450MB/s) |
| Read             | yes      | 6.0s (7000MB/s)  | 6.0s (7020MB/s)  |
5.9s (7170MB/s)  | 5.9s (7100MB/s)  | 5.9s (7100MB/s)  |
| Write            | yes      | 6.7s (6220MB/s)  | 6.7s (6290MB/s)  |
6.9s (6080MB/s)  | 6.9s (6080MB/s)  | 6.9s (6970MB/s)  |
| Exfat (sector ?) |          |                  |                  |=20
|                  |                  |
| Read             | no       | 7.3s (5770MB/s)  | 7.2s (5830MB/s)  |
9s (4620MB/s)    | 13.3s (3150MB/s) | 13.2s (3180MB/s) |
| Write            | no       | 8.3s (5040MB/s)  | 8.9s (4750MB/s)  |
8.3s (5040MB/s)  | 18.3s (2290MB/s) | 18.5s (2260MB/s) |
| Read             | yes      | 6.2s (6760MB/s)  | 6.1s (6870MB/s)  |
6.0s (6980MB/s)  | 6.5s (6440MB/s)  | 6.6s (6320MB/s)  |
| Write            | yes      | 16.1s (2610MB/s) | 16.0s (2620MB/s) |
18.7s (2240MB/s) | 34.1s (1230MB/s) | 34.5s (1220MB/s) |
+------------------+----------+------------------+------------------+--
----------------+------------------+------------------+

Please note that I rounded some values to clarify readiness. Small
variations can be considered as margin error.

Ext4 results: cached reads/writes time have increased of almost 100%
from 6.2.0 to 6.5.0 with a first increase with 6.4.0. Direct access
times have stayed similar though. =20
Exfat results: performance decrease too with and without direct access
this time.

I realize there are thousands of commits between, plus the issue can
come from multiple kernel parts such as the page cache, the file system
implementation (especially for Exfat), the IO engine, a driver, etc.
The results also showed that there is not only a specific version
impacted. Anyway, at the end the performance have highly decreased.

If you want to verify my benchmark tool source code, please ask.

PS: sending again as only text body is accepted

Regards

Florent DELAHAYE


