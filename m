Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2170D2F32
	for <regressions@lists.linux.dev>; Wed,  1 Mar 2023 13:00:56 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id a4so10557519ljr.9
        for <regressions@lists.linux.dev>; Wed, 01 Mar 2023 05:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677675654;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qubv27DiDwlC9u0MucshTHdbQ727qIsd5IiVQIsU3iA=;
        b=QcT2MW6k9iEQOu9UaRMh0MZIYKfDcj7Xykn63IUOpR6qyXCtdyJkMO8bBtngWZqliX
         ytnu8nRVUeaD8UVBCQCoPEeeWubq5FspN+N1S0YWwK8oSHEo72XDVUN4nHPuBgnzu6Cr
         B4qTwlvN7wlZtb6UWVNt9fkTNPCCdSdD1RLHxkngQ8p7n43m1suPiC8kOdV24+RGlWQ7
         snPudnLtgIG0QS1FmENGXSNY8xNsyYpjVi7Lgd4whVgbJDMqwr1Bqfdoo+mu+HRPlEEm
         U1+RVAq8/1FQSg1kySLi8mo9AJGADIUBZpEYkfH/l7YSjKUdShr2Wtyh0ZHrm9naUOU6
         IOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677675654;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qubv27DiDwlC9u0MucshTHdbQ727qIsd5IiVQIsU3iA=;
        b=WTum0q5YMGx9YuRL2yAe/+tB5BrmHc/Ru8rLTRex1EAEnC4TeqQxT4EsAOs341qnbo
         Ry5m90t8eGYTkO/pnmSg5vSsX6DkxKHZxRbro9j+iFroQFQl7m3F05cBgXVBN9XrXDKj
         pP7PxO3YKzUcrP3FrgB/af9uZrFCAryoXaoyNyPFFWSm+8zSyJxvTmtWf9ZVeBaSmKiG
         6rXbWIxfalA2fexAfC0t8eaUqnpuPvQDLT7R2WZdT4Yhy9WGPOWaJHe5mIIcNMQu19Mk
         frJJTqF4RJI9Yvm76fq24aUBAhmZcwqgwa66nKRQ2KyhgqD0owCS6QsBZ9mv8M3ugjVy
         Avog==
X-Gm-Message-State: AO0yUKVwt4dLvkaH4c3ZFcQ8TTxg+EMUMUNtyARufK+xeYiNKiVx8c8Q
	KUegep5dt6G+8MEewl8X7kDgXGKTyJ8=
X-Google-Smtp-Source: AK7set9wpDa15h9smNLGWGmgZTpzZGnMy28pdVnR+UobMgf3TSpw9Noot7aD1FrEZPTC66B2Vq/10A==
X-Received: by 2002:a2e:b90c:0:b0:293:2d4d:7e00 with SMTP id b12-20020a2eb90c000000b002932d4d7e00mr1862707ljb.12.1677675653657;
        Wed, 01 Mar 2023 05:00:53 -0800 (PST)
Received: from ?IPV6:2001:470:27:8a1::2? (tunnel811020-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:8a1::2])
        by smtp.gmail.com with ESMTPSA id v21-20020a197415000000b004db250355a2sm1727653lfe.103.2023.03.01.05.00.52
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 05:00:52 -0800 (PST)
Message-ID: <4634aff6-1d1e-f3e4-d33a-f9677e305ebe@gmail.com>
Date: Wed, 1 Mar 2023 16:00:52 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Bug 216646] having TRANSPARENT_HUGEPAGE enabled hangs some
 applications (supervisor read access in kernel mode)
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <bug-216646-27@https.bugzilla.kernel.org/>
 <bug-216646-27-o4jKola2S5@https.bugzilla.kernel.org/>
 <20221121125400.334190a6d2791b0c9afbfea0@linux-foundation.org>
 <220fd094-7cf1-9d17-8380-98d5663dc5da@leemhuis.info>
 <Y4ouwhqSyDV7I+D9@casper.infradead.org>
 <Y4p0tbbbQ5JkyZs5@casper.infradead.org>
 <20221203014420.76281b930dbc64f51eda0f8b@gmail.com>
 <Y45Tp1Br2Em8e3Fr@casper.infradead.org>
 <20221206050845.6ba9351cef3295be4b923ea8@gmail.com>
 <69b81148-8e62-d697-e92b-c3b042214a09@leemhuis.info>
 <c7e325e6-48a5-902c-054a-dbb32d3d938a@leemhuis.info>
 <edd796af-c53e-0908-599f-2fce92160e92@gmail.com>
 <adb98c6c-dd64-7cb1-4be9-b663a100c460@leemhuis.info>
From: Mikhail Pletenv <mmp.dux@gmail.com>
In-Reply-To: <adb98c6c-dd64-7cb1-4be9-b663a100c460@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

That's all right, i was gearing up to re-test this anyway =)

On 2/27/23 14:40, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 22.02.23 17:45, Mikhail Pletenv wrote:
>> To my knowledge it wasn't, Matthew didn't reply to my last testing
>> results and i'm kinda hesitant to poke him. I've been using a workaround
>> for the time being. I will run tests again later this week (maybe issue
>> was fixed and i didn't notice because of workaround) and i can report
>> the results to you if you wish.
> Thx for your reply. Ugh, I noticed I misread your mail. But seems I was
> lucky and the problem is still there according to your latest public
> message on this. Thx for the update!
>
>> Also i'm thinking about reporting this on gentoo kernel bugzilla, since
>> 6.1.12 is now considered stable there.
>>
>> Best wishes, Mikhail
>>
>> On 2/16/23 15:43, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> [off-list]
>>>
>>> Quick question, was that issue (originally filed in
>>> https://bugzilla.kernel.org/show_bug.cgi?id=216646 ) ever fixed? It
>>> doesn't look like it, but I wonder if I'm missing something
>>>
>>> Ciao, Thorsten
>>>
>>> On 16.12.22 06:23, Thorsten Leemhuis wrote:
>>>> Hi, this is your Linux kernel regression tracker. Top-posting for once,
>>>> to make this easily accessible to everyone.
>>>>
>>>> Was some progress made to get this regression resolved? From here it
>>>> looks kinda stalled, that's why I'm asking -- but maybe I just missed
>>>> something.
>>>>
>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>
>>>> P.S.: As the Linux kernel's regression tracker I deal with a lot of
>>>> reports and sometimes miss something important when writing mails like
>>>> this. If that's the case here, don't hesitate to tell me in a public
>>>> reply, it's in everyone's interest to set the public record straight.
>>>>
>>>> On 06.12.22 03:08, Mikhail Pletnev wrote:
>>>>> On Mon, 5 Dec 2022 20:25:11 +0000
>>>>> Matthew Wilcox <willy@infradead.org> wrote:
>>>>>> Thanks!  I think this may be the problem ...
>>>>>>
>>>>> Hi Matthew, thanks for swift response, i've applied your last patch
>>>>> and ran my stress test a couple of times. It's still constistently
>>>>> crashing (albeit it seems in a different place):
>>>>>
>>>>> .....
>>>> #regzbot poke
