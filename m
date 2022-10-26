Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F03AD41
	for <regressions@lists.linux.dev>; Wed, 26 Oct 2022 20:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666816929; x=1698352929;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1gaLxx2/iHz7YZIBgFqkbZxBg68PkAwpn99ti8lfuqs=;
  b=ONQuruOVtrAKpNXCpsUfp/8eE9vc34WVIgXMtzbnu1N6lZIFUfSoxBo4
   1e5Ed8h2cyKCUcOj+aTBVN5EGv5+lpVZp1qbQrfyJyjvLcEd3WGStufxt
   L3QD5BOseuHBfeCquj9nZkOqi/e6BE12A7bD82y1e2loB112vnw0cZDqO
   se2jXVw/LX48uHJGH4xX57SP1p95eXNa56QQKT4TlY2F+8TSZaGitFecQ
   zedehgHHvSfJbkNHiUHoQIJLTt9G2GrswIkWaHw2IUnCn2WiagYYHIHYa
   SjJq2EG+KdXCGkUsdkAPDTmXVZbGK81NLBRxEd5IBw2G79MCjDa7Rtfek
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="334678617"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="334678617"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 13:42:05 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="610103338"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="610103338"
Received: from bcoan-mobl2.amr.corp.intel.com (HELO [10.209.189.197]) ([10.209.189.197])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 13:42:05 -0700
Message-ID: <3f207f82-e177-c833-b2b0-ca9e64a6e9a7@linux.intel.com>
Date: Wed, 26 Oct 2022 15:41:09 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [Regression] Bug 216613 - Sound stopped working with v6.0.3 on
 Lenovo T14 Gen2i: ASoC: error at snd_soc_component_probe #forregzbot
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: alsa-devel@alsa-project.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <2c028797-b313-be93-7b1e-8d838e694948@leemhuis.info>
 <f34cafd4-f224-ad10-6962-e8f6c709cb39@leemhuis.info>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f34cafd4-f224-ad10-6962-e8f6c709cb39@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/26/22 07:08, Thorsten Leemhuis wrote:
> [Note: this mail is primarily send for documentation purposes and/or for
> regzbot, my Linux kernel regression tracking bot. That's why I removed
> most or all folks from the list of recipients, but left any that looked
> like a mailing lists. These mails usually contain '#forregzbot' in the
> subject, to make them easy to spot and filter out.]
> 
> On 22.10.22 08:35, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>> kernel developer don't keep an eye on it, I decided to forward it by
>> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216613 :
>>
>>>  Grzegorz Alibożek 2022-10-21 19:26:43 UTC
>>>
>>> After upgrade kernel from 6.0.2 to 6.0.3 on Lenovo T14 Gen2i, sound stopped working.
>>> dmesg:
>>>
>>> paź 21 21:11:45 kernel: snd_hda_codec_hdmi ehdaudio0D2: failed to create hda codec -12
>>> paź 21 21:11:45 kernel: snd_hda_codec_hdmi ehdaudio0D2: ASoC: error at snd_soc_component_probe on ehdaudio0D2: -12
>>> paź 21 21:11:45 kernel: skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: failed to instantiate card -12
>>>
>>> [reply] [−] Comment 1 Grzegorz Alibożek 2022-10-21 19:56:43 UTC
>>>
>>> Created attachment 303070 [details]
>>> trace
> 
> #regzbot introduced: 7494e2e6c55ed19
> #regzbot fixed-by: 02356311982b

Revert on its way:

https://lore.kernel.org/r/20221024143931.15722-1-tiwai@suse.de
