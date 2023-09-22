Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111F12C9C
	for <regressions@lists.linux.dev>; Fri, 22 Sep 2023 00:02:18 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-692779f583fso650946b3a.0
        for <regressions@lists.linux.dev>; Thu, 21 Sep 2023 17:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695340938; x=1695945738; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIlWllockWVHn+USccr9bcIlaTuabHf1MxHz684jmAo=;
        b=VC2nb5C4/HrOEKClzY7yvu+g8tKD51GkOT7xE3/cS7z7mw2Qeb4LFSDv16cOL9fkB/
         kLrqUwPZ0Ou9qYZ18DvvixCJpFReBRfMvr5WxC/mc7M2wXNyJPqJbjr+QI/OZBFjiUYm
         gjhCwhMgMkeAoluGf8kiE9VbUwzfXD0LSz4f9UtUKkYguz6vOf/AFZky30hoGgKBgejB
         RifSLftS2Ai8ZvU3Udhc/RdD8HowqfpljbUTElToGbcBB1zJksxxD7e4IJ5POWgyivsv
         2gBXb4/6yjpgZzBVgBEwz4UyIdtnHD2i3dyF/+Wz4CBeK/q/VIReZfAyacQlRXAXNnSN
         4gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695340938; x=1695945738;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lIlWllockWVHn+USccr9bcIlaTuabHf1MxHz684jmAo=;
        b=SjNRo2wkmy5e8ZKU6kLk5/1hLphDSX9kh+7J3KZVRMkV0KnMKVz/PlYxy2dl2KAtlx
         CL3FuaXsdacoxwKgVtNAcLvZDdJjuft778SuwqBIqO+0/zMpvo2WKyVd3XnyefmCyRgg
         az7TA+vAMtmiiEvqi4oiuGZvJnHzd+FReqRsVA4K0Sm5FXtCn4R5BeqUtQdj55CUiF8N
         FkQScf+7RH7zcIdqDx7VyqmiFfMyqq7C3vAciv7Or9C6RswXZdXdwuccdmv4nddH5USW
         5WmE/36zakBoVOQmrZDfZ1r4gXA7UTabEnEvoGuzW8vLq881pzRYmGCw24P6k/tObYud
         yraw==
X-Gm-Message-State: AOJu0Yyu9uK19Di2YzMIJL8JXRxrhKvt99W62/AzTpFTDExSUWiRy+YT
	z+hCuwq+55ghpl/y1k34wwc=
X-Google-Smtp-Source: AGHT+IFYHBSesDnJjmWGQ1ZQ0T9N+LxNIP5SZuAef88AoxvyO2avFf//tfqoENhODbAU8Q+z2mKUZQ==
X-Received: by 2002:a05:6a20:324c:b0:10c:7c72:bdf9 with SMTP id hm12-20020a056a20324c00b0010c7c72bdf9mr5869719pzc.29.1695340938184;
        Thu, 21 Sep 2023 17:02:18 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id z13-20020a170903018d00b001c0a414695dsm2136863plg.62.2023.09.21.17.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 17:02:17 -0700 (PDT)
Message-ID: <49a92f24-bd70-483c-aaaa-49d00c339b12@gmail.com>
Date: Fri, 22 Sep 2023 07:02:09 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greentime Hu <greentime.hu@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>, Vineet Gupta <vineetg@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andy Chiu <andy.chiu@sifive.com>, Conor Dooley <conor.dooley@microchip.com>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 matoro <matoro_bugzilla_kernel@matoro.tk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux RISC-V <linux-riscv@lists.infradead.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: [bisected][regression] rustc userspace crashes on riscv in
 kernel 6.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:


> Since this commit:
> 
> commit 8ee0b41898fa26f66e32237f179b6989c65600d6
> Author: Greentime Hu <greentime.hu@sifive.com>
> Date:   Mon Jun 5 11:07:11 2023 +0000
> 
>     riscv: signal: Add sigcontext save/restore for vector
> 
> running rustc on riscv produces output like this:
> 
> $ rustc test.rs
> /usr/lib/rust/lib/librustc_driver-f0248bec779deb29.so(+0xe8ebdc)[0x3f8dc8ebdc]
> linux-vdso.so.1(__vdso_rt_sigreturn+0x0)[0x3f8fb91800]
> /lib64/libc.so.6(syscall+0x16)[0x3f8cbfacbe]
> /usr/lib/rust/lib/libstd-985e4b663b8154c3.so(_ZN3std3sys4unix5locks13futex_condvar7Condvar4wait17h4e3b669d2690824dE+0x64)[0x3f8cd45f68]
> /usr/lib/rust/lib/librustc_driver-f0248bec779deb29.so(+0x715ab6)[0x3f8d515ab6]
> /usr/lib/rust/lib/librustc_driver-f0248bec779deb29.so(+0x7159ce)[0x3f8d5159ce]
> /usr/lib/rust/lib/librustc_driver-f0248bec779deb29.so(+0x6b64f6)[0x3f8d4b64f6]
> /usr/lib/rust/lib/librustc_driver-f0248bec779deb29.so(+0x715534)[0x3f8d515534]
> /usr/lib/rust/lib/libstd-985e4b663b8154c3.so(rust_metadata_std_9e9c65f710e3ce43+0xaba32)[0x3f8cd44a32]
> /lib64/libc.so.6(+0x6a8e4)[0x3f8cbab8e4]
> /lib64/libc.so.6(+0xbb49c)[0x3f8cbfc49c]
> 
> even for a simple hello world program.  The output being present does not necessarily mean that the compilation failed, in fact often it will still return 0 and produce a working binary despite the output, but often it does not, frequently enough that it's impossible to build large rust packages.  See the attached log for an example of a real build which fails partway through (despite the fact that all compilation lines emit the traceback).

See Bugzilla for the full thread and attached rust build log.

The reporter (Cc'ed) confirms that this regression occurs on all rust toolchain
distributions (both from the distro and from rustup (maybe?)).

Anyway, I'm adding it to regzbot:

#regzbot introduced: 8ee0b41898fa26 https://bugzilla.kernel.org/show_bug.cgi?id=217923

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217923

-- 
An old man doll... just what I always wanted! - Clara
