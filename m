Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A873256A
	for <regressions@lists.linux.dev>; Sat, 10 Jun 2023 13:27:11 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b24eba185cso14360605ad.2
        for <regressions@lists.linux.dev>; Sat, 10 Jun 2023 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686403630; x=1688995630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=feLkklU8QQo6+CqnfmR65iwQdI4nch86pSzF7/Ejl1U=;
        b=d+9Gb4VoEz660buLe8D3IQUStOHnr0qf5rzb4NuYvReJxjuEjo7JPU16c8GAL/RPSB
         SzSt/zLU5MsWlHMDKcF9p73jL0uW2vDG2+ilx4s1dnRM7eyGtUWlZgIAG5B03Cz6WQBt
         BnbQHXaR8tc7+uOG11ya7AR7INdnqsIlVSxAqwNnWKrX2Wc1oqR41ZamiAfSTDCxZMvt
         m+LbdqEregcxUowQ52mjQCh0uzC96qBEf52jZWbsykBJ2UBBUqC3fD5YHAzJs4EcPVqO
         8FpAkz4xntPNx76IMn+FjKx1LvANjko+a80Bph4QWBBZOke27nhJv1sJGjmn69KyYU72
         ZCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686403630; x=1688995630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=feLkklU8QQo6+CqnfmR65iwQdI4nch86pSzF7/Ejl1U=;
        b=Z6FtO3a+ZV5501gMa1qpinW8pwilB1L/jxE+mRjJy2u73SbrcB+VVgYkYfWtzvRZMM
         JdJDQGWkWwuACiLJLgy7oUOo9FvOUbc9frPLrhKD0z4GR/uTA5TBm14oloCtugGhxhjI
         jelWKJLw9VKqZUUg1HxLQCOWzpi8j0pDCaljsOACqDRIh+xZbKVcVjVpQDYd4lZMKaI9
         S5gqqTRvNQAnyCLgaADAjIiJHZY3O3NRAtGWDUYjmdsD9Ciogv6XiDl+/6vkvbHdZ74l
         SEtVRwYMGnkakXMLLDJWiPoeENbyOEGOZRl6dDiGZrFPnJOdx6DA9cNnic2g4gWJoSTA
         fccA==
X-Gm-Message-State: AC+VfDw984F9sJp8ox3mrWFsIQdbYSHGyChr8e2aISjg06mON6po/iGE
	iXU4HC0z1z9cjsUDpdrAidU=
X-Google-Smtp-Source: ACHHUZ6HWDnN7NK+GM1TTa2LKHZOI2WxhV2/acudKOcg0T+xt4IlT9Dkj6c33tsA7jPnRZNWXsxcBw==
X-Received: by 2002:a17:903:1208:b0:1af:aafb:64c8 with SMTP id l8-20020a170903120800b001afaafb64c8mr2118223plh.21.1686403630429;
        Sat, 10 Jun 2023 06:27:10 -0700 (PDT)
Received: from [192.168.43.80] (subs09b-223-255-225-238.three.co.id. [223.255.225.238])
        by smtp.gmail.com with ESMTPSA id y20-20020a170902b49400b001a980a23804sm5010765plr.4.2023.06.10.06.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 06:27:09 -0700 (PDT)
Message-ID: <07d6e2e7-a50a-8cf4-5c5d-200551bd6687@gmail.com>
Date: Sat, 10 Jun 2023 20:27:02 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Fwd: Waking up from resume locks up on sr device
To: Pavel Machek <pavel@ucw.cz>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 Joe Breuer <linux-kernel@jmbreuer.net>,
 Linux Power Management <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Hardening <linux-hardening@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux SCSI <linux-scsi@vger.kernel.org>, bvanassche@acm.org,
 Alan Stern <stern@rowland.harvard.edu>,
 Dan Williams <dan.j.williams@intel.com>, Hannes Reinecke <hare@suse.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>
References: <2d1fdf6d-682c-a18d-2260-5c5ee7097f7d@gmail.com>
 <5513e29d-955a-f795-21d6-ec02a2e2e128@gmail.com>
 <ZIQ6bkau3j6qGef8@duo.ucw.cz>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ZIQ6bkau3j6qGef8@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/23 15:55, Pavel Machek wrote:
> Hi!
> 
> 
>>> #regzbot introduced: v5.0..v6.4-rc5 https://bugzilla.kernel.org/show_bug.cgi?id=217530
>>> #regzbot title: Waking up from resume locks up on SCSI CD/DVD drive
>>>
>> The reporter had found the culprit (via bisection), so:
>>
>> #regzbot introduced: a19a93e4c6a98c
> Maybe cc the authors of that commit?
> 

Ah! I forgot to do that! Thanks anyway.

-- 
An old man doll... just what I always wanted! - Clara

