Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9389023C8A
	for <regressions@lists.linux.dev>; Thu, 18 May 2023 14:00:29 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-64d2a87b9daso122116b3a.0
        for <regressions@lists.linux.dev>; Thu, 18 May 2023 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684418429; x=1687010429;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOXc8StjOjh7MjrwfdFz6Z5mSMunJ3OwEZtOAZGxw5w=;
        b=chkulIZ6uorScOasKTo1T616TaqyCfxKWcN6F0yWKAWf4vRGVx57rEUMVsyZ5H5Anc
         5d0IKXu+PLF/6afFsjrzETnufH5dVrw7H44vePy45JJBpdC1xXTX5dTcgGONFzSvuj8f
         y+sFbEr9FBck9AiAV/sifz2rtIVGwoOiN7E846VR3uyBoFBDMV6teUnenpwvfFu6Tn02
         5/OWAyUxcLGifb+iUZwE54LVkVOkTUCItaIB641xyid6pXeDYqHGXh6iO1K7HIsSInBi
         3cwSVvRxOnHaPCNAWgvH9d3zUKrFR8CELNYfXS3GIIF4yg7X5JKkfpjzehS3n4rJB+0G
         nM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684418429; x=1687010429;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOXc8StjOjh7MjrwfdFz6Z5mSMunJ3OwEZtOAZGxw5w=;
        b=NU4X+Nbn+5T429vDU3hKhGfT0N39PkSxDyZB1u/AJaVGcJF5BTkwB9NV96eaqpAxc2
         Tm4nz/prO0l3KaFRPsl7UfkrZqY6VGdTHjA3mCm5bc8B9G4MxDdPNFaKW8bZ+ngURElo
         DU5oOraJ6rW3lwf7mQZkZ/X5wkobsFFqzN3XGbPJJERbujygWT2YG5W0NX75nYDLVZjn
         FIZJ1WCcV9Vlr3sih0d+VoJAWk9VCsJdUcZmJlY4LgbFxb/qpNWooqDp5O50jPXkooZa
         thsu8EMKy4qvJoHDGjx7yS937ivZatdBXo4sQqxDbQVCRS9e7AVH86v1Z0OzxL77GFep
         GyIw==
X-Gm-Message-State: AC+VfDxc6rygOedQUjoHic0HtpWTRXoTF0SsmFZ4qOLx0uN1JSZNaGHR
	07rlpal4osYWYpR7fJIaEZU=
X-Google-Smtp-Source: ACHHUZ5ZLMZpbnzWCKHzvLj9RuRQJqt96wTDHMlD4k9s89X9UUUGfqQ6LSKNUqfU4z5dLBRVyjqg8g==
X-Received: by 2002:a05:6a20:105a:b0:105:6d0e:c037 with SMTP id gt26-20020a056a20105a00b001056d0ec037mr1804571pzc.38.1684418428448;
        Thu, 18 May 2023 07:00:28 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-78.three.co.id. [180.214.233.78])
        by smtp.gmail.com with ESMTPSA id p15-20020a63c14f000000b00528db73ed70sm1301332pgi.3.2023.05.18.07.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 07:00:27 -0700 (PDT)
Message-ID: <babafe0f-3154-fb0a-346f-2bbea48a366e@gmail.com>
Date: Thu, 18 May 2023 21:00:23 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Fwd: Persistent rt_sigreturn segfaults on KVM VMs after upgrade
 to 5.15
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux KVM <kvm@vger.kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Theodor Milkov <tm@del.bg>
References: <71288f04-546c-9af3-e29a-eb3c44e0d948@gmail.com>
In-Reply-To: <71288f04-546c-9af3-e29a-eb3c44e0d948@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/18/23 20:57, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
>> I'm experiencing sporadic but persistent segmentation faults on the KVM VMs I manage. These faults began appearing after upgrading from Linux Kernel 4.x to 5.15.59. I further upgraded to 5.15.91 and transitioned the userspace from Debian 10 (buster) to Debian 11 (bullseye), yet the issues persist. Notably, the libc has also changed in the process as seen in the following error logs:
>>
>>
>> post.sh[21952]: bad frame in rt_sigreturn frame:000072db65961bb8 ip:6c25f82a9a5d sp:72db65962168 orax:ffffffffffffffff in libc-2.28.so[6c25f8294000+147000]
>>
>> cron[7626]: bad frame in rt_sigreturn frame:000073ddebeb6ff8 ip:72ad9f44d594 sp:73ddebeb75a8 orax:ffffffffffffffff in libc-2.28.so[72ad9f3a9000+147000]
>>
>> cron[64687]: bad frame in rt_sigreturn frame:000073265764b038 ip:67c7b5a0f14a sp:73265764b5f0 orax:ffffffffffffffff in libc-2.31.so[67c7b596f000+159000]
>>
>> worker.py[54568]: bad frame in rt_sigreturn frame:000078eef6591cf8 ip:6c9f9b2a604e sp:78eef6592298 orax:ffffffffffffffff in libpthread-2.31.so[6c9f9b29a000+10000]
>>
>>
>> The segmentation faults occur 1-3 times daily across approximately 1000 VMs running on hundreds of (supermicro, intel cpu) bare-metal servers. Currently, there's no reliable way for me to reproduce the issue. I initially considered this bug - https://www.spinics.net/lists/linux-tip-commits/msg61293.html - as a possible cause, but judging from the comments it likely isn't.
>>
>> The best approximation to a reproducer I have is a Python script that initiates several child processes and continuously sends them a sigusr1 signal. Still, it takes a few hours to trigger the issue even when running this script on several hundred VMs.
>>
>> Switching to the 6.x kernel isn't immediately feasible as these are production systems with specific requirements. The transition is planned but will likely take several months.
>>
>> I'm looking for suggestions on how to more reliably reproduce this problem. Then I could try different old and new kernels and maybe narrow it down.
> 
> See bugzilla for the full thread.
> 
> Anyway, I'm adding it to regzbot:
> 
> #regzbot introduced: v4.19..v5.15 https://bugzilla.kernel.org/show_bug.cgi?id=217457
> #regzbot title: bad frame in rt_sigreturn (libc-related?) regression after 5.15 upgrade
> 

Oops, I forgot to add the reporter:

#regzbot from: Theodor Milkov <tm@del.bg>

Sorry for inconvenience.

-- 
An old man doll... just what I always wanted! - Clara

