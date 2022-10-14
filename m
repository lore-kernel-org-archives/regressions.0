Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50291FBD
	for <regressions@lists.linux.dev>; Fri, 14 Oct 2022 12:28:36 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id l1so4555887pld.13
        for <regressions@lists.linux.dev>; Fri, 14 Oct 2022 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SCyhsNYwhZVTbMa7VcoLVc7/h3ERhFyOfIUt/jdRyKg=;
        b=bWVQ7gDq+JxyL7dr6GZ/FM89h2P+CITEYl6LoxMGfyp1ucFtrOp/eikUNt3+WHB8tU
         i597u6KnmRQCBN1QZlwlC0MBbJXxH7hfTh44uAlih9/fQft24D+zgWyiVlrh61UHJAe0
         YKkxLeTGc3t+yIy7/HFeGtvGkaUu6Wmv0FzzZXz2U7npB5Pf2qOr2VsuCXu4ux2Zi9Ip
         048owIhVsdKk/+Rfcb7dsfKPCRs6m9Al5Ra6eaEhwubbjwB7lg0vHWMcWE361SvBWwrx
         1KvtNWmXFo9uflZMuuTZlBRBKp0o9QVrzmMsENtze7hGI8fXzyHTBjkfjy+y8B6HehIl
         YGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SCyhsNYwhZVTbMa7VcoLVc7/h3ERhFyOfIUt/jdRyKg=;
        b=6hzInmNEVkgrlRaxcrH8ECiVg/Hbz2TKVAX7atfaLaJ4R7G8JuK7DM+hMCjVMyeXpV
         dblWyP5ppbU7YQ02t4VF50G+IQR41gw2RFKW+8XDRIMDY/CUt0Qt0/Fi7R3NH9SXRE53
         fzC857gmzUaJ/binOn567DWASf9JnE+8amt56eFGeoJEafg2fvKllFaNZVhEJnqlwUAR
         lFF6dCXU7FCc63PIcfE1FnGxmm2i95NkBJ6cIhJTAwgCQBxhs529WEqJcdkGKT5T4Zyg
         qTNkTjfdcIMw+PjuWJCLMCR4qLeVPkOg2YtxOuCo7y1uEwGkOUGA+uCk6fQrEyv4aNzT
         2RLQ==
X-Gm-Message-State: ACrzQf0RxlXJ5NzF0Ga2UTCPXQHk6GU5URl8IPPA9+LbYZfB9AlhOOPr
	SM5Q+Pqyrgj52UlQ69gf8ug66p4Dl+5kuA==
X-Google-Smtp-Source: AMsMyM5alJd+48iN707KEK7AsJ/H4QRn2RPFJRfmvwTpeM3BlWBdCVfYD/6tpPU5oGhsHACmIZ3q2A==
X-Received: by 2002:a17:902:c40f:b0:17f:6737:9527 with SMTP id k15-20020a170902c40f00b0017f67379527mr5059333plk.19.1665750516177;
        Fri, 14 Oct 2022 05:28:36 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-8.three.co.id. [180.214.232.8])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c10600b001728ac8af94sm1586498pli.248.2022.10.14.05.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Oct 2022 05:28:35 -0700 (PDT)
Message-ID: <7e0b733d-db73-f9a7-0965-4744e63f1a33@gmail.com>
Date: Fri, 14 Oct 2022 19:28:31 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: 6.0.0-RC kernels trigger Firefox snap bug with 6.0.0-rc3 through
 6.0.0-rc7
Content-Language: en-US
To: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Cc: linux-kernel@vger.kernel.org, Slade Watkins <srw@sladewatkins.net>,
 Marc Miltenberger <marcmiltenberger@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <b0c258c3-6dcf-aade-efc4-d62a8b3a1ce2@alu.unizg.hr>
 <Y0Zw2eHEb1aZ9f4y@debian.me>
 <29362d2e-eec6-5a23-4354-cf8868d50b2c@alu.unizg.hr>
 <6375f31f-316a-bebc-6aec-c6241049e401@alu.unizg.hr>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <6375f31f-316a-bebc-6aec-c6241049e401@alu.unizg.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/22 17:32, Mirsad Todorovac wrote:
> I tried the "make localmodconfig" and provided the default answers ([ENTER]) to all questions
> the script asked as advised here: https://www.stolaf.edu/people/rab/os/linux-compile.html .
> 
> However, though it built much faster, the stripped version did not trigger the bug.
> 
> I am now trying to reproduce the bug with v6.0-rc[123] with config-{051913,060000}.
> This brings a lot of combinations, and though I am a newbie, I noticed that build scripts
> start with "make clean" for both deb-pkg and rpm-pkg.
> 
> Is there a way to rebuild only the stuff that changed between the versions?
> 

You can try building kernel with ccache enabled. However, you'll need
to unset build timestamp, since it will make builds non-deterministic:

	make CC="ccache gcc" KBUILD_BUILD_TIMESTAMP=""

The first ccache build will be slower than normal build, because the
object files needs to be written twice (to the output directory and
to the cache), though.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

