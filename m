Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665827C
	for <regressions@lists.linux.dev>; Mon,  5 Dec 2022 13:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1670246736; x=1701782736;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eIuVPi2oKlmfmwkWcq2jyJdIlCtdykKp0CE/vjbqIHc=;
  b=iHWdt9FlBTue9yQTo/Cy+aZ9LnfXyECrJnlUrkvI20fzVWyhzW2MjNzX
   vjUCKqEWewDadlkKdLeWlRJX8AwlBA2KYXQn0CEKGm51Aij11vHMr8A0B
   wDzz73MtB+IN9gprNDRy9d876c7zhEjSLZR5eu8SXWAVvKsBWZVheQN+S
   u9ZoKlWeAeeIZK0lKJUo4JAlbsV1ucXokD9npTn/0NPaZJzmZTaCLm3j3
   PNKVeUTAc6xqXidSrb51U3AMNRfcb9jEaD1nP7FIaJueNAQpxVc8G3niJ
   uKDV6HGL21KDDu/4KGm/MA5T9L1GKCAs89yeOosvxhDVlZ7kj9toQXGCj
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,219,1665417600"; 
   d="scan'208";a="223073516"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 05 Dec 2022 21:24:27 +0800
IronPort-SDR: FtfVQbaUeq4t1jyCpm3Qcb+7pSDNSTUzDn+AaPD4AwYYaMWLZi0NgA9KvDFFwjzMjpAsReM6sK
 VoNF1WYVfxULplF2H1N3OXOGDmCqTXpR+RhY0O20QzRM7WFOGvvsukTazUKXoEkTfggHBdvc5d
 crCJhqIQoHuD269M434QBJ0lgc9Aswge05U03tKiA/YgiIvTi32rB4tskFuv9zc8rp9Rq3qSSv
 VK5i+7VSMRy18yOWbx8ORybmipSpxTCq5BW9XlhOBNbxo7A0lrHHbtPerCm/4V9YvkhQu0RSbk
 PNQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2022 04:37:16 -0800
IronPort-SDR: 9Cl617TZIntBm/ANKBMmlPzmJbUJ+Hy6xoUAUsKjNURtquublTp+HXgnw5z6pRfmNWJ/gmqeWy
 1Bn83ZCkCdUu9WuxoJm3Ck3iawA/XhONxlLwpMg2jSX9NuJn/mUuqYk4Sx894szngYyd0Gq3lY
 5KYnbninRRqEcgv2kWaEJNZrxmA/ACyNxaoo1u//zNFQbKaDtSDnfMWCBWmoYu6nwwEGzGZ2pm
 6oe0x53/NhLtYQu0QC9irD88zPtBYDOhGAXUJTtG+ErnxeLnBHWPmQhKTc1Ld8oW+rxXyuZ+Xz
 AHY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2022 05:24:27 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NQkmC1qSLz1RWxq
	for <regressions@lists.linux.dev>; Mon,  5 Dec 2022 05:24:27 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1670246666; x=1672838667; bh=eIuVPi2oKlmfmwkWcq2jyJdIlCtdykKp0CE
	/vjbqIHc=; b=Ecs0n0q1JF4Cx8NoxRMgMJtMXrKuW5Q0cv0SaH2nQVL9z4d2Ksw
	oXbrqsUEPpNvntcx7VwaNyBirMaNJS7u6cxvS+6r6SdY0IDZvFdaEnJskr7PVtWr
	gHK5ubpd82Muow3h6emPVVyTAINaxclwgIQalI/+3b57j4xK9Q0+jsckqpd4Ii1H
	+BDqqFFoSkq6T41xsJpOp2mBPDUGNPTws4LYze04nhIRaWGPAIswyb8xC0qSMLq7
	rnpIGvaYv4IYho1sv5tWhQyD6SEuRMgvGW1FKEtCwC+pID4Zkc0A6gfv0I+pxHvK
	Nn8gTg7NPDm23gcFTGFUnNHWvjrxAbt/esA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yYWNG0uHU2mN for <regressions@lists.linux.dev>;
	Mon,  5 Dec 2022 05:24:26 -0800 (PST)
Received: from [10.225.163.74] (unknown [10.225.163.74])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NQkm75kCwz1RvLy;
	Mon,  5 Dec 2022 05:24:23 -0800 (PST)
Message-ID: <f440a8ff-7657-c1be-e733-4ad69b6b7b0b@opensource.wdc.com>
Date: Mon, 5 Dec 2022 22:24:22 +0900
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
To: Arnd Bergmann <arnd@arndb.de>, Serge Semin <fancer.lancer@gmail.com>,
 Anders Roxell <anders.roxell@linaro.org>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
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
References: <ca8d3fff-0365-24d9-fd53-5799ac34f336@opensource.wdc.com>
 <7ee4a1bd-0674-42d8-8980-8b029ca09e71@app.fastmail.com>
 <75eaeab3-7781-d60a-ae61-ae837f5dcec9@opensource.wdc.com>
 <CADYN=9JiX-=PcKMzAcSm=p7Dh6kYT7Kbv-8kcNF0MQ4=1hFS5g@mail.gmail.com>
 <20221014140633.mlypet7skkxvt453@mobilestation>
 <CADYN=9LrKHRNMON3GA4piDvWeSWTASQ1u2=D30rXFdvo1L18bg@mail.gmail.com>
 <20221017155246.zxal2cfehjgaajcu@mobilestation>
 <CA+G9fYtYetV5sZVD14WkZxCE_tgTC4VVKm8BcBw5_NwXD6U=Sw@mail.gmail.com>
 <Y4cqcTRcni5H7UAU@x1-carbon>
 <CADYN=9KKGBXn-YkiiFxsUzsanTALbDV1c+tB0oUQPouE1idnuQ@mail.gmail.com>
 <20221205011105.4do4trbytq4bfw5b@mobilestation>
 <98670e23-6553-4788-8662-9403c480af82@app.fastmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <98670e23-6553-4788-8662-9403c480af82@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/5/22 19:08, Arnd Bergmann wrote:
> On Mon, Dec 5, 2022, at 02:11, Serge Semin wrote:
>> On Thu, Dec 01, 2022 at 12:48:32PM +0100, Anders Roxell wrote:
> 
>>>
>>>   for (i = 0; i < hpriv->n_clks; i++) {
>>> - if (!strcmp(hpriv->clks[i].id, con_id))
>>> + if (hpriv->clks && hpriv->clks[i].id &&
>>> +    !strcmp(hpriv->clks[i].id, con_id))
>>>   return hpriv->clks[i].clk;
>>>   }
>>
>> Indeed I should have taken into account that devm_clk_bulk_get_all()
>> can get unnamed clocks too. But checking the hpriv->clks pointer for
>> being not null is redundant, since the ahci_platform_get_resources()
>> procedure makes sure that the array is always allocated. At the very
>> least you shouldn't check the pointer in the loop, but can make sure
>> that the clks array is available before it.
> 
> Do you think this is otherwise the correct fix then? Any chance we
> can still get a version of it into 6.1?

If someone sends me a proper patch to apply, I can send a last PR for 6.1
to Linus before week end.


> 
>      Arnd

-- 
Damien Le Moal
Western Digital Research

