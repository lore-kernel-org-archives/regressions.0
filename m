Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A20846BD
	for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 11:40:05 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4013454fa93so48471205e9.0
        for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 04:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693395603; x=1694000403; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IXiOAz/5YldoVo6YMY0MxhgKtPGOmCvkDjVmYV3HYIQ=;
        b=LfSmRFPTSGu8WTX1IiFCViWcYRlky3+5tz5gN+liBJKhSIby0yxaP1WvzzxEFaDwFy
         NUyHc/vpefQdVYpnL9wVC6SefHONhCujRL4rFazF6kVEE81dvLyOfUcQ/2HsVtWgQlQ9
         sjUdI1svs26HuMgS812reMGHf2zjSBb97Wf+21RWCOYelfVLxzFIgQ6deABv+zcZAdHM
         1DNPy6bqQKi7AezNfb38SqwIQLTI3uzLTT/tbbEqkOXbMQzjvgjMfceWUxItc8OuyTRD
         q98j001a65B6XQVyNi4C5NUh3siRhkEQtvEquaLUgzeiSyQMy/yEPAZ8P41mSHKdN5wg
         J4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693395603; x=1694000403;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXiOAz/5YldoVo6YMY0MxhgKtPGOmCvkDjVmYV3HYIQ=;
        b=jRTs7jkNYE/KCZXounCx3LAZ26k6O9IM2saDqKcm4aiDungMB9tYYXQK+cxQI9aZNw
         ZHkCIvvfphUdUVy/ABDNo70Ei082nvTxqg+2/zOHmR9EkOCcuT7RF1ETd7A8Crukr8xA
         OW8qD5zP8n5QvopAArGtJm7C/HPVAwgX37EHSgQUpiCX8FhymyolbIe/shKtf2RMsZY3
         XZ2yA9y5QuYOVntBgSQqu5quQQaykoatFBlD4+pgXUcyAEBDGG8Qd5gAaMhIHx6fUzjZ
         S9f9+tQnOH9HRz3yjFfE5mZY7bh+TGq6LNtDIHswLIzhAOMSns+WSIFZP6VxvpQKeq4l
         f8Cw==
X-Gm-Message-State: AOJu0Yy/7VOkywjUFhMzH81a26am1iJIqSusQy9KLjWqO1FI3GWI2pXl
	va1+Obt1D+qPKzhouaoXf88=
X-Google-Smtp-Source: AGHT+IHkuPMEpQJgVFAWz/Fgk+XKScfrDr/wI7OXLhwOUAYdh7hAgUFiEqgxB7A6vvAQv0JSJMfCog==
X-Received: by 2002:a7b:cbc6:0:b0:3fe:18be:76f8 with SMTP id n6-20020a7bcbc6000000b003fe18be76f8mr1744032wmi.38.1693395603237;
        Wed, 30 Aug 2023 04:40:03 -0700 (PDT)
Received: from debian ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id f7-20020a1c6a07000000b003fe407ca05bsm2023455wmc.37.2023.08.30.04.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 04:40:02 -0700 (PDT)
Date: Wed, 30 Aug 2023 12:40:01 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Guo Ren <guoren@linux.alibaba.com>, Oleg Nesterov <oleg@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev
Subject: mainline build failure due to c8171a86b274 ("csky: Fixup
 -Wmissing-prototypes warning")
Message-ID: <ZO8qkS0Skg9L4xzr@debian>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The latest mainline kernel branch fails to build csky allmodconfig with
the error:

In file included from ./arch/csky/include/asm/ptrace.h:7,
                 from ./arch/csky/include/asm/processor.h:8,
                 from ./include/linux/prefetch.h:15,
                 from drivers/net/ethernet/intel/i40e/i40e_txrx.c:4:
./arch/csky/include/asm/traps.h:43:11: error: expected ';' before 'void'
   43 | asmlinkage void do_trap_unknown(struct pt_regs *regs);
      |           ^~~~~
      |           ;
./arch/csky/include/asm/traps.h:44:11: error: expected ';' before 'void'
   44 | asmlinkage void do_trap_zdiv(struct pt_regs *regs);
      |           ^~~~~
      |           ;
./arch/csky/include/asm/traps.h:45:11: error: expected ';' before 'void'
   45 | asmlinkage void do_trap_buserr(struct pt_regs *regs);
      |           ^~~~~
      |           ;
./arch/csky/include/asm/traps.h:46:11: error: expected ';' before 'void'
   46 | asmlinkage void do_trap_misaligned(struct pt_regs *regs);
      |           ^~~~~
      |           ;
./arch/csky/include/asm/traps.h:47:11: error: expected ';' before 'void'
   47 | asmlinkage void do_trap_bkpt(struct pt_regs *regs);
      |           ^~~~~
      |           ;
./arch/csky/include/asm/traps.h:48:11: error: expected ';' before 'void'
   48 | asmlinkage void do_trap_illinsn(struct pt_regs *regs);
      |           ^~~~~
      |           ;
./arch/csky/include/asm/traps.h:49:11: error: expected ';' before 'void'
   49 | asmlinkage void do_trap_fpe(struct pt_regs *regs);
      |           ^~~~~
      |           ;
./arch/csky/include/asm/traps.h:50:11: error: expected ';' before 'void'
   50 | asmlinkage void do_trap_priv(struct pt_regs *regs);
      |           ^~~~~
      |           ;
./arch/csky/include/asm/traps.h:51:11: error: expected ';' before 'void'
   51 | asmlinkage void trap_c(struct pt_regs *regs);
      |           ^~~~~
      |           ;
./arch/csky/include/asm/traps.h:53:11: error: expected ';' before 'void'
   53 | asmlinkage void do_notify_resume(struct pt_regs *regs,
      |           ^~~~~
      |           ;
In file included from ./arch/csky/include/asm/processor.h:8,
                 from ./include/linux/prefetch.h:15,
                 from drivers/net/ethernet/intel/i40e/i40e_txrx.c:4:
./arch/csky/include/asm/ptrace.h:99:11: error: expected ';' before 'int'
   99 | asmlinkage int syscall_trace_enter(struct pt_regs *regs);
      |           ^~~~
      |           ;
./arch/csky/include/asm/ptrace.h:100:11: error: expected ';' before 'void'
  100 | asmlinkage void syscall_trace_exit(struct pt_regs *regs);
      |           ^~~~~
      |           ;

git bisect pointed to c8171a86b274 ("csky: Fixup -Wmissing-prototypes warning").

Reverting the commit has fixed the build failure.

I will be happy to test any patch or provide any extra log if needed.

#regzbot introduced: c8171a86b27401aa1f492dd1f080f3102264f1ab


-- 
Regards
Sudip
