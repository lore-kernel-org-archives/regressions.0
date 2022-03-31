Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19F77E0
	for <regressions@lists.linux.dev>; Thu, 31 Mar 2022 12:46:09 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id m67so42085218ybm.4
        for <regressions@lists.linux.dev>; Thu, 31 Mar 2022 05:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=7oSbnIlDMLV6mSlKXym3qxASIjVDe/FX+PfPc1IezDE=;
        b=PPRREv5L5fAma5LxA0EXOv+JEtTK1iPK+MPh3OIPRHz/rg8IfACgFN/SgSSXZTkWut
         Vd5qRxwJ4iSEqVkv1OVVCK4UCXXZiaozOEH7wY1iCVvukejhkz8tan8UfHi7RBRwWpXn
         gfcNj13CH1AGfsVJML1nqs/GpvC8Z9Uz1Ttd5nAdDEVlSy0Qvjis+bUaTjhyG96jJ+BV
         nkzsTbUAY/bV7xK9JU9Tnq7vEfBuq6b750m3BmYvRdzb2vS2EpPEw3Kz8eBJ70g6I0A6
         GBtouaOm+5cicC866ZDFzAmADYfg28tFgegtLRf5qY6vYbTZcQOGpWouuFXkIwGVdFwi
         N1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=7oSbnIlDMLV6mSlKXym3qxASIjVDe/FX+PfPc1IezDE=;
        b=z1ud02cpNEoo2SkpF4QXUET4IYBEUUmCKsuLCfG9++n/3132ZwwSNAiwfwjl28xH0s
         j++RfQRD+5MbsNalxCzWwaFFC6g+wBMVBXzLwaIMk9103uz+er/pa3PgPRuBl+1o8dkF
         ylPTVKHxVnuefMLnENha9EzNhj8XmEd8KhTE5PdEsfb+qauE4daJoHHjE7+IAaaKiw6R
         mHceFxzDyls1xKmAwWwXrd25ol9QcWLMjmr5vkaxbYaU6WNSM1mziYLj0/tVXQiLcfat
         Bu9hKx6e6Rv567+Kv2L4X30iHI+yjtRcIe/ZFdMnnvJF+SS7FtUWf54VdLWv3oq4jUbY
         0PyA==
X-Gm-Message-State: AOAM532A3ucpTi5BzWn6y6Q6vN0AqhRj/ctIgSIS3ZSvKwdANZs6JTri
	s5zq0ma00GQBzpDA8LUH6RbkWzVn/Ntye2lf1KuFlQ==
X-Google-Smtp-Source: ABdhPJwGKVnhTsdd+AusUNKo/rR9ORGT2Uh2CECAGTbqF33pFQyfuq2Pl6u857Kk6DS9yR87O2kxivPuydHscRHD+y4=
X-Received: by 2002:a25:9846:0:b0:61a:3deb:4d39 with SMTP id
 k6-20020a259846000000b0061a3deb4d39mr3915516ybo.537.1648730768369; Thu, 31
 Mar 2022 05:46:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 31 Mar 2022 18:15:57 +0530
Message-ID: <CA+G9fYsaUWL4MfkmFJGyZ5WRjibieSLE1V1R8OPsWNmjeYWyUQ@mail.gmail.com>
Subject: [next ] x86: Assembler messages: Error: invalid operands (*UND* and
 .data..percpu sections) for `+'
To: X86 ML <x86@kernel.org>, kvm list <kvm@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, regressions@lists.linux.dev
Cc: Li RongQing <lirongqing@baidu.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Linux next-20220331 x86_64 build failed due to below warnings / errors
with gcc-11. build log link [1].

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64
CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc'
'HOSTCC=sccache gcc'
/tmp/ccS5DmVa.s: Assembler messages:
/tmp/ccS5DmVa.s:59: Error: invalid operands (*UND* and .data..percpu
sections) for `+'
make[3]: *** [/builds/linux/scripts/Makefile.build:289:
arch/x86/kernel/kvm.o] Error 1

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: fdcbcd1348f4ef713668bae1b0fa9774e1811205
  git_describe: next-20220331
  build link: https://builds.tuxbuild.com/278RMAf1jcRHx7LwzjCMgFSMMLt/


# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-11
--kconfig https://builds.tuxbuild.com/278RMAf1jcRHx7LwzjCMgFSMMLt/config


--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/278RMAf1jcRHx7LwzjCMgFSMMLt/
