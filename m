Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037F11FA3
	for <regressions@lists.linux.dev>; Wed, 23 Nov 2022 10:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669200059; x=1700736059;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DK+WPftXBrx+r25mWGDlmADzJFlk9VgO71LC1Vr139U=;
  b=O1Vo3J9TDPYHYWOcSPqIUQp27UQzl7IDMmnY38uQspAwQmQeSCmu8xMZ
   bL+8zCirqnt0wiTfyPGL8JOm+zxz08bUFq1A9hATLfNQ5dwFHVNsc4eUJ
   4AYP+QzzUjIjGATD/YNooQ1kvThxMA4dWiKVvSPgCoNIs7tH1xE0J0Brh
   wj50Zo+KZe+/qRhbsiu7aV0QkWcAMRZQXcq6mK7pyoYScIfRbvgHttebG
   41/tZKKACbxLsuLL5Wv9dhWt9quTfQ1H5NKsP+VmMBhEPWGKpGx+T1kTN
   C+fcOi0DpHeeXKNjaa5O/umbiS/v0XJhnru38pBWN8ARvJidTsBEG+xEE
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="201087559"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Nov 2022 03:40:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 23 Nov 2022 03:40:56 -0700
Received: from [10.12.67.44] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Wed, 23 Nov 2022 03:40:54 -0700
Message-ID: <83198642-2ef7-a12a-2ad4-5839b465c085@microchip.com>
Date: Wed, 23 Nov 2022 11:40:53 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] ARM: at91: fix build for SAMA5D3 w/o L2 cache
To: Peter Rosin <peda@axentia.se>, <Claudiu.Beznea@microchip.com>,
	<clement.leger@bootlin.com>, <regressions@leemhuis.info>
CC: <alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<regressions@lists.linux.dev>
References: <b7f8dacc-5e1f-0eb2-188e-3ad9a9f7613d@axentia.se>
 <075d8c0f-5448-73aa-bd3f-0d4e1216e87f@leemhuis.info>
 <20221122181452.6a386296@fixe.home>
 <a961e0a1-5373-e2e0-3acb-7ef3cc32d846@microchip.com>
 <f3ee38ad-61b0-1069-9000-4d125d3bfa25@axentia.se>
Content-Language: en-US
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <f3ee38ad-61b0-1069-9000-4d125d3bfa25@axentia.se>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 23/11/2022 at 09:38, Peter Rosin wrote:
> Hi!
> 
> 2022-11-23 at 08:19, Claudiu.Beznea@microchip.com wrote:
>> On 22.11.2022 19:14, Clément Léger wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Le Tue, 22 Nov 2022 16:13:40 +0100,
>>> Thorsten Leemhuis <regressions@leemhuis.info> a écrit :
>>>
>>>> Hi, this is your Linux kernel regression tracker.
>>>>
>>>> On 12.11.22 16:40, Peter Rosin wrote:
>>>>> The L2 cache is present on the newer SAMA5D2 and SAMA5D4 families, but
>>>>> apparently not for the older SAMA5D3. At least not always.
>>
>> Peter, what do you mean by "at least not always" here? Are you talking
>> about the OUTER_CACHE flag?
> 
> I'm not familiar with all options for L2 caching. I was just being cautious
> to not exclude the possibility that there could be some variation within
> the SAMA5D3 series (I'm on SAMA5D31) or with an external L2 cache or
> something such. If there's simply no possible way to have an L2 cache on
> any SAMA5D3, feel free to edit that "At least not always" out while you
> commit.

I confirm that there is no L2 cache in any variant of SAMA5D3.

[..]

Thanks, best regards,
   Nicolas
-- 
Nicolas Ferre

