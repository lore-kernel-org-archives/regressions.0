Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9994F101E6
	for <regressions@lists.linux.dev>; Wed, 19 Jul 2023 12:36:53 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-66f5faba829so5066936b3a.3
        for <regressions@lists.linux.dev>; Wed, 19 Jul 2023 05:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689770213; x=1692362213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2RDjShEnxx2CITlna+cx0sylIfu7E+lS3FgCJq6HD0=;
        b=UNoXC15EsWDFkjQoZnZY4lnoy8K5+rhFAfW6hitGkvfYJI9XJCRWsq6EwAki92xBNn
         /0oNaXsP/U6xsEiDgwbrog7fQTwE44ZDy1Qc9+PakqjY/e060iSu39wJv0eCaG4ofmxa
         dxSGPtq9ty38PsG/f/1ovUpZ9a/EYlNZVfmqWaHcEUU6R/Sxt3KBeq596HpVP7kkVpqw
         l2Cfxab1A/Pr9AoE/4S2a4F2NtjXf9FnD0Z6MSiQTEGBCYAxXP+KEvV+Tw0z6MkQ0nCI
         O4uni1skj8s9mlYU1eju2GrB5H9lvVdkGajzazCX6NyCiGiHP2qSPrkZbX96jDsR2UMJ
         BRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689770213; x=1692362213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V2RDjShEnxx2CITlna+cx0sylIfu7E+lS3FgCJq6HD0=;
        b=DJLN5SuYDK1i/6ZDEBGQ8mXHDUwMQz/bMLKkPTsgCZJhvTn8jd0LFMhwIbxdUoA0XF
         Kf+FG/BctZtOmbb/c5OgHZ+E34RbRXw+1XedLs8IwBzATNmOsISIItk/zYaUfYE+lyfb
         pc/rD8yAGHhHX47LXGc/kDfjsO9znrxg8L+Yh9seUZrY8HSBu9d8KRgwI1knHxw3jHjF
         2AMMrrrXxJMOQDsor9HnURGUHeHn/jvNhijaQ24CY15XBxxWTwPJDiUvELZ7++89C05I
         Z1sRaIivmZYPcLajhhPvJYSUaOVtqqSSlHl4Q6XqKUwjJxL1g1U74PpQ1/u0MEvOrM7+
         ZSIg==
X-Gm-Message-State: ABy/qLbxPZZYGPlPG0lpdkMw9InbDYWdSNlPXLUp8Gvzuxi4dAxfBJH0
	CCrDz+RyDfCPYuMECeRBatk=
X-Google-Smtp-Source: APBJJlEDIe9vpBDJWHhVQgQNRN7veJEG2fM1DUO/yd5SkFEj75LXilVEy9YB9KT/RL+4rZvyMDFjgQ==
X-Received: by 2002:a05:6a21:6da6:b0:134:40f0:5d04 with SMTP id wl38-20020a056a216da600b0013440f05d04mr6036578pzb.13.1689770212730;
        Wed, 19 Jul 2023 05:36:52 -0700 (PDT)
Received: from [192.168.0.104] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id k6-20020aa790c6000000b006765cb3255asm3186759pfk.68.2023.07.19.05.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 05:36:52 -0700 (PDT)
Message-ID: <5983cf9d-dc1e-75bd-3624-770951661245@gmail.com>
Date: Wed, 19 Jul 2023 19:36:46 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: Tree for Jul 13 (drivers/video/fbdev/ps3fb.c)
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-fbdev@vger.kernel.org, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230713123710.5d7d81e4@canb.auug.org.au>
 <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>
 <ZLYHtVuS7AElXcCb@debian.me>
 <f5e6258b-ba76-001b-4942-588f4cbb0aa7@leemhuis.info>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <f5e6258b-ba76-001b-4942-588f4cbb0aa7@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/18/23 17:06, Thorsten Leemhuis wrote:
> I'm missing something here:
> 
> * What makes you think this is caused by bdb616479eff419? I didn't see
> anything in the thread that claims this, but I might be missing something
> * related: if I understand Randy right, this is only happening in -next;
> so why is bdb616479eff419 the culprit, which is also in mainline since
> End of June?
> 

Actually drivers/video/fbdev/ps3bf.c only had two non-merge commits during
previous cycle: 25ec15abb06194 and bdb616479eff419. The former was simply
adding .owner field in ps3fb_ops (hence trivial), so I inferred that the
culprit was likely the latter (due to it was being authored by Thomas).

Thanks for the question.

-- 
An old man doll... just what I always wanted! - Clara

