Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A272E8475
	for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 12:08:53 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68fcb4dc8a9so5091272b3a.2
        for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 05:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695125333; x=1695730133; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6xhmX02krfuudIK/kDSdYE25699Zi1WYmFbMkp7FRE=;
        b=AkfWUshOmTf7vus10579NmMZ1gcbVNHcoiLI1mbZTkBXCFJle9i3tAsWl6HjFfGWMP
         7dQcrTm3VFl6NxJz7ehZuvMdKVGB3UNHh8xLeTqBwuUSK0Obv9DgfNlPOpR/wzyudmes
         RtostILtZMUwVhSSr5yKmIeuMhYd7ZYd711T/kI6KxaT5QIM9MUMEf/YpqfB/7tKMSOy
         /xNeYyWPrn0sg6Th9berRxL0ZyPn/YEYv/QRgJy0r9vNw78yqj9j61EObzVKsLsPtrV4
         bUxoirR93utcuEx9zQaTJfd9Lw4qFCORcZ94Atb3rq8lHB1L9ri+f7X6Y9deqflsdNIg
         t/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695125333; x=1695730133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6xhmX02krfuudIK/kDSdYE25699Zi1WYmFbMkp7FRE=;
        b=cnKZV3vKTx/4S9rX9WX1ve34niWNfnpOHvp+ev8Jwi2Q7j5DsGOf5m2x7Q1wkFBzej
         6gmNOA5A3XIZdO5/7yc6jeC2A1iarIU0UVJi41rGKaPAYhHkZpgJKvpnNGpc9kHyTpkO
         Zck+Q21VgF81Lh2lxbxZAJAZ892G+ftxhM8jVyL0ZJOT2VO6yvKf8qb6CG/ExBVQ9oc7
         0kjl69UawefUvvLTW7zfmUc5+Xn25bUBBfRvm/yx2phTJ8WOmkfGA7ALIigqaOxBx361
         Ue4BRryP/oAZbDW12vLhPaH+2IDIWy+bmmt8KKAbHq4f7jESjQL4igLsF24pbB0rrO/w
         KELg==
X-Gm-Message-State: AOJu0Yy75dKLILG2epKJLlwzwgqsfl3nUp5++2ZWadEnD2VrpKapuzrq
	H+MLbZ9bsNZzrFBjlQrD4+EjagxZkg0=
X-Google-Smtp-Source: AGHT+IGWrKUt1gJtfuwgclUNdSACapHw0G929wnxRxw67DgRvp8vDesvlYLDs+VGKnIIi/plOt67HA==
X-Received: by 2002:a05:6a00:813:b0:68e:39b5:7e63 with SMTP id m19-20020a056a00081300b0068e39b57e63mr12467455pfk.16.1695125332780;
        Tue, 19 Sep 2023 05:08:52 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id c21-20020aa781d5000000b0068fe68de4e1sm8758513pfn.145.2023.09.19.05.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 05:08:52 -0700 (PDT)
Message-ID: <bbc73924-299d-4de5-a06c-995a49e5f27e@gmail.com>
Date: Tue, 19 Sep 2023 19:08:41 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Marvell RAID Controller issues since 6.5.x
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Damien Le Moal <dlemoal@kernel.org>, Song Liu <song@kernel.org>,
 Timo Gurr <timo.gurr@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux SCSI <linux-scsi@vger.kernel.org>,
 Linux IDE and libata <linux-ide@vger.kernel.org>,
 Linux RAID <linux-raid@vger.kernel.org>
References: <224f10a4-7a6a-48bb-88be-491faf8ecff7@gmail.com>
 <ZQf9mh3v5qfN5Tm0@x1-carbon> <ZQgCoJ17UioOtdOJ@debian.me>
 <ZQlFg4GsULu633P1@debian.me>
 <9c791f68-bbfe-4722-9cbb-5e791ce042ec@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <9c791f68-bbfe-4722-9cbb-5e791ce042ec@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/09/2023 18:32, Linux regression tracking #update (Thorsten Leemhuis) wrote:
> [TLDR: This mail in primarily relevant for Linux kernel regression
> tracking. See link in footer if these mails annoy you.]
> 
> On 19.09.23 08:53, Bagas Sanjaya wrote:
>> Another user has confirmed the fix (see Bugzilla), so:
>>
>> #regzbot fix: https://lore.kernel.org/linux-scsi/20230915022034.678121-1-dlemoal@kernel.org/
> 
> Bagas, FWIW, using "#regzbot fix" is not supported (maybe it should, but
> I have other priorities currently), hence let me fix this up:
> 
> #regzbot fix: scsi: Do no try to probe for CDL on old drives
> #regzbot monitor:
> https://lore.kernel.org/linux-scsi/20230915022034.678121-1-dlemoal@kernel.org/
> #regzbot ignore-activity
> 

Duh! I should have read regzbot doc then. Thanks anyway.

-- 
An old man doll... just what I always wanted! - Clara

