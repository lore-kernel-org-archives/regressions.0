Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D714F7E
	for <regressions@lists.linux.dev>; Mon,  6 Mar 2023 08:57:33 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so8202825pjp.2
        for <regressions@lists.linux.dev>; Mon, 06 Mar 2023 00:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678093053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vt+MS0eYcnMeqDB+aM3O4tClbihsYFf1JjAFSjKpS1E=;
        b=Ut2pKvDf5wwayQF+UAC+FXF6xHDhXluuw7A6U2rkEwwqhkYN5kTsDWdIlcpFk0krUc
         lY8S6KlxITtUWDTDzUkrs7VSrxHu09I324zsD0cQk2qhJ6l4/sOHIWMHsGDmQ1HPXTdk
         OJcPY+GMEj99V3q+BtoXsRpgeXaGDcsNqsK+lhAFFqwgEgCj2Z7+4ag1w2DBSoSs60s8
         70iyjdwN3vTnJKC1ONpM5pMOeX3W+WXB4aVscw/4hCFnzeAS+aIz61fLh9bxrjTHmXtE
         pF78aY6e8KxYw4kXIWuF9qsUaTQ3cE8qo+HFqbMZog+hA3bXZhAW27U1EFR/81jKd3tJ
         gJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678093053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vt+MS0eYcnMeqDB+aM3O4tClbihsYFf1JjAFSjKpS1E=;
        b=aaUAU6ITG31ilSVOnQCjP/49Y/y5nS8zbb/6sLrOdrHA1D6iMRZI/VPNVduS56glfR
         fFReFtitT1PTXr1Pe1c/9bYv3UcAmki7Z7tg/v9FdJnNy/5KieAeHIXAyTSsslY0psgJ
         IVgc1d0W0cKTR8+m4h3ynEKZDVX423woZ1FgH6lAroiNPWRlfglfHQsgs3Z8g5KM/VRt
         H35DuUvO9P0VIcq0VB0AdV5J8K6Rg1w5ToW11ljWUkL/LjOKXZaJAIaUam6sOGC2EgJk
         ap0BtRtEz2f5cEoma0av+7SoVGW5un3qYVKUP/7IV89VVpwxb4bvh6DFujwmRRRj2zGu
         4NzA==
X-Gm-Message-State: AO0yUKUa2XZQGVZKbiEMu1wEtttIAjQrzg2pXZh5RnTojj2kc6/4wnyN
	otSlDTvTo8M13xHrO3DMknw=
X-Google-Smtp-Source: AK7set+dFQRcLEIvi0ZHJ5bHx/UaxNJvMl1pMDFFHBR/U+WXM9FUajLpcyefdLAvvbY7wiCn+BqlMg==
X-Received: by 2002:a17:902:d489:b0:19e:5cc3:828f with SMTP id c9-20020a170902d48900b0019e5cc3828fmr13019163plg.27.1678093053259;
        Mon, 06 Mar 2023 00:57:33 -0800 (PST)
Received: from [192.168.43.80] (subs03-180-214-233-82.three.co.id. [180.214.233.82])
        by smtp.gmail.com with ESMTPSA id e1-20020a631e01000000b004fb681ea0e1sm5764949pge.84.2023.03.06.00.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 00:57:33 -0800 (PST)
Message-ID: <f53f84b5-9da7-0726-2e1f-f7e81e8ecd24@gmail.com>
Date: Mon, 6 Mar 2023 15:57:28 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] docs: describe how to quickly build a trimmed kernel
To: Thorsten Leemhuis <linux@leemhuis.info>, Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <1a788a8e7ba8a2063df08668f565efa832016032.1678021408.git.linux@leemhuis.info>
 <ZAVp6jdeWzYcisUO@debian.me>
 <3d6a30ee-f093-f5b6-a193-cd86320f9452@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <3d6a30ee-f093-f5b6-a193-cd86320f9452@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/6/23 12:40, Thorsten Leemhuis wrote:
>> If your distro config have ``CONFIG_IKCONFIG=y``, you can copy from
>> procfs::
>>
>>     zcat /proc/config.gz > .config
> <snipped>
> 
>> If it isn't the case, you may want to enable the aforementioned config
>> option.
> 
> That or put them in /boot/config-$(uname -r). But well, that is
> something the provider of the running kernel needs to do, so it won't
> help the reader if we mention it here.
> 
> Or do you think the guide should explain this to ensure people can
> pickup their config from there again in case they deleted their build
> artifacts? Hmmm. I currently tend to think that's not worth making the
> text longer for, as at that point it might be better to restart from
> scratch with a distro config anyway.
> 

I think it depends whether someone would pick from /proc/config.gz or
/boot/config. My kernel configuration have CONFIG_IKCONFIG=y but I
often copy the config from the latter instead, since I booted with
arbitrary kernel version when compiling two or three versions, and I
want to ensure that the config used is from correct version (i.e.
I use /boot/config-5.15.x-string to build 5.15.x+1 kernel).

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

