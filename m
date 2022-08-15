Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E7A5386
	for <regressions@lists.linux.dev>; Mon, 15 Aug 2022 21:42:32 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id ha11so8042844pjb.2
        for <regressions@lists.linux.dev>; Mon, 15 Aug 2022 14:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=8LW1Z2eHtfRzkh/DgEsbiz4wPXvg86VGj0tcalow2gc=;
        b=aUIKmdx49jY2qpswU91D8urED0N6BFbxXQi/EbnSwbikNL/hePNE1obTW9O8LEYSIW
         IHI8Q5mAsHRrvEas1zNypoTBA+TZJlVseJQDg64SvfXMVShTvq+A/AZ0WKi8PiW1JzGH
         sZ/WWE7MoQoz/DZHFisZ2JIJ/fSkaTqeMXdZV7qxk2YcyDjlehEukw5lJTSY54hjBg0B
         81qhQsRES3XSGUVyOEZZnDrRs7weG6zPS5mm2Int4cmKUMKYCP8Rc1diBHlrJ9sFYFOG
         G+0rA+MMxjS1kZ0LCg1JBq6AUZWcb6zgZXAGmBBIdSJfKYvQQvPlf2hi3LmT5kEB00FE
         ZhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=8LW1Z2eHtfRzkh/DgEsbiz4wPXvg86VGj0tcalow2gc=;
        b=8ETcUR2dC9f4V6+jgl5/FMsZCMM5H8U9LiedkcBPgyQL/5UE48QNuXxHqR6wgDsoTE
         qzcj2MX+BrTZ7QUGLp1sh8QEB0JIe8zTcziTmXFuNrTZraXsvNkydYd4pT8nb99Jqr6Q
         3nGlMJ/dH5y2Sk+t9igMSEZoxqhAavDSMaAPv//vQ/A/9SO2KgzAEVN4R4iXxr9vAvdn
         jjkJe8htgXXUCfywlbfpyRfloxDJfuYatqUALW8ZDZjDeRWnzvaEVoZ1io8t3KM2vbAL
         HPgPRd5xQOUqOQe8YIX3Ma0XVaP4m2tugFF0pfGgGQCcR8lfJPpiIKdDHWMibCoOzSug
         G3kg==
X-Gm-Message-State: ACgBeo0mvB+FLeeL7D0J1EXsFnP6jU9MyA/7YLDHi/YOfL9UDK58q8zx
	nelh5Y8TnhzrH/lPQBlplVNNpw==
X-Google-Smtp-Source: AA6agR73ib93qkb4fwGAobfuvJZGyS/QKaScq6gxXlAO16qAVl0y6157lhvwxcdRKKcvrkCAnkAkNA==
X-Received: by 2002:a17:902:ce83:b0:16d:d667:d4df with SMTP id f3-20020a170902ce8300b0016dd667d4dfmr18614380plg.159.1660599751433;
        Mon, 15 Aug 2022 14:42:31 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id s14-20020a170902b18e00b0016d231e366fsm7456080plr.59.2022.08.15.14.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 14:42:31 -0700 (PDT)
Date: Mon, 15 Aug 2022 21:42:27 +0000
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Andrew Jones <andrew.jones@linux.dev>,
	LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
	lkp@lists.01.org, lkp@intel.com, xudong.hao@intel.com,
	regressions@lists.linux.dev
Subject: Re: [KVM]  e923b0537d: kernel-selftests.kvm.rseq_test.fail
Message-ID: <Yvq9wzXNF4ZnlCdk@google.com>
References: <Yvn60W/JpPO8URLY@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yvn60W/JpPO8URLY@xsang-OptiPlex-9020>

On Mon, Aug 15, 2022, kernel test robot wrote:
> commit: e923b0537d28e15c9d31ce8b38f810b325816903 ("KVM: selftests: Fix target thread to be migrated in rseq_test")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

...

> # selftests: kvm: rseq_test
> # ==== Test Assertion Failure ====
> #   rseq_test.c:278: i > (NR_TASK_MIGRATIONS / 2)
> #   pid=49599 tid=49599 errno=4 - Interrupted system call
> #      1	0x000000000040265d: main at rseq_test.c:278
> #      2	0x00007fe44eed07fc: ?? ??:0
> #      3	0x00000000004026d9: _start at ??:?
> #   Only performed 23174 KVM_RUNs, task stalled too much?
> # 
> not ok 56 selftests: kvm: rseq_test # exit=254

...

> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 5.19.0-rc6 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-3) 11.3.0"
> CONFIG_CC_IS_GCC=y
> CONFIG_GCC_VERSION=110300
> CONFIG_CLANG_VERSION=0
> CONFIG_AS_IS_GNU=y
> CONFIG_AS_VERSION=23800
> CONFIG_LD_IS_BFD=y
> CONFIG_LD_VERSION=23800
> CONFIG_LLD_VERSION=0

Assuming 23800 == 2.38, this is a known issue.

https://lore.kernel.org/all/20220810104114.6838-1-gshan@redhat.com
