Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED297361640
	for <regressions@lists.linux.dev>; Sat,  1 Aug 2026 01:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785546964; cv=none; b=OwyuK534cZJZZg/6E8+QzeRU2VXq9uJCCodQkC+cIIRcGRELQdCkuQ8rg/7nzIFQJZcf1DGSIjengZxF9TbVYweTq5iGPMyBFWHO3oW0KzpW6nUW+jK+XwwwF/yhTpLm7h04/T32s7JeWMhICgK74PbvxnoYt1jXU3UFw5wcFj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785546964; c=relaxed/simple;
	bh=P5DcjewuX8maw0JP6QOsw+RzcVQfrHT3SGrqsYsm8pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oZsiWPiMiQ9becW5HqZyRNo82OeDfPTbwF2Bohq/cb9lV/aVqajXC5q8RB+KkS1pX0ECURh0AinNO5/n8A8QChgHkmvcWMOjRSOIpSReSxgSgv67uaGw3fumpsZa9wdbWXhqWsNsJgPoKEkwLh181FUPgfo9AMGcPUKCAlREGBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBTzTXvJ; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBTzTXvJ"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4a40bcc8d69so1032094b6e.3
        for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 18:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785546962; x=1786151762; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5DcjewuX8maw0JP6QOsw+RzcVQfrHT3SGrqsYsm8pc=;
        b=lBTzTXvJLbHJTbCic/ZBupxqTfg4PZ8ybGhZYuicG07NLPtgIO77gBCR9xQ3aZfYQb
         gqUm3lUGs2Tk15oo4F7i4Y/Ot1AlugCeblecWV13u62w+gsj7ed3M51rcvPJKRXfeEo5
         QlGqarSxWcYGJJ76KQ8dXn8cv94ZLF9OLnKgrW9yAQGVHg8KMRClGnoASG3doQlkQuDn
         kTAZaB5CdRtflhtTwfp2d56jwU/1LGrEAAmr2GHPHKqKrjqBmRubnJVXh6KrRbP6fZ8i
         ULjm8jHAaChvgHbMFAl6dmBl4HiMF5b59fGuUkU2lXLyQ+Avs0b5CBnKe188Bl4btqib
         rKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785546962; x=1786151762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5DcjewuX8maw0JP6QOsw+RzcVQfrHT3SGrqsYsm8pc=;
        b=fRh702FH97Q875lC1wYJIQXZCZGzqNPVWSicVznCNZQ8vvFxDgoFPk7YgM7BCk2O0t
         BKGAFQP7S/JxOUJWF2uZ4gDeENYy4W6QLDuzCFOEgN3odjTiT8NzGGpJaUJK31Ijqk2+
         coQQNVXi2i6WXbOygzptDRI7KzoSsX1FSASWvw7lcq+rk+ipXccqTASKxKYc8oFfUoFm
         p8r7Z+xvO+xCtPprfgpQWlIn15/x9rXewLvvW7JkmkKQOQvJzhCTd5TEaihzk5jzdzti
         YMvzbrxANo4AI1f1E6DQ2NVOnh/1FJ/aAdW1hP1MOfyby5bVw3Z1WbY4qKIRkDvh8tjP
         gAfg==
X-Forwarded-Encrypted: i=1; AHgh+RpkcZvjVe4GPTEJi0bKLMbFJq3RTXPVEiyAda5LehK/73in/BbGSt7dLUYfr7TbMcs9gfFH3v0bZfW45g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwD9VXidK5Vja6jwA/1GWQqB9q86tdS9J7ZZGX/o+A4NFDDpcLQ
	aNHG/NP5s3l/DTDrq33Lxc3qQNJ4FSo+pF5Vczje8SABlztnTXwjuLDu
X-Gm-Gg: AR+sD113zMPhipgg3K0wrNqdQNVlimTmbNAGdmrBR8akOJhdibr9yFlWTaO6bareYwJ
	udRzmxGc9RscNLvNnXkJuL+UQBPKpCP454FKWbY+/OFYuTC8oLOqi17zm/0YWZPI8aznAW+cYxb
	CAtDNcVi8Rm3Wll04xp+AX5ftjqh/pkpaz2W+06VHLdxbH+DRrdU2RLJgTjYeG9fPCLmtuHCHHN
	jAcl/6tvUnYMEHmULiXsWMVzaDXITEO+iAfbxQNfQBW3VZQGy2Sflc70LAkiPc1zUCslUaVqieZ
	h138+aoH0xdQzHMtvsOUoO5e05hpovUTosTJpIe4m8ulR7RPSJlAaogXHdekdamuhBdGsABnGP6
	G0TPV+sqK6l0o81lurbxAVNqNWSYpIXaJhiG8NvSjTjo670zgcijKX0vugwWRj/c391d1nCcN4V
	Xh3D63SdKq/F5814FBLDdeMipHl8IhKP6e74YnTv+5Vkul7dLFM61DW+482g==
X-Received: by 2002:a05:6808:384c:b0:4a3:f4b7:cbdf with SMTP id 5614622812f47-4af5e2725cemr4182772b6e.15.1785546961793;
        Fri, 31 Jul 2026 18:16:01 -0700 (PDT)
Received: from [10.10.0.5] ([59.152.127.200])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58ce3e8esm1904627b6e.3.2026.07.31.18.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 18:16:01 -0700 (PDT)
Message-ID: <1da0b5a8-336c-455f-9098-a8c834721039@gmail.com>
Date: Sat, 1 Aug 2026 09:15:55 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb controller fails to initialize on intel s1200btl
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: rafael.j.wysocki@intel.com, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
References: <3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com>
 <CAJZ5v0h1kqDEBYk0k05rv6f2SJ7g+TN4FhBDJYZSVUctu-0FdA@mail.gmail.com>
 <daf0bb9b-246d-437d-87ca-16706113b201@gmail.com>
 <CAJZ5v0jByxtQ2tmNm_ZyyBnDMBNjuqQwD_367NRyGNzF7wQtRw@mail.gmail.com>
 <7792f017-42b0-4a09-9941-5259138e21b1@gmail.com>
 <CAJZ5v0jCFFNuG7WtCE2CG+hP=YNsYMdXH_945QgkgAUcr4Lryg@mail.gmail.com>
 <37daa35f-06aa-49d0-bf0a-1b5ac9f44c89@gmail.com>
 <CAJZ5v0jyy0+hqU3=gmBrgMzLBVhdUQwDj8d0_jGCqZwqyWT=_g@mail.gmail.com>
 <588c2e18-e6fb-4fc1-95d5-7a5dd0f556fe@gmail.com>
 <CAJZ5v0gXtKEaNDdSRqd57zg9GbFN-VDHrU5-=EEQPdSa9Zk-xw@mail.gmail.com>
 <CAJZ5v0g4ctzLpEro2Mu7EbSo8RNmYUCM6+J2p_ExCXseQAx13Q@mail.gmail.com>
Content-Language: en-US
From: Julian Silver <mendaxca@gmail.com>
In-Reply-To: <CAJZ5v0g4ctzLpEro2Mu7EbSo8RNmYUCM6+J2p_ExCXseQAx13Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-07-31 22:11:15, Rafael J. Wysocki (Intel) wrote:
> The attached patch (on top of the current mainline) should prevent
> cpuidle governors from requesting idle states deeper than C1E when
> intel_idle is used until all of the device_initcall()s are done.
> Please see if this helps.

Thanks for the patch. There is no more -110 error after applying this.
Feel free if you need other info or test.
