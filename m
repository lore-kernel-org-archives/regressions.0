Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1B37B
	for <regressions@lists.linux.dev>; Fri, 14 Oct 2022 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1665734030; x=1697270030;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=e43rx5lrlAT5OV5I6ek/4TNY/F1pHFYbWzrhPY/2w98=;
  b=MMnlYJqzAajLvLsa4NHBtK9zoMjgnOMVDG4dIiPKSbu2vskBnlrwfoD0
   kGCgMRFEELC0yKGuDqiR3TWtzeJ+wRm3zDGZRBovTbOVaX1rGFw1x/zi+
   duL8MvPZo8tHq8Bxb6yc9EBwpoWBQNelY5PaIidqR0G3SEgU2p8LfvAoP
   NpszgVvh6V8XeisDPfymvPrNSEy7OfFHAQaI3qPyQG7IURdVFoN2SwbSW
   QyrTe8S7Ry+AYVVs4rUSVwWoyeZLhk/WQGECs3fxLCoqi+1IZ+7tG05Rg
   rjm8mCQoZObEWclf5lG1+GqdPu8yRf+wcTCiMuytJtx7O6MUY/VdsnsA7
   w==;
X-IronPort-AV: E=Sophos;i="5.95,182,1661788800"; 
   d="scan'208";a="318090803"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2022 15:53:41 +0800
IronPort-SDR: uA9mQWH3z0obK/nRjNa6LjXSsY01RGWEHU0mvadJdzcHt8HAy0+aOU7aUscW4/3hsWq22qSLPr
 84mjifx7FRJSUCjFDPRM7hz2fNmOBwfwj4aF6EPUWWDJtLtNkWin/ZP/aE4VDMHu8YlBz7Zx7G
 xu0ZCfpYhGMR64tu+Jp4ULWKd4t2ehxWc/Ngi05WOYo1HvXms1fMJlmis9y2OdOqB1JEoSG+3H
 ahhGpF/NC2FiqXVGejXWqr9J0V8kAKLnmVZFjuQSHvKPsNNfvVlDlpri1GHn+xAOCgqH/Y36DT
 U2tHWoqC/2ipRho6oBoMzhng
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Oct 2022 00:07:39 -0700
IronPort-SDR: 9tBf03kIIAM/e+dUjSV8bHhyvqdZex4zEjzcfSRxPNWO1B+3d1N+YnCfLUZAx+13/BPjySicCQ
 qEBmnbI2ahwvS006JiEerWMMIv0bA3yJqkG5gNhJSVW5snLx6vZi7EVqufo5ghN9rZiRPPc6ko
 euyKj34S1DZYZbi56IRyTsx0MmaGays+xdr2Kq149mtXGgVY1Dm34/JLD+wgXbOyj1VdGvkUq0
 cu6fiznvs+BlqBroV/79ZeKMnuWxu7/mS+cmyYTSqRXiF+TuZbH3kPPL/CatEu0XRWToHXRu4l
 MqM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Oct 2022 00:53:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MpdtW1yCbz1RwvL
	for <regressions@lists.linux.dev>; Fri, 14 Oct 2022 00:53:39 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1665734018; x=1668326019; bh=e43rx5lrlAT5OV5I6ek/4TNY/F1pHFYbWzr
	hPY/2w98=; b=J6otgZb2gLVyo5iDgw1EJzXs34RvRB6dhvEworLjDHWHNypRWpZ
	YmZ9GwL/ryiqA4swG/T+kXFhWOXKrUD6XD1VScNeaT80bWTmzU41jjhubVjdKB42
	Dw8SfaG9QXwVTDaQYmKxYqb8swutqnzB4WCtWsv6eCo8RIZk4AKs4qLji69mo7h2
	MzoO+RJ30+6ayAD2ffga+zfs3RxHYBxI8bydIaJhuO6X+of+4gWm2HP+3tVzhPx0
	6M7fNEl+VUW80ZvYyu57iNoc7YdlScusZ04rEzb+fpw/Fa2hzh4gk7mWukJEjNvC
	vmfkcOGZt5F3qL0UAOxmpx5lmWIxJBNojvA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id A4yykyZF8vub for <regressions@lists.linux.dev>;
	Fri, 14 Oct 2022 00:53:38 -0700 (PDT)
Received: from [10.225.163.119] (unknown [10.225.163.119])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MpdtS2PLzz1RvLy;
	Fri, 14 Oct 2022 00:53:36 -0700 (PDT)
Message-ID: <75eaeab3-7781-d60a-ae61-ae837f5dcec9@opensource.wdc.com>
Date: Fri, 14 Oct 2022 16:53:34 +0900
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
To: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Sergey.Semin@baikalelectronics.ru
Cc: open list <linux-kernel@vger.kernel.org>,
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
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <7ee4a1bd-0674-42d8-8980-8b029ca09e71@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/22 16:31, Arnd Bergmann wrote:
> On Fri, Oct 14, 2022, at 2:22 AM, Damien Le Moal wrote:
>> On 10/14/22 07:07, Anders Roxell wrote:
>> [...]
>>>> 8)
>>>>> If reverting these patches restores the eSATA port on this board, then you need
>>>>> to fix the defconfig for that board.
>>>>
>>>> OTOH,
>>>> Anders, enabled the new config CONFIG_AHCI_DWC=y  and tried but the
>>>> device failed to boot.
>>>
>>> I thought it would work with enabling CONFIG_AHCI_DWC=y, but it didn't...
>>
>> As mentioned in my previous reply to Naresh, this is a new driver added in
>> 6.1. Your board was working before so this should not be the driver needed
>> for it.
>>
>>> However, reverting patch 33629d35090f ("ata: ahci: Add DWC AHCI SATA
>>> controller support")
>>> from next-20221013 was a success, kernel booted  and the 'mkfs.ext4' cmd was
>>> successful.
>>
>> Which is very strange... There is only one hunk in that commit that could
>> be considered suspicious:
>>
>> diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
>> index 9b56490ecbc3..8f5572a9f8f1 100644
>> --- a/drivers/ata/ahci_platform.c
>> +++ b/drivers/ata/ahci_platform.c
>> @@ -80,9 +80,7 @@ static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
>>  static const struct of_device_id ahci_of_match[] = {
>>         { .compatible = "generic-ahci", },
>>         /* Keep the following compatibles for device tree compatibility */
>> -       { .compatible = "snps,spear-ahci", },
>>         { .compatible = "ibm,476gtr-ahci", },
>> -       { .compatible = "snps,dwc-ahci", },
>>         { .compatible = "hisilicon,hisi-ahci", },
>>         { .compatible = "cavium,octeon-7130-ahci", },
>>         { /* sentinel */ }
>>
>> Is your board using one of these compatible string ?
> 
> The x15 uses "snps,dwc-ahci". I would expect it to detect the device
> with the new driver if that is loaded, but it's possible that the
> driver does not work on all versions of the dwc-ahci hardware.
> 
> Anders, can you provide the boot log from a boot with the new driver
> built in? There should be some messages from dwc-ahci about finding
> the device, but then not ultimately working.
> 
> Depending on which way it goes wrong, the safest fallback for 6.1 is
> probably to move the "snps,spear-ahci" and "snps,dwc-ahci" compatible
> strings back into the old driver, and leave the new one only for 
> the "baikal,bt1-ahci" implementation of it, until it has been
> successfully verified on TI am5/dra7, spear13xx and exynos.

OK. So a fix patch until further tests/debug is completed would be this:

diff --git a/drivers/ata/ahci_dwc.c b/drivers/ata/ahci_dwc.c
index 8fb66860db31..7a0cbab00843 100644
--- a/drivers/ata/ahci_dwc.c
+++ b/drivers/ata/ahci_dwc.c
@@ -469,8 +469,6 @@ static struct ahci_dwc_plat_data ahci_bt1_plat = {
 };

 static const struct of_device_id ahci_dwc_of_match[] = {
-       { .compatible = "snps,dwc-ahci", &ahci_dwc_plat },
-       { .compatible = "snps,spear-ahci", &ahci_dwc_plat },
        { .compatible = "baikal,bt1-ahci", &ahci_bt1_plat },
        {},
 };
diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
index 8f5572a9f8f1..9b56490ecbc3 100644
--- a/drivers/ata/ahci_platform.c
+++ b/drivers/ata/ahci_platform.c
@@ -80,7 +80,9 @@ static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
 static const struct of_device_id ahci_of_match[] = {
        { .compatible = "generic-ahci", },
        /* Keep the following compatibles for device tree compatibility */
+       { .compatible = "snps,spear-ahci", },
        { .compatible = "ibm,476gtr-ahci", },
+       { .compatible = "snps,dwc-ahci", },
        { .compatible = "hisilicon,hisi-ahci", },
        { .compatible = "cavium,octeon-7130-ahci", },
        { /* sentinel */ }

Anders, Naresh,

Can you try this ?

-- 
Damien Le Moal
Western Digital Research

