Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E7C7E8
	for <regressions@lists.linux.dev>; Mon, 22 May 2023 01:15:24 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ae851f2a7dso17935075ad.0
        for <regressions@lists.linux.dev>; Sun, 21 May 2023 18:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684718124; x=1687310124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8+i58/URhD5Oy4QVV045Z5+XbFG8kUXLJVflrNrgRc=;
        b=Ym0As8KG3p45Dn4dAOynaEdAhVHJrpNtaMc5Yb6MBQStegeX2n4swdTUKfLjjY6sWS
         MbIf+VIlqrXjpnJ9f+uZTPDAfjcPKf1upQjpJJN27yGYMSnYVbXSmJ+4rYYcdods1hYo
         Az30t9kdltADsxeTJk/CzykGCjW4xoMZyraDYzsPMeqQfEemw4HPiJNvUlVVQIn+bjGw
         Qz78nMhN2t9gkEAD6Up8RM8O63XN8sI7ilGxjJjYIxUFiwHKo5cS9+668jKZZ1dd1BTr
         daeEGC2mKPBt0ixSyamjTVxbQwF9GMCmSLvRkCIWPWXe6isQoU5Uaok8ShgEeupaf7oc
         eRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684718124; x=1687310124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8+i58/URhD5Oy4QVV045Z5+XbFG8kUXLJVflrNrgRc=;
        b=Ottavt27rhUSLXGPW9m2H70fy5KWvKQ/534YjeckP00tDqMXROnq4s2zHM/kkrzkfe
         oVWxbW37yDh9Mx+rEm1yZCmVcNU5nQVamRAMCSZ5MsYRzHP2ZxEkKx/Pr/GPJQxaIjRp
         DeoS+pzwbdTBWDyiD4FJqCgOPIl1Ol3+CKbyKeB0cfrJMJbluRQBFF9t9EOsPVn3EHad
         C+VWrDmW0utHfEB+eGW5CmAip0kqIiD+XLBKKKCm+YSkHBNp9QiU2f69WTrXuODwkUAu
         mmcgbwb0N8y0N7hApfXy8szeHYLLeQ+zE/2B91V60ETGEoladld7DprNeclZfhkBuSF5
         BIQg==
X-Gm-Message-State: AC+VfDxNFUdQAJTzA0S2X0EoV9+Vln3gvb1TRzomJIZJfYVpc8HPR02F
	+eElyn1Viaq53Wabrdx4873cH8M1aeHQKgLrkrM=
X-Google-Smtp-Source: ACHHUZ5Tt62Jqs5Vubhr6WT00c9/03aD/Kve+KqQgszWKgSSOFKQMFiwd+cG1dxRAHav3vO89CjE6WkxWH1+FqPf35I=
X-Received: by 2002:a17:902:e5ce:b0:1a2:a904:c42e with SMTP id
 u14-20020a170902e5ce00b001a2a904c42emr11036794plf.24.1684718124180; Sun, 21
 May 2023 18:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <8a79151b-ef75-08ad-ae3d-f6cdabfeaa47@gmail.com>
In-Reply-To: <8a79151b-ef75-08ad-ae3d-f6cdabfeaa47@gmail.com>
From: Pedro Falcato <pedro.falcato@gmail.com>
Date: Mon, 22 May 2023 02:15:13 +0100
Message-ID: <CAKbZUD3FBiaLGWq=TipfevqXP0SBz8F+=L6JSO+FMZOv0QQ9AQ@mail.gmail.com>
Subject: Re: Regression. -6.3.X Good. -6.4-rcY Bad.
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux EFI <linux-efi@vger.kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Alan Bartlett <ajb@elrepo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 1:43=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Hi,
>
> I notice a simple build-time regression on Bugzilla [1]. Quoting from it:
>
> > This is a very simple to see regression.
> >
> > On arm64 hardware, take any one of the -6.4-rcY tarballs created by Lin=
us. Extract the contents of the tarball and cd to the linux-6.4-rcY directo=
ry. Issue a "make clean" or a "make mrproper" or a "make distclean" command=
. Look at the output (there should not be any). In every case, the output i=
s --
> >
> > nm: 'vmlinux': No such file
> >
> > A bisection of Linus' full tree was performed specifying v6.4-rc1 as ba=
d and v6.3 as good. Here is the result --
> >
> > git bisect start
> > # status: waiting for both good and bad commits
> > # bad: [ac9a78681b921877518763ba0e89202254349d1b] Linux 6.4-rc1
> > git bisect bad ac9a78681b921877518763ba0e89202254349d1b
> > # status: waiting for good commit(s), bad commit known
> > # good: [457391b0380335d5e9a5babdec90ac53928b23b4] Linux 6.3
> > git bisect good 457391b0380335d5e9a5babdec90ac53928b23b4
> > # good: [6e98b09da931a00bf4e0477d0fa52748bf28fcce] Merge tag 'net-next-=
6.4' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> > git bisect good 6e98b09da931a00bf4e0477d0fa52748bf28fcce
> > # good: [70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7] Merge tag 'powerpc-6=
.4-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
> > git bisect good 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7
> > # bad: [865fdb08197e657c59e74a35fa32362b12397f58] Merge tag 'input-for-=
v6.4-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
> > git bisect bad 865fdb08197e657c59e74a35fa32362b12397f58
> > # good: [e81507acdc19d91df4121f409871f3e4e055f6c2] Merge tag 'clk-for-l=
inus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
> > git bisect good e81507acdc19d91df4121f409871f3e4e055f6c2
> > # bad: [26c009dffca89b0f8fe7facc41d1ccf88a66825a] Merge tag '6.4-rc-smb=
3-client-fixes-part1' of git://git.samba.org/sfrench/cifs-2.6
> > git bisect bad 26c009dffca89b0f8fe7facc41d1ccf88a66825a
> > # bad: [10de638d8ea57ebab4231ea077bed01d9bade775] Merge tag 's390-6.4-1=
' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
> > git bisect bad 10de638d8ea57ebab4231ea077bed01d9bade775
> > # good: [680957b3b8b0b2e8697592fcb77369d4f643908a] s390/relocate_kernel=
: use SYM* macros instead of ENTRY(), etc.
> > git bisect good 680957b3b8b0b2e8697592fcb77369d4f643908a
> > # good: [ea76e08f4d901a450619831a255e9e0a4c0ed162] rust: ioctl: Add ioc=
tl number manipulation functions
> > git bisect good ea76e08f4d901a450619831a255e9e0a4c0ed162
> > # bad: [825a0714d2b3883d4f8ff64f6933fb73ee3f1834] Merge tag 'efi-next-f=
or-v6.4' of git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi
> > git bisect bad 825a0714d2b3883d4f8ff64f6933fb73ee3f1834
> > # good: [9489d1bdb763a3dd954e61522043190a9fd1cb4c] power: supply: gener=
ic-adc-battery: simplify read_channel logic
> > git bisect good 9489d1bdb763a3dd954e61522043190a9fd1cb4c
> > # good: [528bd42615f4bb564613cc76dead90d7fbae76ba] power: supply: rk817=
: Drop unneeded debugging code
> > git bisect good 528bd42615f4bb564613cc76dead90d7fbae76ba
> > # good: [538bc0f40b364f2c7b81f11aa163f723b138b40f] efi/zboot: Set forwa=
rd edge CFI compat header flag if supported
> > git bisect good 538bc0f40b364f2c7b81f11aa163f723b138b40f
> > # bad: [026b85796ab4d52af56f8a1c60d2613983ecd845] efi/zboot: arm64: Gra=
b code size from ELF symbol in payload
> > git bisect bad 026b85796ab4d52af56f8a1c60d2613983ecd845
> > # bad: [45dd403da851124412d32e3193c21de4a51d29da] efi/zboot: arm64: Inj=
ect kernel code size symbol into the zboot payload
> > git bisect bad 45dd403da851124412d32e3193c21de4a51d29da
> > # first bad commit: [45dd403da851124412d32e3193c21de4a51d29da] efi/zboo=
t: arm64: Inject kernel code size symbol into the zboot payload
> >
> > Reverting the commit 45dd403da851124412d32e3193c21de4a51d29da resolves =
the problem.
>
> The regression looks like arm-specific, but the first bad commit
> IMO isn't related to kbuild system.
>
> Anyway, I'm adding it to regzbot:
>
> #regzbot introduced: 45dd403da85112 https://bugzilla.kernel.org/show_bug.=
cgi?id=3D217468
> #regzbot title: nm vmlinux ENOENT when "make mrproper" on arm64

I was able to track down the issue.
In line 47, arch/arm64/boot/Makefile, a variable (that gets expanded
on use, hence =3D and not :=3D) gets defined, that requires vmlinux to
exist (see the $(shell) invocation).
drivers/firmware/efi/libstub/Makefile.zboot then defines a variable
with :=3D, which expands on site and not when it actually needs to be
used. This expands EFI_ZBOOT_OBJCOPY_FLAGS without vmlinux existing,
which ENOENTs.

The below patch should fix it. I'm not submitting an actual patch
because I simply don't know if there are any possible side effects
here (although it frankly seems unlikely).

diff --git a/drivers/firmware/efi/libstub/Makefile.zboot
b/drivers/firmware/efi/libstub/Makefile.zboot
index 89ef820f3b3..3fb39dea114 100644
--- a/drivers/firmware/efi/libstub/Makefile.zboot
+++ b/drivers/firmware/efi/libstub/Makefile.zboot
@@ -32,7 +32,7 @@ zboot-size-len-$(CONFIG_KERNEL_GZIP)   :=3D 0
 $(obj)/vmlinuz: $(obj)/vmlinux.bin FORCE
        $(call if_changed,$(zboot-method-y))

-OBJCOPYFLAGS_vmlinuz.o :=3D -I binary -O $(EFI_ZBOOT_BFD_TARGET)
$(EFI_ZBOOT_OBJCOPY_FLAGS) \
+OBJCOPYFLAGS_vmlinuz.o =3D -I binary -O $(EFI_ZBOOT_BFD_TARGET)
$(EFI_ZBOOT_OBJCOPY_FLAGS) \
                          --rename-section
.data=3D.gzdata,load,alloc,readonly,contents
 $(obj)/vmlinuz.o: $(obj)/vmlinuz FORCE
        $(call if_changed,objcopy)



--=20
Pedro
