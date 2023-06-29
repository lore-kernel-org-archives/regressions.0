Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C654A14AB3
	for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 20:05:44 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-77dcff76e35so17498839f.1
        for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 13:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1688069143; x=1690661143;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y4tq5eP75MWhv6841WPIqTGQTd0wmAvIyZR6YMM91cU=;
        b=kt4y6BEf8FjwOMV3pk/CMHocQI2zxrK/0DPy8nfGhKmxrGsb65ZnyBk+RzELx7IxdD
         04Ssa46bdvqfxULj03WxMa9fcLlxSY63jScz96ALYVx09vgtscokAI9SfKbVWv4H7PYj
         gyiiqBnpaQCX4E9KDfK1xQyoOQdI0XQF7unrkr6IlDkz4WUDKDAbUL8X/oBFXev85tpn
         aMDqQMNCAMTRTqS01YP3lvh4K737d+lAlgczZoU1zxUTUZmk8R5INS1HnSgkB6mHnQ/j
         AvGcSR7A01zpQXCkY/TiqTwvZ4zJmhORcCgYf0//mnUBMXqCkfX9vfyV2HBbLpc/oTYL
         scKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688069143; x=1690661143;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4tq5eP75MWhv6841WPIqTGQTd0wmAvIyZR6YMM91cU=;
        b=Sw21ASuxR9kiaBZkO3IvWtkPmeSetk93pcs//0t4vSBPlihS7MN0/XoakJwB/bEj/N
         IOMcoumB/TAgoVchFA/pni/7BVIdt87FoQfndpNldMLWZmTZIhVK80CiiM7q/U3JnOL6
         uz+y19FG+GoSQs4jqvfOvaBikVBONW2bUCqOQ8oWWw/WL6qdacxrz9Ec036YldjJZDwX
         emDwht/kggPdgE3migyJY+EFVO37MWt5HQN+7Z9n+7d+sz0BX6WEcVjN7gDo1UZrcdj4
         oMJmjmN3Gl9tw3OTKzb5Rp4bQALkNKTFGlN5TVfVxVwsjugB818jyJQbah9w80+rZRrc
         x8TQ==
X-Gm-Message-State: AC+VfDyR+MKypVizUnPDkpwHKUzS9pmfDGmKxmLwm8ZMOcujnV6M6XFz
	WOp6IfZ3ri6KAXXB6T6A81/tbw==
X-Google-Smtp-Source: ACHHUZ7pGQ6LKbesXl3hlbRX1AckZ5mzpygexKjVW7CU51oKAJKLyAWwhk1jdwG4cE4v0XY9sALCiw==
X-Received: by 2002:a05:6602:3e94:b0:783:5df5:950d with SMTP id el20-20020a0566023e9400b007835df5950dmr579213iob.1.1688069143431;
        Thu, 29 Jun 2023 13:05:43 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id t5-20020a02cca5000000b0042aca9978c6sm2865041jap.0.2023.06.29.13.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 13:05:42 -0700 (PDT)
Message-ID: <d6130a0c-5d91-b0a3-f6a9-d1fa6edbba92@kernel.dk>
Date: Thu, 29 Jun 2023 14:05:41 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: mainline build failure due to 8295efbe68c0 ("md/raid1-10: factor
 out a helper to submit normal write")
Content-Language: en-US
To: Song Liu <song@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Yu Kuai <yukuai1@huaweicloud.com>,
 "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
 linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <ZJ2H5FWuo9oDMgPm@debian>
 <be9320b5-7613-be0f-ffcd-4b3041ea5836@huaweicloud.com>
 <13abe42f-2f5f-cbaf-21b8-baa4516963aa@leemhuis.info>
 <CAPhsuW4Wf+PLDCZ7JpHzVT81ubj1Y6MCyLm-BWcVmB1jRqYEGg@mail.gmail.com>
 <CAPhsuW7VK6O6RKQTAcAVk4XxUzNALUW5nKMnMFkm3pW+4F23yw@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAPhsuW7VK6O6RKQTAcAVk4XxUzNALUW5nKMnMFkm3pW+4F23yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The late branch will go out some time next week.


On 6/29/23 9:56?AM, Song Liu wrote:
> Oops, didn't really add Jens in the previous email.
> 
> Add Jens now.
> 
> On Thu, Jun 29, 2023 at 8:55?AM Song Liu <song@kernel.org> wrote:
>>
>> + Jens,
>>
>> On Thu, Jun 29, 2023 at 7:10?AM Linux regression tracking (Thorsten
>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>
>>> On 29.06.23 15:56, Yu Kuai wrote:
>>>>
>>>> ? 2023/06/29 21:32, Sudip Mukherjee (Codethink) ??:
>>>>> The latest mainline kernel branch fails to build x86_64, arm64 and arm
>>>>> allmodconfig
>>>
>>> Thx for the report.
>>>
>>>> Thanks for the testing, which branch are you testing?
>>>>
>>>> This problem is already fixed in latest mainline kernel:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b5a99602b74bbfa655be509c615181dd95b0719e
>>
>> Hi Jens,
>>
>> The fix is in the for-6.5/block-late branch.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-6.5/block-late&id=b5a99602b74bbfa655be509c615181dd95b0719e
>>
>> Would you send a pull request with it? Or would you prefer
>> some other solution for the issue?
>>
>> AFAICT, it will fix clang build with RANDSTRUCT.
>>
>> Thanks,
>> Song
>>
>>>
>>> And thx for the reply. :-D
>>>
>>> FWIW, that fix afaics is still in -next and hasn't reached mainline yet.
>>> But I guess that will change within a few days.
>>>
>>>>> #regzbot introduced: 8295efbe68c080047e98d9c0eb5cb933b238a8cb
>>>
>>> #regzbot fix: b5a99602b74bbfa6
>>> #regzbot dup-of: https://lore.kernel.org/all/ZJ2M4yqnOCqqGWH0@debian/
>>> #regzbot ignore-activity
>>>
>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>> --
>>> Everything you wanna know about Linux kernel regression tracking:
>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>> If I did something stupid, please tell me, as explained on that page.

-- 
Jens Axboe

