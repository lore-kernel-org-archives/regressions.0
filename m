Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97C263A
	for <regressions@lists.linux.dev>; Fri, 14 Oct 2022 09:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1665740853; x=1697276853;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iE5GUnFyeMBRQvMjHEXX2zn/Gp9BkuhhaBK9MtXM00k=;
  b=UwgkT5XjSnlqsO4UeK4w/0MLIbsr1D3AMAFao0if2tgxiwHfVdk3WzFi
   ppAUJKlpqK60Xk2JoJx6Wptuu6whonDFTNB3HdySCjwgdloWSYhlIzes9
   E3IY9j4j2E4biczjqB+ifUADOkfxcWRJLjEO9UeBbcsAtpzGph6/hG02V
   mls5ppTfgraeNztbmUNkCxulqGWvqe0x1PI3xsimcdp/8K3cJlUXpGgSm
   ZvYFkCFUQAOI4cu1c1HBtxFBjw4p6+inODv6VZwfPUbEpJaqlO+vTwxtE
   YMfkmEuCkRmdxMR2P4spkCQcp0n5hY1+L6JwY9/64SEuN//kyMV+kz/vZ
   A==;
X-IronPort-AV: E=Sophos;i="5.95,184,1661788800"; 
   d="scan'208";a="325892165"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2022 17:47:27 +0800
IronPort-SDR: vynBSvH++4Tq0NzyAKyK2/l20qNzZyCA0MQyCmokjPhJDdME306CgZvlIA/VA+cwNNPHxV/KhO
 8wq3DP+WbTr7w4q2pv994EIxBwbmcyKagGCKLDEkQg+lompegTlEY+Q6QaqB/u9E7XqPeqIToD
 NMXolEw+0DfGlCcIfSRFrrTpGYFigCeDu65Lk0Q9gdvcqO/b77VVaCJzuSdThMopglHE9ILhSf
 T8Vy3XgOoji/tf8wvtMmWpU7AuvZRCavVpmBHWdSTLrfODfGZLwnK13EkuweiABlRytjp/iVW5
 8l+ihCKrd+3R9966RVZG8x7p
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Oct 2022 02:07:04 -0700
IronPort-SDR: HCboEZR7b5YUoMaVFx5w2X2z52Gczt9aKqiNl7EzQX4IeDQ9Mxt2EndiMMGhxjjEy+RYGDggwE
 lPvmMbvtU3AnX3WojfvMgyhYVqSLcIrc3OQnM2BTWaFp+QgM6G8Kf1plv0O4Bfq70NKwZopOjC
 NlAdDw3XSU7pbTQJlm5Q2ac5vFVhxGYWKCgNR6LpzMlK7YBd3gdHGXEA52LgfadM7xfP2GauEy
 SrG+GiZzTJxiryPwwKoVXRCS4aWwK/wxgI/QFFHvrce+pyhLOHga4hIXVrVdxZwn8QipdZqrwa
 3f0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Oct 2022 02:47:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MphPq282Nz1RwqL
	for <regressions@lists.linux.dev>; Fri, 14 Oct 2022 02:47:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1665740846; x=1668332847; bh=iE5GUnFyeMBRQvMjHEXX2zn/Gp9BkuhhaBK
	9MtXM00k=; b=PtF2czCRF+dp0VRC6dLZ04V+8DkQ37SQBwZgiOI+H7Mix1GMkT9
	VPCsMXk2iDSfJkaeAhOOX3tXSwusMe5xZ9/nR7wGPHH3odYNCyqhy6lyB7x1ycJU
	FYfsDRnvlvdXSUQrc5Elbx/BL5Ak8q/x7m2HPQHFepDlXHMb7Vn4RVzXTa7e/7zt
	GK75GQRzAEUcJj6u8+RmwEkOnIqwf9gKV6pzRR3snzBlDEXH0efib4qSHDt0dN1i
	XzwlvrRAZCVMI/9zh+BfjtoqIGEiZWDgTax8hmZHS+IGzNPskp8Z5INSEbPxFSm+
	VXuJjsOSVTodq5+7zM/ZoxRK2f/pXRmSE3A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DLEIfEt9Rcll for <regressions@lists.linux.dev>;
	Fri, 14 Oct 2022 02:47:26 -0700 (PDT)
Received: from [10.225.163.119] (unknown [10.225.163.119])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MphPm4nqjz1RvLy;
	Fri, 14 Oct 2022 02:47:24 -0700 (PDT)
Message-ID: <0ea781f8-6911-2850-16a2-cee230dd32b0@opensource.wdc.com>
Date: Fri, 14 Oct 2022 18:47:23 +0900
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: TI: X15 the connected SSD is not detected on Linux next 20221006
 tag
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 regressions@lists.linux.dev,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Niklas Cassel <niklas.cassel@wdc.com>
References: <CA+G9fYvRXkjeO+yDEQxwJ8+GjSmwhZ7XHHAaVWAsxAaSngj5gg@mail.gmail.com>
 <bf1b053d-ffa6-48ab-d2d2-d59ab21afc19@opensource.wdc.com>
 <CA+G9fYvUnn0cS+_DZm8hAfi=FnMB08+6Xnhud6yvi9Bxh=DU+Q@mail.gmail.com>
 <CADYN=9L8tt2T-8O+u5NSMSUOkZDvEggnvzxH6aMmd5Rn9yDeuw@mail.gmail.com>
 <ca8d3fff-0365-24d9-fd53-5799ac34f336@opensource.wdc.com>
 <7ee4a1bd-0674-42d8-8980-8b029ca09e71@app.fastmail.com>
 <75eaeab3-7781-d60a-ae61-ae837f5dcec9@opensource.wdc.com>
 <CADYN=9JiX-=PcKMzAcSm=p7Dh6kYT7Kbv-8kcNF0MQ4=1hFS5g@mail.gmail.com>
 <d087c831-1519-4b83-8cc1-5317659709be@app.fastmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <d087c831-1519-4b83-8cc1-5317659709be@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/22 18:37, Arnd Bergmann wrote:
> On Fri, Oct 14, 2022, at 11:22 AM, Anders Roxell wrote:
>> On Fri, 14 Oct 2022 at 09:53, Damien Le Moal
> 
>> Tested this patch on todays linux-next tag: next-20221014 without enabling
>> CONFIG_AHCI_DWC and it worked as expected when booting [1].
>> On the other hand I also tried a build/boot with CONFIG_AHCI_DWC enabled
>> and it worked as expected to boot [2].

That is great news ! So the new driver is OK, good !

> 
> Ok, great. Can you a patch to soc@kernel.org to enable the driver in the
> relevant defconfigs?
> 
>> However, during building a warning [3] popped up:
>>
>> make --silent --keep-going --jobs=8
>> O=/home/tuxbuild/.cache/tuxmake/builds/2/build ARCH=arm
>> CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
>> arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
>> /builds/linux/drivers/ata/ahci_dwc.c:462:34: warning: 'ahci_dwc_plat'
>> defined but not used [-Wunused-variable]
>>   462 | static struct ahci_dwc_plat_data ahci_dwc_plat = {
> 
> Strange, I can't reproduce this, and the ahci_dwc_plat symbol
> looks like it is clearly used in ahci_dwc_of_match[], at least
> in next-20221014. Do you also see this on mainline?

This is with the trial fix diff I sent. My bad, it was not even compile
tested :). Does not happen otherwise.

>       Arnd

Thanks for helping with this !

-- 
Damien Le Moal
Western Digital Research

