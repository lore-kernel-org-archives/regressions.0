Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320E8173
	for <regressions@lists.linux.dev>; Fri, 21 Jan 2022 09:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1642757328; x=1674293328;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wvAGSSkbD8sKVKozj06LSLUZ8DGhuMSqNCuuyy1l4Tg=;
  b=KKePWTUoMJCdNR2xVJ6dGAqFUjAQZXGeRjETUEGvpghRZBpcSsRzTNQ5
   6Rp6m3+mt7hy5OXDU25CRO2wTN1RoBFJQFyAJqsCyZ4dtHcTvAys0KD0i
   +lNjOFmYJhOsKDqs1rKBPXs31WkfVKuoDirqPtlreLdMO3EfgbRT53WOm
   p1M7dcZXGK8ujCy2Uelck8w84M84Dp3NdithR9chenQrxyS5SoOqbW4Vw
   9Oms50M6S/oW0pTQ9mfGeKh/wOiq/Zqa0gOKjOyiAxjo54NiMafNV21tJ
   FQYR5y3/q4GXQzRv7TspDTznnHzTQauK2qiO+nIDUZ58GB5TOHIpdhF5x
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; 
   d="scan'208";a="192040169"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 17:27:39 +0800
IronPort-SDR: A7FxDOg84gT4YhQT3iKA+kpBn838fQPlV79m6fjKy6D9nGL4jpt6Vb90Sg4GSa/vKWk7g5ULaj
 /dkbf7iTnAU8TOA4/sSaGWZqXlMVo8CHaOvVw3QlLzfYJfWH7v50eGmGsubAw/PmtIW0AsQA1m
 SG9Doc+HAQ0VlegFEn3NiebxltZTEfjaWtLlCbD+OdiAmcDBRRJh7FdsbUqUDn/JprwuhV3pND
 qSmmO7DzpgBRDaplzU1dVDN22iExdgC/zZRCh3CnEH70VEsGy5oYil+1o6lSCmoCPaBr+6sqj/
 ikY3boDOg0goJJWIeI+BcjPG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 01:01:06 -0800
IronPort-SDR: tlMzTLfeqzCv20bDmNrW8bXDNtDCwhItJCg+uH5LDtu9xMguEgxoU392m/qAV5ANpn1B7PBzDL
 +bns/ch4+7Z7FQbBW+TP7J0OLPj+3vAaon/mcgBeKbORFTKXp7o4JssplWv9DjRxzFtC+FZJtz
 gbnG57hPwt5e8XHpWv4+BsneDs0+7XdTdWS2V62LJP/qCUqL+OQBWj+ncSJzgVd2hbUQsFOaZR
 R1k2R0H6fHHDH+gonmfSGSIc3kOICO7gwpiN5KH/CI2rx4jF0/MHFP+5c1EgeyeIG9HtExCUZ9
 Wtk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 01:27:39 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JgDYk42fpz1SVp8
	for <regressions@lists.linux.dev>; Fri, 21 Jan 2022 01:27:38 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1642757257; x=1645349258; bh=wvAGSSkbD8sKVKozj06LSLUZ8DGhuMSqNCu
	uyy1l4Tg=; b=eH3Z965uTxH9B+Ybb9izm7AvFS75V8fAtbih7EcrBmg7M/fwcUl
	zPO5DnBIzdU5y2lrgu4Toooa2iwJ80SvIeOybdNsW2ZCtiztoVPnkBiW+WGnXsCF
	rt1FhRMpYD88Dj5WRfDmAFbslsE3tgUxc+Fr6VJqVCN/9qbFUeTGceLrudBjI1aU
	sdvxSCmFi568o65dcF8bo1LwSeDImocsGkIEbnuHw/Bhtj6dZWRDbB2WM2DNWD+s
	SKh0qfGhm1+18rMesxGU5cTyK4ESN8u4o6fAtuD88a3tw8r8IrnAfIzUWnSImuKi
	xsfnz+gHr8NdGnoX1OkyQGMOLelsLgwoJCQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 15RYfLPy1R1C for <regressions@lists.linux.dev>;
	Fri, 21 Jan 2022 01:27:37 -0800 (PST)
Received: from [10.225.163.53] (unknown [10.225.163.53])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JgDYg5LFjz1RvlN;
	Fri, 21 Jan 2022 01:27:35 -0800 (PST)
Message-ID: <11ec9f44-5e1c-c4cd-8d63-93d7538a12c8@opensource.wdc.com>
Date: Fri, 21 Jan 2022 18:27:34 +0900
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
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
Organization: Western Digital Research
In-Reply-To: <CA+G9fYu__OOvk-ESXoOqbd-Lk+CmO8CSQ8chEFf3MyeTjKtp9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/21/22 17:58, Naresh Kamboju wrote:
>> I just posted a fix. As I do not have the environment to compile test
>> mips, could someone test please ? I will send the fix to Linus asap
>> after confirmation that it is OK.
> 
> Please share your patch / patch link. I will test it with tuxmake.
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

Just tried this and it all passes for me.

> 
> - Naresh


-- 
Damien Le Moal
Western Digital Research
