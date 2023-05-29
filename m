Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66537C
	for <regressions@lists.linux.dev>; Mon, 29 May 2023 01:51:35 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-64d24136685so1897017b3a.1
        for <regressions@lists.linux.dev>; Sun, 28 May 2023 18:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685325095; x=1687917095;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPRHttCC09H4/tUnTXoXcgLVvVhSGfEl39Ynz6A4OtM=;
        b=V519c/gbuue/T92+R4H0pBg1sxGlRJprFhuCh0JHMw49sp4ZQriafpp+D5tGr4f8Bm
         UFcuu9nCVKRk+Xs5HY5AxGTNhbHM0hWC8ejexIMWeRuQbfULB6xjiJW36P39rxz1boJV
         SQAbGk0eu/T/sEk/Rxd9CeB5US7iRzRPX8eEA8AITlH1rGZHia6KQybulgmCVsx70rSq
         L809pQS6ffm6BMEIm5dJY2RFFsjiJOR2GJdeYL+PyOm3WXW1S45PD4ejG9rRkO9OMHft
         5h1dWqtzCzQ0najzmjyTyxdoGljDz/dDAj/p+C2cX7o0K/Ookogd9CcNKOQFv8sV/iJK
         YNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685325095; x=1687917095;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gPRHttCC09H4/tUnTXoXcgLVvVhSGfEl39Ynz6A4OtM=;
        b=MUcmJLGE9I5t/sl/tWGlTJZn6/it8SPtN6h5/z9wdd7lS0WxNHgKvhZXaQbojWRIkw
         Oxcg4SQIYlI9tVX7ptMQ844xT7TbFUfegIivPcx9ZUzyZBHZ2kx+I1fh8OBgQJ7u80Bu
         YkzE1VvCXlV+7D5YzB+AKA43yc2Fz7pQ4uRUvsActGfHFVkECDY2UCjumUCn6f2ONEbf
         j0wFp1VeSjuhwejCKzYGq/37SdCJbCVW87EZ1DxTvhCK1snFN1/znPQBObvuTyGlEXeZ
         gouatTKfXZGg+9ZnJMB2uvoU/6jdCA+yU52YUvzrEN+6Yod5A6Ov5NBFiD8SmqvrsGKt
         xXRA==
X-Gm-Message-State: AC+VfDxdivkfjjXk8xT/2HimdUSRTq11BGMGeuNr4LSPut49G6EusET9
	6lUzUqLa0ZP37CVQrrU46Vw=
X-Google-Smtp-Source: ACHHUZ5eg9u2gFQ/NpsWDKl0x6LFq4+4SZ/VN1BEeZ26O2vXPPAebeK2u1iGkJbCbKUybu4MaidBHA==
X-Received: by 2002:a05:6a00:1742:b0:647:157b:cb61 with SMTP id j2-20020a056a00174200b00647157bcb61mr7382873pfc.7.1685325095172;
        Sun, 28 May 2023 18:51:35 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-34.three.co.id. [116.206.12.34])
        by smtp.gmail.com with ESMTPSA id s22-20020aa78296000000b00627fafe49f9sm5661178pfm.106.2023.05.28.18.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 May 2023 18:51:34 -0700 (PDT)
Message-ID: <6a10ec48-3940-cd8d-5e34-b9ade9f87b82@gmail.com>
Date: Mon, 29 May 2023 08:50:51 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>, Linux x86 <x86@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>, Thomas Gleixner
 <tglx@linutronix.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Michael Kelley <mikelley@microsoft.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>, Helge Deller
 <deller@gmx.de>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Vincent Donnefort <vdonnefort@google.com>, Bert Karwatzki <spasswolf@web.de>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: kernel/cpu.c: linux misses the initialization of one CPU
 (off-by-one regression)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Since commit 18415f33e2ac4ab382cbca8b5ff82a9036b5bd49 linux misses the initialization of 1 CPU when the CONFIG_NR_CPUS is equal to the actual number of CPUs in the system. One can work around the issue by increasing CONFIG_NR_CPUS or apply the following patch:
> 
> From aa5ef661936655f0d806fdbf2d28fc9513dd5c69 Mon Sep 17 00:00:00 2001
> From: Bert Karwatzki <spasswolf@web.de>
> Date: Sun, 28 May 2023 14:35:45 +0200
> Subject: [PATCH] Fix CPU detection when CONFIG_NR_CPUS is equal to the actual
>  number of CPUs.
> 
> Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> ---
>  kernel/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index 005f863a3d2b..5e900b531827 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -1770,7 +1770,7 @@ static void __init cpuhp_bringup_mask(const struct cpumask *mask, unsigned int n
>  	for_each_cpu(cpu, mask) {
>  		struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
>  
> -		if (!--ncpus)
> +		if (!ncpus--)
>  			break;
>  
>  		if (cpu_up(cpu, target) && can_rollback_cpu(st)) {
> -- 
> 2.40.1

Anyway, I'm adding it to regzbot:

#regzbot introduced: 18415f33e2ac4a https://bugzilla.kernel.org/show_bug.cgi?id=217498
#regzbot title: Off-by-one CPU initalization when CONFIG_NR_CPUS equal to actual system CPU count

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217498

-- 
An old man doll... just what I always wanted! - Clara
