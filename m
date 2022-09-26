Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695BE4686
	for <regressions@lists.linux.dev>; Mon, 26 Sep 2022 18:17:12 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so13302495pjm.1
        for <regressions@lists.linux.dev>; Mon, 26 Sep 2022 11:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Il0vkOLUU8Wr/hKXeWfSAnVT8noJuQa95krgaKi1p4s=;
        b=ndO8+/R02S9Z+MftcCPkoi50pEbp5cagm+Obh6sygHFMVdgUXeF5PNyfPJt6YEvCYt
         7RdkC9KxTEQ1Fv/6bZMFZkGIr9/TUJh/Dn0IquOtJBsG2IK16fFoMTYGcZh2H8d8P2Lv
         E0BL7I628eb7+l3xct+uiGuiEncpwJ/CGtXsOiVIS4zoIaaY54OEdOK3WFHmS14qRzp2
         0Ty0K9rYGGS0QkRH54SSZ8pTvZ8nhEavH4e/sfuRnTYiClyswgBgufRD61NvhQumJNje
         eV1nrk8nwKijMExrhQbqdT0tI2hk4ZcnTxN4TKSFoN6qylvUs4R0SxSojqwRZok22yWi
         sWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Il0vkOLUU8Wr/hKXeWfSAnVT8noJuQa95krgaKi1p4s=;
        b=w0gkmx/iGMDTSpuBJY3L/Z0A6u3itBtvKx8MrCu9v+aZ1QWjiFRzLsejuBxWqt4cP7
         RMfTdpbjJtGKb2ybVyOcq1Ro3Cw4IV/yMOeZb3UbJ6HgcO88JrjsKfTOxScGKv0MVGXb
         uW42bP9ekme86y1Lu+XU0Z15CKTHWSAUCr6YTAe5Fs6hzeMQEZBmGWucLFioe4qB9yDA
         S8wF1SqBkF+awxBoLWw4WwL0Lx2r9IZDKo5Nbgw9JzG3LN/VJO3zd2rkm/pR/REmln4L
         jExzRB6zYu5F3LMInzM3WxmfdsAACPYAhCfiLaN42As2JcV6mqj8ndiU9kQICfSphPDf
         sa6Q==
X-Gm-Message-State: ACrzQf3Ad/GPAEPF0DWLmYDXnXCcVtdj0BmvBnkSupw/4KhD0jhwHbla
	yrURbnIeuKlP47lbR1pGFWErXc7mbUvNQhnsNCshYA==
X-Google-Smtp-Source: AMsMyM7HLUfbdMpdW3guEO/IoUjYq2oQz+OyMDkq7nLclHX/EA7jhIcMm5L/Nfwp+rvUkCew0JIURYshd4k1BklGYCE=
X-Received: by 2002:a17:90b:1d0f:b0:202:be3e:a14a with SMTP id
 on15-20020a17090b1d0f00b00202be3ea14amr49839pjb.102.1664216231609; Mon, 26
 Sep 2022 11:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvyD9OWF53ua2EZmyf+=YTx4f1mezDNkVLMxf3BKXW=_w@mail.gmail.com>
 <YzHIwvzhM9DSW9cF@dev-arch.thelio-3990X> <YzHJRH9hO1lfjSPp@dev-arch.thelio-3990X>
 <CAKwvOdkYr-Nv6PowyJ10DuP-uFLcvH1oGWSeQH3Dz_JM8vwp2w@mail.gmail.com> <YzHpT7t+9uSIYm0k@shell.armlinux.org.uk>
In-Reply-To: <YzHpT7t+9uSIYm0k@shell.armlinux.org.uk>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 26 Sep 2022 11:17:00 -0700
Message-ID: <CAKwvOdkCCyP8W2pHf9ETKMgUtKCgcSwUb6=bMJ_8riwjyknpCw@mail.gmail.com>
Subject: Re: arch/arm/probes/kprobes/core.c:409:30: error: .fnstart must
 precede .save or .vsave directives
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Nathan Chancellor <nathan@kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masami Hiramatsu <mhiramat@kernel.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 26, 2022 at 11:02 AM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Sep 26, 2022 at 10:42:45AM -0700, Nick Desaulniers wrote:
> > > On Mon, Sep 26, 2022 at 08:44:05AM -0700, Nathan Chancellor wrote:
> > > > Thank you for the testing and report! I brought this up on GitHub on
> > > > Friday as I noticed this as well:
> > > >
> > > > https://github.com/ClangBuiltLinux/linux/issues/1718
> >
> > Thanks for the reports. I'll take a look at filing additional bug
> > reports against clang, then moving the definition of
> > __kretprobe_trampoline to out of line assembler.
>
> Are you saying that .save should be accepted without a .fnstart?

No. It's just a bug in clang's inline assembler. But it does make
sense to just move it to out of line assembler anyways; having it be
inline provides little to no benefit.

Should I be using UNWIND from arch/arm/include/asm/unwind.h on these
.fnstart/.save/.pad/.fnend directives?
-- 
Thanks,
~Nick Desaulniers
