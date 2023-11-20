Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E85C1DA29
	for <regressions@lists.linux.dev>; Mon, 20 Nov 2023 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrRRKy3V"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-409299277bbso15323295e9.2
        for <regressions@lists.linux.dev>; Mon, 20 Nov 2023 07:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700495858; x=1701100658; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=89EYg4ouBWYX+fl0hKWC4znxsM2071TE3litLlRaSBY=;
        b=WrRRKy3VKPkh1rdUvhiObZ8InFyJo/vOnr7Hv7L6G7OlH0NUifZHHxzvHUMMIcLY5F
         aiYqPsrRpY7qdQSYb4DQIt6ZdwpvqcONLx2xhzwzfOujfYHeuUJJ5uQq3xqrmCjhq/P8
         4yu5X+5Rtu71z2e1wQBCj1rEkxND+TaISVkETgcF0xdN2M2O85KTaLxtYFYUF93euZot
         bNw3fy2Fq699y2DWvLD8oDLtI5z1Z7a96fUtpU7hjBqGDs5CRKsFvK5diJMWQnoNdWka
         hj3Yu/alMmNqb6tCWs5ppGbsPdlTAmDqZsEoKX/wn/rOWme/Zr78V7gKCfvWjL0HxOf4
         07hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700495858; x=1701100658;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=89EYg4ouBWYX+fl0hKWC4znxsM2071TE3litLlRaSBY=;
        b=DIGNduiduCz+2iaU+DyRELrq75snSzu0w7czThw74QFxpjlXu1v1kMQLLQcS0b9SxD
         lbWj6k/jvVr0y/n/bstn7iZaFHS0UC26JB+2KZ8YSh6ZBsKzVV28kBvoAtbBa8d2MwB/
         tZ2WERqs4IXwdqsQDJ9QqiG2LT3hEbcskDrm3yNyOUsLk55XaFTP037vGEj1FHgNZAEr
         ZU8EdsO66J3Qi4FQD5IV6YBqvWZBlZr7eLXOKy9ufcloN/Zhrz23xXUR2T4AkYbVuFGa
         N3HZjRwuy2bty0rsI5DbaojmsXvY6M6UtclUvbQ2jzrIZKQPf+XNEL7JwZWWMRYu3iex
         QBKw==
X-Gm-Message-State: AOJu0YynwUL9NqXxxd4o9mYlKwXzXGAoDrtvDvvhPwRZy8tfVxUo/m8a
	A0MsCNQPNQR3Y5HIrUvlYHU=
X-Google-Smtp-Source: AGHT+IFhUMUVyBcUDGRSZaC3iPujMi7KSk5AL1rJDDgsBFZb0+BSUafYsTQ9/YcD2194+2G2rh41ZQ==
X-Received: by 2002:a05:600c:4f8f:b0:40a:4609:9c97 with SMTP id n15-20020a05600c4f8f00b0040a46099c97mr6312604wmq.20.1700495858005;
        Mon, 20 Nov 2023 07:57:38 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id y15-20020a05600c364f00b004060f0a0fd5sm13509216wmq.13.2023.11.20.07.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 07:57:37 -0800 (PST)
Message-ID: <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
Date: Mon, 20 Nov 2023 16:57:33 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Radeon regression in 6.6 kernel
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Phillip Susi <phill@thesusis.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 19.11.23 um 07:47 schrieb Dave Airlie:
>> On 12.11.23 01:46, Phillip Susi wrote:
>>> I had been testing some things on a post 6.6-rc5 kernel for a week or
>>> two and then when I pulled to a post 6.6 release kernel, I found that
>>> system suspend was broken.  It seems that the radeon driver failed to
>>> suspend, leaving the display dead, the wayland display server hung, and
>>> the system still running.  I have been trying to bisect it for the last
>>> few days and have only been able to narrow it down to the following 3
>>> commits:
>>>
>>> There are only 'skip'ped commits left to test.
>>> The first bad commit could be any of:
>>> 56e449603f0ac580700621a356d35d5716a62ce5
>>> c07bf1636f0005f9eb7956404490672286ea59d3
>>> b70438004a14f4d0f9890b3297cd66248728546c
>>> We cannot bisect more!
>> Hmm, not a single reply from the amdgpu folks. Wondering how we can
>> encourage them to look into this.
>>
>> Phillip, reporting issues by mail should still work, but you might have
>> more luck here, as that's where the amdgpu afaics prefer to track bugs:
>> https://gitlab.freedesktop.org/drm/amd/-/issues
>>
>> When you file an issue there, please mention it here.
>>
>> Furthermore it might help if you could verify if 6.7-rc1 (or rc2, which
>> comes out later today) or 6.6.2-rc1 improve things.
> It would also be good to test if reverting any of these is possible or not.

Well none of the commits mentioned can affect radeon in any way. Radeon 
simply doesn't use the scheduler.

My suspicion is that the user is actually using amdgpu instead of 
radeon. The switch potentially occurred accidentally, for example by 
compiling amdgpu support for SI/CIK.

Those amdgpu problems for older ASIC have already been worked on and 
should be fixed by now.

Regards,
Christian.

>
> File the gitlab issue and we should poke amd a but more to take a look.
>
> Dave.

