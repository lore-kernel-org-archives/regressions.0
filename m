Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E48628E7
	for <regressions@lists.linux.dev>; Tue,  6 Dec 2022 09:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1670318042; x=1701854042;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4mt0j/vdtWfJcSSBLLsGjJ3hTgh4e+ZqWrii34fueUY=;
  b=pXW8y8U2Or057qAujltwgzWruOi5IX/nfUkitL9ZrDOAYYDq3GQHZ0Rs
   gwB3pwoaiK5QNlonDZ+IElEcmli7ZECPMbjPFMkd/5nBRH5VeiOHwdFee
   WpG2PDxdui9ZO2rZEFFoz+6Sg/OWPF9YQUEN+dNL7Q3yRTU+5x6otDypr
   O38WZbu3iYuwDHLJFRM06rdtg3mYOH4rEFlMZiSR3waTJGUR+2OQQ9GwP
   xrjKHfPxZyL+Emop8QeDd7OsSZcPCpp5T/mkhNWPyVsWLcM5mFcAdeYGY
   NIwO6j72F8V17344YffPWZdtM4a3slyLaY30jeobhhK6UQwYrHBdzwntS
   g==;
X-IronPort-AV: E=Sophos;i="5.96,220,1665417600"; 
   d="scan'208";a="330088915"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 06 Dec 2022 17:12:53 +0800
IronPort-SDR: RILXwzUbvei+oybBVigBHHChMH1qhxjZt8T9KfLwTWzOA4+XPYPAopSymAVWuilbE+4Mc5MtPg
 yXIkMDv/8XRh/FTwg7FulkcjzHD3fmsOepJ0Kr1IX4GJ5GT8CQ9t+wpsekJ+yZDM1ACiKNQfuy
 goaP/dC5x3o6dxnEccya43KS5xF9NEGAQK0Zje4k7vNqbloed15Oa0g9siZ3ZJ9qhcZxaBbeYN
 SfmmzoXWw2TtNxsV6MCh9XqrNnpWEFfnTOEUfnXN1hcCSCIiS5VMPxvKrSwJIZ0AlDSbkAxT6n
 A6w=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2022 00:25:41 -0800
IronPort-SDR: A8LcWnlJ30r9BF8IatwDlVkt81e7iHmcx8CckyzAYSp3ngEnYQyxE0w93qNVPpPBRPMGAomBbB
 SIHbfx2gBEeKIgt046amB15PcXcLrx9tRCnYZWheY7Lg1q2zxhQhoU8uCWBz9UjDRqpoxZbOnm
 yq/viazrwK3TbM+dtCc21deQObOBdPkNiepJZOFQLar7DVJUpA9iFWA1TsXcPeza4M4mFipHKO
 GGDAjOqFndV6ZszMJa6LzDQr0X0Eo7ypwo8bmFiWFoILfh1tzpeWc8QClWqMV/Genl04J4+MOU
 wBI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2022 01:12:55 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NRF7T58j9z1RvTp
	for <regressions@lists.linux.dev>; Tue,  6 Dec 2022 01:12:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1670317972; x=1672909973; bh=4mt0j/vdtWfJcSSBLLsGjJ3hTgh4e+ZqWri
	i34fueUY=; b=YNSyUHBzaAuo3ULsinKsC2zO2BLGCy3UVeDKqHthvVvj2MyBt8d
	KEQA8yVLkKSd3gfSQAQb+PnVDFrHNJOPeOWDJTZnqxUSC+Ho0Ti2B+p1EvLvsL/N
	YTcAFyY8G5NhmSY53yzHQKnA7VFtc0lu/fSJpEVtfTWx5DDw/bF0bn3He25govb3
	nsUWOBFCbvrWuB2DMh5kxLd8RuDY3UW9CQTp+uwXVKKZA10yT8vlvP5mtgB5qAM4
	6jsBpQKjgFNZczbuGXW4p5vOYBipJ4SzaNettuVsPzfmMC8JZtXYdENAZWY6nrpp
	Fa3zaxB3wUKjUdIMUf6tSq6VWTIjmxUTasw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BUclAD4r54hL for <regressions@lists.linux.dev>;
	Tue,  6 Dec 2022 01:12:52 -0800 (PST)
Received: from [10.225.163.74] (unknown [10.225.163.74])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NRF7Q0fHvz1RvLy;
	Tue,  6 Dec 2022 01:12:49 -0800 (PST)
Message-ID: <fa2bc2b9-d74a-51a3-cb5f-80d04e145b27@opensource.wdc.com>
Date: Tue, 6 Dec 2022 18:12:48 +0900
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: TI: X15 the connected SSD is not detected on Linux next 20221006
 tag
Content-Language: en-US
To: Serge Semin <fancer.lancer@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Anders Roxell <anders.roxell@linaro.org>,
 Niklas Cassel <Niklas.Cassel@wdc.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Praneeth Bajjuri <praneeth@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Carlos Hernandez <ceh@ti.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <CADYN=9JiX-=PcKMzAcSm=p7Dh6kYT7Kbv-8kcNF0MQ4=1hFS5g@mail.gmail.com>
 <20221014140633.mlypet7skkxvt453@mobilestation>
 <CADYN=9LrKHRNMON3GA4piDvWeSWTASQ1u2=D30rXFdvo1L18bg@mail.gmail.com>
 <20221017155246.zxal2cfehjgaajcu@mobilestation>
 <CA+G9fYtYetV5sZVD14WkZxCE_tgTC4VVKm8BcBw5_NwXD6U=Sw@mail.gmail.com>
 <Y4cqcTRcni5H7UAU@x1-carbon>
 <CADYN=9KKGBXn-YkiiFxsUzsanTALbDV1c+tB0oUQPouE1idnuQ@mail.gmail.com>
 <20221205011105.4do4trbytq4bfw5b@mobilestation>
 <98670e23-6553-4788-8662-9403c480af82@app.fastmail.com>
 <f440a8ff-7657-c1be-e733-4ad69b6b7b0b@opensource.wdc.com>
 <20221206084637.olaflvqmxwoo467a@mobilestation>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221206084637.olaflvqmxwoo467a@mobilestation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/6/22 17:46, Serge Semin wrote:
> On Mon, Dec 05, 2022 at 10:24:22PM +0900, Damien Le Moal wrote:
>> On 12/5/22 19:08, Arnd Bergmann wrote:
>>> On Mon, Dec 5, 2022, at 02:11, Serge Semin wrote:
>>>> On Thu, Dec 01, 2022 at 12:48:32PM +0100, Anders Roxell wrote:
>>>
>>>>>
>>>>>   for (i = 0; i < hpriv->n_clks; i++) {
>>>>> - if (!strcmp(hpriv->clks[i].id, con_id))
>>>>> + if (hpriv->clks && hpriv->clks[i].id &&
>>>>> +    !strcmp(hpriv->clks[i].id, con_id))
>>>>>   return hpriv->clks[i].clk;
>>>>>   }
>>>>
>>>> Indeed I should have taken into account that devm_clk_bulk_get_all()
>>>> can get unnamed clocks too. But checking the hpriv->clks pointer for
>>>> being not null is redundant, since the ahci_platform_get_resources()
>>>> procedure makes sure that the array is always allocated. At the very
>>>> least you shouldn't check the pointer in the loop, but can make sure
>>>> that the clks array is available before it.
>>>
> 
>>> Do you think this is otherwise the correct fix then? Any chance we
>>> can still get a version of it into 6.1?
> 
> I'll think of a better solution. But at this stage it seems like the
> best choice seeing the bindings permit having unnamed clocks
> specified.
> 
>>
>> If someone sends me a proper patch to apply, I can send a last PR for 6.1
>> to Linus before week end.
> 
> I'll submit the patch today. Thanks.

Anders just posted one. Can you review it please ?

> 
> -Serge(y)
> 
>>
>>
>>>
>>>      Arnd
>>
>> -- 
>> Damien Le Moal
>> Western Digital Research
>>

-- 
Damien Le Moal
Western Digital Research

