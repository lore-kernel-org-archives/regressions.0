Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C998E79C2
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 08:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="CwJiatSo"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso692878b3a.3
        for <regressions@lists.linux.dev>; Thu, 02 Nov 2023 01:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698915190; x=1699519990; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVE1366znDDdUGahkb02KC8IFZyefUqtJav8pg5Z4yU=;
        b=CwJiatSoyusgN2aJ+aNkZkEflOOZn62OjmCBzuoH2n+hYZPHFmcXHANeUZm+k2Lsh/
         munWRB5dJmvp8eY1IsUYaPhlLSzdX5SPHzNhWj6cQAuH/YOW+VzglTWadthmSo/jt/bL
         UwxcuZrt/2yGozSQu0k/e5xkDw9+2qw7msXvERc1XiD/fniwcy6u/LhRDEH+/iWfi14V
         u5pqQfbpwqkGqr+0qPanfgUO+NLmhdYu5HCLfwdorFVQP3i0vXWuo1vbpSBR8PN+HnT3
         UrfsQrctVGhc18NWyoR3poYSjnasmOGfWKOsx2mgeTIepWsSJ8mjVau7xgYueO0pqd74
         uobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698915190; x=1699519990;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YVE1366znDDdUGahkb02KC8IFZyefUqtJav8pg5Z4yU=;
        b=F1tlT9aa4zq1nJz28FlmMehhx7YQHYqRwYlGcSASAwDxHoLtyI/PrjKA5y6T4iwUr0
         Wx4Cofn17Tnvwt7JvGysxn1pjLImAYajvBh+cB5dxq5LFLfx8d6q6w8/00H4yOVrEkSN
         4v9lSfSt6r+R7Htk/i8daOGEP5VxSRmd7dABXWTHf924gcolYpYf8cx9Yo2kwN4/vgYg
         Tw2SMz91OHrDLypNKqL3xudFtVrmh3nSN2mVRwGZbOtSnTY0k2fZ80p4Hjx9cahprzjQ
         t0JI4BQU2s+rHt6T8IFLpn8PPxPjpaBCZ69/bAG+NjjegXF4m+v7rdW3Jg6FS3olKlJv
         NJkA==
X-Gm-Message-State: AOJu0YxfPW5jCZSLpe/QNcUIjS2UhJomOs873xiFtQ3nUgLGlb9IinOS
	RWnxfRzsyyhsTxCqQPcYuRKKqw==
X-Google-Smtp-Source: AGHT+IFmL1R/UF0nhz7aD3cuUs+n6jN2r82/CxAkFfbJ0Tsfkn0j6Ww7vsvhb400ENoxqbuA7fqhdg==
X-Received: by 2002:a05:6a21:99a2:b0:153:353e:5e39 with SMTP id ve34-20020a056a2199a200b00153353e5e39mr17559102pzb.51.1698915189954;
        Thu, 02 Nov 2023 01:53:09 -0700 (PDT)
Received: from [10.84.141.101] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001cbf3824360sm2618011plg.95.2023.11.02.01.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 01:53:09 -0700 (PDT)
Message-ID: <79260ece-5819-4292-bfac-dc21a3701813@bytedance.com>
Date: Thu, 2 Nov 2023 16:53:05 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: mainline build failure due to 9c66dc94b62a ("bpf: Introduce css_task
 open-coded iterator kfuncs")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, regressions@lists.linux.dev,
 Yonghong Song <yonghong.song@linux.dev>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <ZUNiwMLBsL52X9wa@debian>
From: Chuyi Zhou <zhouchuyi@bytedance.com>
In-Reply-To: <ZUNiwMLBsL52X9wa@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

在 2023/11/2 16:50, Sudip Mukherjee (Codethink) 写道:
> Hi All,
> 
> The latest mainline kernel branch fails to build mips decstation_64_defconfig,
> decstation_defconfig and decstation_r4k_defconfig with the error:
> 
> kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_new':
> kernel/bpf/task_iter.c:917:14: error: 'CSS_TASK_ITER_PROCS' undeclared (first use in this function)
>    917 |         case CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED:
>        |              ^~~~~~~~~~~~~~~~~~~
> kernel/bpf/task_iter.c:917:14: note: each undeclared identifier is reported only once for each function it appears in
> kernel/bpf/task_iter.c:917:36: error: 'CSS_TASK_ITER_THREADED' undeclared (first use in this function)
>    917 |         case CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED:
>        |                                    ^~~~~~~~~~~~~~~~~~~~~~
> kernel/bpf/task_iter.c:925:60: error: invalid application of 'sizeof' to incomplete type 'struct css_task_iter'
>    925 |         kit->css_it = bpf_mem_alloc(&bpf_global_ma, sizeof(struct css_task_iter));
>        |                                                            ^~~~~~
> kernel/bpf/task_iter.c:928:9: error: implicit declaration of function 'css_task_iter_start'; did you mean 'task_seq_start'? [-Werror=implicit-function-declaration]
>    928 |         css_task_iter_start(css, flags, kit->css_it);
>        |         ^~~~~~~~~~~~~~~~~~~
>        |         task_seq_start
> kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_next':
> kernel/bpf/task_iter.c:938:16: error: implicit declaration of function 'css_task_iter_next'; did you mean 'class_dev_iter_next'? [-Werror=implicit-function-declaration]
>    938 |         return css_task_iter_next(kit->css_it);
>        |                ^~~~~~~~~~~~~~~~~~
>        |                class_dev_iter_next
> kernel/bpf/task_iter.c:938:16: warning: returning 'int' from a function with return type 'struct task_struct *' makes pointer from integer without a cast [-Wint-conversion]
>    938 |         return css_task_iter_next(kit->css_it);
>        |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_destroy':
> kernel/bpf/task_iter.c:947:9: error: implicit declaration of function 'css_task_iter_end' [-Werror=implicit-function-declaration]
>    947 |         css_task_iter_end(kit->css_it);
>        |         ^~~~~~~~~~~~~~~~~
> 
> git bisect pointed to 9c66dc94b62a ("bpf: Introduce css_task open-coded iterator kfuncs")
> 
> I will be happy to test any patch or provide any extra log if needed.
> 
> #regzbot introduced: 9c66dc94b62aef23300f05f63404afb8990920b4
> 

Thanks for the report! This issue has been solved by Jiri.[1]

[1]:https://lore.kernel.org/all/169890482505.9002.10852784674164703819.git-patchwork-notify@kernel.org/
