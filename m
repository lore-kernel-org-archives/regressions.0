Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEFD3E5577
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648288; cv=pass; b=tnJgEpapKr0T0QrRee+Wloqml2tLJhI+rCr/+viPFNZRXwqk5dUQqQuFVw8RN/GNjiksn7WmaJZibp19HnJ2v0QmzzSUQCkw1KSnwwFDrR6PwIqZv2oTfCV5grPl/tNYALVI51zxWqDe1XWd6TJ6B4dWMUbHsGnHEAZwRmdiomU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648288; c=relaxed/simple;
	bh=hv7psFl3Ws9ReChTvMwa0l+kAvHLDTCuxuec1CNlfM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d5Ad1j9j7SbWHZuiylurBbrktMHOa5kDsjxrlD2xg+ys4ZvGbinD71hAFzyFIkmxUyic2SDt+9ZIPfPND5Jp13lCHhhyLmwGuMmQjWaLIDfl+ZRFOt9TqZ4nkFKuvTE/SOaJzcE9y+v/75QBVxUVUZxTW5GCEnnwh/v8yUlw0vY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uot3F1D3; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uot3F1D3"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c74722e27so6909581fa.0
        for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 01:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787648284; cv=none;
        d=google.com; s=arc-20260327;
        b=DCuSaCSJ++Rj+fQWdP2PABqxc+NZtV3Os2MBqV/Bbj1ccZcJBLbYfwarKQ0JC703uY
         2/mrGIUjrF5p8+Ix/4O3Yy153On3Gb4woxziMQijdciv+8LuLrUPKiLjc7cOa+cu4wW2
         dWwG7YYpBAsHcOxaqeNHvnnwT3/DHEHY5UHqGEulCzftA/O9gzp/TSflghTOVXv3K62r
         +WIg/LTFfkIT1/+hiM0U7UrmR0sGgT1ZWTsuMaQ2ruJxnc4APKHm0TDGYga+7NJpvKfZ
         JmTiQRK9FTSpbuSFZW2ZJRYAZMCSjXPVYL70khnsOl/0GJ1JRgHJhnHWKXpb5/HID/88
         IgBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ezw+lHG90KyeeujMITgw3JFtWqOY7cmyGIM6ONzm1c=;
        fh=sun/Zl3GCIZCY4+G/vZh1d+Ux48V5VnPqukiu2fFqDs=;
        b=MoLUG+aqESQH+4CPsxbxHEtwOm3bD7E7SMgwoXh4blDM9fRxCzWQ28xbFIoGZDfVwl
         nXHW4PM4P18DAW6+8HEumC4iHIanA0ihBTslyeRqYex5Aiu3tkcxoJwfsDNIEYcia3q7
         bwfmRPDvE5jEsRKFdXImF+HErR/VwEBotnIz6upRnAxzxvlsz//6tN0c58Ik379O6S8a
         V94wkdgie6OqfKTK6qq4mjVRgPQ93fDQ3v+TeWCuuhfow0n9N6eucExE4nh6ykMVt/e8
         FF70WeYVoKiPU6mMWqafSjdlKhJrb93xmeXNe/N/F9NPp49wQ96v1znk86pLYPOtZJ9Q
         XHsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787648284; x=1788253084; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ezw+lHG90KyeeujMITgw3JFtWqOY7cmyGIM6ONzm1c=;
        b=Uot3F1D3PaVTSQpseyfAK+uSv1I7L6T+IMRAGzz9cbXXDLE1erH69DFODVrUtrJugA
         emji0Udg7UXbi4kggAZ57ulFyKWan95+ZZUVQiv4EhbTQRZ6mlSYg225CeNaqV9YYoMw
         vcvVdUnxfXt0d8k0uX5mGZeG+VumqG9jDGuqbT03TAn0zJbx3qvtDdCc9UNL/nMSZe1K
         qToXtuh86AFhFZApQRXyfcO0kWRscW8LyQYVIH4VktGFlvgKbUTKR9MUO/tTXu9p4PGt
         BvQtlRL1ZOG0ANM2d6mTfT1YfUCeb/k48icVzYTwBO7sfYDR04WMyV7qid/fCn2Zhi2T
         0xnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787648284; x=1788253084;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ezw+lHG90KyeeujMITgw3JFtWqOY7cmyGIM6ONzm1c=;
        b=dd/SR7a6P0Xr9mmLzZJt4cAznr3assHcL2QNUpQgq1PLJ9NFdws0VEj7D27AM5238p
         Qju9L/I6laRCZFnE93uozcmbqxWOokcgPvUnItBhXZG76uE1DpvKuTs/9KWHs1Tj9r/p
         aC754X6ibRcZ78TywxLZdxT8WmCeLKS8Uj+fKFAydtgp1JvRutcg+3Y8/iZfTbWtKsDL
         /xpVU307KNklKDDiJO+jVR3x996ms1v5T/3/TF95ws3TkSqO5CdDsAmFadmYPHCgRKrT
         wwK/dykX29zulUyT8INcLdJuGKu8kLm1OgbePKFncNiDsIkfuJjhO+UsZBYXVCDxeqmX
         KZOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmUn9HMtN72RaiVdZfatyeTFt/lPZ7PwdPAldIvbg0zK3tb3h7VvFTjO2qFCm2L2/zqJaJdSEiaAaQYA==@lists.linux.dev
X-Gm-Message-State: AFuF++nRTPLlPF0lrB0M0mT2BIpJVF7/1paz3pBusSzU1xV6GRXUBsem
	5Q+97/XFtp4rCbsF/euAaXt3FixNHjNrv+pmRiggL/UNzAXA927gZz+wFvdHUrpk8nHBMdfDsEt
	6DS7Hq9pf4Vvb6iErAYt6jzA4n2XS0tE=
X-Gm-Gg: AR+sD13Oq2whFrAEP7HNjZTR2r+bw5j0mUt9vrJSHGjsTuJrEkb5ttn4iUT8Mm9D23O
	EWn2ofWIuB7FQl1cdAelWeQb8YaIPMQnOTUqZAmE8hmnHV9wgY694tia2ZJ4bE31st0ppHy09Ha
	ZGu+Ty2Pb0j4ikX/RFP5NkkN30zrRyU9QGGyYHU6vBiXFDLiec6j5oD4NOSHX5X4+6Qg+CNl6v8
	YpIOm4RcHnO9fkOWFzKBe0k8gJs7oABG/AMRMdJ/w0ykfjZbc2aP2/lzOFIuVJDwpEaUBCVQaSG
	kMqruRNSOjk2EOdKJzc/hLLBfE1GCDH7jXW3aWTrUL3BIdxHLdZBkdPvYsMpF0JWrv9ZhWenkIc
	5jw==
X-Received: by 2002:a05:651c:a338:b0:3a1:7927:c302 with SMTP id
 38308e7fff4ca-3a1eda808acmr10530241fa.2.1787648283761; Tue, 25 Aug 2026
 01:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info> <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com> <aoser8dLytrwqBC2@eggarch>
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com> <226b2f34-fa25-4ca6-8afb-0b3dc942715c@amd.com>
In-Reply-To: <226b2f34-fa25-4ca6-8afb-0b3dc942715c@amd.com>
From: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Date: Tue, 25 Aug 2026 10:57:52 +0200
X-Gm-Features: AcwNN1VgQYuPNfWZAsoIgdXuYlvjSNx0u-75mKCYFe6GTjYsbwfcHq3iOmLOPQM
Message-ID: <CAPyJwA9GvqeaBYhN56L1S9YW-rwWgFejrcNcE=54DQC3Eaqxww@mail.gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Lovekesh Solanki <lovekeshsolanki00@gmail.com>, Michal Pecio <michal.pecio@gmail.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Mathias Nyman <mathias.nyman@linux.intel.com>, 
	linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> The behavior that is described here sounds like a platform firmware bug
> Are you on the latest BIOS available from your OEM?

Ywa, And I even rolled back 2 BIOS before, All 3 are showing the issue...
...even the exact same one (with the exact same CMOS settings) that I
used in 2024 without any single issue.

> Can you please confirm:
> Your CPU model number/codename
AMD Ryzen Threadripper 7870X 32.Cores

mathieu@ubuntu:~$ cat /proc/cpuinfo
processor : 0
vendor_id : AuthenticAMD
cpu family : 25
model : 24
model name : AMD Ryzen Threadripper 7970X 32-Cores
stepping : 1
microcode : 0xa10810c
cpu MHz : 2188.582
cache size : 1024 KB
physical id : 0
siblings : 64
core id : 0
cpu cores : 32
apicid : 0
initial apicid : 0
fpu : yes
fpu_exception : yes
cpuid level : 16
wp : yes
flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt
pdpe1gb rdtscp lm constant_tsc rep_good amd_lbr_v2 nopl xtopology
nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor
ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx
f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a
misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core
perfctr_nb bpext perfctr_llc mwaitx cpuid_fault cpb cat_l3 cdp_l3
hw_pstate ssbd mba perfmon_v2 ibrs ibpb stibp ibrs_enhanced vmmcall
fsgsbase bmi1 avx2 smep bmi2 erms invpcid cqm rdt_a avx512f avx512dq
rdseed adx smap avx512ifma clflushopt clwb avx512cd sha_ni avx512bw
avx512vl xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc
cqm_mbm_total cqm_mbm_local user_shstk avx512_bf16 clzero irperf
xsaveerptr rdpru wbnoinvd amd_ppin cppc arat npt lbrv svm_lock
nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter
pfthreshold avic vgif x2avic v_spec_ctrl vnmi avx512vbmi umip pku
ospke avx512_vbmi2 gfni vaes vpclmulqdq avx512_vnni avx512_bitalg
avx512_vpopcntdq la57 rdpid overflow_recov succor smca fsrm flush_l1d
debug_swap
bugs : sysret_ss_attrs spectre_v1 spectre_v2 spec_store_bypass srso
spectre_v2_user tsa vmscape
bogomips : 7988.27
TLB size : 3584 4K pages
clflush size : 64
cache_alignment : 64
address sizes : 52 bits physical, 57 bits virtual
power management: ts ttp tm hwpstate cpb eff_freq_ro [13] [14]
[..]

2. Your OEM (from /sys/class/dmi/id)
I am using an ASUS Pro WS TRX50-SAGE WIFI

root@ubuntu:/home/mathieu# cat /sys/class/dmi/id/board*
Default string
Pro WS TRX50-SAGE WIFI
231230340100705
ASUSTeK COMPUTER INC.
Rev 1.xx

3. OEM BIOS version (from /sys/class/dmi/id)
root@ubuntu:/home/mathieu# cat /sys/class/dmi/id/bios*
02/03/2026
13.17
American Megatrends Inc.
1317

4. AGESA version (see commit bc91133e260c8113c1119073c03b93c12aa41738 if
the OEM didn't tear it out.  Otherwise look in BIOS menus)?

The BOIS shoes this information (I also put the ones from previous
BIOS I tested):
BIOS 1317: ComboSP6PI 1.0.0.1e
BIOS 1203: ComboSP6PI 1.0.0.1a Patch A
BIOS 0803: StormPeakPI_1.1.0.0g

On Tue, Aug 25, 2026 at 12:09=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 8/24/26 14:37, Mathieu Fluhr wrote:
> >> The issue is obviously a severe HW malfunction (you mentioned MCEs, th=
e
> >> Ryzen CPUs simply totally locked up), triggered by poking certain xHCI
> >> controllers on the I/O die of these CPUs in some wrong way.
> >
> > Yes. As mentioned, I first thought that the emulator itself triggered t=
hat by
> > doing something that the CPU did not like.To be honest, I barely play w=
ith old
> > Android versions anymore, but seeing that I could reproduce it even wit=
h
> > Android 13 or 14 made me suspicious.
> >
> > I _guess_ Google implemented a workaround inside adb for version Androi=
d
> > 15 since using this version, it remains stable for more than 2 hours.
> >
> > But, in the end, the situation is that from a simple user account havin=
g access
> > to some usb plugged in devices (I usually add my user account to the pl=
ugdev
> > group and use some known udev rules to access my Android tests devices)=
,
> > you have a way to crash the complete system.
> >
> >> Opinions seem to vary on whether CPU load must be present or absent.
> >
> > On my side (and I am here only speaking about my TR. I don't know about
> > other Ryzen CPUs), I can't reproduce it under load, and one condition t=
o
> > reproduce it is my CPU going in C2 state.
> > -> I did a 2:30 hour test using several youtube videos playing at the s=
ame
> > time on my desktop, also stressing the emulator with some 3D Mark runs
> > (as mentioned, I first suspected the nvidia driver to be faulty). As lo=
ng as my
> > computer was busy everything went fine. But then I let it stand still f=
or a few
> > minutes, and it just crashed.
> >
> > If you need me to do some further tests or experiments, let me know. I =
will
> > be more than happy to play the guinea pig here.
> >
> The behavior that is described here sounds like a platform firmware bug
> to me.  Are you on the latest BIOS available from your OEM?
>
> Can you please confirm:
>
> 1. Your CPU model number/codename
> 2. Your OEM (from /sys/class/dmi/id)
> 3. OEM BIOS version (from /sys/class/dmi/id)
> 4. AGESA version (see commit bc91133e260c8113c1119073c03b93c12aa41738 if
> the OEM didn't tear it out.  Otherwise look in BIOS menus)?
>
