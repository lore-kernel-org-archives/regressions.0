Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897DF11181
	for <regressions@lists.linux.dev>; Sun, 19 Nov 2023 13:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Q42Il7gR"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5c1b6fc5426so179640a12.1
        for <regressions@lists.linux.dev>; Sun, 19 Nov 2023 05:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1700399692; x=1701004492; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Jnvh0uSqYJOA1ffl5+OCnqgORnNMLUa+bbdwsPJB8s=;
        b=Q42Il7gRyMc5HTTup/ObhNfvCHp6r7BeEACRTInDPLofWH30ML4e/vl++5Srptd9DL
         BM319OUTj8w4LQ9Cew8CW+twG1q5h8CuTzHD87xQkrqsMRu6Q2UbZxoodHqqTRq/gJlI
         AJkxtDhyiaDvgA0AWuoNSB7F6aB6XFk7yE+Rlj+b0P+zpJCgYywQTje6eAvARfLHwC9i
         lOpUSuzN9mvjlkS34CAxT8ENB8Qas6UPI8dwGGMKmGgfM3ZnlHKQYWV+VnbIzFDjqErR
         q4SPT93lV3TrovX7IWFV2JvGBoCMZiJzwvg+hskCHY5zhUiDuaXCzvW8XCWxZvMB2gu6
         U5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700399692; x=1701004492;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Jnvh0uSqYJOA1ffl5+OCnqgORnNMLUa+bbdwsPJB8s=;
        b=kPR9UEyEMk3a2vBMKUQxsRSRWEbjCYhG0deHVjJRii4BElPUH6XRJNkRGomHaELA4b
         N+H7nXTgVXrZ3ckVeHPmSGYKj+JX7C9KygrOzvzVpmW6cpSClXM0kQOicdiiXDouNWLn
         9NNmuHCstDWuBMcGPVYABUnipi/f7yPhC0JALM0LrHkqKvELt7BcSrnd8jddZJ6UqekJ
         6DHI7g2LXW0K+V2IgNpv5tUbkMzDs4CeAmECyd+jjSQhDbjFTiYphsehfDTwI2EWdfYH
         6YobNd/R9l2KFw8UzSdnw3slIKltGBsuS1bghJ/RrjS7rGl566fK75KMi1QK3jHaFh2u
         ug2w==
X-Gm-Message-State: AOJu0YxllRp3W7ezTAKid0Dz3bMY/LLFl/EADv503/kYirT25jeEKNjE
	ITJPBN5v0Qenq0Prhg9S0DDT3w==
X-Google-Smtp-Source: AGHT+IGqpRKFev/H7sZu2yvuRrfS/qugUAQdcwysXY76mok/kgcwo5VNtQhAUKhXkSeHKyoj1apkOA==
X-Received: by 2002:a05:6a00:4215:b0:68f:c8b3:3077 with SMTP id cd21-20020a056a00421500b0068fc8b33077mr3375219pfb.1.1700399692289;
        Sun, 19 Nov 2023 05:14:52 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id m12-20020a056a00080c00b006cb6fa32590sm1468349pfk.148.2023.11.19.05.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Nov 2023 05:14:51 -0800 (PST)
Message-ID: <42b9fdd7-2939-4ffc-8e18-4996948b19f7@kernel.dk>
Date: Sun, 19 Nov 2023 06:14:50 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Don't clobber fr0/vs0 during fp|altivec register
 save
Content-Language: en-US
To: Timothy Pearson <tpearson@raptorengineering.com>,
 regressions <regressions@lists.linux.dev>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>,
 christophe leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <1105090647.48374193.1700351103830.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1105090647.48374193.1700351103830.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/18/23 4:45 PM, Timothy Pearson wrote:
> During floating point and vector save to thread data fr0/vs0 are clobbered
> by the FPSCR/VSCR store routine.  This leads to userspace register corruption
> and application data corruption / crash under the following rare condition:
> 
>  * A userspace thread is executing with VSX/FP mode enabled
>  * The userspace thread is making active use of fr0 and/or vs0
>  * An IPI is taken in kernel mode, forcing the userspace thread to reschedule
>  * The userspace thread is interrupted by the IPI before accessing data it
>    previously stored in fr0/vs0
>  * The thread being switched in by the IPI has a pending signal
> 
> If these exact criteria are met, then the following sequence happens:
> 
>  * The existing thread FP storage is still valid before the IPI, due to a
>    prior call to save_fpu() or store_fp_state().  Note that the current
>    fr0/vs0 registers have been clobbered, so the FP/VSX state in registers
>    is now invalid pending a call to restore_fp()/restore_altivec().
>  * IPI -- FP/VSX register state remains invalid
>  * interrupt_exit_user_prepare_main() calls do_notify_resume(),
>    due to the pending signal
>  * do_notify_resume() eventually calls save_fpu() via giveup_fpu(), which
>    merrily reads and saves the invalid FP/VSX state to thread local storage.
>  * interrupt_exit_user_prepare_main() calls restore_math(), writing the invalid
>    FP/VSX state back to registers.
>  * Execution is released to userspace, and the application crashes or corrupts
>    data.

What an epic bug hunt! Hats off to you for seeing it through and getting
to the bottom of it. Particularly difficult as the commit that made it
easier to trigger was in no way related to where the actual bug was.

I ran this on the vm I have access to, and it survived 2x500 iterations.
Happy to call that good:

Tested-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

