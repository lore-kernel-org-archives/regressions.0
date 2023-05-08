Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666A51361
	for <regressions@lists.linux.dev>; Mon,  8 May 2023 13:20:10 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6439b410679so2593487b3a.0
        for <regressions@lists.linux.dev>; Mon, 08 May 2023 06:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683552009; x=1686144009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5gcBvfYJlzZmMkTxk2h2j2g6ckvX/k2lViWHLDwGtw=;
        b=NYtl9s3Ld1fQJDR+VrYeqdM2/sUlMS9Qek93q4zCpHDFzmXlDZze41R4MCnunwL0PD
         GPXbuIHTdgT7BctFzxcrzNgO+vZO4LFiHDK58LsQRltboAbY7mkFUR+cW2CK4izooreA
         +NTGlQHkbKM+BZ+n6oGfXfP0pPyOptBZfSlmzwMw3HC/z5ikPR86P3vOOpd7jlz5dE8d
         14W7o8PhsGZBW38rYX0mIY936DgDGu56c53RFsgUY08zIg+QD3f7TmTzfRJ7k5NjOBgh
         DSDf460W23FXIY0vTOAphRDaCTyS2Lam9N/SmNll7nZG6J+cWYLZRh1uPA/BqDhrSMoa
         2Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683552009; x=1686144009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5gcBvfYJlzZmMkTxk2h2j2g6ckvX/k2lViWHLDwGtw=;
        b=ivb59km4nfb1xN9hpV7NcTkjMIiAm+8ntl5zVAY5AOJgEBogX/7dA/XxcynRGYzjSd
         QJeP6/SISzhTraIyhKNjKAKK3Rvf0M5WWnINhaLJjB7HiMszONTtC37ueuCCTv+oXvbh
         rKErd5foat9HV6wkSReKwiR0d+jGlca+oPohibSM5vhP14lNIfSWz9Gb4h3CpRDnk9Dm
         ewqQz5DW/1uoZ07i6MAd9BieY0Ll0v+Y4QAWsmkd8Aw5yQBDof+WVMSm+L/gkvn37xea
         zY+gOP3AUk/GtB3poOzDFr1DY0GHqf376v4yduMpgTt/lsif5kSQ7D9p2A+cuowbROf7
         NZlg==
X-Gm-Message-State: AC+VfDxfewJ1s+WUQVGb2AW5sgJbof4Aht9+uHi4T0AwnlQf9KduUj4N
	2RqOcokwh9Qz4zMZ+Vm7Swa7PZQW3B8=
X-Google-Smtp-Source: ACHHUZ58r+AP9tUQfy2pmFlw+UCdJJdya/1z0EdBVs+Edz0Om2vXLSJ+k7kmdVXeKyHFrkKKkx6xKg==
X-Received: by 2002:a05:6a00:1a46:b0:641:d9b:a444 with SMTP id h6-20020a056a001a4600b006410d9ba444mr12336588pfv.31.1683552009437;
        Mon, 08 May 2023 06:20:09 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-47.three.co.id. [116.206.28.47])
        by smtp.gmail.com with ESMTPSA id c1-20020aa781c1000000b0062e0010c6c1sm6052062pfn.164.2023.05.08.06.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 06:20:08 -0700 (PDT)
Message-ID: <85ca82b1-8a53-c0d7-e1b6-93288a6e129c@gmail.com>
Date: Mon, 8 May 2023 20:20:03 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Olof Johansson <olof@lixom.net>, Darren Stevens
 <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>, Rob Herring <robh@kernel.org>
References: <301595ad-0edf-2113-b55f-f5b8051ed24c@xenosoft.de>
 <71f580c7-0890-b622-62c9-f58fa9537a90@leemhuis.info>
 <ZFjx31Rw79GF+E7p@debian.me>
 <fa6de026-1444-7beb-197c-d6a637eef86e@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <fa6de026-1444-7beb-197c-d6a637eef86e@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/23 20:17, Linux regression tracking (Thorsten Leemhuis) wrote:
>> Why and how can you conclude that the culprit is e4ab08be5b4902 ("powerpc/isa-bridge:
>> Remove open coded "ranges" parsing") rather than powerpc PR merge commit
>> 70cc1b5307e8ee ("Merge tag 'powerpc-6.4-1' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux")? 
> 
> I looked at the thread and noticed it was mentioned later (
> https://lore.kernel.org/all/3fa42c8c-09bd-d0f0-401b-315b484f4bb0@xenosoft.de/
> ).
> 

Oops, I wasn't seeing the whole thread. Thanks anyway.

-- 
An old man doll... just what I always wanted! - Clara

