Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA2636B930
	for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 06:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787725666; cv=pass; b=o9tHVRyIY9evOUUW5N1SpCm5/Mt8cSNyj4yZUZgJ+7nlD/HGc2Zs/V1ROTMlHXO4vY4uygTjMku5D5tKfSa2V58BM3iUoj3EoOTDIqkqzIsGg32ScOLQ1cujjB/3xqN3ZhIDY3rQOXCfG7cfm8d/bVmK7UvsENAw5MdOlpwug0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787725666; c=relaxed/simple;
	bh=SRuRWxMQzXeC+rs0OpNQyle4kcKw6RCGP24XO/bNQ5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jSjCKpa6cWvpcuIZ/hm4pBMvB5lMYwdB69b1UN0eyd71PDfkbvsmYFAlKDwZel0cHZAb6ktT3vz36Gf428RejdO8bikoq8QSE2yGiqjzPQ2etMm/W6tess4cZ8PQe2FIScmv4M80+ePiCmt7eAG+wTpJkxm//xY2R7kroCPMkug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzCAusol; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzCAusol"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so4905341fa.1
        for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 23:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787725663; cv=none;
        d=google.com; s=arc-20260327;
        b=Us3YCxTlR7x6nET0UqcD9rKL9pz0gEfqdJVgN1f3KLQvErptiAAEK1kcRe8RSGvSx5
         BVVqu3R6Bu6o3w6BX5s/XGSq3NmTqgp201hieTML2JidEA5/W84CUq1W/BiGoA1N4Frl
         VjMl9FpATAr8Mof6Q7T7Rw3x+rS5heyC/PQKVTQcfSkYyYNMIFpaN45Snu9iNFw/d7kw
         8GJqoX0AWGeDe6Kr9hs1iRQ4nRHRGgbpHUtxGlg3uEXJmM/N0EvGzY7PR93QaYvxsGl9
         uOeC5coxQoe+wR//AAfG1VgXC0UJreOk2RLA3yb3nc/mFu6jZEvft1X1yp48+6eOF/iF
         ZMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bCQy5KYAnT0Nqu+N8f/uz+vDCHlQ4T9ZBMVo1dyy1DU=;
        fh=f02B5L6mxmtb91iyzQyIhGU3xsiytXpC86J2B2ZSb/Q=;
        b=H4/5VI8JH2mjvbRIMDzBMPcOc30Z8TkcHpVVi3TvSjYn8ln18KB1k1cAkRyfkxeP9c
         xUI0KCHrQKnV0VQ1T65eEHaIu/PMZWRUileTjbaNtl39+AO5b1P2/KgzVY3aCByulmqD
         KzjCMBHhCGG3sGWb6HPIl6w0ifw//lxpjyr1nXmOYj+AvYYKGXxo7ahGKuY2913+GSMX
         Wycm5WFana7ImgACc/LO1gUh6qQDDn+BA9bn+UKdLax61ARKP3twP0xVTQETpmKT6laP
         rUAGdKI3ATxqZ9Gh1+owEemZTvn4Rh4XD6/FsB22eILEbqvtffKn5tbZIyPb3ZM2IPOD
         eZxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787725663; x=1788330463; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bCQy5KYAnT0Nqu+N8f/uz+vDCHlQ4T9ZBMVo1dyy1DU=;
        b=FzCAusol2yTUsgylXyfBDBQg4ksIaq9quhe9euAw5N9Xyuwsbkl8wsSl9f+B+4M5+1
         NbwOr9WNl+9O+rSBDVKo5eWCPDTXzixLF0xlah6+oA71GVSFGVy0VhEQNk9W9ZCs1xP8
         bIZuvjn4JmCtLfULiTg9hTednfPxWt7hJ20oHrkkvUsS8xSOjQmrvCNYnsl/kJ+CHaEp
         DHESXtI5Bv8BbC8oE+p5YikkR7+QMnlSPVQ5rNk82ioaRa3enm5jotaR/zmatKm634yp
         OdY/pBloxdEfajNufIFRmz4iazNftdIFpwBW4q5WNL83bbeBbgpxGLrS4oshlyyXUIy4
         NGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787725663; x=1788330463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCQy5KYAnT0Nqu+N8f/uz+vDCHlQ4T9ZBMVo1dyy1DU=;
        b=RamKl5Iq2qTeefFxzvFYJ0816Q3/3bM6FF++SJ5nfFQgXB3FctJ3JNbiar8ucX6JTJ
         EbUWGbhuIlR7jMrCbtA+GYNle5NO8nv9xxxczt+eLtqqUKDT1yhkIbS5QAlxINrlqv2/
         dwoJjN+kJJtvxYT/Mh3wVZiRUVNDZkCXJPdTa6bVP5kbHn+X3K2Y5+DTdGhJQ7dORqsI
         QoZCLa1spt9YI9jDx84PnExLTIU7eiXlh3p4s+K52yFmPAGW5Tn1oGrqTSLd5j7Xv2Wh
         JdYXj3erS8/t1OhcWVWAiaH+OVSnDqOVkoETi2x6H0cX+qLY5ce1p1FBfSn5sJGA7IsQ
         XSRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2FINSNR8wg8ulXKUoWiZOtF9CBOnC/uosLr+KW5fRH8By3mF9yfH469D9J2j8yHzZ0LTsX06FpyPHww==@lists.linux.dev
X-Gm-Message-State: AFuF++k+rBa7iumg5Ukdfe5nw5p8UfsQQJnvgaWVbc17ZP0Bx2GNrdR+
	YGVMisAKneEOCOmEhe5dtinwe5cFdizBe4Q1tUV4EYdPqggXTYtR5b8RaXkkvchydFITbsibuBv
	KlMJFq7UU6W6PL53XE0lbjCZTrOop+DU=
X-Gm-Gg: AR+sD13UlpR53g9+0x/3IEbQhDVN953UmRNFTmMZPULXhd3xM2N9VwBeGKjUW5eabis
	TdvgJ7bb68I+z2+jtDLHFAoWGHkwcHW7aCl9pfNXCo4rhtHTu4+jR+OQPD57ZXeDl32h7+KYRoh
	DtiKdPjeEyQEUk7uHEAMK604EX0Nc+enhXy6ar6FYEg0IRIDzZsesxz9uGUtk+d+opR7Te5ScKV
	hf04FyuPvBgLfoVmXstwSfqk7s9Gy3mgZt0QYmk0HrX/TfFfdb3BfdkzGzhvd7Jin12kJzy2hQw
	kIwQd0WPAoqrJkjhon/Ayd6TVmBw4FP1qxfBaubzOkQjetmACXMfD3R0o4LNe42+r8gBf6J+1Ec
	B
X-Received: by 2002:a05:651c:41d7:b0:3a1:a8c8:2e21 with SMTP id
 38308e7fff4ca-3a1fd67d0eemr7541131fa.9.1787725662800; Tue, 25 Aug 2026
 23:27:42 -0700 (PDT)
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
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
 <226b2f34-fa25-4ca6-8afb-0b3dc942715c@amd.com> <CAPyJwA9GvqeaBYhN56L1S9YW-rwWgFejrcNcE=54DQC3Eaqxww@mail.gmail.com>
 <f6f2f984-f31b-42c9-b120-6c179803dd2b@amd.com>
In-Reply-To: <f6f2f984-f31b-42c9-b120-6c179803dd2b@amd.com>
From: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Date: Wed, 26 Aug 2026 08:27:30 +0200
X-Gm-Features: AcwNN1XQnKUyXlrnQKHlAQ_Lew01uxWBW7szTdABYW8DO1E4QbjhmLgnHDZw2_0
Message-ID: <CAPyJwA-DqScij982KfUQQ3ad2nHF4=SEBjjQhQGr1yCumdMXHA@mail.gmail.com>
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

> The workaround you can do for now is to disable runtime PM on the XHCI
> controller to avoid triggering it.  But it's a platform issue.

So, long story short, the kernel source code is correct, and the issue come=
s
from the BIOS/AGESA, correct?

> For a proper fix you need to reach out to ASUS to get an AGESA upgrade.
> You can ask them to reach out to AMD if they need assistance/guidance on
> the versions that contain the fix for this.  You can share this thread
> with them for reference.

I will. But this leaves me with a few questions here:
1. Do you already have a fixed AGESA on AMD side, that ASUS could use?
2. Does this issue also affect other threadripper generations, like the 997=
0x?
3. I guess not only ASUS is concerned but Also ASRock and Gigabyte which
also produces TRX50 mainboards, correct?

On Wed, Aug 26, 2026 at 5:14=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 8/25/26 03:57, Mathieu Fluhr wrote:
> >> The behavior that is described here sounds like a platform firmware bu=
g
> >> Are you on the latest BIOS available from your OEM?
> >
> > Ywa, And I even rolled back 2 BIOS before, All 3 are showing the issue.=
..
> > ...even the exact same one (with the exact same CMOS settings) that I
> > used in 2024 without any single issue.
> >
> >> Can you please confirm:
> >> Your CPU model number/codename
> > AMD Ryzen Threadripper 7870X 32.Cores
> >
> > mathieu@ubuntu:~$ cat /proc/cpuinfo
> > processor : 0
> > vendor_id : AuthenticAMD
> > cpu family : 25
> > model : 24
> > model name : AMD Ryzen Threadripper 7970X 32-Cores
> > stepping : 1
> > microcode : 0xa10810c
> > cpu MHz : 2188.582
> > cache size : 1024 KB
> > physical id : 0
> > siblings : 64
> > core id : 0
> > cpu cores : 32
> > apicid : 0
> > initial apicid : 0
> > fpu : yes
> > fpu_exception : yes
> > cpuid level : 16
> > wp : yes
> > flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
> > pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt
> > pdpe1gb rdtscp lm constant_tsc rep_good amd_lbr_v2 nopl xtopology
> > nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor
> > ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx
> > f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a
> > misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core
> > perfctr_nb bpext perfctr_llc mwaitx cpuid_fault cpb cat_l3 cdp_l3
> > hw_pstate ssbd mba perfmon_v2 ibrs ibpb stibp ibrs_enhanced vmmcall
> > fsgsbase bmi1 avx2 smep bmi2 erms invpcid cqm rdt_a avx512f avx512dq
> > rdseed adx smap avx512ifma clflushopt clwb avx512cd sha_ni avx512bw
> > avx512vl xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc
> > cqm_mbm_total cqm_mbm_local user_shstk avx512_bf16 clzero irperf
> > xsaveerptr rdpru wbnoinvd amd_ppin cppc arat npt lbrv svm_lock
> > nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter
> > pfthreshold avic vgif x2avic v_spec_ctrl vnmi avx512vbmi umip pku
> > ospke avx512_vbmi2 gfni vaes vpclmulqdq avx512_vnni avx512_bitalg
> > avx512_vpopcntdq la57 rdpid overflow_recov succor smca fsrm flush_l1d
> > debug_swap
> > bugs : sysret_ss_attrs spectre_v1 spectre_v2 spec_store_bypass srso
> > spectre_v2_user tsa vmscape
> > bogomips : 7988.27
> > TLB size : 3584 4K pages
> > clflush size : 64
> > cache_alignment : 64
> > address sizes : 52 bits physical, 57 bits virtual
> > power management: ts ttp tm hwpstate cpb eff_freq_ro [13] [14]
> > [..]
> >
> > 2. Your OEM (from /sys/class/dmi/id)
> > I am using an ASUS Pro WS TRX50-SAGE WIFI
> >
> > root@ubuntu:/home/mathieu# cat /sys/class/dmi/id/board*
> > Default string
> > Pro WS TRX50-SAGE WIFI
> > 231230340100705
> > ASUSTeK COMPUTER INC.
> > Rev 1.xx
> >
> > 3. OEM BIOS version (from /sys/class/dmi/id)
> > root@ubuntu:/home/mathieu# cat /sys/class/dmi/id/bios*
> > 02/03/2026
> > 13.17
> > American Megatrends Inc.
> > 1317
> >
> > 4. AGESA version (see commit bc91133e260c8113c1119073c03b93c12aa41738 i=
f
> > the OEM didn't tear it out.  Otherwise look in BIOS menus)?
> >
> > The BOIS shoes this information (I also put the ones from previous
> > BIOS I tested):
> > BIOS 1317: ComboSP6PI 1.0.0.1e
> > BIOS 1203: ComboSP6PI 1.0.0.1a Patch A
> > BIOS 0803: StormPeakPI_1.1.0.0g
> >
> This isn't a BIOS regression, it's been around since the beginning on
> this threadripper model but it was harder to trigger.
> The Linux kernel changes in the bisect exposed a platform issue.
>
> The workaround you can do for now is to disable runtime PM on the XHCI
> controller to avoid triggering it.  But it's a platform issue.
>
> For a proper fix you need to reach out to ASUS to get an AGESA upgrade.
> You can ask them to reach out to AMD if they need assistance/guidance on
> the versions that contain the fix for this.  You can share this thread
> with them for reference.
