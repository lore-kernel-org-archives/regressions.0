Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237F6173
	for <regressions@lists.linux.dev>; Fri, 21 Jan 2022 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1642756704; x=1674292704;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DDt33//J7HC81vPepGQWceRVhDsuFSNWZ9d7bVsT2sk=;
  b=HMNZJ218uwcxGHRmkw5Ig8O6HxSbimjebs0cum6cfLi4erMPfrGRwm/0
   ONsFPQRaxAkdVNKcJDoya0hxDhJ2E7mtxFyXC5iyw0jysenDqewn+GTI3
   R6gsFcD9Mzh170McPJfsjMaEQtyZi9j5Kqsw3sef/AvufEQbox7P1TDXB
   u46i69TNk8Vf14HBNEs1amDtzPkvSHH84dGeV8AgLEGqN3Mx8WxwSA3Bi
   2HjQhTOTWoX1GQT39ysW6D1I579CCmYjvBpGyR/lgu96d/K0o+94jSXfo
   DAGnxhBPkluDwnH6krl/v1WTfjsMVsn4xwbBp78i0JIo5Qc/0eekmpRlM
   g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; 
   d="scan'208";a="195827192"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 17:17:16 +0800
IronPort-SDR: BTZAUKGlCXBUdSoLoIfpYTpquJNgnXC/+Tt2NBkQ21iiN0N+iNzgUrZ6x1tCVueY/onziR15us
 4CliLkRiZnYXFNbvazNjadIXL0PUGDh6ooAQS/xWDUTM/f0chLFtcRGcz0ZMatZA450n6O7iSB
 hsq4LWjN0oHylXRQ/U2GZQxI8U7bGXtfNlZNrEnAPPB4lplWnxwCz2rS6irqBln09/L07LycPA
 NjxF3Sn48+I6XN6xbViC1Su0CJo9W9rD7ssZhpQ9Bn+RbCmw0X5tKWPrI1QQt368c0e8gDKZXR
 z+vPW65sce3Yy7lNZG6HmS19
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 00:49:28 -0800
IronPort-SDR: Kz/DWvVVraWgk+PAkUV1yNWwgMQFYH8/AYNEkhL8tgUEEeVoev/XNI7MnStetjzxgp/HETi9+3
 eaj4KqhC3ZzOwtfDJNdC5ILK6GYP8ZQVXUiO9bzNLVUOTCjrgr7rY76hZ0MOM2/C5r3g+DQhc+
 kX+/uB9e29WL19LWOu3RNSG1LZm1RnX/IYGgTvIrS2e3yo3hsSTiskG0uoe5MGyeBz7E3Aqook
 lDVb82wXewSxYV8CeF5VVV4EU1zEZm9hF0ri72TfthjVefaOedEjTGt28U1e5Fi7elVzbJE6TN
 Ya0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 01:17:17 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JgDKm5yVjz1SVp6
	for <regressions@lists.linux.dev>; Fri, 21 Jan 2022 01:17:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1642756636; x=1645348637; bh=DDt33//J7HC81vPepGQWceRVhDsuFSNWZ9d
	7bVsT2sk=; b=o1QBeAXEDOCEulPdCiKVw1rIswd9ZPRTg2QvWZcBmaRRidXGKSA
	RDIqoeIiLJ4GzsOG67O8MKe20oCR1zbbre3pC+9UL16bKRa8av8Easy/BzusnDoC
	yOG/Ttnx7WcaJFB/5duCGuwTEjuyZEvZ9Jcap/L6gWssL+FJzgDT49d6L61zt0a2
	gRCtLqvlu0kPpTDtBXhaVjak91XaKw7LZ4nBAn4mhufbNwqVoSeaxHQLZFKSce/y
	TH8W13pkYiJd031St13DjoVTx5t+XJ6dXWEdCn1yNg9nckqTJHdI5wc5PJ2lC7vE
	sMdc80M4ARDeyr3OJHp311pCaFhWh47a2Ag==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Tev6WGJGH4SN for <regressions@lists.linux.dev>;
	Fri, 21 Jan 2022 01:17:16 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JgDKk0DRvz1RvlN;
	Fri, 21 Jan 2022 01:17:13 -0800 (PST)
Message-ID: <350720e8-9b78-bd24-5c60-602076610bf4@opensource.wdc.com>
Date: Fri, 21 Jan 2022 18:17:12 +0900
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [next] mips: cavium_octeon_defconfig: pata_octeon_cf.c:598:23:
 error: passing argument 1 of 'trace_ata_bmdma_stop' from incompatible pointer
 type
Content-Language: en-US
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Zeal Robot <zealci@zte.com.cn>,
 Minghao Chi <chi.minghao@zte.com.cn>, CGEL ZTE <cgel.zte@gmail.com>
References: <CA+G9fYtq0wzSeG8YG-a+=KrbdWqHJMXk1hvq0FKeAvj9sZAK2g@mail.gmail.com>
 <6249735f-e6b7-1331-eb2b-361bb17d6115@opensource.wdc.com>
 <CA+G9fYu__OOvk-ESXoOqbd-Lk+CmO8CSQ8chEFf3MyeTjKtp9g@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <CA+G9fYu__OOvk-ESXoOqbd-Lk+CmO8CSQ8chEFf3MyeTjKtp9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2022/01/21 17:58, Naresh Kamboju wrote:
>> I just posted a fix. As I do not have the environment to compile test
>> mips, could someone test please ? I will send the fix to Linus asap
>> after confirmation that it is OK.
> 
> Please share your patch / patch link. I will test it with tuxmake.

I posted on linux-ide and CC-ed linux-mips:

https://marc.info/?l=linux-ide&m=164275458614058&w=2

> 
> you may also give a try with these easy steps.
> 
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> #
> # See https://docs.tuxmake.org/ for complete documentation.
> # Original tuxmake command with fragments listed below.
> 
>  tuxmake --runtime podman --target-arch mips --toolchain gcc-10
> --kconfig cavium_octeon_defconfig

I saw this in the compilation error report. Will try this.

> 
> - Naresh


-- 
Damien Le Moal
Western Digital Research
