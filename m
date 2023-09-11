Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798AB320A
	for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 08:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694421857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VAxzSaG1M4DEhsNtImwQoNwLcsSsvtzLnn+O3t93MMI=;
	b=fJL/efwIL6NMgj9q7u8KxtS3OrXCTN6OfUYQc8T/qzSRyiPwwRB//hdOVw4VyvRVvt41LJ
	sCl+QQxrSTUDiYdSTp0cjV8/IwedC63TDIZfFfGRo35YPVsxNPlroys4ozekwoAbghQljV
	yGHnk6bAA3/0tRFHopcRY97hhJzTM10=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-2uDrEZ8IOcOwQoushEl_LQ-1; Mon, 11 Sep 2023 04:44:16 -0400
X-MC-Unique: 2uDrEZ8IOcOwQoushEl_LQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9aa20a75780so80872066b.2
        for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 01:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694421855; x=1695026655;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VAxzSaG1M4DEhsNtImwQoNwLcsSsvtzLnn+O3t93MMI=;
        b=fxGT27V6NWmHC0vtLL6qWMsyvIYoqs3GLVDcyW68V8PfAnM2IsGts3JndGtJ7jWCbs
         9C1SF5e7v6PqxSBF7SvwI7xrAyAsv91BUFRePzl/5XPKwUsDlnC8OoNYVmME5Svu+X9F
         n5E2ib441aYjM2nlvb4nrtOrR2gypWIYhr+EyqtPsRhYm6yMeNsxg7O9IJZ+HOqEMzIB
         7h1uMo/I782pJCRrkIFkOuMNX7hW6x33vo4qbDL4GtA6a+Meb+SikPCrcsFCZYPpUXPW
         ZVaITxD2HwYC6mpSFJ6Gihp3dUlzPOQruF0fIx50430dp0m9njcOfoxYq1t7+cH7wRFM
         Q1Aw==
X-Gm-Message-State: AOJu0YymD6XTzkn779ndawb5bG0DEWisd/NkN2JzFG0rLhk5+k1wD/Jg
	nDVZLYkivCZbjyvb8v7xBXT5cobuNijPO961WjQOnhMDwJ2xqiv2BvIdthpUm2yYdWg2pTCIvCp
	FTJEMOu0LG2dni+y/YXP/bYB33esnR9M=
X-Received: by 2002:a17:907:7791:b0:9a1:c669:6e66 with SMTP id ky17-20020a170907779100b009a1c6696e66mr7315329ejc.70.1694421854837;
        Mon, 11 Sep 2023 01:44:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2tHs3/adAoSKiOx8eGAOvxWunKF+gY3lM/wIxzRQSYHdnxfQMOCzk0ts3VZHw6/fo3thefw==
X-Received: by 2002:a17:907:7791:b0:9a1:c669:6e66 with SMTP id ky17-20020a170907779100b009a1c6696e66mr7315318ejc.70.1694421854530;
        Mon, 11 Sep 2023 01:44:14 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id k21-20020a17090646d500b00988dbbd1f7esm4953072ejs.213.2023.09.11.01.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 01:44:13 -0700 (PDT)
Message-ID: <472fc5a1-46cb-66e0-463a-934806595997@redhat.com>
Date: Mon, 11 Sep 2023 10:44:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: power button stopped working on lenovo ideapad 5 since
 a855724dc08b
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <7b78505a-a8c9-4770-b283-807581b5edfb@leemhuis.info>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <7b78505a-a8c9-4770-b283-807581b5edfb@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/11/23 09:50, Thorsten Leemhuis wrote:
> [TLDR: Just adding a regression reported to bko to the tracking]
> 
> Hi, Thorsten here, the Linux kernel's regression tracker. I noticed a
> regression reported in bugzilla.kernel.org that seems to be handled
> there already, nevertheless I'd like to add to the tracking to ensure
> it's doesn't fall through the cracks in the end:
> 
> #regzbot introduced: a855724dc08b
> https://bugzilla.kernel.org/show_bug.cgi?id=217833
> #regzbot title: power button stopped working on lenovo ideapad 5
> #regzbot dup-of:
> https://lore.kernel.org/stable/aa1649b6-b7a8-4fbe-8356-2c856951e283@gmail.com/
> #regzbot ignore-activity
> 
> See the ticket for details, there were a few replies already.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

Note there is a patch-series which fixes this (and which is planned
to be reworked to fix it slightly different) pending here:

#regzbot link: https://lore.kernel.org/regressions/20230829165627.156542-1-mario.limonciello@amd.com/

Regards,

Hans

