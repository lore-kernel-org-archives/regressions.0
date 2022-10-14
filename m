Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FC3361
	for <regressions@lists.linux.dev>; Fri, 14 Oct 2022 00:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1665706961; x=1697242961;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sVhzWB6bJ4Xda1JmI82UJgmAYd2X09c+MflqD/NibXE=;
  b=G+ZxRQaCqjHyq8kb4L/hKo+14NbWn9BYsXfyNe45pO6mYDtHBi3CK0/O
   vM91xzJHuIf9FsoTmdvEFwAhkyM66VGT+UijSNTT09Shr9ZRllenR9ihU
   KNTttkSEtEEJjlSKbR9au4K6oTXojUojXObHExIWMAzPWPoI3qTAwpWUJ
   GAHYX3ayf/usizug1xThAFNo6wqeEkG1BG0ESES+4GDyGUZ//bTFodGlK
   uM6SExlFzInYZdj3NS/QOls3ii21rUCSK3V9Si3203wzZAoF0VsxQvsLk
   XsM2nldFXuJLDx7YBDdHF9IU3lbUr0t+1huFNNC14rjuG2mYtO8hUL9ly
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,182,1661788800"; 
   d="scan'208";a="212086662"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2022 08:22:39 +0800
IronPort-SDR: ymGyphi3gNoyLL5k4MvrOn0T15HeYQ8l52DP6JKG65fw+OlNsrztrNb1Uuv1jEfkBctEg0WzgA
 X3aTCAbzb7jK1RErHBYix2ediPtBF/K+DYp+7ucwnbio7GhqmnXmQ/mbTlY3emc6wYKMWjXXoW
 vjtK3DxymPB200Wj4W+DRiZtlj/inP2rT7Z02pVWNi6Oc1N1g/OoL5S7lE/wHXAREgJw8auXTE
 XFz/VHDeQ6flHXqtH0fD+wNs+U07/HfBytUwDc+D38GI6TQBpweiCClerIM9ElfOLrWNVpTTqy
 mnCSfLDcoFCWKtHQqhQWOTui
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2022 16:36:38 -0700
IronPort-SDR: yR+A44i2tUoXCB5qqqlLhNixnRDfAVyRLb7DwYwmHr4Q5nGGXdOR+HWSGP9Gb2iQ2wDZRIJ0Uc
 dgY44N9xMQKZMOKYJaq2I6nv7qDlmQQPTiljY2RSTiGVSloxUfoHdhNk3DwF+EUKkczMjXWmS4
 YwgD8Y5n0P7CCIThk+qGF6aUfZqSX59hD65210oEE4ro4G+vRPE8MGLu8sgVKR1MjoRlLArGI+
 SKpsRdKtp8Fblx40SvHt9alGEzlI++xTLjHtA6gvsePhUNSXOY/FwFyU5vPenJA7IiXiZtW/V9
 OFI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2022 17:22:39 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MpRt645sWz1RwvT
	for <regressions@lists.linux.dev>; Thu, 13 Oct 2022 17:22:38 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1665706957; x=1668298958; bh=sVhzWB6bJ4Xda1JmI82UJgmAYd2X09c+Mfl
	qD/NibXE=; b=fmPjxKj7HqP7bSr4u6/wQXre40p8RobYeqHiB4MWenOb/AL5efD
	qUCl9JZA9dKmNbOFRETfkHyP7K7Ve112eVqoGkZWCVGShGbKzKGldwhDdEDxAZvd
	1ezoR5W6/ZRsMzGy6abAcF4MyodwsVnCBhk2UkrweJGNP1NLOGQ0TWmOycFcGW4y
	OLWjcJpXKH7UxxhEtRGaVfbqeTnDTJoX6Fj7qtv46HeSLJ9xmljuLD916kML7tyW
	m0rmu8oJRO/8I9bppMSTDR5jLP9tB/LAYm0B7FADrS85GPKXNvz1PHWGgSwIevDt
	EHT0JeL4/cG3QTEzVlF3k6KPFgASlQDm1Ew==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8YfjTuNbnauJ for <regressions@lists.linux.dev>;
	Thu, 13 Oct 2022 17:22:37 -0700 (PDT)
Received: from [10.225.163.119] (unknown [10.225.163.119])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MpRt36XHsz1RvLy;
	Thu, 13 Oct 2022 17:22:35 -0700 (PDT)
Message-ID: <ca8d3fff-0365-24d9-fd53-5799ac34f336@opensource.wdc.com>
Date: Fri, 14 Oct 2022 09:22:34 +0900
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
To: Anders Roxell <anders.roxell@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Sergey.Semin@baikalelectronics.ru
Cc: open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 regressions@lists.linux.dev,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Niklas Cassel <niklas.cassel@wdc.com>, Arnd Bergmann <arnd@arndb.de>
References: <CA+G9fYvRXkjeO+yDEQxwJ8+GjSmwhZ7XHHAaVWAsxAaSngj5gg@mail.gmail.com>
 <bf1b053d-ffa6-48ab-d2d2-d59ab21afc19@opensource.wdc.com>
 <CA+G9fYvUnn0cS+_DZm8hAfi=FnMB08+6Xnhud6yvi9Bxh=DU+Q@mail.gmail.com>
 <CADYN=9L8tt2T-8O+u5NSMSUOkZDvEggnvzxH6aMmd5Rn9yDeuw@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CADYN=9L8tt2T-8O+u5NSMSUOkZDvEggnvzxH6aMmd5Rn9yDeuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/22 07:07, Anders Roxell wrote:
[...]
>> 8)
>>> If reverting these patches restores the eSATA port on this board, then you need
>>> to fix the defconfig for that board.
>>
>> OTOH,
>> Anders, enabled the new config CONFIG_AHCI_DWC=y  and tried but the
>> device failed to boot.
> 
> I thought it would work with enabling CONFIG_AHCI_DWC=y, but it didn't...

As mentioned in my previous reply to Naresh, this is a new driver added in
6.1. Your board was working before so this should not be the driver needed
for it.

> However, reverting patch 33629d35090f ("ata: ahci: Add DWC AHCI SATA
> controller support")
> from next-20221013 was a success, kernel booted  and the 'mkfs.ext4' cmd was
> successful.

Which is very strange... There is only one hunk in that commit that could
be considered suspicious:

diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
index 9b56490ecbc3..8f5572a9f8f1 100644
--- a/drivers/ata/ahci_platform.c
+++ b/drivers/ata/ahci_platform.c
@@ -80,9 +80,7 @@ static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
 static const struct of_device_id ahci_of_match[] = {
        { .compatible = "generic-ahci", },
        /* Keep the following compatibles for device tree compatibility */
-       { .compatible = "snps,spear-ahci", },
        { .compatible = "ibm,476gtr-ahci", },
-       { .compatible = "snps,dwc-ahci", },
        { .compatible = "hisilicon,hisi-ahci", },
        { .compatible = "cavium,octeon-7130-ahci", },
        { /* sentinel */ }

Is your board using one of these compatible string ?

Serge ?
Any idea ?

-- 
Damien Le Moal
Western Digital Research

