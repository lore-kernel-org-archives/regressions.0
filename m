Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171C01D2BB
	for <regressions@lists.linux.dev>; Mon,  5 Jun 2023 14:00:14 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b010338d82so21665115ad.0
        for <regressions@lists.linux.dev>; Mon, 05 Jun 2023 07:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685973614; x=1688565614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gJXgEjwfpGOHmImHGfQnSQ5y/6H8/czNE4ns9Lm0aYU=;
        b=LZIGm33R1A5C3Z4uJOAQjknLKEq9vdn5pwpXRb09H61W/xEj3QlHE5wQe1yHiyrXQC
         b6hlvJ+tVGUYc62fI3NNL9GCZA1WxieUDl7gjUmYE3toi4djL9HFSQ8/UfLvzw6tHsDs
         xplJhTzwPXBgDq+Y/YJgIQyWOUM38q1O/PwUGcsY2ObphafE3p0BkMlEVUg3pAilx2Cc
         R1u3ZhOE8DmfRHsnBOhxCW1HXiZ5+YAbk3Ws2fqODnUS6e9wvt3TwxQmsvvkpmXpUpHD
         LB+0BXKOJ26Q4+kSIQPbcumocTbzEtvTk5hAKRF0kHgrXDzFrL6J7ecrHgftNi191L+H
         WD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685973614; x=1688565614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJXgEjwfpGOHmImHGfQnSQ5y/6H8/czNE4ns9Lm0aYU=;
        b=AvkJf8WNW/57j8UeiYAqnMgADpS1Ypd9BQlw01o53PF4Xk7w7Ox6Jb7iUSi7mBBaj0
         Me4yHKpcT2sEkn1jci0gUuGeuAm4jMOIye4Xim48YsLljd3tfNlF1WyIZaKPyb+E3acc
         yX074AcyUpgrZzTG5DG7nEkVJLnLE585tGMq3zZ7tj77GmF52Wi6DcMreRm/qmfn7ILB
         Mte3IbtvH5w5vBw1NjUYcfBX66xLPVyaCcwJamilcD4+HIsq+bcYLAFACHE1Ru16gQJm
         l7QC5fUKJyRx4kNtzvtC/xBXfgTwe4Nfd2kbC8ZERbCsMrqMhnLmI1cYCLdi8uBxe94D
         /VKQ==
X-Gm-Message-State: AC+VfDwMW9eZgN9li+sLNs7UuBr0rEtxCkD5CVtl+UK2ZXNPinn6JIRi
	qicwnUHgnIzmPoaZW9EQXUPxo2SATjo=
X-Google-Smtp-Source: ACHHUZ4E9Q3G05dFg8t9uQlCkWbb6TyMjEL67Dl6Ss5uRTkCoQGcdpZmlgXonB4wTg9LPnCCm6pcwg==
X-Received: by 2002:a17:902:f683:b0:1b2:1943:e291 with SMTP id l3-20020a170902f68300b001b21943e291mr968598plg.57.1685973614025;
        Mon, 05 Jun 2023 07:00:14 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-67.three.co.id. [180.214.232.67])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902b78400b001b03d543549sm6638660pls.72.2023.06.05.07.00.12
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 07:00:13 -0700 (PDT)
Message-ID: <1a7e94dd-fb3f-8534-9c56-976820dc10a8@gmail.com>
Date: Mon, 5 Jun 2023 21:00:10 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Fwd: nvsp_rndis_pkt_complete error status and net_ratelimit:
 callbacks suppressed messages on 6.4.0rc4
To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <15dd93af-fcd5-5b9a-a6ba-9781768dbae7@gmail.com>
 <ebdd877d-f143-487c-04cd-606996eb6176@leemhuis.info>
 <9b810f43-3413-ebc2-1a5f-45a4dd9d774b@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <9b810f43-3413-ebc2-1a5f-45a4dd9d774b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/5/23 17:29, Thorsten Leemhuis wrote:
> [private mail]
> 
> On 05.06.23 12:28, Linux regression tracking (Thorsten Leemhuis) wrote:
>> Hi, Thorsten here, the Linux kernel's regression tracker.
>>
>> On 30.05.23 14:25, Bagas Sanjaya wrote:
>>>
>>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>
>> Hmmm, nobody replied to this yet (or am I missing something?). Doesn't
>> seems like it's something urgent, but nevertheless:
>>
>> Michael, Bagas didn't make it obvious at all,
> 
> FWIW, you might want to make this more obvious and put the authors of a
> culprit in the To: field, and everything else in the CC. And you might
> want to mention the name of the authors somewhere close to the top of
> the mail. And maybe also mention the commit and it's subject close by as
> well.
> 

Thanks for the tip. I'm getting used to habit on placing mailing lists
on To: and individuals on Cc:. I think both fields doesn't have any
practical difference.

> Maybe just use the boilerplate text's I use. Or do you dislike them for
> some reason?
> 

I'm getting creative at this point. I write my own wording which is less
verbose.

Thanks!

-- 
An old man doll... just what I always wanted! - Clara

